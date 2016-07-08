<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.ktds.pingpong.chat.biz.ChatBiz" %>
<%@ page import="com.ktds.pingpong.team.vo.TeamVO" %>
<!DOCTYPE html>
<style>
::-webkit-scrollbar {width: 8px; height: 8px; border: 3px solid #fff; }
::-webkit-scrollbar-button:start:decrement, ::-webkit-scrollbar-button:end:increment {display: block; height: 10px; background: url('./images/bg.png') #efefef}
::-webkit-scrollbar-track {background: #efefef; -webkit-border-radius: 10px; border-radius:10px; -webkit-box-shadow: inset 0 0 4px rgba(0,0,0,.2)}
::-webkit-scrollbar-thumb {height: 50px; width: 50px; background: rgba(0,0,0,.2); -webkit-border-radius: 8px; border-radius: 8px; -webkit-box-shadow: inset 0 0 4px rgba(0,0,0,.1)}
html{scrollbar-3dLight-Color: #efefef; scrollbar-arrow-color: #dfdfdf; scrollbar-base-color: #efefef; scrollbar-Face-Color: #dfdfdf; scrollbar-Track-Color: #efefef; scrollbar-DarkShadow-Color: #efefef; scrollbar-Highlight-Color: #efefef; scrollbar-Shadow-Color: #efefef;}
#myProgress {
background-image: -webkit-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
  background-image: -o-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
  background-image: linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
  background-size: 40px 40px;
    /*  height: 20px; 
	position: relative;
	background: #555;
	-moz-border-radius: 25px;
	-webkit-border-radius: 25px;
	border-radius: 25px;
	padding: 10px;
	box-shadow: inset 0 -1px 1px rgba(255,255,255,0.3);  */
/*   background-color: #eee;
  border-radius: 2px;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.25) inset; */
}
#myBar {
 background-image: -webkit-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
  background-image: -o-linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
  background-image: linear-gradient(45deg, rgba(255, 255, 255, 0.15) 25%, transparent 25%, transparent 50%, rgba(255, 255, 255, 0.15) 50%, rgba(255, 255, 255, 0.15) 75%, transparent 75%, transparent);
background-color: #f44336;
  /*     content: "";
  position: absolute;
  top: 0; left: 0; bottom: 0; right: 0;
  background-image: linear-gradient(
    -45deg, 
    rgba(255, 255, 255, .2) 25%, 
    transparent 25%, 
    transparent 50%, 
    rgba(255, 255, 255, .2) 50%, 
    rgba(255, 255, 255, .2) 75%, 
    transparent 75%, 
    transparent
  );
  z-index: 1;
  background-size: 50px 50px;
  animation: move 2s linear infinite;
  border-top-right-radius: 8px;
  border-bottom-right-radius: 8px;
  border-top-left-radius: 20px;
  border-bottom-left-radius: 20px;
  overflow: hidden;  */
/*   background-image:
	   -webkit-linear-gradient(-45deg, 
	                           transparent 33%, rgba(0, 0, 0, .1) 33%, 
	                           rgba(0,0, 0, .1) 66%, transparent 66%),
	   -webkit-linear-gradient(top, 
	                           rgba(255, 255, 255, .25), 
	                           rgba(0, 0, 0, .25)),
	   -webkit-linear-gradient(left, #09c, #f44);

    border-radius: 2px; 
    background-size: 35px 20px, 100% 100%, 100% 100%; */
}
</style> 
<script type="text/javascript">
$(document).ready(function(){
	$("#searchKeyword").click(function (){
		var keyword = $("#keyword").val();
		if ( keyword = null || keyword == "" ){
			swal("입력된 키워드가 없습니다.");	
			return false;
		}
		
		var form = $("#searchForm");
        form.attr("method", "post");
        form.attr("action", "/getChatByKeyword");
        form.submit();
        
	});
});

</script>
<div class="card">
<div class="card-header" style="background-color: #71d1b2;">
	    <h2>Search By Keyword
	    <button type="button" class="md md-help" data-trigger="hover" data-toggle="popover" data-placement="bottom" data-content="키워드별 텍스트 추출"  style="border-radius :50%; background-color: #71d1b2; border: 0; size: 50%;"></button>
	    </h2>
</div>
<div class="card-body card-padding">
	<div class="row">
	    <div class="col-sm-4">
		<form id="searchForm">
		 <div class="row" style="width:380px;">
		    <div class="col-sm-6">
		        <div class="form-group">
		            <div class="fg-line fg-toggled" style="width:300px;">
		                <input type="text" class="form-control" placeholder="검색어 입력" id="keyword" name="keyword"/>
		            </div>
		        </div>
		    </div>
		    <div align="right"><button class="btn btn-icon" id="searchKeyword" style="background-color: #71d1b2; color: #fff;"><i class="md md-search"></i></button></div>
		</div>
		</form>
	</div>
	</div>

	<!-- 여기에 검색어 저장 -->
	<div class="panel-group" role="tablist" data-collapse-color="amber" aria-multiselectable="true" style="overflow:hidden;">
	  <div class="panel panel-collapse">
	     <div class="panel-heading" role="tab" id="headingTwo">
	         <h4 class="panel-title">
	             <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
	                 KeyWord List
	             </a>
	         </h4>
	     </div>
	     <div id="collapseTwo" class="collapse" role="tabpanel" aria-labelledby="headingTwo">
	         <div class="panel-body">
	         <form id="getNickName" method="post" action="/getChat">
				<c:forEach items="${ keywords }" var="key">
				<a href="/getChatByKeyword?keyword=${ key }">
				<div class="listview lv-user m-t-20">
					<div class="lv-item media">
				    <div class="lv-avatar pull-left" style="background-color: #7f4a82;"></div>
				    <div class="media-body">
				        <div class="lv-title"  style="margin-top: 4px; font-size:13px;">${ key }</div>
				    </div>
				     </div>
				</div>
				</a>
				</c:forEach>
			  </form>
	         
	         </div>
	     </div>
	 </div>
	</div>



</div>


</div>
<!-- <div class="card" id="insertKeyword">  í¤ìëì ì°ì.
    <div class="card-header">
        <h2>Keywords</h2>
    </div>
    <div class="card-body card-padding">
        <div class="alert alert-success alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <a href="" class="alert-link">KTDS</a>
        </div>
        <div class="alert alert-info alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <a href="" class="alert-link">KTDS</a>
        </div>
        <div class="alert alert-warning alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <a href="" class="alert-link">KTDS</a>
        </div>
        <div class="alert alert-danger alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <a href="" class="alert-link">KTDS</a>
        </div>
    </div>
</div> -->