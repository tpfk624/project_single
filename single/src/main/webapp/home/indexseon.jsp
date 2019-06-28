<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/commons/template/roadtrip_top.jsp" %>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script>

$(document).ready(function(){
	$('[data-toggle="popover"]').popover();   
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

}
</style>

      <!-- Header -->
         <header id="header">
            <div class="logo"><a href="index.html">우리 혼자 살아요 </a></div> <!-- <span>by TEMPLATED</span> -->
            
            <!-- <a href="#menu"><span>Menu</span></a> -->
            <a href="#"  data-toggle="popover" title="Popover Header" data-content="Some content inside the popover">
            	<img src="${root}/resources/img/seonimg/rain.png" id="weatherimg" height="100">
            </a>
         </header>


      <!-- menu -->
         <nav id="menu">
            <ul class="links">
               <li><a href="index.html">로그인</a></li>
               <li><a href="generic.html">같이놀래요</a></li>
               <li><a href="elements.html">혼자놀래요</a></li>
            </ul>
         </nav>
         
      <!-- weather -->
         <nav id="weather" >
            <ul class="links">
               <li><a href="index.html">로그인</a></li>
               <li><a href="generic.html">같이놀래요</a></li>
               <li><a href="elements.html">혼자놀래요</a></li>
            </ul>
         </nav>

      <!-- Banner -->
      <!--
         Note: To show a background image, set the "data-bg" attribute below
         to the full filename of your image. This is used in each section to set
         the background image.
      -->
      
      
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

         <!-- <footer id="footer">
            <a href="#menu"><span>Menu</span></a>
         </footer> -->
         
         <script src="${root}/resources/template/roadtrip/assets/js/jquery.min.js"></script>
         <script src="${root}/resources/template/roadtrip/assets/js/jquery.scrolly.min.js"></script>
         <script src="${root}/resources/template/roadtrip/assets/js/jquery.scrollex.min.js"></script>
         <script src="${root}/resources/template/roadtrip/assets/js/skel.min.js"></script>
         <script src="${root}/resources/template/roadtrip/assets/js/util.js"></script>
         <script src="${root}/resources/template/roadtrip/assets/js/main.js"></script>

   </body>
</html>