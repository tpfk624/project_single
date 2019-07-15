<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/commons/template/roadtrip_top.jsp" %>


<script src="${root}/resources/template/roadtrip/assets/js/jquery.min.js"></script>
<script src="${root}/resources/template/roadtrip/assets/js/jquery.scrolly.min.js"></script>
<script src="${root}/resources/template/roadtrip/assets/js/jquery.scrollex.min.js"></script>
<script src="${root}/resources/template/roadtrip/assets/js/skel.min.js"></script>
<script src="${root}/resources/template/roadtrip/assets/js/util.js"></script>
<script src="${root}/resources/template/roadtrip/assets/js/main.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="${root}/resources/css/common.css" type="text/css">


<!-- 로그인 -->
<!-- 사용법:파일 안의 로그인 로그아웃 버튼 선택자를 등록해주세요. -->
<%@ include file = "/WEB-INF/views/member/login/loginmodal.jsp"%> 
<!-- 로그인  -->	


<script>


/* $(document).ready(function(){
	$('[data-toggle="popover"]').popover({
		container:'body'
	});   
}); */

$(document).ready(function(){

	//로그인 버튼 누를때 네비바 닫히기
	$('.loginModalBtn').click(function() {
		$('#menu').attr("class","");
	});
	
	//로그아웃기능 추가
	$('.logoutBtn').click(function(){
		$.ajax({
			url:"${root}/member/logout",
			method: "GET",
			success: function(data){
				console.log(data);
				location.reload();
			},
			error: function (data){
			}
		});
		return false;
	});
	
	getDailyDust();
	
	//검색
	$("#word").on("keyup", function(e) {
		if(e.keyCode == 13){
			$("#searchBtn").trigger("click");
		}
	});
	$("#searchBtn").click(function() {
		window.open("	https://www.google.co.uk/search?newwindow=1&q=" + $("#word").val());
		//location.href = "https://www.google.co.uk/search?newwindow=1&q=" + $("#word").val();
	});
	
	//$('#weatherimg').on("click", getDailyDust);
});

function getDailyDust(){
	if($("#popover").hasClass("show")){
		$("#popover").removeClass("show");
		return;
	}
	
	var form = {
			'stationName' : $('#stationName').val(),
			'dataTerm' : $('#dataTerm').val()
	};
	$.ajax({
		url : "${root}/home/dusttest.do",
		type : "POST",
		data : JSON.stringify(form)	,
		contentType:"application/json; charset=UTF-8;",
		dataType : "json",
		success : function(data){
			var list = data.list;
			var dt = list[0].pm25Grade;
			console.log(dt);
			if(dt == "1"){
				$("#dustimg").attr("src", "${root}/resources/img/seonimg/good.png");
				//$("#here").html("<img src='${root}/resources/img/seonimg/good.png' height='100'>");
				$("#dustInfo").html("<strong>미세먼지 수치 너무 좋아요! 야외활동하기 딱 좋은 날이에요!</strong>");
			}else if(dt == "2"){
				$("#dustimg").attr("src", "${root}/resources/img/seonimg/soso.png");
				//$("#here").html("<img src='${root}/resources/img/seonimg/soso.png' height='100'>");	
				$("#dustInfo").html("<strong>미세먼지 수치 보통이에요. 오늘은 집 근처 산책은 어떠세요?</strong>");
			}else if(dt == "3"){
				$("#dustimg").attr("src", "${root}/resources/img/seonimg/bad.png");
				//$("#here").html("<img src='${root}/resources/img/seonimg/bad.png' height='100'>");	
				$("#dustInfo").html("<strong>오늘은 미세먼지가 많네요. 마스크 챙기세요!</strong>");
			}else if(dt == "4"){
				$("#dustimg").attr("src", "${root}/resources/img/seonimg/die.png");
				//$("#here").html("<img src='${root}/resources/img/seonimg/die.png' height='100'>");	
				$("#dustInfo").html("<strong>미세먼지가 심각해요! 오늘은 야외활동을 삼가해주세요!</strong>");
			}
			
			$("#popover").toggle(); 
		},
		error: function(){
			alert("에러났어요!!!!!!");
		}
	});
}
</script>

<input id="stationName" name="stationName" value="구로구" hidden="">
<input id="dataTerm" name="dataTerm" value="DAILY" hidden="">


      <!-- Header -->
         <header id="header">
            <div class="logo"><a href="${root}/home">우리 혼자 살아요 </a></div> <!-- <span>by TEMPLATED</span> -->
            <div>
            <img src="" id="dustimg" height="100">
            </div>
            <%-- <div class="popover fade bs-popover-bottom" role="tooltip" id="popover" style="will-change: transform;" x-placement="bottom">  transform: translate3d(1248px, 79px, 0px);
	        	<div class="arrow" style="left: 25px;">
	         	</div>
	         	<h3 class="popover-header">날씨</h3>
	         	<div class="popover-body">
	         		<img src="${root}/resources/img/seonimg/rain.png" id="dustimg" height="100">
	         	</div>
         	</div> --%>
         </header>

      <!-- menu -->
         <nav id="menu">
            <ul class="links">
            <c:if test="${userInfo != null}">
            	<li id="profile">
		          <!-- 프로필사진 -->
					<div class="user-photo" style="display: inline-block;">
						<c:if test="${userInfo.userProfile != null}">
			            	<img src="${userInfo.userProfile}" class="rounded-circle" width="90" height="90">             			
						</c:if>
						<c:if test="${userInfo.userProfile == null}">
		            		<img id = "userpic" src='${root}/resources/img/seonimg/kakaopic.png'  class="rounded-circle" width="90" height="90">  			
						</c:if>
					</div>
					<!-- 프로필사진 -->
					<div class="profile-usertitle">
						<div class="profile-usertitle-name">
						<br>
							${userInfo.userNickname}
						</div>
					</div>
				</li>
			</c:if>
			<li>
				<hr>
           	</li>
			<c:if test="${userInfo == null}">
                <li><a class="loginModalBtn" href="#">로그인 / 회원가입</a></li> <!-- href = "${root}/member/loginmodal/loginmodal.jsp-->
		    </c:if>
		    <c:if test="${userInfo != null}">
		    	<li><a class="logoutBtn" href="#">로그아웃</a></li><!-- href = "${root}/member/login" -->
		    	<li><a href="${root }/mypage/mypage">마이 페이지</a></li>
		    </c:if>
 <%-- 		    <c:if test="${userInfo != null}"> --%>
<%-- 		    	<li><a href="${root}/home/dusttest">로그아웃</a></li> --%>
<%-- 		    </c:if> --%>
                
                <li><a href="${root }/board/singlemain">혼자놀아요</a></li>
                <li><a href="${root}/group">같이놀아요</a></li>
            </ul>
            
         </nav>
      
         <section id="banner"> <!-- class="bg-img" -->
            <div class="inner">
              <!--  <header>
                  <h1>SingleTrace</h1>
               </header> -->
               <c:if test="${!empty userInfo}">
               <label class="txt"><strong>${userInfo.userName} 님 어서오세요</strong></label><br></c:if>
               <label class="txt" id="dustInfo"></label><br><br>
                <div class="input-group mb-3">
				  <input type="text" class="form-control" placeholder="구글 검색" width="100" id="word">
				  <button class="btn btn-success" type="submit" id="searchBtn">&#8981;</button> 
				</div>
            </div>
            <a href="#menu" class="more">menu</a>
         </section>

         <!-- 날씨 popover -->
                  
   </body>
</html>

