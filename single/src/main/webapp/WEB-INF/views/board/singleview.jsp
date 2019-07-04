<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/commons/template/modern_business_top.jsp" %>

<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script> -->






<div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h2 class="mt-4 mb-3">혼자놀아요
      <small>- 자취생활 팁</small>
    </h2>

    <ol class="breadcrumb" style="background-color: #004085!important;"></ol>




    <div class="row">
    <!-- 메인 중앙 -->
    <div class="col-lg-10 mb-4">
      
      
		<div class="row">
			<div class="col-lg-3"><h5>자취생활 팁 공유</h5></div>
			<div class="col-lg-9"></div>
		</div>
	    <div class="container" style=" border: 1px solid #444444;"><br><br>  
      
      
      
      	
      	<!-- 본글 -->
	   	<div class="row">
			<div class="col-lg-2"></div>
			<!-- 제목 -->
			<div class="col-lg-5"><h5>라면 맛있게 끓이기</h5><small>좋아요 : ${article.boardViews }</small></div>
			<div class="col-lg-0"></div>
			<div class="col-lg-4">
				<small>작성자 : ${article.userId }</small>
			</div>
			
			<div class="col-lg-1"><!-- 좋아요 그림 넣기 + 좋아요 수 나타내기 --></div>
		</div>
		<div class="row">
			<div class="col-lg-1"></div>
			<div class="col-lg-10"><hr style="background-color: #6c757d"></div>
			<div class="col-lg-1"></div>
		</div>
		<div class="row">
			<div class="col-lg-2"></div>
			<div class="col-lg-3"><small>작성일 : ${article.boardCreatedate }</small></div>
			<div class="col-lg-4" style="padding-right: 0;"></div>
			<div class="col-lg-2" style="padding-left: 0;">
				<button class="btn btn-outline-secondary" style="color: #007bff; border-color: #007bff;">좋아요</button>
			</div>
		</div>
		
		
		
		<!-- 답글 -->
	   	<div class="row">
	   		<div class="col-lg-2"></div>
			<div class="col-lg-8" style="border: 1px solid #444444;">
			<br><br><br><br>
			<!-- 글 내용 -->
			
			${article.boardContent }
			
			<br><br><br><br>
			</div>
			<div class="col-lg-2"></div>
	   	</div><br>
	   	<div class="row">
	   		<div class="col-lg-7"></div>
	   		<div class="col-lg-2">
	   		</div>
	   		<div class="col-lg-2">
	   			<button class="btn btn-outline-secondary" style="color: #007bff; border-color: #007bff;">글작성</button>
	   		</div>
	   		<div class="col-lg-1"></div>
	   	</div>
	   	
	   	
	   	<!-- 답변글 -->
		<div class="row">
			<div class="col-lg-1"></div>
			<div class="col-lg-10"><hr style="background-color: #adb5bd"></div>
			<div class="col-lg-1"></div>
		</div>
		<div class="row">
			<div class="col-lg-2"></div>
			<div class="col-lg-5"><small>작성일 : 2019-06-28</small></div>
			<div class="col-lg-5"></div>
		</div>
      	<div class="row">
	   		<div class="col-lg-2"></div>
			<div class="col-lg-8" style="border: 1px solid #444444;">
			<br><br>
				
				
				
				<div class="row">
					<div class="col-lg-1"></div>
					<div class="col-lg-3">______님 답변</div>
					<div class="col-lg-8"></div>
				</div>
				<div class="row">
					<div class="col-lg-1"></div>
					<div class="col-lg-10"><hr style="background-color: #6c757d"></div>
					<div class="col-lg-1">
					</div>
				</div>
				<div class="row">
					<div class="col-lg-1"></div>
					<div class="col-lg-10">
						<br>
						<!-- 내용넣기 -->
						잘 보고 갑니다요~~~
						<br>
					</div>
					<div class="col-lg-1"></div>
				</div>
				
				
				
				
				
			<br><br><br><!-- 글 내용 -->
			</div>
			<div class="col-lg-2"></div>
	   	</div><br>
      	
      	
      	
      	
      	</div>
	</div>
	  
	  
	  
	  
	<!-- Sidebar Column -->
	<div class="col-lg-2 mb-4" align="center"><br>
		<div class="list-group">
			<a href="index.html" class="list-group-item">메인</a>
			<a href="about.html" class="list-group-item">자취생활 팁</a>
			<a href="services.html" class="list-group-item">요리 레시피</a>
			<a href="contact.html" class="list-group-item">명예의 전당</a>
		</div>
	</div>
		
		
		
		
	</div>
	<!-- row -->

</div>
<br><br><br><br><br><br><br><br>






  
  
  
  
  
  
  
<%@ include file = "/WEB-INF/views/commons/template/modern_business_bottom.jsp" %>
