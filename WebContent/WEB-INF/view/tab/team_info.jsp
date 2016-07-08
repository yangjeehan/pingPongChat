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
     	<script src="${root}/resource/resourcevendors/fileinput/fileinput.min.js"></script>
     	<script src="${root}/resource/vendors/chosen/chosen.jquery.min.js"></script>
		<script src="${root}/resource/vendors/bootstrap-select/bootstrap-select.min.js"></script>
		<script src="${root}/resource/vendors/bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
        
        <script src="resource/js/functions.js"></script>
        <script src="resource/js/demo.js"></script>
        
        <script type="text/javascript">
            $(document).ready(function(){
                //Basic Example
                $("#data-table-basic").bootgrid({
                    css: {
                        icon: 'md icon',
                        iconColumns: 'md-view-module',
                        iconDown: 'md-expand-more',
                        iconRefresh: 'md-refresh',
                        iconUp: 'md-expand-less'
                    },
                });
                var jsonData3 = {};
                $("#outTeam").click(function() {
                	$.post(
            				"/outTeam"
            				, function(data) {
            					
            					try{
            						jsonData3 = JSON.parse(data);
            					}
            					catch(e) { //자바스크립트는 타입이 없기때문에 e만 적으면 된다.
            					}
            					
            					if (jsonData3.isOutSuccess) { // 로그인 성공했으면
            						location.href="/goMain"; 
            					}
            					else { // 로그인에 실패했을 경우
            					     swal("팀장일 경우에는 탈퇴를 할 수 없습니다."); 
            					}
            				  }
            		);
                });
                
                $("#myProgress").hide();
            	$("#myBar").hide();
            	  
            /* 	$("#upload").click(function (){
            		/* var fm = document.textFileUpload;
            		var fnm = fm.chatText;
            		var ext = fnm.value; 
            		var fileExt = $("#isFile").val();
            		fileExt = fileExt.slice(fileExt.indexOf(".") + 1).toLowerCase();
            		if (fileExt != "txt" && fileExt != "") {
            			swal("텍스트 파일만 등록가능합니다.");
            			return false;
            		}
            		else if( $("#isFile") ==  null) {
            			swal("파일을 등록해주세요.");
            			return false;
            		}
            		else{
            			var form = $("#textFileUpload");
            	        form.attr("method", "post");
            	        form.attr("action", "/insertChat");
            	        form.attr("enctype", "multipart/form-data");
            	        form.submit();
            	        
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
            		}
            	}); */
      });
        </script>
<style>
::-webkit-scrollbar {width: 8px; height: 8px; border: 3px solid #fff; }
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
            <ul class="header-inner"  >
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
                    <li class="dropdown" style="color: black; ">
                        <a data-toggle="dropdown" class="tm-settings" href=""  style="color: #323e4a; background-color: #71d1b2; border-radius : 5px 5px 5px 5px"></a>
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
					    <li class="waves-effect active" ><a href="/teamInfo" style="color: #323e4a;">Team Information</a></li>
					    <li class="waves-effect"><a href="/propertyMember" style="color: #323e4a;">CHAT ANALYSIS</a></li>
						<c:if test="${ leaderEmail ne Useremail }">
						</c:if>    
						<c:if test="${ leaderEmail eq Useremail }">
						<li class="waves-effect"><a href="/goManageTeam" style="color: #323e4a;">TEAM SETTING</a></li>
						</c:if>
					</ul>
					 <div class="card" id="profile-main">
					<div class="pmb-block">
                       <div class="p-header">
                           <ul class="p-menu">
                               <li class="active"><a href=""><i class="md md-people hidden-xs"></i> Team Member List </a></li>
                               <button class="btn" style="background-color: #496f7a; color: #fff;" id="outTeam">탈퇴</button>
                           </ul>
                        
						<div class="contacts clearfix row">
							<c:forEach items="${ memberList }" var="memEmail" varStatus="status">
							<c:if test="${(status.index mod 5) eq 4}">
							<div class="row">
							</c:if>
							
							<c:if test = "${ memEmail.email ne Useremail }">
						
						
							
                            <div class="col-md-3 col-sm-6 col-xs-6">
                                <div class="c-item">
                                    <div class="ci-avatar">
                                    	<c:if test="${ memEmail.pic_name eq null }">
                                    		<img src="resource/img/notifications.png" height="170px">
                                    	</c:if>
                                    	<c:if test="${ memEmail.pic_name ne null }">
                                       		<img src="/callMemberImage?picName=${ memEmail.pic_name }" alt="" height="170px">
                                    	</c:if>
                                    </div>
                                    
                                    <div class="c-info">
                                        <strong>${ memEmail.name }</strong>
                                        <input type="hidden" id="thisEmail" name="thisEmail" value="${ memEmail.email }"><small>${ memEmail.email }</small>
                                    </div>
                                    <div class="c-footer">
                                    </div>
                                </div>
                            </div>
                            
                            </c:if>

							<c:if test="${(status.index mod 5) eq 4}">
							</div>
							</c:if>
				
                            </c:forEach>
						</div>
					</div>
			    </div>
			</div>
			</div>
			</div>
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
</html>