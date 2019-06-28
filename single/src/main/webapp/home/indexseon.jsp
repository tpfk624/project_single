<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/commons/template/roadtrip_top.jsp" %>

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

    #custom-search-form {
        margin:0;
        margin-top: 5px;
        padding: 0;
    }
 
    #custom-search-form .search-query {
        padding-right: 3px;
        padding-right: 4px \9;
        padding-left: 3px;
        padding-left: 4px \9;
        /* IE7-8 doesn't have border-radius, so don't indent the padding */
 
        margin-bottom: 0;
        -webkit-border-radius: 3px;
        -moz-border-radius: 3px;
        border-radius: 3px;
    }
 
    #custom-search-form button {
        border: 0;
        background: none;
        /** belows styles are working good */
        padding: 2px 5px;
        margin-top: 2px;
        position: relative;
        left: -28px;
        /* IE7-8 doesn't have border-radius, so don't indent the padding */
        margin-bottom: 0;
        -webkit-border-radius: 3px;
        -moz-border-radius: 3px;
        border-radius: 3px;
    }
 
    .search-query:focus + button {
        z-index: 3;   
    }

</style>
      <!-- Header -->
         <header id="header">
            <div class="logo"><a href="index.html">Road Trip <span>by TEMPLATED</span></a></div>
            
            <a href="#menu"><span>Menu</span></a>
         </header>

      <!-- Nav -->
         <nav id="menu">
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
               <h4>장마가 시작됐어요 우산 챙겨다니세요</h4>
               <div class="input-group mb-3">
				  <input type="text" class="form-control" placeholder="Search">
				  <div class="input-group-append">
				    <button class="btn btn-success" type="submit">Go</button> 
				  </div>
				</div>
            </div>
            <a href="#menu" class="more">menu</a>
         </section>

         <!-- <footer id="footer">
            <a href="#menu"><span>Menu</span></a>
         </footer> -->

      <!-- Scripts -->
         <%-- <script src="${root}/resources/assets/js/jquery.min.js"></script>
         <script src="${root}/resources/assets/js/jquery.scrolly.min.js"></script>
         <script src="${root}/resources/assets/js/jquery.scrollex.min.js"></script>
         <script src="${root}/resources/assets/js/skel.min.js"></script>
         <script src="${root}/resources/assets/js/util.js"></script>
         <script src="${root}/resources/assets/js/main.js"></script> --%>
         
         <script src="${root}/resources/template/roadtrip/assets/js/jquery.min.js"></script>
         <script src="${root}/resources/template/roadtrip/assets/js/jquery.scrolly.min.js"></script>
         <script src="${root}/resources/template/roadtrip/assets/js/jquery.scrollex.min.js"></script>
         <script src="${root}/resources/template/roadtrip/assets/js/skel.min.js"></script>
         <script src="${root}/resources/template/roadtrip/assets/js/util.js"></script>
         <script src="${root}/resources/template/roadtrip/assets/js/main.js"></script>

   </body>
</html>