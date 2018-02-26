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
//= require rails-ujs
//= require turbolinks
//= require jquery
//= require_tree .

$(document).ready( function() {

	$(".main-yield-container").on( "ajax:success", "#graffiti-request-form", function(event) {
		event.preventDefault();

		$(".graffiti-response-container").append("<img src='https://media.giphy.com/media/APdM6q0D3DqTK/giphy.gif' />");

		var $form = $(this);
		var method = $form.attr("method");
		var url = $form.attr("action");
		var data = $form.serialize();

		var ajaxRequest = $.ajax({
			method: method,
			url: url, 
			data: data
		});		

		ajaxRequest.done( function(response) {
			console.log(response);
			if (response.indexOf("<h2>Search Results:</h2>") >= 0) {
				$(".errors-container").empty();
				$(".graffiti-response-container").empty();
				$(".graffiti-response-container").append(response);
			} else {
				$(".main-yield-container").empty();
				$(".main-yield-container").append(response);
			}
		});

	});

});