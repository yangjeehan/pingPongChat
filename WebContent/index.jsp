<!DOCTYPE html>
<%@page import="com.ktds.pingpong.member.vo.MemberVO"%>
<%@page import="com.ktds.pingpong.history.vo.OperationHistoryVO"%>
<%@page import="com.ktds.pingpong.history.biz.OperationHistoryBiz"%>
<%@page import="com.ktds.pingpong.history.vo.ActionCode"%>
<%@page import="com.ktds.pingpong.history.vo.Description"%>
<%@page import="com.ktds.pingpong.history.vo.BuildDescription"%>
<html lang="en">
<%
	MemberVO member = (MemberVO) session.getAttribute("_MEMBER_");
	if ( member != null ){
		OperationHistoryVO historyVO = new OperationHistoryVO();
		historyVO.setIp(request.getRemoteHost());
		historyVO.setEmail(member.getEmail());
		historyVO.setUrl(request.getRequestURI());
		historyVO.setActionCode(ActionCode.LOGIN);
		historyVO.setDescription(BuildDescription
				.get(Description.ALREADY_LOGIN, member.getEmail())
				);
		
		OperationHistoryBiz biz = new OperationHistoryBiz();
		biz.addHistory(historyVO);
		
		response.sendRedirect("/goMain");
		return;
	}

	
	OperationHistoryVO historyVO = new OperationHistoryVO();
	historyVO.setIp(request.getRemoteHost());
	historyVO.setEmail("");
	historyVO.setUrl(request.getRequestURI());
	historyVO.setActionCode(ActionCode.LOGIN);
	historyVO.setDescription(BuildDescription
			.get(Description.VISIT_LOGIN_PAGE, request.getRemoteHost())
			);
	
	OperationHistoryBiz biz = new OperationHistoryBiz();
	biz.addHistory(historyVO);
%>
<head>
<meta charset="UTF-8">
<title>PingPong Chat</title>
<link rel="stylesheet" href="resource/css/bootstrap.min.css">
<link rel="stylesheet" href="resource/css/bootstrap-theme.min.css">
<link href="resource/css/cover.css" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<style type="text/css">
.carousel{
    background: #2f4357;
    margin-top: 20px;
}
.carousel .item img{
    margin: 0 auto; /* Align slide image horizontally center */
}
.bs-example{
	margin: 20px;
}
h2 { 
	color: #F44336;
}
html {
  font-family: sans-serif;
  -ms-text-size-adjust: 100%;
  -webkit-text-size-adjust: 100%;
}
</style>
</head>
<body>
 <div class="site-wrapper">

      <div class="site-wrapper-inner">

        <div class="cover-container">

          <div class="masthead clearfix">
            <div class="inner">
              <h2 class="masthead-brand" color="#FFFFFF">PINGPONG CHAT</h2>
              <nav>
                <ul class="nav masthead-nav">
                  <li><a href="/goLogin" style="font-size : 17x;">Login</a></li>
                  <li><a href="/goSignup" style="font-size : 17px;">Sign Up</a></li>
                </ul>
              </nav>
            </div>
          </div>

          <div class="inner cover">
            
				<div class="bs-example">
				    <div id="myCarousel" class="carousel slide" data-ride="carousel">
				        <!-- Carousel indicators -->
				        <ol class="carousel-indicators">
				            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				            <li data-target="#myCarousel" data-slide-to="1"></li>
				            <li data-target="#myCarousel" data-slide-to="2"></li>
				        </ol>   
				        <!-- Wrapper for carousel items -->
				        <div class="carousel-inner">
				            <div class="item active">
				                <img src="resource/img/headers/2.png"  alt="First Slide">
				            </div>
				            <div class="item">
				                <img src="resource/img/headers/1.png" alt="Second Slide">
				            </div>
				            <div class="item">
				                <img src="resource/img/headers/3.png" alt="Third Slide">
				            </div>
				        </div>
				        <!-- Carousel controls -->
				        <a class="carousel-control left" href="#myCarousel" data-slide="prev">
				            <span class="glyphicon glyphicon-chevron-left"></span>
				        </a>
				        <a class="carousel-control right" href="#myCarousel" data-slide="next">
				            <span class="glyphicon glyphicon-chevron-right"></span>
				        </a>
				    </div>
				</div>
          </div>

          <div class="mastfoot">
            <div class="inner">
            </div>
          </div>

        </div>

      </div>

    </div>


</body>
</html>                                		