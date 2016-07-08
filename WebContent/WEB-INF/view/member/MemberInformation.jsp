<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="com.ktds.pingpong.member.vo.MemberVO" %>
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
        <script src="resource/vendors/waves/waves.min.js"></script>
        <script src="resource/vendors/bootgrid/jquery.bootgrid.min.js"></script>
        <script src="resource/vendors/bootstrap-growl/bootstrap-growl.min.js"></script>
        <script src="resource/vendors/sweet-alert/sweet-alert.min.js"></script>
        <script src="${root}/resource/vendors/fileinput/fileinput.min.js"></script>
        <script src="resource/vendors/chosen/chosen.jquery.min.js"></script>
		<script src="resource/vendors/bootstrap-select/bootstrap-select.min.js"></script>
		<script src="resource/vendors/bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>

		
        
        <script src="resource/js/functions.js"></script>
        <script src="resource/js/demo.js"></script>
        
<script type="text/javascript">

$(document).ready( function() {

	$("#uploadPhoto").click(function() {
		var fileExt = $("#upPhoto").val();
		if (fileExt == "") {
		swal("사진파일이 없습니다. ");
		return false;
		} 
		else {
				fileExt = fileExt.slice(fileExt.indexOf(".") + 1).toLowerCase();
				
				if (fileExt != "jpg" && fileExt != "png" && fileExt != "gif" && fileExt != "bmp" && fileExt != "") {
					swal("사진 파일만 등록가능합니다.");
					return false;
				} else {
						var form = $("#profileModal");
						form.attr("method", "post");
						form.attr("action","/updatePhoto");
						form.attr("enctype","multipart/form-data");
						form.submit();
				}
		}
	});

	function notify(from, align, icon, type, animIn, animOut) {
			$.growl({
					icon : icon,
					title : '',
					message : 'Your password is not correct',
					url : ''
					},
					{
					element : 'body',
					type : type,
					allow_dismiss : true,
					placement : {
								from : from,
								align : align
								},
								offset : {
											x : 20,
											y : 85
										},
								spacing : 10,
								z_index : 1031,
								delay : 2500,
								timer : 1000,
								url_target : '_blank',
								mouse_over : false,
								animate : {
											enter : animIn,
											exit : animOut
											},
								icon_type : 'class',
								template : '<div data-growl="container" class="alert" role="alert">'
														+ '<button type="button" class="close" data-growl="dismiss">'
														+ '<span aria-hidden="true">&times;</span>'
														+ '<span class="sr-only">Close</span>'
														+ '</button>'
														+ '<span data-growl="icon"></span>'
														+ '<span data-growl="title"></span>'
														+ '<span data-growl="message"></span>'
														+ '<a href="#" data-growl="url"></a>'
														+ '</div>'
											});
						};

						var jsonData3 = {};

						$("#saveInfo")
								.click(
										function() {
											var name = $("#name").val();
											var afterPw = $("#afterPw").val();
											var beforePw = $("#beforePw").val();


											$
													.post(
															"/doChangeInfo",
															{
																"name" : name,
																"afterPw" : afterPw,
																"beforePw" : beforePw
															},
															function(data) {

																try {
																	jsonData3 = JSON
																			.parse(data);
																} catch (e) { //자바스크립트는 타입이 없기때문에 e만 적으면 된다.
																}

																if (jsonData3.isUpdate) {
																	location.href = "/doLogout";
																}
																if (jsonData3.checkPw == false) {
																	notify(
																			'top',
																			'center',
																			'fa fa-comments',
																			'inverse',
																			'animated fadeInDown',
																			'animated fadeOutDown');
																}
															});

										});

						$("#data-table-basic").bootgrid({
							css : {
								icon : 'md icon',
								iconColumns : 'md-view-module',
								iconDown : 'md-expand-more',
								iconRefresh : 'md-refresh',
								iconUp : 'md-expand-less'
							},
						});

						$("#data-table-command").bootgrid({
							css : {
								icon : 'md icon',
								iconColumns : 'md-view-module',
								iconDown : 'md-expand-more',
								iconRefresh : 'md-refresh',
								iconUp : 'md-expand-less'
							}
						/* formatters: {
						    "commands": function(column, row) {
						        return "<button type=\"submit\" class=\"btn btn-icon command-delete\" data-row-id=\"" + row.id + "\"><span class=\"md md-delete\"></span></button>";
						    }
						} */
						});
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
<c:set var="picName" value="${ sessionScope._MEMBER_.pic_name }" />
<c:set var="picPath" value="${ sessionScope._MEMBER_.pic_path }" />
<c:set var="root" value="${pageContext.request.contextPath}" /> 
<body id="content" style="background-color: #ffffff">
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
        
        <section id="main" style="background-color: #ecf0f1;">
	          <section id="content">
                <div class="container" >
				<div id="defaultPage">
					 <div class="block-header">
                        <h2>Member Information <small> you can modify your information</small></h2>
                    </div>
                    
                    <div class="card" id="profile-main" >
                        <div class="pm-overview c-overflow">
                            <div class="pmo-pic">
                                <div class="p-relative">
                                	<c:if test="${ picName  ne null }">
                                		<img src="/callImageServlet" class="img-responsive" alt="">
                                	</c:if>
                                    <c:if test="${ picName  eq null }">
                                    	<img src="resource/img/notifications.png" class="img-responsive">
                                    </c:if>
									<a href="#modalProfile" data-target-color="lightblue" data-toggle="modal" class="pmop-edit">
										<i class="md md-camera-alt"></i> 
										<span class="hidden-xs">프로필 사진 변경</span>
									</a>
									
                                <!-- Modal -->
		                           <div class="modal fade" id="modalProfile" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-hidden="true">
		                                <div class="modal-dialog modal-sm">
		                                    <div class="modal-content">
		                                        <div class="modal-header">
		                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
													<h4 class="modal-title">프로필 사진 변경</h4>
		                                        </div>
		                                        <form id="profileModal">
			                                        <div class="modal-body" align="center">
														<p>원하시는 사진을 선택하세요.</p>
														<div class="fileinput fileinput-new" data-provides="fileinput">
							                                <div class="fileinput-preview thumbnail" data-trigger="fileinput"></div>
							                                <div>
							                                    <span class="btn btn-info btn-file" style="background-color: #7f4a82;">
							                                        <span class="fileinput-new">선택된 이미지</span>
							                                        <span class="fileinput-exists">변경</span>
							                                        <input type="file" id="upPhoto" name="upPhoto" value="file">
							                                    </span>
							                                    <a href="#" class="btn btn-danger fileinput-exists" data-dismiss="fileinput">Remove</a>
							                                </div>
							                            </div>
													</div>		
			                                        <div class="modal-footer">
			                                            <button class="btn btn-link" id="uploadPhoto">Save</button>
			                                            <button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
			                                        </div>
		                                        </form>
		                                    </div>
		                                </div>
		                            </div>
								</div>
                                
                                <div class="pmo-stat">
                                    <h2 class="m-0 c-white">${ Username }</h2>
                                    ${ Useremail }
                                </div>
                            </div>
                            <!-- <div class="pmo-block pmo-contact hidden-xs">
                                <h2>Team Information</h2>
                                
                                <ul>
                                    <li><i class="md md-phone"></i> 00971 12345678 9</li>
                                    <li><i class="md md-email"></i> malinda-h@gmail.com</li>
                                    <li><i class="socicon socicon-skype"></i> malinda.hollaway</li>
                                    <li><i class="socicon socicon-twitter"></i> @malinda (twitter.com/malinda)</li>
                                    <li>
                                        <i class="md md-location-on"></i>
                                        <address class="m-b-0">
                                            10098 ABC Towers, <br/>
                                            Dubai Silicon Oasis, Dubai, <br/>
                                            United Arab Emirates
                                        </address>
                                    </li>
                                </ul>
                            </div>-->
                        </div> 
                        
                        <div class="pm-body clearfix">
                            <ul class="tab-nav" role="tablist" data-tab-color="amber">
                                <li class="active"><a href="#teamInfo" aria-controls="teamInfo" role="tab" data-toggle="tab">Team Information</a></li>
                                <li><a href="#changeInfo" aria-controls="changeInfo" role="tab" data-toggle="tab">Change Information</a></li>
                            </ul>
                            
                            <div class="tab-content">
						    	
						    	
						    	<!-- Team Info -->
						    	<div role="tabpanel" class="tab-pane active" id="teamInfo">
							        <div class="pmb-block">
		                                <div class="pmbb-header">
		                                    <h2><i class="md md-equalizer m-r-5"></i> Team List</h2>
	                                	</div>
	                                <div class="pmbb-body p-l-30">
	                                    <div class="pmbb-view">
	                                        <div class="panel-group" role="tablist" data-collapse-color="amber" aria-multiselectable="true">
											    <div class="panel panel-collapse">
											        <div class="panel-heading" role="tab" id="headingOne">
											            <h4 class="panel-title" >
											                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
											                  Team List
											              </a>
											          </h4>
											      </div>
											      <div id="collapseOne" class="collapse in" role="tabpanel" aria-labelledby="headingOne">
											          <div class="panel-body">
														<c:forEach items="${ allTeams }" var="teams">
															<div class="listview lv-user m-t-20">
																<div class="lv-item media">
															    <div class="lv-avatar bgm-red pull-left">t</div>
															    <div class="media-body">
															        <div class="lv-title">${ teams.teamName }  ( Member Count : ${ teams.memCount } )</div>
															        <div class="lv-small">Leader ID : ${ teams.leaderEmail }</div>
															    </div>
															     </div>
															</div>
														</c:forEach>
											           </div>
											       </div>
											   </div>
											</div>
	                                    </div>
	                                </div>
                            		</div>
	                            	<div class="pmb-block">
	                                <div class="pmbb-header">
	                                    <h2><i class="md md-person m-r-5"></i> Basic Information</h2>
	                                </div>
	                                <div class="pmbb-body p-l-30">
	                                    <div class="pmbb-view">
	                                        <dl class="dl-horizontal">
	                                            <dt>name</dt>
	                                            <dd>${ Username }</dd>
	                                        </dl>
	                                        <dl class="dl-horizontal">
	                                            <dt>email</dt>
	                                            <dd>${ Useremail }</dd>
	                                        </dl>
	                                    </div>
                                    </div>
	                            	</div>
                            	</div>
	          				
	          					<!-- change Info -->
						    	<div role="tabpanel" class="tab-pane" id="changeInfo">
		                            	<div class="pmb-block">
			                                <div class="pmbb-header">
			                                    <h2><i class="md md-person m-r-5"></i> Change Information
			                                    <button type="button" class="md md-help" data-trigger="hover" data-toggle="popover" data-placement="bottom" data-content="비밀번호 변경시 다시 로그인 해주세요."  style="border-radius :50%; background-color: #ffffff; border: 0; size: 50%;"></button>
			                                    <div align="right" style="margin-top:-20px;"><a class="btn" style="background-color: #71d1b2; color: white;" data-pmb-action="edit" href="">Edit</a></div>
			                                    </h2>
		                               		</div>
			                                <div class="pmbb-body p-l-30">
			                                    <div class="pmbb-view">
			                                        <dl class="dl-horizontal">
			                                            <dt>name</dt>
			                                            <dd>${ Username }</dd>
			                                        </dl>
			                                        <dl class="dl-horizontal">
			                                            <dt>email</dt>
			                                            <dd>${ Useremail }</dd>
			                                        </dl>
		                                    	</div>
		                                    
		                                    <div class="pmbb-edit">
		                                        <dl class="dl-horizontal">
		                                            <dt class="p-t-10">User name</dt>
		                                            <dd>
		                                                <div class="fg-line">
		                                                    <input type="text" id="name" name="name" class="form-control" placeholder="eg. ${ Username }">
		                                                </div>
		                                            </dd>
		                                        </dl>
		                                        <dl class="dl-horizontal">
			                                            <dt>User email</dt>
			                                            <dd>${ Useremail }</dd>
		                                        </dl>
		                                        <dl class="dl-horizontal">
		                                            <dt class="p-t-10">Password</dt>
		                                            <dd>
		                                                <div class="fg-line">
		                                                    <input type="password" id="beforePw" name="beforePw" class="form-control" placeholder="before password">
		                                                </div>
		                                                <div class="fg-line">
		                                                    <input type="password" id="afterPw" name="afterPw" class="form-control" placeholder="after password">
		                                                </div>
		                                                
		                                            </dd>
		                                        </dl>
		                                        
		                                        <div class="m-t-30">
		                                            <button class="btn btn-primary btn-sm" id="saveInfo" >Save</button>
		                                            <button data-pmb-action="reset" class="btn btn-link btn-sm">Cancel</button>
		                                        </div>
		                                    </div>
		                            	</div>
	                            	</div>
		          				</div><!-- changeInfo -->
	          				
	          				
	          				
	          				
	          					<%-- <!-- Manage Team -->
					    		<div role="tabpanel" class="tab-pane" id="ManageTeam">
							        <div class="pmb-block">
		                                <div class="pmbb-header">
		                                    <h2><i class="md md-equalizer m-r-5"></i>Manage Team</h2>
	                                	</div>
	                                	<div class="listview lv-bordered lv-lg">
	                                	<c:forEach items="${ isLeaderTeams }" var="teams">
	                                	<div class="lv-body">
			                                <div class="lv-item media">
			                                    <div class="checkbox pull-left">
			                                        <label>
			                                            <input type="checkbox" value="">
			                                            <i class="input-helper"></i>
			                                        </label>
			                                    </div>
			                                    
			                                    <div class="media-body">
			                                        <div class="lv-title">${ teams.teamName }  ( Member Count : ${ teams.memCount } )</div>
			                                        
			                                        <div class="lv-actions actions dropdown">
			                                            <a href="" data-toggle="dropdown" aria-expanded="true">
			                                                <i class="md md-more-vert"></i>
			                                            </a>
			                                
			                                            <ul class="dropdown-menu dropdown-menu-right">
			                                                <li>
			                                                    <a href="#manageTeam" data-toggle="modal" id="manageTeam">Member Manage</a><!-- Modal로 보내기 -->
			                                                </li>
			                                                <li>
			                                                    <a href="/deleteTeam?teamId=${ teams.teamId }">Delete Team</a> <!-- /DeleteTeam서블릿으로 -->
			                                                </li>
			                                            </ul>
			                                        </div>
			                                        
			                                    </div>
			                                </div>
		                                </div>
	                                	</c:forEach>
	                                	</div>
	                                </div>
                            		</div><!-- Manage Team --> --%>
                            		
                            	<%-- 	<!-- Manage Team -->
					    		<div role="tabpanel" class="tab-pane" id="ManageTeam">
							        <div class="pmb-block">
		                                <div class="pmbb-header">
		                                    <h2><i class="md md-equalizer m-r-5"></i>Manage Team</h2>
	                                	</div>
	                                	
	                                	<div class="table-responsive">
	                                	<table id="data-table-selection" class="table table-striped">
	                                		<thead>
				                                <tr>
				                                    <th data-column-id="teamName">Team Name</th>
				                                    <th data-column-id="memberEamil">Member</th>
				                                </tr>
				                            </thead>
		                                	<tbody>
			                                	<c:forEach items="${ isLeaderTeams }" var="teams">
			                                	
			                                	<tr>
			                                		<td> ${ teams.teamName }  ( Member Count : ${ teams.memCount } )</td>
			                                		<td> ${ teams.email }</td>
			                                	</tr>
			                                	</c:forEach>
		                                	</tbody>
	                                	</table>
	                                	</div>
	                                </div>
                            		</div><!-- Manage Team --> --%>
                            		
                            		
                            	</div><!-- tab content -->
                            		<!-- <div class="modal" id="manage" tabindex="-1" role="dialog" aria-hidden="true">
													<div class="modal-dialog">
										                <div class="modal-content">
										                     <div class="modal-header">
										                         <h4 class="modal-title" align="center">Manage Team</h4>
										                     </div>
																<div class="modal-body">
										                        <form id="manage">
										                        	팀관리
																
																</form>
										                    </div>
										                 </div>
										             </div>
												</div> -->
	          				</div>
						</div>
					</div>
				</div>
		</section>
		</section>
		
		
<!-- 		<div class="modal" id="manage" tabindex="-1" role="dialog" aria-hidden="true">
			<div class="modal-dialog">
                <div class="modal-content">
                     <div class="modal-header">
                         <h4 class="modal-title" align="center">Manage Team</h4>
                     </div>
						<div class="modal-body">
                        <form id="manage">
                        	팀관리
						
						</form>
                    </div>
                 </div>
             </div>
		</div>
		
		 -->
	</body>
</html>


		