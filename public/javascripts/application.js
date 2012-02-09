$(function() {
	$("#accordion").accordion({ header: "h3" });
	
	$( "#dialog:ui-dialog" ).dialog( "destroy" );
		
	var email = $( "#email" ),
		password = $( "#password" ), 
		password_confirmation = $( "#password_confirmation" ), 
		allFields = $( [] ).add( email ).add( password ).add( password_confirmation ), 
		tips = $( ".validateTips" );
		
	var email_login = $( "#email-login"), password_login = $( "#password-login" ),
		loginFields = $( [] ).add( email_login ).add( password_login );
		
	function updateTips( t ) {
		tips
			.text( t )
			.addClass( "ui-state-highlight" );
		setTimeout(function() {
			tips.removeClass( "ui-state-highlight", 1500 );
		}, 500 );
	}
	
	function checkLength( o, n, min, max ) {
		if ( o.val().length > max || o.val().length < min ) {
			o.addClass( "ui-state-error" );
			updateTips( "Length of " + n + " must be between " +
				min + " and " + max + "." );
		return false;
		} else {
			return true;
		}
	}

	function checkRegexp( o, regexp, n ) {
		if ( !( regexp.test( o.val() ) ) ) {
			o.addClass( "ui-state-error" );
			updateTips( n );
			return false;
		} else {
			return true;
		}
	}
	
	$( "#dialog-form-register" ).dialog({
		autoOpen: false,
		height: 350,
		width: 300,
		modal: true,
		resizable: false,
		buttons: {
			"Create an account": function() {
				var bValid = true;
				allFields.removeClass( "ui-state-error" );

				bValid = bValid && checkLength( email, "email", 6, 80 );
				bValid = bValid && checkLength( password, "password", 5, 16 );
				bValid = bValid && checkLength( password_confirmation, "password_confirmation", 5, 16 );

				// From jquery.validate.js (by joern), contributed by Scott Gonzalez: http://projects.scottsplayground.com/email_address_validation/
				bValid = bValid && checkRegexp( email, /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i, "eg. ui@jquery.com" );
				bValid = bValid && checkRegexp( password, /^([0-9a-zA-Z])+$/, "Password field only allow : a-z 0-9" );

				if ( bValid ) {
					$("#new-account-submit").click();
					$( this ).dialog( "close" );
					$("#faq-intro-flash-movie").show();	
				}
			},
			Cancel: function() {
				$("#faq-intro-flash-movie").show();	
				$( this ).dialog( "close" );
			}
		},
		close: function() {
			$("#faq-intro-flash-movie").show();	
			allFields.val( "" ).removeClass( "ui-state-error" );
		}
	});

	$( "#dialog-form-login" ).dialog({
		autoOpen: false,
		height: 270,
		width: 300,
		modal: true,
		resizable: false,
		buttons: {
			"Login": function() {
				var loginValid = true;
				allFields.removeClass( "ui-state-error" );

				loginValid = loginValid && checkLength( email_login, "email", 6, 80 );
				loginValid = loginValid && checkLength( password_login, "password", 5, 16 );

				// From jquery.validate.js (by joern), contributed by Scott Gonzalez: http://projects.scottsplayground.com/email_address_validation/
				loginValid = loginValid && checkRegexp( email_login, /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i, "eg. ui@jquery.com" );
				loginValid = loginValid && checkRegexp( password_login, /^([0-9a-zA-Z])+$/, "Password field only allow : a-z 0-9" );

				if ( loginValid ) {
					$("#submit-log-in").click();
					$( this ).dialog( "close" );
					$("#faq-intro-flash-movie").show();	
				}
			},
			Cancel: function() {
				$("#faq-intro-flash-movie").show();	
				$( this ).dialog( "close" );
			}
		},
		close: function() {
			$("#faq-intro-flash-movie").show();	
			allFields.val( "" ).removeClass( "ui-state-error" );
		}
	})
	
	$( "#dialog-form-manage" ).dialog({
		autoOpen: false,
		height: 300,
		width: 550,
		modal: true,
		resizable: false,
		buttons: {
			"Update": function() {
				$("#account-edit-submit").click();
				$( this ).dialog( "close" );
			},
			Cancel: function() {
				
				$( this ).dialog( "close" );
			}
		},
		close: function() {
			allFields.val( "" ).removeClass( "ui-state-error" );
		}
	})
	// .keyup(function(e) { 
		// if(e.keyCode == 13) {
			// $("#submit-log-in").click();
		// }
	// });
	
	
	$( "#register-button" ).click(function() {
		$("#faq-intro-flash-movie").hide();
		$( "#dialog-form-register" ).dialog( "open" );
	});
	
	$( "#login-button" ).click(function() {
		$("#faq-intro-flash-movie").hide();
		$( "#dialog-form-login" ).dialog( "open" );
	});
	
	$( "#account-manage-link" ).click(function() {
			$( "#dialog-form-manage" ).dialog( "open" );
	});
	
	$( ".ui-button" ).button();
	$(".ui-button-checkbox").button();
	
	$(".note-display-dialog").dialog( {
		modal: true
	});
	
});