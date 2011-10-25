// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function() {
	$( "#user_birthday" ).datepicker({
		changeMonth: true,
		changeYear: true,
		yearRange: '1950:2011'
	});
});

$.fx.speeds._default = 1000;
	$(function() {
		$( ".new_bookmark_form" ).dialog({
			autoOpen: false,
			modal: true,
			height:200,
			width:500
		});

		$( "#new_bookmark_button" ).click(function() {
			$( ".new_bookmark_form" ).dialog( "open" );
			return false;
		});
	});
	
	$(function(){
			$(".comment li").hover(function(){
				$(this).css({
					"background-color":"#F5F5F5",
					"cursor":"pointer"
				});
			}, function(){
				var resetCSS = {
					"background-color":"",
					"cursor":""
				}
				$(this).css(resetCSS);
			});
		});
		
		
		$(function(){
				$(".user_index li").hover(function(){
					$(this).css({
						"background-color":"#F5F5F5",
						"cursor":"pointer"
					});
				}, function(){
					var resetCSS = {
						"background-color":"",
						"cursor":""
					}
					$(this).css(resetCSS);
				});
			});
		
		
		var popupStatus = 0;

		function loadPopup(){
		if(popupStatus==0){
			$(".backgroundPopup").css({
				"opacity": "0.7"
			});
			$(".backgroundPopup").fadeIn("fast");
			$(".popupPicture").fadeIn("fast");
			popupStatus = 1;
			}
		}

		function disablePopup(){
		if(popupStatus==1){
			$(".backgroundPopup").fadeOut("slow");
			$(".popupPicture").fadeOut("slow");
			popupStatus = 0;
			}
		}

		function centerPopup(){
			var windowWidth = document.documentElement.clientWidth;
			var windowHeight = document.documentElement.clientHeight;
			var popupHeight = $(".popupPicture").height();
			var popupWidth = $(".popupPicture").width();
			$(".popupPicture").css({
				"position": "absolute",
				"top": windowHeight/2-popupHeight/2,
				"left": windowWidth/2-popupWidth/2
			});

			$(".backgroundPopup").css({
				"height": windowHeight
			});

		}

		$(function(){
			$("#new_topic").click(function(){
				centerPopup();
				loadPopup();
			});

			$(".popupContactClose").click(function(){
				disablePopup();
			});

			$(".backgroundPopup").click(function(){
				disablePopup();
			});

			$(document).keypress(function(e){
				if(e.keyCode==27 && popupStatus==1){
					disablePopup();
				}
			});

		});
	
