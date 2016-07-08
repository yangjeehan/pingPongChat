<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Javascript Libraries -->
<script src="resource/js/jquery-2.1.1.min.js"></script>
<script src="resource/js/bootstrap.min.js"></script>

<script src="resource/vendors/nicescroll/jquery.nicescroll.min.js"></script>
<script src="resource/vendors/bootstrap-growl/bootstrap-growl.min.js"></script>
<script src="resource/vendors/sweet-alert/sweet-alert.min.js"></script>
<script src="resource/vendors/waves/waves.min.js"></script>
<script src="resource/vendors/sweet-alert/sweet-alert.min.js"></script>

<script src="resource/js/functions.js"></script>
<script src="resource/js/demo.js"></script>

<script type="text/javascript">
$(document).ready( function() {
	function notify(from, align, icon, type, animIn, animOut){
	    $.growl({
	        icon: icon,
	        title: '',
	        message: 'Already exists',
	        url: ''
	    },{
	            element: 'body',
	            type: type,
	            allow_dismiss: true,
	            placement: {
	                    from: from,
	                    align: align
	            },
	            offset: {
	                x: 20,
	                y: 85
	            },
	            spacing: 10,
	            z_index: 1031,
	            delay: 2500,
	            timer: 1000,
	            url_target: '_blank',
	            mouse_over: false,
	            animate: {
	                    enter: animIn,
	                    exit: animOut
	            },
	            icon_type: 'class',
	            template: '<div data-growl="container" class="alert" role="alert">' +
	                            '<button type="button" class="close" data-growl="dismiss">' +
	                                '<span aria-hidden="true">&times;</span>' +
	                                '<span class="sr-only">Close</span>' +
	                            '</button>' +
	                            '<span data-growl="icon"></span>' +
	                            '<span data-growl="title"></span>' +
	                            '<span data-growl="message"></span>' +
	                            '<a href="#" data-growl="url"></a>' +
	                        '</div>'
	    });
	};
	
	var jsonData3 = {};
	
	$("#send").click(function(e) {
		var email = $("#email").val();
		
		email = $.trim(email);
		if( email == "" ){
			swal("Email Address is empty");
			return;
		}
		var regExp = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;
		if (!email.match(regExp)){
			swal("Email Address is not match format");
			return;
		}
		
		
		
		var authNum = $("#authNum").val();
		$.post(
				"/emailAuth"
				, { "email" : email,
					"authNum" : authNum }
				, function(data) {
					
					try{
						jsonData3 = JSON.parse(data);
					}
					catch(e) { //자바스크립트는 타입이 없기때문에 e만 적으면 된다.
					}
					
					if (jsonData3.authNum != null) {
						 swal("Confirm Email");
						 var authNum = jsonData3.authNum;
						 $("#check").text(authNum);
						 $("#isTrue").text("false");
					}
					
					if(jsonData3.isCheckId) {
					    notify('top','center', 'fa fa-comments', 'inverse', 'animated fadeInDown', 'animated fadeOutDown');
					}
				  }
				);
	});
	
	$("#confirm").click(function(){
		var form = $("#authNum").val();
		var checkNum = $("#check").text();
		if(form != checkNum){
			swal("try again");
			$("#authNum").val("");
			$("#isTrue").text("false");
		}
		if(form == checkNum){
			swal("success");
			$("#isTrue").text("true");
		}
	});
	
	$("#doRegister").click(function() {
		var name = $("#name").val();
		name = $.trim(name);
		if( name == "" ){
			swal("Username is empty");
			return;
		}
		
		
		var email = $("#email").val();
		email = $.trim(email);
		if( email == "" ){
			swal("Email Address is empty");
			return;
		}
		var regExp = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;
		if (!email.match(regExp)){
			swal("Email Address is not match format");
			return;
		}
		
		var authNum = $("#authNum").val();
		authNum = $.trim(authNum);
		if( authNum == "" ){
			swal("Authentication no. is empty");
			return;
		}
		
		var password = $("#password").val();
		password = $.trim(password);
		if( password == "" ){
			swal("Password is empty");
			return;
		}
		
		var check_pass = $("#check_pass").val();
		if(password != check_pass){
			swal("Password is not match");
			return;
		}
		
		var isTrue = $("#isTrue").text();
		if( isTrue == "true"){
			location.href = "/doSignUp?name="+ name +"&email=" + email + "&password="+ password;
		}
		else{
			swal("Check Authentication no.")
			return;
		}
/* 		$('input[type="checkbox"]').each(function(){		
			if(!$(this).checked()){
				swal("Accept the license agreement");
				return;
			}
		})  체크박스 체크여부 어케하는지 모르겠따..............*/
		
		
		
/* 		var form = $("#doJoin");
		form.attr("method", "POST");
		form.attr("action", "/Email_Test/doSignUp");
		form.submit(); */
	});
});

</script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PingPong Chat</title>

<!-- Vendor CSS -->
<link href="resource/vendors/animate-css/animate.min.css" rel="stylesheet">
<link href="resource/vendors/sweet-alert/sweet-alert.min.css" rel="stylesheet">
<link href="resource/vendors/material-icons/material-design-iconic-font.min.css" rel="stylesheet">
<link href="resource/vendors/socicon/socicon.min.css" rel="stylesheet">
    
<!-- CSS -->
<link href="resource/css/app.min.1.css" rel="stylesheet">
<link href="resource/css/app.min.2.css" rel="stylesheet">
</head>
<body class="login-content">
	<!-- Register -->
	<div class="lc-block toggled" id="l-register">
	    <div class="input-group m-b-20">
	        <span class="input-group-addon"><i class="md md-person"></i></span>
	        <div class="fg-line">
	            <input type="text" class="form-control" placeholder="Username" id="name" name="name">
	        </div>
	    </div>
	    
	    <div class="input-group m-b-20">
	        <span class="input-group-addon"><i class="md md-mail"></i></span>
	        <div class="fg-line">
	            <input type="text" class="form-control" placeholder="Email Address" id="email" name="email"><button class="btn" style="background-color: #ff4f3e; color: white;"id="send"><i class="md md-arrow-forward"> Send</i></button>
	        </div>
	    </div>
	
	    <div class="input-group m-b-20">
	        <span class="input-group-addon"><i class="md md-mail"></i></span>
	        <div class="fg-line">
	            <input type="text" class="form-control" placeholder="Authentication no." id="authNum" name="authNum">  <button class="btn" style="background-color: #ff4f3e; color: white;" id="confirm"><i class="md md-check">Check</i></button>
	            <!-- <button class="btn btn-default"><i class="md md-check"></i> Check</button> -->
	<!-- <button class="btn btn-default" id="confirm">confirm</button> -->
	    </div>
	</div>
	
	
	<div class="input-group m-b-20">
	    <span class="input-group-addon"><i class="md md-lock"></i></span>
	    <div class="fg-line">
	        <input type="password" class="form-control input-sm" placeholder="Password" id="password" name="password">
	    </div>
	</div>
	<div class="input-group m-b-20">
	  
	    <span class="input-group-addon"><i class="md md-lock"></i></span>
	    <div class="fg-line">
	        <input type="password" class="form-control input-sm" placeholder="Confirm Password" id="check_pass" name="check_pass">
	    </div>
	</div>
	<div class="clearfix"></div>
	
	
	<button class="btn btn-login btn-float" style="background-color: #71d1b2;" id="doRegister"><i class="md md-arrow-forward"></i></button>
	<span style="display:none" id="check" > </span>
	<span style="display:none" id="isTrue" > </span>
	
	</div>
</body>
</html>