<%-- <div class="btn-group btn-group-justified" role="group" aria-label="close">
         <div class="btn-group" role="group">
             <a class="btn btn-default" href="/teamInfo">Team Information</a>
         </div>
          <div class="btn-group" role="group">
             <a class="btn btn-default" href="${root}/controlMain?page=${PageUtil.chatCalendar}">Chat By Calendar</a>
         </div>
         <div class="btn-group" role="group">
             <a class="btn btn-default" href="${root}/controlMain?page=${PageUtil.chatMember}">Chat By Member</a>
         </div>
         <div class="btn-group" role="group">
             <a class="btn btn-default" href="${root}/controlMain?page=${PageUtil.propertyMember}">Property By Member</a>
    </div>
</div>     메뉴 첫번째 --%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="leaderEmail" value="${ sessionScope._TEAM_.leaderEmail }" />
<c:set var="Useremail" value="${ sessionScope._MEMBER_.email }" />

<ul class="tab-nav tn-justified" style="color: #323e4a; background-color: #edecec; ">
    <li class="waves-effect"><a href="/teamInfo" style="color: #323e4a;">Team Information</a></li>
    <li class="waves-effect"><a href="/propertyMember" style="color: #323e4a;">CHAT ANALYSIS</a></li>
		<c:if test="${ leaderEmail eq Useremail }">
	<li class="waves-effect"><a href="/goManageTeam" style="color: #323e4a;">TEAM SETTING</a></li>
		</c:if>
</ul>
 
 
 
<%-- <ul class="nav nav-pills">
 	<li class="active"><a href="/teamInfo">팀원정보</a></li>
    <li class="active"><a href="${root}/controlMain?page=${PageUtil.chatCalendar}">캘린더 대화</a></li>
    <li class="active"><a href="${root}/controlMain?page=${PageUtil.chatMember}">맴버간 대화</a></li>
    <li class="active"><a href="${root}/controlMain?page=${PageUtil.propertyMember}">맴버별 성향</a></li>
</ul>  --%>
<!-- <div role="tabpanel">
    <ul class="tab-nav" role="tablist" data-tab-color="red">
        <li class="active"><a href="#home11" aria-controls="home11" role="tab" data-toggle="tab">Team Information</a></li>
        <li><a href="#profile11" aria-controls="profile11" role="tab" data-toggle="tab">Chat By Calendar</a></li>
        <li><a href="#messages11" aria-controls="messages11" role="tab" data-toggle="tab">Chat By Member</a></li>
        <li><a href="#settings11" aria-controls="settings11" role="tab" data-toggle="tab">Property By Member</a></li>
    </ul>
	<div class="tab-content">
	    <div role="tabpanel" class="tab-pane active" id="home11">
	          <div class="block-header">
	              <h2>Buttons</h2>
	          
	              <ul class="actions">
	                  <li>
	                      <a href="">
	                          <i class="md md-trending-up"></i>
	                      </a>
	                  </li>
	                  <li>
	                      <a href="">
	                          <i class="md md-done-all"></i>
	                      </a>
	                  </li>
	                  <li class="dropdown">
	                      <a href="" data-toggle="dropdown">
	                          <i class="md md-more-vert"></i>
	                      </a>
	          
	                      <ul class="dropdown-menu dropdown-menu-right">
	                          <li>
	                              <a href="">Refresh</a>
	                          </li>
	                          <li>
	                              <a href="">Manage Widgets</a>
	                          </li>
	                          <li>
	                              <a href="">Widgets Settings</a>
	                          </li>
	                      </ul>
	                  </li>
	              </ul>
	          
	          </div>
	      
	          <div class="card">
	              <div class="card-header">
	                  <h2>Basic Examples <small>Use any of the available button classes to quickly create a styled button.</small></h2>
	          
	                  <ul class="actions">
	                      <li class="dropdown action-show">
	                          <a href="" data-toggle="dropdown">
	                              <i class="md md-more-vert"></i>
	                          </a>
	          
	                          <div class="dropdown-menu pull-right">
	                              <p class="p-20">
	                                  You can put anything here
	                              </p>
	                          </div>
	                      </li>
	                  </ul>
	              </div>
	          
	              <div class="card-body card-padding">
	                  <p class="f-500 c-black m-b-20">Bootstrap Color Schemes</p>
	                  
	                  <div class="btn-demo">
	                      <button class="btn btn-default">Default</button>
	                      <button class="btn btn-info">Info</button>
	                      <button class="btn btn-primary">Primary</button>
	                      <button class="btn btn-success">Success</button>
	                      <button class="btn btn-warning">Warning</button>
	                      <button class="btn btn-danger">Danger</button>
	                  </div>
	                  
	                  <br/>
	                  <br/>
	                  
	                  <p class="f-500 c-black m-b-20">Optional Material Design Colors</p>
	                  
	                  <div class="btn-colors btn-demo"> Optional container for demo porpose only
	                          <button class="btn bgm-cyan">Cyan</button>
	                          <button class="btn bgm-teal">Teal</button>
	                          <button class="btn bgm-amber">Amber</button>
	                          <button class="btn bgm-orange">Orange</button>
	                          <button class="btn bgm-deeporange">Deep Orange</button>
	                          <button class="btn bgm-red">Red</button>
	                          <button class="btn bgm-pink">Pink</button>
	                          <button class="btn bgm-lightblue">Light Blue</button>
	                          <button class="btn bgm-blue">Blue</button>
	                          <button class="btn bgm-indigo">Indigo</button>
	                          <button class="btn bgm-lime">Lime</button>
	                          <button class="btn bgm-lightgreen">Light Green</button>
	                          <button class="btn bgm-green">Green</button>
	                          <button class="btn bgm-purple">Purple</button>
	                          <button class="btn bgm-deeppurple">Deep Purple</button>
	                          <button class="btn bgm-gray">Gray</button>
	                          <button class="btn bgm-bluegray">Blue Gray</button>
	                          <button class="btn bgm-black">Black</button>
	                      </div>
	                      
	                      <br/>
	                      <br/>
	                      
	                      <p class="f-500 c-black m-b-5">Button Sizes</p>
	                      <small>Fancy larger or smaller buttons? Add the button sizing classes.</small>
	                      
	                      <br/>
	                      <br/>
	                      
	                      <div class="btn-demo">
	                          <button class="btn btn-primary btn-lg">Large</button>
	                          <button class="btn btn-primary">Default</button>
	                          <button class="btn btn-primary btn-sm">Small</button>
	                          <button class="btn btn-primary btn-xs">Extra Small</button>
	                      </div>
	
	                      <br/>
	                      <br/>
	                      
	                      <p class="f-500 c-black m-b-20">Disable Stat</p>
	                      
	                      <div class="btn-demo">
	                          <button class="btn btn-default" disabled="disabled">Default</button>
	                          <button class="btn btn-info" disabled="disabled">Info</button>
	                          <button class="btn btn-primary" disabled="disabled">Primary</button>
	                          <button class="btn btn-success" disabled="disabled">Success</button>
	                          <button class="btn btn-warning" disabled="disabled">Warning</button>
	                          <button class="btn btn-danger" disabled="disabled">Danger</button>
	                      </div>
	                  </div>
	              </div>
      		</div>
      <div role="tabpanel" class="tab-pane" id="profile11">
      2번
      </div>
      <div role="tabpanel" class="tab-pane" id="messages11">
      3번
      </div>
      <div role="tabpanel" class="tab-pane" id="settings11">
      4번
      </div>
    </div>
