<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/commons/template/modern_business_top.jsp" %>

<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script> -->
<% UserDto userDto = new UserDto();
userDto.setUserId("qjawns0617@naver.com");
userDto.setUserNickname("뿡뿡뿡뿡");
userDto.setUserName("권범준");
session.setAttribute("userInfo", userDto); %>

<style>

.table .thead-light th {
    color: #495057;
    background-color: #7cb3ef;
    border-color: #dee2e6;
}


</style>




<script>


$(function() {
	
	//페이징 처리
	selectPage(1, "", "", 0);
	
	// 페이지 숫자
	// this 대신에 클래스로 바로 접근하면 전체적으로 접근한 것이라 어느것이 클릭된지 판별이 안됌.
	$(document).on("click", ".page", function(){
		var page = $(this).find(".page-link").val();
		selectPage(page, "", "", 0);
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
    <h2 class="mt-4 mb-3">우리 혼자 산다
      <small>- 혼자놀아요</small>
    </h2>

   <ol class="breadcrumb" style="background-color: #004085!important;"></ol>




    <div class="row">
    <!-- 메인 중앙 -->
    <div class="col-lg-10 mb-4">
      
      
	<!-- 이달의 자취왕 -->
	<div class="container" style="background-color: #007bff21;">
		<br>
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
				</div><br>
			</div>
		</div>
	</div>
	<br><br><br>	
	
	
	<!-- 이주의 추천글 테이블 -->
	<div class="container">
	
		<table class="table" align="center">
			<thead class="thead-light" align="center">
				<tr style="background-color: #86c2ff">
					<th colspan="3">이주의 추천순</th>
				</tr>
			</thead>
			<tbody align="center">
				<tr>
					<th>카테고리</th>
					<th>제목</th>
					<th>닉네임</th>
				</tr>
				<!-- 처음부터 List로 가져왔기 때문에 weekList만 씀. -->
				<!-- BoardDto로 가져온거면 weekList.list(Dto변수 이름)가져와야뎀. -->
				<c:forEach var="weekList" items="${weekList }">
				<tr>
					<c:if test="${weekList.boardListNum == 1 }">
						<td>자취생활팁</td>
					</c:if>
					<c:if test="${weekList.boardListNum == 2 }">
						<td>요리레시피</td>
					</c:if>
					<c:if test="${weekList.boardListNum == 3 }">
						<td>명예의전당</td>
					</c:if>
					
					<td>
						<a class="boardDetail">
							<input class="boardNum" type="hidden" value="${weekList.boardNum }">
							${weekList.boardSubject }
						</a>
					</td>
					<td>${weekList.userNickname }</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div><hr> 
	<br><br><br>
	
	
	
	<!-- 오늘의 새글 테이블 전체글로 보이게 하기.(최신순)-->
	<div class="container">
		<div class="row">
			<div class="col-lg-12" align="left">
			<h4 style="margin-bottom: 1rem;">오늘의 새글</h4>
			</div>
		</div>
	</div> 
	  
	<div class="container">
		
			
			
		<!-- 새글 목록,페이징 처리 -->
		<div class="paging">	
		</div> <!-- 페이징처리 -->
	
	
	
	</div>
      
      
      
      
	</div>
	  
	<!-- Sidebar Column -->
	<%@ include file = "/WEB-INF/views/commons/singlecategory.jsp" %>
		
		
		
		
	</div>
	<!-- row -->

</div>
<br><br><br><br><br><br><br><br>






  
  
  
  
  
  
  
<%@ include file = "/WEB-INF/views/commons/template/modern_business_bottom.jsp" %>
