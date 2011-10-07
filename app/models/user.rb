# SQL Reference Sheet
# t.string   "username"
# t.string   "name"
# t.string   "email"
# t.boolean  "admin"
# t.string   "password_rem_token"
# t.string   "password_hash"
# t.string   "password_salt"
# t.string   "birthday"
#
class User < ActiveRecord::Base
    attr_accessor :password
    attr_accessible :username, :name, :email, :birthday, :password, :password_confirmation
    has_many :profiles
    has_many :topics
    has_many :bookmarks
    
    email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
                    
    validates :username, :presence => true
    
    validates :name, :presence => true, 
                     :length => { :maximum => 36}
                     
    validates :email, :presence => true,
                      :format => { :with => email_regex },
                      :uniqueness => { :case_sensitive => false }
                      
    validates :password, :presence => true, 
                         :confirmation => true,
                         :length => { :within => 6..36 }
                         
    validates :birthday, :presence => true
    
    before_save :encrypt_password

    def self.authenticate(email, password)
        user = find_by_email(email)
        if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
            user
        else
            nil
        end
    end
    
    def self.authenticate_with_salt(id, cookie_salt)
        user = find_by_id(id)
        (user && user.password_salt == cookie_salt) ? user : nil
    end

    def encrypt_password
        if password.present?
            self.password_salt = BCrypt::Engine.generate_salt
            self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
        end
    end
    
    def send_password_reset
      generate_token(:password_rem_token)
      self.password_reset_sent_at = Time.zone.now
      save!
      UserMailer.password_reset(self).deliver
    end

    def generate_token(column)
      begin
        self[column] = SecureRandom.urlsafe_base64
      end while User.exists?(column => self[column])
    end
    
    def self.search(search)
      if search
        find(:all, :conditions => ['username || name LIKE ?', "%#{search}%"])
      else
        find(:all)
      end
    end
end