</div> -->

<%-- <ul class="nav nav-pills">
<ul class="tab-nav" data-tab-color="red">
        <li class="active"><a href="${root}/controlMain?page=${PageUtil.teamInfo}" data-toggle="tab">Team Information</a></li>
        <li><a href="${root}/controlMain?page=${PageUtil.chatCalendar}" data-toggle="tab">Chat By Calendar</a></li>
        <li><a href="${root}/controlMain?page=${PageUtil.chatMember}" data-toggle="tab">Chat By Member</a></li>
        <li><a href="${root}/controlMain?page=${PageUtil.propertyMember}" data-toggle="tab">Property By Member</a></li>
    </ul>
--%>
<%--  	 <div class="btn-group btn-group-justified" role="group" aria-label="close">
         <div class="btn-group" role="group">
             <a class="btn btn-primary" href="${root}/controlMain?page=${PageUtil.teamInfo}">팀원정보</a>
         </div>
          <div class="btn-group" role="group">
             <a class="btn btn-primary" href="${root}/controlMain?page=${PageUtil.chatCalendar}">캘린더 대화</a>
         </div>
         <div class="btn-group" role="group">
             <a class="btn btn-primary" href="${root}/controlMain?page=${PageUtil.chatMember}">맴버간 대화</a>
         </div>
         <div class="btn-group" role="group">
             <a class="btn btn-primary" href="${root}/controlMain?page=${PageUtil.propertyMember}">맴버별 성향</a>
         </div>
     </div> --%>
<%--     <li class="active"><a href="${root}/controlMain?page=${PageUtil.teamInfo}">팀원정보</a></li>
    <li class="active"><a href="${root}/controlMain?page=${PageUtil.chatCalendar}">캘린더 대화</a></li>
    <li class="active"><a href="${root}/controlMain?page=${PageUtil.chatMember}">맴버간 대화</a></li>
    <li class="active"><a href="${root}/controlMain?page=${PageUtil.propertyMember}">맴버별 성향</a></li>
  </ul> --%>

<%-- <c:if test="${pageNum ne null}">
<c:choose>
 	<c:when test="${pageNum eq page_teamInfo}">
       <jsp:include page="/WEB-INF/view/team/team_info.jsp"></jsp:include>
    </c:when>
 	<c:when test="${pageNum eq page_chatCalendar}" >
       <jsp:include page="/WEB-INF/view/chat/chat_calendar.jsp"></jsp:include>
    </c:when>
 	<c:when test="${pageNum eq page_chatMember}">
       <jsp:include page="/WEB-INF/view/chat/chat_mem.jsp"></jsp:include>
    </c:when>
 	<c:when test="${pageNum eq page_propertyMember}">
       <jsp:include page="/WEB-INF/view/member/property_mem.jsp"></jsp:include>
    </c:when>
</c:choose>
</c:if> --%>