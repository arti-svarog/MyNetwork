// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.validate.additional-methods 
//= require jquery.validate
//= require alertify
//= require profile
//= require script
//= require_tree .


$(document).ready(function(){
	let url = new URLSearchParams(window.location.search);
	var id = url.get('info');
	$("#"+id).parent().addClass('active');
	$("#"+id).parent().siblings().removeClass('active');            
	$('.edit-menu a').click(function(){
		window.location = "?type=about&info="+this.id;
	});
});
