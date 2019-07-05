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




<style>
#banner .more:before{
   content: "";
    -moz-osx-font-smoothing: grayscale;
    -webkit-font-smoothing: antialiased;
    font-family: FontAwesome;
    font-style: normal;
    font-weight: normal;
    text-transform: none !important;
}

.txt{
	font-size: 30px;
	text-shadow: 2px 2px 2px gray;
	font-weight: bolder;
}

.logo{
	text-shadow: 2px 2px 2px gray;
}

#weatherimg{
	margin-top: 10px;
	cursor: pointer;

}
#weatherimg:hover{
	transform:scale(1.1);             /*  default */
	-webkit-transform:scale(1.1);     /*  크롬 */
	-moz-transform:scale(1.1);       /* FireFox */
	-o-transform:scale(1.1);           /* Opera */
	/* box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19); */
}

#popover{
	width: 500px
}

#profile{
	text-align: center;
}
#userpic{
	width: 100px; height: 100px;
    object-fit: cover;
    border-radius: 50%;
}

.input-group>.custom-file, .input-group>.custom-select, .input-group>.form-control, .input-group>.form-control-plaintext {
    position: relative;
    /* -ms-flex: 1 1 auto;
    flex: 1 1 auto; */
    flex:100px;
    width: 1%;
    margin-bottom: 0;
}

.input-group>.custom-select:not(:last-child), .input-group>.form-control:not(:last-child) {
    border-top-right-radius: 0;
    border-bottom-right-radius: 0;
    background-color: white;
}

</style>

<script>

/* $(document).ready(function(){
	$('[data-toggle="popover"]').popover({
		container:'body'
	});   
}); */

$(document).ready(function(){
	
	$('#weatherimg').on("click", function(){
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
					$("#here").html("<img src='${root}/resources/img/seonimg/good.png' height='100'>");
					$(".txt").html("<strong>미세먼지도 없는데 산책 어떠세요?</strong>");
				}else if(dt == "2"){
					$("#here").html("<img src='${root}/resources/img/seonimg/soso.png' height='100'>");	
					$(".txt").html("<strong>미세먼지 좋아요</strong>");
				}else if(dt == "3"){
					$("#here").html("<img src='${root}/resources/img/seonimg/bad.png' height='100'>");	
					$(".txt").html("<strong>마스크 챙기세요!</strong>");
				}else if(dt == "4"){
					$("#here").html("<img src='${root}/resources/img/seonimg/die.png' height='100'>");	
					$(".txt").html("<strong>미세먼지가 심각해요! 마스크 꼭 챙기세요!</strong>");
				}
				
				$("#popover").addClass("show"); 
			},
			error: function(){
				alert("에러났어요!!!!!!");
			}
		});
	});
});
</script>

<input id="stationName" name="stationName" value="구로구" hidden="">
<input id="dataTerm" name="dataTerm" value="DAILY" hidden="">


      <!-- Header -->
         <header id="header">
            <div class="logo"><a href="index.html">우리 혼자 살아요 </a></div> <!-- <span>by TEMPLATED</span> -->
            <img src="${root}/resources/img/seonimg/rain.png" id="weatherimg" height="100">
         </header>
         
		
		


      <!-- menu -->
         <nav id="menu">
            <ul class="links">
            
            <c:if test="${userInfo != null}">
            	<li id="profile">
	            	<div class="profile-userpic">
						<img id = "userpic" src='${root}/resources/img/seonimg/kakaopic.png'  height="100">
					</div>
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
               <li><a href="${root}/home/dusttest">로그인</a></li>
		    </c:if>
                <li><a href="${root }/mypage/groupall">마이 페이지</a></li>
                <li><a href="${root }/board/singlemain">혼자놀래요</a></li>
                <li><a href="generic.html">같이놀래요</a></li>
            </ul>
         </nav>
      
         <section id="banner"> <!-- class="bg-img" -->
            <div class="inner">
              <!--  <header>
                  <h1>SingleTrace</h1>
               </header> -->
               <label class="txt"></label>
                <div class="input-group mb-3">
				  <input type="text" class="form-control" placeholder="Search" width="100">
				    <button class="btn btn-success" type="submit">&#8981;</button> 
				</div>
            </div>
            <a href="#menu" class="more">menu</a>
         </section>


         <!-- 날씨 popover -->
         
         <div class="popover fade bs-popover-bottom" role="tooltip" id="popover" style="float : right; top: 60px; left: 1560px;  will-change: transform;" x-placement="bottom">  <!-- transform: translate3d(1248px, 79px, 0px); -->
	         <div class="arrow" style="left: 25px;">
	         </div>
	         <h3 class="popover-header">날씨</h3>
	         <div class="popover-body">
	         	<div id="here"></div>
	         </div>
         </div>
   </body>
</html>

