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
<script>
$(document).ready(function(){
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
}); 
</script>

<div class="card">
	<div class="card-header" style="background-color: #71d1b2;">
	    <h2>Text Diary by Member
	     <button type="button" class="md md-help" data-trigger="hover" data-toggle="popover" data-placement="bottom" data-content="대화방에 존재하는 멤버별 대화 추출"  style="border-radius :50%; background-color: #71d1b2; border: 0; size: 50%;"></button>
	    </h2>
	</div>
	<div class="card-body card-padding">
	<!-- <div class="row">
	    <div class="col-sm-4">
	        <p class="f-500 c-black m-b-20">Input only text file</p>
	        <form id="textFileUpload" method="post" action="/insertChat" enctype="multipart/form-data">
	        <div class="fileinput fileinput-new" data-provides="fileinput">
	            <span class="btn btn-primary btn-file m-r-10">
	                <span class="fileinput-new">Select file</span>
	                <span class="fileinput-exists">Change</span>
	                <input type="file" name="chatText" value="file">
	            </span>
	            <span class="fileinput-filename" style="color: black;"></span>
	            <a href="#" class="close fileinput-exists" data-dismiss="fileinput" style="color: black;">&times;</a>
	        </div>
	        <br/>
	        <button class="btn bgm-red" type="submit" id="upload"><i class="md md-trending-up" style=" margin-bottom: 2px;"></i> Upload TextFile</button>
	        <br/>
	        <div id="myProgress">
				  <div id="myBar">
				  </div>
			</div>
			<br/>
	        </form>
	    </div>
	</div> -->


<div class="panel-group" role="tablist" data-collapse-color="amber" aria-multiselectable="true">
    <div class="panel panel-collapse">
        <div class="panel-heading" role="tab" id="headingOne">
            <h4 class="panel-title"  >
                <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                  Member List
              </a>
          </h4>
      </div>
      <div id="collapseOne" class="collapse in" role="tabpanel" aria-labelledby="headingOne">
          <div class="panel-body">
          	  <form id="getNickName" method="post" action="/getChat">
         
            <c:forEach items="${ allChatMember }" var="mem">
            <a href="/getChat?nickName=${ mem }">
            <div class="listview lv-user m-t-20">
               <div class="lv-item media">
                <div class="lv-avatar pull-left" style="background-color: #ff4f3e;">m</div>
                <div class="media-body">
                    <div class="lv-title" style="margin-top: 4px; font-size:13px;">${ mem }</div>
                </div>
                 </div>
            </div>
            </a>
            </c:forEach>
            <br>
            <a href="/getChat?nickName=all">모두 보기</a>
           </form>
           </div>
       </div>
   </div>
</div>

  </div>     
</div>	
                                


                        
