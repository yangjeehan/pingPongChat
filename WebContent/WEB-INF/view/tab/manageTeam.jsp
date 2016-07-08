<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>PingPong Chat</title>
        <!-- Vendor CSS -->
        <link href="${root}/resource/vendors/animate-css/animate.min.css" rel="stylesheet">
        <link href="${root}/resource/vendors/bootgrid/jquery.bootgrid.min.css" rel="stylesheet">
        <link href="${root}/resource/vendors/fullcalendar/fullcalendar.css" rel="stylesheet">
        <link href="${root}/resource/vendors/sweet-alert/sweet-alert.min.css" rel="stylesheet">
        <link href="${root}/resource/vendors/light-gallery/lightGallery.min.css" rel="stylesheet">
        <link href="${root}/resource/vendors/material-icons/material-design-iconic-font.min.css" rel="stylesheet">
        <link href="${root}/resource/vendors/socicon/socicon.min.css" rel="stylesheet">
            
        <!-- CSS -->
        <link href="${root}/resource/css/app.min.1.css" rel="stylesheet">
        <link href="${root}/resource/css/app.min.2.css" rel="stylesheet">
        <link href="${root}/resource/css/display.property.css" rel="stylesheet">
        <link href="${root}/resource/css/profile.css" rel="stylesheet">
   	    <link href="${root}/resource/vendors/light-gallery/hovereffect.css" rel="stylesheet">
   	    
        <!-- Javascript Libraries -->
        <script src="resource/js/jquery-2.1.1.min.js"></script>
        <script src="resource/js/bootstrap.min.js"></script>
        
        <script src="resource/vendors/nicescroll/jquery.nicescroll.min.js"></script>
        <script src="resource/vendors/auto-size/jquery.autosize.min.js"></script>
        <script src="resource/vendors/bootgrid/jquery.bootgrid.min.js"></script>
        <script src="resource/vendors/waves/waves.min.js"></script>
        <script src="resource/vendors/bootstrap-growl/bootstrap-growl.min.js"></script>
        <script src="resource/vendors/sweet-alert/sweet-alert.min.js"></script>
		<script src="${root}/resource/resource/vendors/fileinput/fileinput.min.js"></script>
     	<script src="${root}/resource/vendors/chosen/chosen.jquery.min.js"></script>
		<script src="${root}/resource/vendors/bootstrap-select/bootstrap-select.min.js"></script>
		<script src="${root}/resource/vendors/bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
        
        <script src="resource/js/functions.js"></script>
        <script src="resource/js/demo.js"></script>
		<script type="text/javascript">
            $(document).ready(function(){
            	$("#input2").hide();
        		
        		$("#addEmail2").click(function(){
        			$("#input2").show();
        			$("#addFloor2").append("<div class=\"input-group m-b-20\"><span class=\"input-group-addon\"><i class=\"md md-mail\"></i></span><div class=\"fg-line\"><input type=\"text\" class=\"form-control\" placeholder=\"Email Address\" id=\"newAddemail\" name=\"email\"></div></div>");
        			
        		});         	
            	
        		$("#input2").click(function() {
        			 if ( $("#newAddemail").val() == "" ){
        				alert("첫번째 이메일의 입력란은 반드시 입력해주세요");	
        				return;
        			} 
        			
        			var form = $("#createAddEmail");
        			form.attr("method", "post");
        			form.attr("action", "<c:url value="/addNewMember"/>");
        			form.submit();
        		});
            	//위에는 멤버추가를 위한 코드
                //Basic Example
                
                var jsonData3 = {};
                $("#deleteMember").click( function() {
                	var email = $("#thisEmail").val();
                	location.href="/deleteMember?emailId=${ email }";
                });
                
                $("#deleteWaitingMember").click( function() {
                	var email = $("#waitingEmail").val();
                	location.href="/deleteWaitingMember?emailId=${ email }";
                });
                
                
                $("#myProgress").hide();
            	$("#myBar").hide();
            	  
            	 $("#upload").click( function move() {
            	    $("#myProgress").show();
            		$("#myBar").show();
					var elem = document.getElementById("myBar"); 
				    var width = 0;
				    var id = setInterval(frame, 180);
				    function frame() {
				        if (width >= 100) {
				            clearInterval(id);
				        } else {
				            width++; 
				            elem.style.width = width + '%'; 
				        }
				    }
				});
                
/*   기존 이메일 멤버 추가 방식             $("#addMember").click( function() {
                	if ( $("#email").val() == "" ){
        				swal("Member ID is empty");	
        				return;
        			}
                	
                	var form = $("#addMember");
        			form.attr("method", "post");
        			form.attr("action", "<c:url value="/addNewMember"/>");
        			form.submit();
                	
                }); */
            	
            	$("#deleteMember").click( function() {
                	var email = $("#thisEmail").val();
                	location.href="/deleteMember?emailId=${ email }";
                });
                
                $('#sa-params').click(function(){
                        swal({   
                            title: "Are you sure?",   
                            text: "Delete Team",   
                            type: "warning",   
                            showCancelButton: true,   
                            confirmButtonColor: "#DD6B55",   
                            confirmButtonText: "Yes, delete it!",   
                            cancelButtonText: "No, cancel!",   
                            closeOnConfirm: false,   
                            closeOnCancel: false 
                        }, function(isConfirm){   
                            if (isConfirm) {
                            	 swal({   
                                     title: "Deleted!",   
                                     text: "Your team has been deleted.",   
                                     type: "success",
                                     timer: 4000,
                                     showConfirmButton: false 
                                 });
                            	/* swal("Deleted!", "Your team has been deleted.", "success");  */
                            	location.href="/deleteTeam";
                            } else { 
                                swal("Cancelled", "Your team is safe :)", "error");   
                            }
                        });
                    });
			  });
			  
            	/* $("#myProgress").hide();
            	$("#myBar").hide(); */
            	
			</script>
