<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PingPong Chat</title>

<script src="${root}/resource/js/jquery-2.1.1.min.js"></script>
<script src="${root}/resource/js/bootstrap.min.js"></script>

<!-- Vendor CSS -->
<link href="${root}/resource/vendors/animate-css/animate.min.css"
	rel="stylesheet">
<link href="${root}/resource/vendors/fullcalendar/fullcalendar.css"
	rel="stylesheet">
<link href="${root}/resource/vendors/sweet-alert/sweet-alert.min.css"
	rel="stylesheet">
<link href="${root}/resource/vendors/light-gallery/lightGallery.min.css"
	rel="stylesheet">
<link
	href="${root}/resource/vendors/material-icons/material-design-iconic-font.min.css"
	rel="stylesheet">
<link href="${root}/resource/vendors/socicon/socicon.min.css"
	rel="stylesheet">


<!-- CSS -->
<link href="${root}/resource/css/app.min.1.css" rel="stylesheet">
<link href="${root}/resource/css/app.min.2.css" rel="stylesheet">
<link href="${root}/resource/css/display.property.css" rel="stylesheet">
<link href="${root}/resource/css/profile.css" rel="stylesheet">
<link href="${root}/resource/vendors/light-gallery/hovereffect.css"
	rel="stylesheet">

<!-- 모리스 차트 -->
<link href="${root}/resource/css/moris/font-awesome.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="http://cdn.oesmith.co.uk/morris-0.4.3.min.css">
<link href="${root}/resource/css/moris/style-responsive.css"
	rel="stylesheet">
<link href="${root}/resource/css/moris/style.css" rel="stylesheet">

<!--
<link rel="stylesheet" href="resource/css/jquery.mCustomScrollbar.css" />
<script
   src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="/resource/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="resource/vendors/nicescroll/jquery.nicescroll.min.js"></script>
<script src="resource/vendors/auto-size/jquery.autosize.min.js"></script>
<script src="resource/vendors/waves/waves.min.js"></script>

-->

<style>
::-webkit-scrollbar {
	width: 15px;
	height: 15px;
	border: 3px solid #fff;
}

::-webkit-scrollbar-button:start:decrement, ::-webkit-scrollbar-button:end:increment
	{
	display: block;
	height: 10px;
	background: url('./images/bg.png') #efefef
}

::-webkit-scrollbar-track {
	background: #efefef;
	-webkit-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: inset 0 0 4px rgba(0, 0, 0, .2)
}

::-webkit-scrollbar-thumb {
	height: 50px;
	width: 50px;
	background: rgba(0, 0, 0, .2);
	-webkit-border-radius: 8px;
	border-radius: 8px;
	-webkit-box-shadow: inset 0 0 4px rgba(0, 0, 0, .1)
}

@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

