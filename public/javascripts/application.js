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
	$( ".topic_form" ).dialog({
		autoOpen: false,
		modal: true,
		height:400,
		width:600
});

$( "#new_topic" ).click(function() {
	$( ".topic_form" ).dialog( "open" );
	return false;
	});
});