<style>
::-webkit-scrollbar {width: 12px; height: 12px; border: 3px solid #fff; }
::-webkit-scrollbar-button:start:decrement, ::-webkit-scrollbar-button:end:increment {display: block; height: 10px; background: url('./images/bg.png') #efefef}
::-webkit-scrollbar-track {background: #efefef; -webkit-border-radius: 10px; border-radius:10px; -webkit-box-shadow: inset 0 0 4px rgba(0,0,0,.2)}
::-webkit-scrollbar-thumb {height: 50px; width: 50px; background: rgba(0,0,0,.2); -webkit-border-radius: 8px; border-radius: 8px; -webkit-box-shadow: inset 0 0 4px rgba(0,0,0,.1)}
html{scrollbar-3dLight-Color: #efefef; scrollbar-arrow-color: #dfdfdf; scrollbar-base-color: #efefef; scrollbar-Face-Color: #dfdfdf; scrollbar-Track-Color: #efefef; scrollbar-DarkShadow-Color: #efefef; scrollbar-Highlight-Color: #efefef; scrollbar-Shadow-Color: #efefef;}
#myProgress {
    position: relative;
    width: 100%;
    height: 30px;
    background-color: white;
}
#myBar {
    position: absolute;
    width: 1%;
    height: 100%;
    background-color: green;
}
</style>
</head>
<c:set var="Username" value="${ sessionScope._MEMBER_.name }" />
<c:set var="Useremail" value="${ sessionScope._MEMBER_.email }" />
<c:set var="leaderEmail" value="${ sessionScope._TEAM_.leaderEmail }" />
<c:set var="TeamID" value="${ sessionScope._TEAM_.teamId }" />
<c:set var="root" value="${pageContext.request.contextPath}" /> 

<body id="content" style="background-color: #edecec">
       <header id="header" style="background-color: #ffffff">
            <ul class="header-inner">
                <li>
                    <div class="line-wrap">
                        <div class="line top"></div>
                        <div class="line center"></div>
                        <div class="line bottom"></div>
                    </div>
                </li>
                <li class="logo hidden-xs">
                    <a class="orgin" href="/goMain"  style="color: #323e4a;">PingPong Chat</a>
                </li>
               		 
              <li class="pull-right"  style="color: black;">
                <ul class="top-menu">
                	<li class="logo" style="position: relative; top: 1px;">
                    	<a class="my" href="/goMain" style="color: black;">
                    	<i class="md-timer-auto" style="width: 200%; height: 200%; color: #323e4a;"> Welcome ${ Username }  ( ${ Useremail } ) </i></a>
                	</li> 
                    <li class="dropdown" style="color: #323e4a; background-color: #71d1b2; border-radius : 5px 5px 5px 5px">
                        <a data-toggle="dropdown" class="tm-settings" href=""  ></a>
                        <ul class="dropdown-menu dm-icon pull-right" style="color: black; ">
                       		<li>
                            	<a href="/doLogout"><i class="md md-history"></i>로그아웃</a>
                            </li>
                            <li>
                                <a data-action="fullscreen" href=""><i class="md md-fullscreen"></i>전체화면</a>
                            </li>
                            <li>
                                <a href="/doAboutProfile"><i class="md md-person"></i>회원정보</a>
                            </li>
                        </ul>
                    </li>
                    </ul>
                </li>
            </ul>
        </header>
        
        <section id="main">
	        <div id="left_menu">
				<div id="profile">
					<jsp:include page="/WEB-INF/view/view/profile.jsp"></jsp:include>
				</div>
				<div id="team_menu">
					<jsp:include page="/WEB-INF/view/team/team_menu.jsp"></jsp:include>
				</div>
				<div id="mine">
					<jsp:include page="/WEB-INF/view/member/mine.jsp"></jsp:include>
				</div>
			</div>
			<div id="main_menu">
				<div id="defaultPage">
					<ul class="tab-nav tn-justified" data-tab-color="cyan" style="color: #323e4a; background-color: #edecec; ">
					    <li class="waves-effect"><a href="/teamInfo" style="color: #323e4a;">Team Information</a></li>
					    <li class="waves-effect"><a href="/propertyMember" style="color: #323e4a;">CHAT ANALYSIS</a></li>
						<c:if test="${ leaderEmail ne Useremail }">
						</c:if>    
						<c:if test="${ leaderEmail eq Useremail }">
							<li class="waves-effect active"><a href="/goManageTeam" style="color: #323e4a;">TEAM SETTING</a></li>
						</c:if>
					</ul>
					 <div class="card" id="profile-main">
					<div class="pmb-block">
                       <div class="p-header">
                           <ul class="p-menu">
                               <li class="active"><a><i class="md md-people hidden-xs"></i> Team Member List </a></li>
                               <button class="btn btn-info" id="sa-params" style=" color: white; background-color: #71d1b2; float: right;  box-shadow: 0 2px 7px rgba(0, 0, 0, 0);" id="deleteTeam">Delete Team</button>
                               
                               <!-- background-color: #71d1b2; -->
                           </ul>
                        </div>	
						<div class="contacts clearfix row">
						
						<c:forEach items="${ memberList }" var="memEmail" varStatus="status">
								<form method="post" action="deleteMember">
									<c:if test="${(status.index mod 5) eq 4}">
									<div class="row">
									</c:if>
									
									<c:if test = "${ memEmail.email ne Useremail }">
		                            <div class="col-md-3 col-sm-6 col-xs-6">
		                                <div class="c-item" style="">
		                                    <div class="ci-avatar">
		                                    	<c:if test="${ memEmail.pic_name eq null }">
		                                    		<img src="resource/img/notifications.png"  height="170px">
		                                    	</c:if>
		                                    	<c:if test="${ memEmail.pic_name ne null }">
		                                       		<img src="/callMemberImage?picName=${ memEmail.pic_name }"  alt="" height="170px">
		                                    	</c:if>
		                                    </div>
		                                    <div class="c-info">
		                                        <strong>${ memEmail.name }</strong>
		                                        <input type="hidden" id="thisEmail" name="thisEmail" value="${ memEmail.email }"><small>${ memEmail.email }</small>
		                                    </div>
		                                    <div class="c-footer">
		                                        <button class="waves-effect" type="submit">Delete</button>
		                                    </div>
		                                </div>
		                            </div>
		                            </c:if>
		                            
	                                <c:if test="${(status.index mod 5) eq 4}">
									</div>
									</c:if>
		                            
		                            
	                            </form>
                            </c:forEach>
                            
                             <div class="col-md-3 col-sm-6 col-xs-6" >
	                                <div class="c-item">
	                                    <div class="ci-avatar">
                                    		<a href="#addMem"  data-toggle="modal" id="add"><img src="resource/img/add.png" height="170px" style="padding-right: 100px; padding-left: 100px; padding-bottom: 70px; padding-top: 70px;"></a>
	                                    </div>
	                                    <div class="c-info">
	                                    		<strong>NICK NAME</strong>
		                                        <small>EMAIL</small>
	                                    </div>
	                                     <div class="c-footer">
	                                     	 <button class="waves-effect" id="add">Add</button>
	                                     </div>
	                                </div>
	                            </div>
						</div>
			    </div>
			</div>
			
				 <div class="card" id="profile-sub">
					<div class="pmb-block" style="position:relative;">
                       <div class="p-header">
                           <div style="float:left;">
                           <ul class="p-menu">
                               <li class="active"><a><i class="md md-people hidden-xs"></i> Waiting List 
                               <button type="button" class="md md-help" data-trigger="hover" data-toggle="popover" data-placement="bottom" data-content="해당 이메일의 회원정보가 존재하지 않는 타겟들만 보여지는 리스트 입니다. 가입 후 에는 멤버 리스트 열에 자동으로 추가됩니다."  style="border-radius :50%; margin-top:3px; background-color: #fff; border: 0;"></button>
                               </a></li>
                           </ul>
                           </div>

                        </div>	
                        <br />
						<div class="contacts clearfix row" style="clear:both;">
							<c:forEach items="${ waitList }" var="waitList" varStatus="status">
								<form method="post" action="deleteWaitingMember">
									<c:if test="${(status.index mod 5) eq 4}">
									<div class="row">
									</c:if>
									
									<c:if test = "${ waitList.email ne Useremail }">
									
		                            <div class="col-md-3 col-sm-6 col-xs-6">
		                                <div class="c-item" style="">
		                                    <div class="ci-avatar">
		                                    		<img src="resource/img/nullprofile2.png" height="170px" style="padding-right:20px; padding-left:20px;">
		                                    </div>
		                                    <div class="c-info">
		                                        <strong>${ waitList.email }</strong>
		                                        <input type="hidden" id="waitingEmail" name="waitingEmail" value="${ waitList.email }">
		                                    </div>
		                                    <div class="c-footer">
		                                        <button class="waves-effect" type="submit">Delete</button>
		                                    </div>
		                                </div>
		                            </div>
		                            </c:if>
		                            
	                                <c:if test="${(status.index mod 5) eq 4}">
									</div>
									</c:if>
		                            
	                            </form>
                            </c:forEach>
						</div>
			   		 </div>
				</div>
			
			</div>
		 </div>
		 <div class="clear"></div>
			<c:if test="${ TeamID eq null }">
				<div id="right_menu">
					<div id="calendar">
					</div>
					<div id="chatbyMem">
					</div>
					<div id="chatbyKeyword">
					</div>
				</div>
			</c:if>
			<c:if test="${ TeamID ne null }">
				<div id="right_menu">
					<div id="calendar">
						<jsp:include page="/WEB-INF/view/calendar/calendar.jsp"></jsp:include>
					</div>
					<div id="chatbyMem">
						<jsp:include page="/WEB-INF/view/chat/chat_mem.jsp"></jsp:include>
					</div>
					<div id="chatbyKeyword">
						<jsp:include page="/WEB-INF/view/chat/chat_keyword.jsp"></jsp:include>
					</div>
				</div>
			</c:if>
	    <div class="clear"></div>
		</section>
	</body>
		<div class="modal" id="addMem" tabindex="-1" role="dialog"
			aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" align="center">ADD MEMBER</h4>
					</div>
					<div class="modal-body">
						<form id="createAddEmail">
		
							<div style="float: left; padding: 0px 50px 0px 0px;">
								<p class="f-500 c-black m-b-15">Send Invitation by e-mail</p>
							</div>
		
							<div>
								<button type="button" class="btn"
									style="background-color: #ff4f3e; color: white;" id="addEmail2">
									<i class="md md-arrow-forward"> ADD</i>
								</button>
							</div>
							<br />
							<div id="addFloor2"></div>
							<div id="tab32"></div>
							<div style="width: 30%; margin: auto;">
								<button class="btn" style="background-color: #ff4f3e; color: white;" id="input2">
									<i class="md md-check">SEND</i>
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
</html>