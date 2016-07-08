<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<script src="${root}/resource/resource/vendors/fileinput/fileinput.min.js"></script>
<c:set var="Username" value="${ sessionScope._MEMBER_.name }" />
<c:set var="Useremail" value="${ sessionScope._MEMBER_.email }" />
<c:set var="Userpicpath" value="${ sessionScope._MEMBER_.pic_path }" />
<c:set var="nowTeamId" value="${ sessionScope._TEAM_.teamId }" />
<c:set var="ChatUdtUser" value="${ sessionScope._TEAM_.udtUser }" />
<c:set var="ChatUdtDate" value="${ sessionScope._TEAM_.udtDt }" />
<script>


	$(document).ready(function() {

		$("#myProgress").hide();
		$("#myBar").hide();

		$("#upload").click(function() {
			/* var fm = document.textFileUpload;
			var fnm = fm.chatText;
			var ext = fnm.value; */

			var fileExt = $("#isFile").val();
			if ( fileExt == "" ) {
				alert("선택된 파일이 없습니다.");
				return;
			}
			fileExt = fileExt.slice(fileExt.indexOf(".") + 1).toLowerCase();
			
			if (fileExt != "txt" && fileExt != "") {
 				alert("텍스트 파일만 등록가능합니다.");
 				return;
				
			}else{
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

		
		
		function notify(message, type){
	        $.growl({
	            message: message
	        },{
	            type: type,
	            allow_dismiss: false,
	            label: 'Cancel',
	            className: 'btn-xs btn-inverse',
	            placement: {
	                from: 'top',
	                align: 'right'
	            },
	            delay: 4000,
	            animate: {
	                    enter: 'animated bounceIn',
	                    exit: 'animated bounceOut'
	            },
	            offset: {
	                x: 1000,
	                y: 300
	            }
	        });
	 } 
	});
</script>
<style>
.fg-line:not([class*=has-]):after {
    background: #ff4f3e;
}
</style>
<c:if test="${ nowTeamId ne null }">
<div class="card" style="background-color : #354052; overflow: hidden;">
	<div class="card-header" style="background-color: #496f7a;">
	    <h2 style="color :#323e4a; font-weight:bold; font-size: 20px;">Upload File
	    <button type="button" class="md md-help" data-trigger="hover" data-toggle="popover" data-placement="bottom" data-content="Upload Only TextFile ex.kakao, line"  style="border-radius :50%; margin-top:3px; background-color: #496f7a; border: 0; size: 50%;"></button>
	    </h2>
	</div>

			<div class="card-body card-padding">
      <div class="row">
           <p class="f-500 c-black m-b-20" style="color: #959aa2;"></p>
           <form id="textFileUpload">
           <div class="fileinput fileinput-new" data-provides="fileinput" style="width: 100%;">
               <span class="btn btn-file" style="background-color: #7f4a82; color:white; width: 100%;">
                   <span class="fileinput-new">Upload file</span>
                   <span class="fileinput-exists">Change</span>
                   <input type="file" id="isFile" name="chatText" value="file"  >
               </span>
               <span class="fileinput-filename" style="color: white;" id="fileName"></span>
               <a href="#" class="close fileinput-exists" data-dismiss="fileinput" style="color: black; ">&times;</a>
           </div>
           
           <br/>
           <button class="btn btn-block" style="background-color: #ff4f3e; color:white;" id="upload">save</button>
           <br/>
           </form>
           <div id="myProgress">
              <div id="myBar">
              </div>
         </div>

			<c:if test="${ ChatUdtUser ne null }">
			<div id="ChatUpdateState" style="color : #959aa2;" >
					<br>
					최근 ${ ChatUdtUser }이(가) <br> 
					${ ChatUdtDate }에 <br>
					대화글 업데이트 하였습니다.
					<br>
			</div>
			</c:if>
			<br/>
	</div>
</div>
</div>
</c:if>