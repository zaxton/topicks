jQuery.fn.favicons=function(c){var b=jQuery.extend({classname:"favicon",service:"http://g.etfv.co/__URL__"},c);return this.each(function(){var a=$(this),d=b.service.replace("__URL__",a.attr("href")).replace("__DOMAIN__",a.attr("href").replace("http://","").replace("https://",""));a.css("background-image","url("+d+")").addClass(b.classname)})};


/*
 *
 * Copyright (c) 2006/2007 Sam Collett (http://www.texotela.co.uk)
 * Licensed under the MIT License:
 * http://www.opensource.org/licenses/mit-license.php
 * 
 * Version 2.0
 * Demo: http://www.texotela.co.uk/code/jquery/newsticker/
 *
 * $LastChangedDate: 2007-05-29 11:31:36 +0100 (Tue, 29 May 2007) $
 * $Rev: 2005 $
 *
 */
eval(function(p,a,c,k,e,r){e=function(c){return(c<a?'':e(parseInt(c/a)))+((c=c%a)>35?String.fromCharCode(c+29):c.toString(36))};if(!''.replace(/^/,String)){while(c--)r[e(c)]=k[c]||e(c);k=[function(e){return r[e]}];e=function(){return'\\w+'};c=1};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p}('(1($){$.9.D=$.9.g=1(b){b=b||p;i=1(a){j(a);a.4=$("r",a);a.4.q(":o(0)").l().C();a.5=0;h(a)};h=1(a){a.m=t(1(){f(a)},b)};j=1(a){s(a.m)};8=1(a){a.3=7};d=1(a){a.3=c};f=1(a){e(a.3)6;a.3=7;$(a.4[a.5]).n("k",1(){$(2).l();a.5=++a.5%(a.4.B());$(a.4[a.5]).z("k",1(){a.3=c})})};2.y(1(){e(2.x.w()!="A")6;i(2)}).v("g").u(1(){8(2)},1(){d(2)});6 2}})(E);',41,41,'|function|this|pause|items|currentitem|return|true|pauseTicker|fn|||false|resumeTicker|if|doTick|newsticker|startTicker|initTicker|stopTicker|slow|hide|tickfn|fadeOut|eq|4000|not|li|clearInterval|setInterval|hover|addClass|toLowerCase|nodeName|each|fadeIn|ul|size|end|newsTicker|jQuery'.split('|'),0,{}))


/*
   Copyright (c) 2008 Fred Wu

   Dual licensed under the MIT and GPL licenses:
   http://www.opensource.org/licenses/mit-license.php
   http://www.gnu.org/licenses/gpl.html
*/

(function($){

  $.fn.endlessScroll = function(options){

    var defaults = {
      bottomPixels: 50,
      fireOnce: true,
      fireDelay: 150,
      loader: "<br />Loading...<br />",
      data: "",
      insertAfter: "div:last",
      resetCounter: function(){ return false; },
      callback: function(){ return true; },
      ceaseFire: function(){ return false; }
    };

    var options = $.extend(defaults, options);

    var firing       = true;
    var fired        = false;
    var fireSequence = 0;

    if (options.ceaseFire.apply(this) === true)
    {
      firing = false;
    }

    if (firing === true)
    {
      $(this).scroll(function() {
        if (this == document) {
          var is_scrollable = $(document).height() - $(window).height() <= $(window).scrollTop() + options.bottomPixels;
        } else {
          // calculates the actual height of the scrolling container
          var inner_wrap = $(".endless_scroll_inner_wrap", this);
          if (inner_wrap.length == 0) {
            $(this).wrapInner("<div class=\"endless_scroll_inner_wrap\" />");
          }
          var is_scrollable = inner_wrap.length > 0 &&
            (inner_wrap.height() - $(this).height() <= $(this).scrollTop() + options.bottomPixels);
        }

        if ((options.ceaseFire.apply(this) === false) && is_scrollable && (options.fireOnce == false || (options.fireOnce == true && fired != true)))
        {
          if (options.resetCounter.apply(this) === true) fireSequence = 0;

          fired = true;
          fireSequence++;

          $(options.insertAfter).after("<div id=\"endless_scroll_loader\">" + options.loader + "</div>");

          data = typeof options.data == 'function' ? options.data.apply(this) : options.data;
          if (data !== false)
          {
            $("div#endless_scroll_loader").remove();
            $(options.insertAfter).after("<div id=\"endless_scroll_data\">" + data + "</div>");
            $("div#endless_scroll_data").hide().fadeIn();
            $("div#endless_scroll_data").removeAttr("id");

            var args = new Array();
            args[0] = fireSequence;
            options.callback.apply(this, args);

            if (options.fireDelay !== false || options.fireDelay !== 0)
            {
              // slight delay for preventing event firing twice
              $("body").after("<div id=\"endless_scroll_marker\"></div>");
              $("div#endless_scroll_marker").fadeTo(options.fireDelay, 1, function(){
                $(this).remove();
                fired = false;
              });
            }
            else
            {
              fired = false;
            }
          }
        }
      });
    }
  };

})(jQuery);