<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/commons/template/modern_business_top.jsp" %>

<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script> -->



<script>




// 페이징 처리
$(function() {
	
	
	
	selectPage(1, "", "", 1);
	
	// 페이지 숫자
	// this 대신에 클래스로 바로 접근하면 전체적으로 접근한 것이라 어느것이 클릭된지 판별이 안됌.
	$(document).on("click", ".page", function(){
		
		var key = $("#searchkey").val();
		var word =  $("#searchword").val();
	
		if (key == "" && word == "") {	
			var page = $(this).find(".page-link").val();
			selectPage(page, "", "", 1);
		}else {
			var page = $(this).find(".page-link").val();
			selectPage(page, key, word, 1);
		}	
		
	});
	
	
	$(document).on("click", "#search", function(){
		
			var word = $("#word").val();
			var key = $("#key").val();
			
			var page = $(this).find(".page-link").val();
			selectPage(1, key, word, 1);
		
	});
	
	 
});




function selectPage(page, key, word, boardListNum ) {
	var param = JSON.stringify({'page':page,'key':key,'word':word,'boardListNum':boardListNum});
	$.ajax({
		url : '${root}/board',
		type : 'GET',
		data : {
			'page':page
			,'key':key
			,'word':word
			,'boardListNum':boardListNum
		},
		success : function(response) {
			$(".paging").html(response.trim());
		}
	});
} 



</script>




<div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h2 class="mt-4 mb-3">혼자놀아요
      <small>- 자취생활 팁</small>
    </h2>

    <ol class="breadcrumb" style="background-color: #004085!important;"></ol>




    <div class="row">
    <!-- 메인 중앙 --> 
    <div class="col-lg-10 mb-4">
      
      
	<!-- 이달의 자취왕 -->
	<div class="container" style="background-color: #007bff21;">
	
	    <h2 class="my-4" align="center">이달의 최고 자취왕</h2>
		
		<div class="container">
			<div class="row" align="center">
				<div class="col-lg-4">
					<div class="container">
						<h3>1등</h3>
						<img src="${root}/resources/img/bimg/king.PNG" class="rounded-circle" alt="1등" width="100" height="100">
					</div>
					<!-- 글 제목 좋아요 높은순으로 for문 돌리기 -->
					<div>
						<div><a href="#">1.라면이 좋아요</a></div>
						<div><a href="#">2.이게 좋아요가 1등이라니</a></div>
						<div><a href="#">3.공부는 싫어요</a></div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="container">
						<h3>2등</h3>
						<img src="${root}/resources/img/bimg/king.PNG" class="rounded-circle" alt="2등" width="100" height="100">
					</div>
					<!-- 글 제목 좋아요 높은순으로 for문 돌리기 -->
					<div>
						<div><a href="#">1.라면이 좋아요</a></div>
						<div><a href="#">2.안뇽하세요 에베베베베베베베</a></div>
						<div><a href="#">3.공부는 싫어요</a></div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="container">
						<h3>3등</h3>
						<img src="${root}/resources/img/bimg/king.PNG" class="rounded-circle" alt="3등" width="100" height="100">
					</div>
					<!-- 글 제목 좋아요 높은순으로 for문 돌리기 -->
					<div>
						<div><a href="#">1.라면이 좋아요</a></div>
						<div><a href="#">2.띠요오오오옹오오오오오옹띠</a></div>
						<div><a href="#">3.공부는 싫어요</a></div>
					</div>
				</div>
			</div><br>
		</div>
	</div>
	<br><br><br>	
	
	
			
	<!-- 새글 목록,페이징 처리 -->
	<div class="paging">	
	</div> <!-- 페이징처리 -->
	
	
	
	
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
