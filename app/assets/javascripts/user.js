$(document).ready(function(){
	// User Signin Javascript
	// #admin user login js validations
	$('#Login_form').validate({
		onkeyup: function(element) {$(element).valid()},
        onclick: false,
	    rules: {
			'user[email]': {required: true}	
     	},
	    messages: {
			'user[email]': {required: 'Please enter email.'}
	    },
	    submitHandler: function(form) {
	    	form.submit();
	    }
	});
});