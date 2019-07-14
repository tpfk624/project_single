<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/commons/template/modern_business_top.jsp" %>

<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script> -->



<script>




$(function() {
	
	
	// 페이징 처리
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
	
	
	// 글 상세보기.
	$(document).on("click",".boardDetail", function () {
		var boardNum = $(this).find(".boardNum").val();
		
		if (boardNum == null || boardNum == "" || boardNum == 0) {
			alert("오류로 인해 접근이 불가능 합니다.");
		} else {
			location.href="${root}/board/view?boardNum=" + boardNum;
		}
		
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

    <!-- <ol class="breadcrumb" style="background-color: #004085!important;"></ol> -->




    <div class="row">
    <!-- 메인 중앙 --> 
    <div class="col-lg-10 mb-4">
      
      
	<!-- 이달의 자취왕 -->
	<!-- id="background" -->
	<div class="container">   
	<!-- style="background-image: url('/single/resources/img/bimg/15.jpg');" -->
	 
		<br> 
	    <h2 class="my-4" align="center" style="font: normal; font-weight: lighter; align-content: center;">이달의 최고 자취왕</h2>
		 
		<div class="container" >
			<div class="row" align="center"> 
				<c:forEach var="userdto" items="${userList}" varStatus="stat">
					<div class="col-lg-4">    
					<div class="container"  style="border: 1px solid gold;" > 
						<div class="container">    
							<br>
							<h3>${stat.count}등</h3>
							<h4>
								<img alt="${stat.count}" src="${root}/resources/img/bimg/${stat.count}.png">
								${userdto.userNickname}
							</h4>
							<c:if test="${userdto.userProfile != null}">
								<img src="${userdto.userProfile}" class="rounded-circle" alt="${stat.count}등" width="130" height="130">
							</c:if>
							<c:if test="${userdto.userProfile == null}">
								<img src='${root}/resources/img/seonimg/kakaopic.png' alt="${stat.count}등" class="rounded-circle" width="130" height="130">
							</c:if>
						</div>
						<br>  
					</div>
						<!-- 글 제목 좋아요 높은순으로 for문 돌리기 -->
						<div>
						<c:set var="userId" value="${userdto.userId}"></c:set>
							<div class="card">
								<div class="card-body"  style="background-color: #ffeb3b87">  
								<c:forEach var="board" items="${map[userId]}" varStatus="boardStat">
									<div><a href="${root}/board/view?boardNum=${board.boardNum}"><small>${boardStat.count}.&nbsp;${board.boardSubject}</small></a></div>
								</c:forEach>
								</div> 
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<br><br> 
	</div><hr style="background-color: #b5b5b5;"> 
	<br><br><br>	
	
	
			
	<!-- 새글 목록,페이징 처리 -->
	<div class="paging">	
	</div> <!-- 페이징처리 -->
	
	
	
	
	</div>
	  
	  
	  
	  
	<!-- Sidebar Column -->
	<%@ include file = "/WEB-INF/views/commons/singlecategory.jsp" %>
		
		
		
		
	</div>
	<!-- row -->

</div>
<br><br><br><br><br><br><br><br>






  
  
  
  
  
  
  
<%@ include file = "/WEB-INF/views/commons/template/modern_business_bottom.jsp" %>