html {
	font-family: 'Nanum Gothic Coding', sans-serif;
	-ms-text-size-adjust: 100%;
	-webkit-text-size-adjust: 100%;
	scrollbar-3dLight-Color: #efefef;
	scrollbar-arrow-color: #dfdfdf;
	scrollbar-base-color: #efefef;
	scrollbar-Face-Color: #dfdfdf;
	scrollbar-Track-Color: #efefef;
	scrollbar-DarkShadow-Color: #efefef;
	scrollbar-Highlight-Color: #efefef;
	scrollbar-Shadow-Color: #efefef;
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
			<li class="logo hidden-xs"><a class="orgin" href="/goMain"
				style="color: #323e4a;">PingPong Chat</a></li>

			<li class="pull-right" style="color: black;">
				<ul class="top-menu">
					<li class="logo" style="position: relative; top: 1px;"><a
						class="my" href="/goMain" style="color: black;"> <i
							class="md-timer-auto"
							style="width: 200%; height: 200%; color: #323e4a;"> Welcome ${ Username } ( ${ Useremail } ) </i></a></li>
					<li class="dropdown"
						style="color: #323e4a; background-color: #71d1b2; border-radius: 5px 5px 5px 5px">
						<a data-toggle="dropdown" class="tm-settings" href=""></a>
						<ul class="dropdown-menu dm-icon pull-right" style="color: black;">
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
					<li class="waves-effect"><a href="/teamInfo"
						style="color: #323e4a;">Team Information</a></li>
					<li class="waves-effect active"><a href="/propertyMember"
						style="color: #323e4a;">CHAT ANALYSIS</a></li>
					<c:if test="${ leaderEmail ne Useremail }">
					</c:if>
					<c:if test="${ leaderEmail eq Useremail }">
						<li class="waves-effect"><a href="/goManageTeam"
							style="color: #323e4a;">TEAM SETTING</a></li>
					</c:if>
				</ul>


				<%-- <ul class="tab-nav" role="tablist">   
               <%
                Cookie[] cookies = request.getCookies() ;
                 
                if(cookies != null){
                  
                    for(int i=0; i < cookies.length; i++){
                        Cookie c = cookies[i] ;
                          if( c.getName().equals("tablist")){  %>
               <li class="waves-effect"><a href="/TabManager"><%=c.getValue()%>
                     <button class="btn btn-default">
                        <i class="md md-close"></i>
                     </button></li>
               <%
                           }
                          
                       }
                   }
               %>
            </ul> --%>

				<!-- 멤버별 속성 시작  -->
				<div class="row">

					<!-- page start-->
					<div id="morris">
						<div class="row mt" style="background-color: #f8f8f8;">
							<div class="col-lg-11">
								<div class="content-panel" style="overflow: auto; margin-top:5px;">
									<h4 style="text-align: left; margin-left: 10px;">
										<i class="md  md-person" style="margin-left: 9px;"></i> 날짜별 대화 추이
									</h4>
									<div class="panel-body" style="width: 150%">
										<div id="hero-graph" class="graph"></div>
									</div>
								</div>
							</div>
							<div class="col-lg-1">
								<div class="toggle-content" style="margin-left:5px; font-size: 13px;">
									<c:forEach items="${nickNames}" var="nickName">
									<div class="checkbox" style="margin-bottom:20px;">
									<label>
                                        <input type="checkbox"  style="width: 20px; height: 20px;"name="activec" checked="checked" value="${nickName}" />
                                        <i class="input-helper"></i>
                                        ${nickName}
                                    </label>
                                    </div>
										<%-- <input type="checkbox" name="activec" checked="checked"
											value="${nickName}" />${nickName}<br /> --%>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
					
                                    
                                </div>
					
					
					<!-- page end-->
				</div>
				<br /> <br />

				<div class="row">
					<div class="col-lg-5">
						<div class="content-panel">
							<h4>
								<i class="md md-person"></i> 멤버별 대화 참여율
							</h4>
							<div class="panel-body">
								<div id="hero-donut" class="graph"></div>
							</div>
						</div>
					</div>
					<div class="col-lg-1"></div>

					<!--  다른 데이터로 수정해야함 -->
					<div class="col-lg-5">
						<div class="content-panel">
							<h4>
								<i class="md md-person"></i> 자료 공유비율
							</h4>
							<div class="panel-body">
								<div id="file-donut" class="graph"></div>
							</div>
						</div>
					</div>
				</div>

				<br /> <br />

				<c:if test="${totalRate ne null}">
					<c:forEach items="${totalRate}" var="list" varStatus="status">
						<c:if test="${(status.index mod 3) eq 2}">
							<div class="row">
						</c:if>
							<div class="col-lg-4">
								<div class="epc-item bgm-transparent">
									<div class="easy-pie main-pie"
										data-percent="${list.similarity}">
<!-- 										style="background-color: blue;">-->
										<div class="percent">${list.similarity}</div>
										<div class="pie-title">${list.nickName}(${list.character})</div>
									</div>
								</div>
			
								<div class="card rating-list">
									<div class="listview">
										<div class="lv-header">
											<div class="m-t-5">
										<c:if test="${list.character eq '츤데레'}">
											("오다 주었데이 이거 너 가져라")<br/>
											정색도 하지만 상대방을 챙기는 타입
										</c:if>
										<c:if test="${list.character eq '분위기 메이커'}">
											("글쎄 있잖아~ , 헤헤 호호 ~")<br/>
											말수가 많고, 웃음도 많은 타입
										</c:if>
										<c:if test="${list.character eq '독재자'}">
											("내 말이 곧 법이다!")<br/>
											할 말만 하고, 잘 듣지 않는 타입
										</c:if>
										<c:if test="${list.character eq '부처'}">
											("나무아미타불 관세음 보살 (미소)")<br/>
											말 수가 적으며, 웃음으로 화답 하는 타입
										</c:if>
										<c:if test="${list.character eq '깍쟁이'}">
											("글쎄 말이야~, 나 이제 가봐야겠다")<br/>
											말이 많지만, 귀담아 듣지 않는 타입
										</c:if>
											
										
											
											</div>
											<div class="clearfix"></div>

										</div>

										<div class="lv-body">
											<div class="p-15">
												<div class="lv-item">
														<div class="media">
														<div class="pull-left">
															<c:if test="${list.morningChatCount eq list.maxMorningChatCount}">
																<img class="media-object" alt="" src="${root}/resource/img/trope.png" width="20px" height="20px">
															</c:if>
															<c:if test="${list.morningChatCount ne list.maxMorningChatCount}">
															<img class="media-object" alt="" src="${root}/resource/img/transparent.png" width="20px" height="20px" border="none" >
															</c:if>
														</div>
														<div class="pull-left">
															
															<i class="md md-brightness-5" data-trigger="hover"
																data-toggle="popover" data-placement="bottom"
																data-content="뻐꾸기 타입"></i>
														
														</div>
					
														<div class="pull-right">
															<fmt:formatNumber
																value="${(list.morningChatCount*100)/(list.sumMorningChatCount)}"
																pattern="0" />
															<br>

														</div>

														<div class="media-body">
															<div class="progress">
																<div class="progress-bar progress-bar-danger"
																	role="progressbar"
																	aria-valuenow="${(list.morningChatCount*100)/(list.sumMorningChatCount)}"
																	aria-valuemin="0" aria-valuemax="100"
																	style="width: <fmt:formatNumber value="${(list.morningChatCount)/(list.sumMorningChatCount)}" type="percent"/>"></div>

															</div>
														</div>
													</div>
												</div>

												<div class="lv-item">
													<div class="media">
														<div class="pull-left">
															<c:if test="${list.nightChatCount eq list.maxNightChatCount}">
																<img class="media-object" alt="" src="${root}/resource/img/trope.png" width="20px" height="20px">
															</c:if>
															<c:if test="${list.nightChatCount ne list.maxNightChatCount}">
															<img class="media-object" alt="" src="${root}/resource/img/transparent.png" width="20px" height="20px" border="none" >
															</c:if>
															
														</div>
														<div class="pull-left">
															<i class="md md-brightness-3" data-trigger="hover"
																data-toggle="popover" data-placement="bottom"
																data-content="올빼미 타입"></i>
														</div>

														<div class="pull-right">
															<fmt:formatNumber
																value="${(list.nightChatCount*100)/(list.sumNightChatCount)}"
																pattern="0" />
															<br>
														</div>

														<div class="media-body">
															<div class="progress">
																<div class="progress-bar progress-bar-warning"
																	role="progressbar"
																	aria-valuenow=${(list.nightChatCount*100)/(list.sumNightChatCount)}
																	aria-valuemin="0" aria-valuemax="100"
																	style="width: <fmt:formatNumber value="${(list.nightChatCount)/(list.sumNightChatCount)}" type="percent"/>"></div>
															</div>
														</div>
													</div>
												</div>

												<div class="lv-item">
													<div class="media">
														<div class="pull-left">
															<c:if test="${list.firstChatCount eq list.maxFirstChatCount}">
																<img class="media-object" alt="" src="${root}/resource/img/trope.png" width="20px" height="20px">
															</c:if>
															<c:if test="${list.firstChatCount ne list.maxFirstChatCount}">
																<img class="media-object" alt="" src="${root}/resource/img/transparent.png" width="20px" height="20px" border="none" >
															</c:if>
														</div>
														<div class="pull-left">
															<i class="md md-quick-contacts-mail" data-trigger="hover"
																data-toggle="popover" data-placement="bottom"
																data-content="리더형 타입"></i>
														</div>

														<div class="pull-right">
															<fmt:formatNumber
																value="${(list.firstChatCount*100)/(list.sumFirstChatCount)}"
																pattern="0" />
															<br>
														</div>


														<div class="media-body">
															<div class="progress">
																<div class="progress-bar progress-bar-warning"
																	role="progressbar"
																	aria-valuenow="${(list.firstChatCount*100)/(list.sumFirstChatCount)}"
																	aria-valuemin="0" aria-valuemax="100"
																	style="width: <fmt:formatNumber value="${(list.firstChatCount)/(list.sumFirstChatCount)}" type="percent"/>"></div>
															</div>
														</div>
													</div>
												</div>

												<div class="lv-item">
													<div class="media">
														<div class="pull-left">
															<c:if test="${list.firstReplyCountTalk eq list.maxFirstReplyCount}">
																<img class="media-object" alt="" src="${root}/resource/img/trope.png" width="20px" height="20px">
															</c:if>
															<c:if test="${list.firstReplyCountTalk ne list.maxFirstReplyCount}">
																<img class="media-object" alt="" src="${root}/resource/img/transparent.png" width="20px" height="20px" border="none" >
															</c:if>
														</div>
														<div class="pull-left">
															<i class="md md-cached" data-trigger="hover"
																data-toggle="popover" data-placement="bottom"
																data-content="반응형 타입"></i>
														</div>

														<div class="pull-right">
															<fmt:formatNumber
																value="${(list.firstReplyCountTalk*100)/(list.firstReplySumTalk)}"
																pattern="0" />
															<br>
														</div>

														<div class="media-body">
															<div class="progress">
																<div class="progress-bar progress-bar-success"
																	role="progressbar"
																	aria-valuenow="${(list.firstReplyCountTalk*100)/(list.firstReplySumTalk)}"
																	aria-valuemin="0" aria-valuemax="100"
																	style="width: <fmt:formatNumber value="${(list.firstReplyCountTalk)/(list.firstReplySumTalk)}" type="percent"/>"></div>
															</div>
														</div>
													</div>
												</div>

												<div class="lv-item">
													<div class="media">
														<div class="pull-left">
															<c:if test="${list.smileChatCount eq list.maxSmileChatCount}">
																<img class="media-object" alt="" src="${root}/resource/img/trope.png" width="20px" height="20px">
															</c:if>
															<c:if test="${list.smileChatCount ne list.maxSmileChatCount}">
																<img class="media-object" alt="" src="${root}/resource/img/transparent.png" width="20px" height="20px" border="none" >
															</c:if>
														</div>
														<div class="pull-left">
															<i class="md md-mood" data-trigger="hover"
																data-toggle="popover" data-placement="bottom"
																data-content="푼수형 타입"></i>
														</div>

														<div class="pull-right">
															<fmt:formatNumber
																value="${(list.smileChatCount*100)/(list.smileSumChatCount)}"
																pattern="0" />
															<br>
														</div>

														<div class="media-body">
															<div class="progress">
																<div class="progress-bar progress-bar-info"
																	role="progressbar"
																	aria-valuenow="${(list.smileChatCount*100)/(list.smileSumChatCount)}"
																	aria-valuemin="0" aria-valuemax="100"
																	style="width: <fmt:formatNumber value="${(list.smileChatCount)/(list.smileSumChatCount)}" type="percent"/>"></div>
															</div>
														</div>
													</div>
												</div>

												<div class="lv-item">
													<div class="media">
														<div class="pull-left">
															<c:if test="${list.angryChatCount eq list.maxAngryChatCount}">
																<img class="media-object" alt="" src="${root}/resource/img/trope.png" width="20px" height="20px">
															</c:if>
															<c:if test="${list.angryChatCount ne list.maxAngryChatCount}">
																<img class="media-object" alt="" src="${root}/resource/img/transparent.png" width="20px" height="20px" border="none" >
															</c:if>
														</div>
														<div class="pull-left">
															<i class="md md-whatshot" data-trigger="hover"
																data-toggle="popover" data-placement="bottom"
																data-content="정색형 타입"></i>
														</div>

														<div class="pull-right">
															<fmt:formatNumber
																value="${(list.angryChatCount*100)/(list.angrySumChatCount)}"
																pattern="0" />
															<br>
														</div>

														<div class="media-body">
															<div class="progress">
																<div class="progress-bar progress-bar-info"
																	role="progressbar"
																	aria-valuenow="${(list.angryChatCount*100)/(list.angrySumChatCount)}"
																	aria-valuemin="0" aria-valuemax="100"
																	style="width: <fmt:formatNumber value="${(list.angryChatCount)/(list.angrySumChatCount)}" type="percent"/>"></div>
															</div>
														</div>
													</div>
												</div>

											</div>
										</div>
									</div>
								</div>
							</div>
						<c:if test="${(status.index mod 3) eq 2}">
							</div>
						</c:if>
					</c:forEach>
				</c:if>
			</div>

			<!-- 멤버별 속성 끝  -->
		</div>
		<c:if test="${ TeamID eq null }">
			<div id="right_menu">
				<div id="calendar"></div>
				<div id="chatbyMem"></div>
				<div id="chatbyKeyword"></div>
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


	<!-- Javascript Libraries -->

	<script
		src="${root}/resource/vendors/bootstrap-growl/bootstrap-growl.min.js"></script>
	<script src="${root}/resource/vendors/waves/waves.min.js"></script>
	<script
		src="${root}/resource/vendors/nicescroll/jquery.nicescroll.min.js"></script>
	<script
		src="${root}/resource/vendors/sparklines/jquery.sparkline.min.js"></script>
	<script
		src="${root}/resource/vendors/easypiechart/jquery.easypiechart.min.js"></script>
	<script src="${root}/resource/vendors/sweet-alert/sweet-alert.min.js"></script>
	<script
		src="${root}/resource/resourcevendors/fileinput/fileinput.min.js"></script>
	<script src="${root}/resource/vendors/chosen/chosen.jquery.min.js"></script>
	<script
		src="${root}/resource/vendors/bootstrap-select/bootstrap-select.min.js"></script>
	<script
		src="${root}/resource/vendors/bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>

	<script src="${root}/resource/js/charts.js"></script>

	<!-- moris에 적용 -->
	<script class="include" type="text/javascript"
		src="${root}/resource/js/moris/jquery.dcjqaccordion.2.7.js"></script>
	<script src="${root}/resource/js/moris/jquery.scrollTo.min.js"></script>

	<!--common script for all pages-->
	<script src="${root}/resource/js/moris/raphael-min.js"></script>
	<script src="${root}/resource/js/moris//morris-0.4.3.min.js"></script>
	<script src="${root}/resource/js/moris/common-scripts.js"></script>
	<!--script for this page-->
	<!--   <script src="/resource/js/moris/morris-conf.js"></script>  -->
	<script src="${root}/resource/js/functions.js"></script>
	<script src="${root}/resource/js/demo.js"></script>

	<script>
		var morrisLine = Morris.Line({
			element : 'hero-graph',
			data : lidate(),
			xkey : 'd',
			ykeys : nickdate(),
			labels : nickdate(),
			lineColors : [ '#4ECDC4', '#FF85CA', '#cd2225', '#fd5111',
					'#2478FF', '#B95AFF' ]
		});

		/* jQuery(function($)......................................................... { */
		$(document).ready(function() {
			$("#myProgress").hide();
			$("#myBar").hide();
			  
			$("#upload").click(function (){
				/* var fm = document.textFileUpload;
				var fnm = fm.chatText;
				var ext = fnm.value; */
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
			});

			$("input:checkbox[name='activec']").on('change', function() {
				var nick = new Array();
				$("input:checkbox[name='activec']").each(function() {
					if (this.checked) {
						//checked 된 value값
						console.log("체크된값들" + this.value);
						nick.push(this.value);
					}
				});

				/*             
				var nick = nickdate();
				if (!this.checked) {
				   var i = nick.indexOf(this.value);
				   nick.splice(i, 1);
				} else {
				   nick.push(this.value);
				} */

				morrisLine.setData(lidate(nick));
			});
		});
		function nickdate() {
			var nickNames = new Array();
			<c:forEach items="${nickNames}" var="nickName">
			nickNames.push("${nickName}");
			</c:forEach>
			return nickNames;
		}

		/*       function singleNickdate(){
		 var nickNames;
		
		 nickdate = function singleNickdate(){
		 return nickNames;
		 };
		
		 nickNames = new Array();
		 nickNames.constructor = 
		 <c:forEach items="${nickNames}" var="nickName">
		 nickNames.push("${nickName}");
		 </c:forEach>
		 return nickNames;
		 } */

		function lidate(checkNick) {
			var line_data = new Array();

			/*    console.log("===========");
			   console.log(line_data.length); */

			<c:forEach items="${dayChatCounts}" var="rates">
			if (typeof checkNick == "undefined") { // 처음 실행시 
				var ldata = {};
				ldata["d"] = "${rates.chatDay}",
						ldata["${rates.nickName}"] = "${rates.dayChatCount}";
				line_data.push(ldata);

			} else { // 버튼으로 인한 실행시
				/*             console.log("k"+line_data.length); */

				if (checkNick.indexOf("${rates.nickName}") != -1) {
					var ldata = {};
					ldata["d"] = "${rates.chatDay}";
					ldata["${rates.nickName}"] = "${rates.dayChatCount}";

					line_data.push(ldata);
				}

			}
			</c:forEach>

			return line_data;
		};

		var Script = function() {
			//morris chart
			$(function() {

				// data stolen from http://howmanyleft.co.uk/vehicle/jaguar_'e'_type

				// 닉네임 넣는다.
				/*
				$("input:checkbox[name='activec']").each(function() {
				     this.checked=true;  // checked 처리
				   if (this.checked) {
				      //checked 된 value값
				      console.log("체크된값들"+this.value);
				      nickNames.push(this.value);
				   }
				});
				 */

				var donutData = new Array();
				<c:forEach items="${memChatRates}" var="item">
				var data = {};

				data.label = "${item.nickName}";
				data.value = "${item.memberChatRate}";
				console.log("what" + data.label);
				console.log("how" + data.value);

				data.value = Math.round(data.value * 100);
				donutData.push(data);
				</c:forEach>

				Morris.Donut({
					element : 'hero-donut',
					data : donutData,
					colors : [ '#2a99b7', '#3bbdc0', '#804a82', '#7c95be',
							'#f5bc4b', '#8ac050', '#70c9a6', '#48d1ff',
							'#4974c5' ],
					formatter : function(y) {
						return y + "%"
					}
				});

				var fileData = new Array();
				<c:forEach items="${addFileCounts}" var="item">
				var data = {};

				data.label = "${item.nickName}";
				data.value = "${item.addFileCount/item.sumAddFileCount}";
				console.log(data.label);
				console.log(data.value);
				data.value = Math.round(data.value * 100);
				fileData.push(data);
				</c:forEach>

				Morris.Donut({
					element : 'file-donut',
					data : fileData,
					colors : [ '#2a99b7', '#3bbdc0', '#804a82', '#7c95be',
							'#f5bc4b', '#8ac050', '#70c9a6', '#48d1ff',
							'#4974c5' ],
					formatter : function(y) {
						return y + "%"
					}
				});

				Morris.Area({
					element : 'hero-area',
					data : [ {
						period : '2010 Q1',
						iphone : 2666,
						ipad : null,
						itouch : 2647
					}, {
						period : '2010 Q2',
						iphone : 2778,
						ipad : 2294,
						itouch : 2441
					}, {
						period : '2010 Q3',
						iphone : 4912,
						ipad : 1969,
						itouch : 2501
					}, {
						period : '2010 Q4',
						iphone : 3767,
						ipad : 3597,
						itouch : 5689
					}, {
						period : '2011 Q1',
						iphone : 6810,
						ipad : 1914,
						itouch : 2293
					}, {
						period : '2011 Q2',
						iphone : 5670,
						ipad : 4293,
						itouch : 1881
					}, {
						period : '2011 Q3',
						iphone : 4820,
						ipad : 3795,
						itouch : 1588
					}, {
						period : '2011 Q4',
						iphone : 15073,
						ipad : 5967,
						itouch : 5175
					}, {
						period : '2012 Q1',
						iphone : 10687,
						ipad : 4460,
						itouch : 2028
					}, {
						period : '2012 Q2',
						iphone : 8432,
						ipad : 5713,
						itouch : 1791
					} ],

					xkey : 'period',
					ykeys : [ 'iphone', 'ipad', 'itouch' ],
					labels : [ 'iPhone', 'iPad', 'iPod Touch' ],
					hideHover : 'auto',
					lineWidth : 1,
					pointSize : 5,
					lineColors : [ '#4a8bc2', '#ff6c60', '#a9d86e' ],
					fillOpacity : 0.5,
					smooth : true
				});

				Morris.Bar({
					element : 'hero-bar',
					data : [ {
						device : 'iPhone',
						geekbench : 136
					}, {
						device : 'iPhone 3G',
						geekbench : 137
					}, {
						device : 'iPhone 3GS',
						geekbench : 275
					}, {
						device : 'iPhone 4',
						geekbench : 380
					}, {
						device : 'iPhone 4S',
						geekbench : 655
					}, {
						device : 'iPhone 5',
						geekbench : 1571
					} ],
					xkey : 'device',
					ykeys : [ 'geekbench' ],
					labels : [ 'Geekbench' ],
					barRatio : 0.4,
					xLabelAngle : 35,
					hideHover : 'auto',
					barColors : [ '#ac92ec' ]
				});

				new Morris.Line({
					element : 'examplefirst',
					xkey : 'year',
					ykeys : [ 'value' ],
					labels : [ 'Value' ],
					data : [ {
						year : '2008',
						value : 20
					}, {
						year : '2009',
						value : 10
					}, {
						year : '2010',
						value : 5
					}, {
						year : '2011',
						value : 5
					}, {
						year : '2012',
						value : 20
					} ]
				});

				$('.code-example').each(function(index, el) {
					eval($(el).text());
				});
			});

		}();
	</script>
	<%--
       이거 두개 가 문제 
         <script src="${root}/resource/js/functions.js"></script>
        <script src="${root}/resource/js/demo.js"></script> 
      --%>
</body>
</html>