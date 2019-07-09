<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/commons/template/modern_business_top.jsp" %>

<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script> -->


<script>

$(function() {
	
	var boardNum = $(".boardNum").val();
	
	// 답변 보기를 들어와서 보여주는 이유는 답변 작성하고 나서 다시 서버에 들렸다 내것을 보여주기 위해서임.
	selectanswer(boardNum);
	
	// 답변 글쓰기 textarea불러오기.
	$(document).on("click",".answerBtn",function (){
		
		$.ajax({
			url : '${root}/board/answerwritepage',
			type : 'GET',
			success : function(response) {
				$(".answer").html(response.trim());
			}
		});
		
	});
	
	// 답변 글쓰기.
	$(document).on("click","#completeBtn",function (){
		
		var replyContent = $('#replyContent').val();
		
		$.ajax({
			url : '${root}/board/answerwrite',
			type : 'GET',
			data : {
				'boardNum': boardNum,
				'replyContent': replyContent
			},
			success : function(response) {
				$(".answer").html(response.trim());
			}
		});
		
	});
	
	
	
	
});


function selectanswer(boardNum) {
	
	// 답변 글쓰기 불러오기.
	$.ajax({
		url : '${root}/board/answerview',
		type : 'GET',
		data : {
		'boardNum':boardNum
		},
		success : function(response) {
			$(".answerview").html(response.trim());
		}
	});
		
}


</script>


<!-- 글번호 -->
<input class="boardNum" type="hidden" value="${article.boardNum }">




<div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h2 class="mt-4 mb-3">혼자놀아요
		<small>- 
		<c:if test="${article.boardListNum == 1 }">
			자취생활팁
		</c:if>
		<c:if test="${article.boardListNum == 2 }">
			요리레시피
		</c:if>
		<c:if test="${article.boardListNum == 3 }">
			명예의전당
		</c:if>
		</small>
    </h2>

    <ol class="breadcrumb" style="background-color: #004085!important;"></ol>




    <div class="row">
    <!-- 메인 중앙 -->
    <div class="col-lg-10 mb-4">
      
      
		<div class="row">
			<div class="col-lg-3">
				<h5>
					<c:if test="${article.boardListNum == 1 }">
						자취생활 팁 공유
					</c:if>
					<c:if test="${article.boardListNum == 2 }">
						요리레시피 팁 공유
					</c:if>
					<c:if test="${article.boardListNum == 3 }">
						명예의전당
					</c:if>
				</h5>
			</div>
			<div class="col-lg-9"></div>
		</div>
		
		
		
		
	    <div class="container" style=" border: 4px solid #444444;"><br><br>  
      
      
      
      	
      	<!-- 본글 -->
	   	<div class="row">
			<div class="col-lg-2"></div>
			<!-- 제목 -->
			<div class="col-lg-5"><h5>${article.boardSubject }</h5><small>좋아요 : ${article.boardViews }</small></div>
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
			
			<br><br>
			
			<c:forEach var="hash" items="${article.hashtagList}">
				<c:if test="${hash != null }">
					<tag>
					#${hash}
					</tag>&nbsp;
				</c:if>
			</c:forEach>	
			<br><br>
			</div>
			<div class="col-lg-2"></div>
	   	</div><br>
	   	<div class="row">
	   		<div class="col-lg-7"></div>
	   		<div class="col-lg-2">
	   		</div>
	   		<div class="col-lg-2">
	   			<a class="answerBtn">
		   			<button class="btn btn-outline-secondary" style="color: #007bff; border-color: #007bff;">답변</button>
	   			</a>
	   		</div>
	   		<div class="col-lg-1"></div>
	   	</div>
	   	
	   	
		<div class="row">
			<div class="col-lg-1"></div>
			<div class="col-lg-10"><hr style="background-color: #adb5bd"></div>
			<div class="col-lg-1"></div>
		</div>





	   	<!-- 답변글 쓰기 -->
		<div class="answer">	
		</div>
		
		<!-- 답별글 보기 -->
      	<div class="answerview">
      	</div>
      	
      	
      	
      	</div>
	</div>
	  
	  
	  
	  
	<!-- Sidebar Column -->
	<%@ include file = "/WEB-INF/views/commons/singlecategory.jsp" %>
		
		
		
		
	</div>
	<!-- row -->

</div>
<br><br><br><br><br><br><br><br>






  
  
  
  
  
  
  
<%@ include file = "/WEB-INF/views/commons/template/modern_business_bottom.jsp" %>
