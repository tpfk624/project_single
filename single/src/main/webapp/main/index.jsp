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

</style>
      <!-- Header -->
         <header id="header">
            <div class="logo"><a href="index.html">Road Trip <span>by TEMPLATED</span></a></div>
            <!-- <a href="#menu"><span>Menu</span></a> -->
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
            
               <header>
                  <h1>SingleTrace</h1>
               </header>
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