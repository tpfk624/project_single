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
					
				}else if(dt == "2"){
					$("#here").html("<img src='${root}/resources/img/seonimg/soso.png' height='100'>");	
				}else if(dt == "3"){
					$("#here").html("<img src='${root}/resources/img/seonimg/bad.png' height='100'>");	
				}else if(dt == "4"){
					$("#here").html("<img src='${root}/resources/img/seonimg/die.png' height='100'>");	
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


</style>

      <!-- Header -->
         <header id="header">
            <div class="logo"><a href="index.html">우리 혼자 살아요 </a></div> <!-- <span>by TEMPLATED</span> -->
            
            <!-- <a href="#menu"><span>Menu</span></a> -->
            <!-- data-content="날씨정보" -->
            <img src="${root}/resources/img/seonimg/rain.png" id="weatherimg" height="100">
         </header>
         
		<input id="stationName" name="stationName" value="구로구" hidden="">
		<input id="dataTerm" name="dataTerm" value="DAILY" hidden="">
		
		


      <!-- menu -->
         <nav id="menu">
            <ul class="links">
            	<li id="profile">
	            	<div class="profile-userpic">
						<img id = "userpic" src='${root}/resources/img/seonimg/song.png'  height="100">
					</div>
					<!-- END SIDEBAR USERPIC -->
					<!-- SIDEBAR USER TITLE -->
					<div class="profile-usertitle">
						<div class="profile-usertitle-name">
						<br>
							Marcus Doe
						</div>
						<div class="profile-usertitle-job">
							Developer
						</div>
					</div>
				</li>
				<li>
					<hr>
            	</li>
               <%-- <li><a href="${root}/home/dusttest">로그인</a></li> --%>
               <li><a href="generic.html">같이놀래요</a></li>
               <li><a href="${root }/board/write">혼자놀래요</a></li>
            </ul>
         </nav>
      
         <section id="banner"> <!-- class="bg-img" -->
            <div class="inner">
              <!--  <header>
                  <h1>SingleTrace</h1>
               </header> -->
               <label class="txt">장마가 시작됐어요 우산 챙겨다니세요</label>
               <div class="input-group mb-3">
				  <input type="text" class="form-control" placeholder="Search" width="100">
				  <!-- <div class="input-group-append"> -->
				    <button class="btn btn-success" type="submit">&#8981;</button> 
				  <!-- </div> -->
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