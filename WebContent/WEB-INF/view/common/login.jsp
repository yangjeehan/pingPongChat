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
	function notify(from, align, message, icon, type, animIn, animOut){
	    $.growl({
	        icon: icon,
	        title: '',
	        message: message,
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
	
	
	
	$("#doLogin").click(function(e){
 		var userId = $("#userId").val();
 		var password = $("#password").val();
		$.post(
				"/doLogin"
				, { "userId" : userId,
					"password" : password }
				, function(data) {
					
					try{
						jsonData3 = JSON.parse(data);
					}
					catch(e) { //자바스크립트는 타입이 없기때문에 e만 적으면 된다.
					}
					
					if (jsonData3.isLoginSuccess) { // 로그인 성공했으면
						location.href="/goMain"; 
					}
					else { // 로그인에 실패했을 경우
					    notify('top', 'center', 'Check your ID and Password', 'fa fa-comments', 'inverse', 'animated fadeInDown', 'animated fadeOutDown'); 
					}
				  }
		);
	});
	
	var jsonData3 = {};
	$("#forgotPw").click(function(e){
		var emailId = $("#emailId").val();
		$.post(
				"/forgotEmail"	
				,{ "emailId" : emailId }
				, function(data) {
					
					try{
						jsonData3 = JSON.parse(data);
					}
					catch(e) { //자바스크립트는 타입이 없기때문에 e만 적으면 된다.
					}
					if (jsonData3.forgotPw) {
						 swal("Confirm Email");
						 /* location.href="/goLogin"; */
					}
					if( !jsonData3.forgotPw )
					    notify('top','center', 'Check your Email ID', 'fa fa-comments', 'inverse', 'animated fadeInDown', 'animated fadeOutDown');
					}
					
		);
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
        <!-- Login -->
        <div class="lc-block toggled" id="l-login">
            <div class="input-group m-b-20">
                <span class="input-group-addon"><i class="md md-person"></i></span>
                <div class="fg-line">
                    <input type="text" class="form-control" placeholder="Email ID" id="userId">
                </div>
            </div>
            
            <div class="input-group m-b-20">
                <span class="input-group-addon"><i class="md md-lock"></i></span>
                <div class="fg-line">
                    <input type="password" class="form-control" placeholder="Password" id="password">
                </div>
            </div>
            
            <!-- 비밀번호찾기 만들기 -->
            <div class="clearfix"></div>
				
            <button class="btn btn-login btn-float" style="background-color: #71d1b2;" id="doLogin"><i class="md md-arrow-forward"></i></button>
            
            <ul class="login-navigation">
                <li data-block="#l-forget-password" class="bgm-orange">Forgot Password?</li>
            </ul>
            
             <!-- Forgot Password -->
        </div>
        
        <div class="lc-block" id="l-forget-password">
            <p class="text-left">Email ID</p>
            
            <div class="input-group m-b-20">
                <span class="input-group-addon"><i class="md md-email"></i></span>
                <div class="fg-line">
                    <input type="text" class="form-control" placeholder="Email Address" id="emailId">
                </div>
            </div>
            
            <button class="btn btn-login btn-float" style="background-color: #71d1b2;" id="forgotPw"><i class="md md-arrow-forward"></i></button>
            
            <ul class="login-navigation">
                <li data-block="#l-login" class="bgm-green">Login</li>
            </ul>
        </div>
    </body>
</html>