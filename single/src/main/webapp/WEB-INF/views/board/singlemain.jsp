<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/commons/template/modern_business_top.jsp" %>

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


    <div class="row">
    <!-- 메인 중앙 -->
    <div class="col-lg-10 mb-4"> 
      
	<!-- 이달의 자취왕 --> 
	<!-- id="background" -->
	<div class="container">   
	 
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
							<img src="${userdto.userProfile}" class="rounded-circle" alt="1등" width="130" height="130">
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
	
	
	<!-- 이달의 추천글 테이블 -->
	
	<div class="container">
		<div class="row">
			<div class="col-lg-12" align="left">
			<h4 style="margin-bottom: 1rem;">이달의 추천글</h4> 
			</div>
		</div>
	</div>
	
	<div class="container">
	    
		<table class="table" align="center">     
			<thead style="background-color: #dee4ea;" align="center">
				<tr>
					<th>카테고리</th>
					<th>제목</th>
					<th>닉네임</th>
				</tr>
			</thead>
			<tbody align="center">
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
