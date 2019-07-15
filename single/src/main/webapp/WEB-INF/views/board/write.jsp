<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/commons/template/modern_business_top.jsp" %>
<%@ include file = "/WEB-INF/views/commons/logincheck.jsp" %>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script> -->


<!-- 들고다님 위에 있어야뎀. -->
<c:set var="boardListNum" value="${bp.boardListNum}"/>
<%-- <c:set var="key" value="${bp.key}"/>
<c:set var="word" value="${bp.word}"/> --%>


<!-- summernote setting-->
<link href="${root}/resources/summernote/summernote.css" rel="stylesheet">
<script src="${root}/resources/summernote/summernote.js"></script>
<!-- summernote korean language pack -->
<script src="${root}/resources/summernote/lang/summernote-ko-KR.js"></script>
<!-- summernote setting-->
<script type="text/javascript">

$(function() {
  $('.summernote').summernote({
    height: 400,          // 기본 높이값
    minHeight: null,      // 최소 높이값(null은 제한 없음)
    maxHeight: null,      // 최대 높이값(null은 제한 없음)
    focus: true,          // 페이지가 열릴때 포커스를 지정함
    lang: 'ko-KR'         // 한국어 지정(기본값은 en-US)
  });
  
  //글쓰기 이벤트
  $("#writeBtn").click(function () {
	  console.log("클릭");
		if($("#boardSubject").val() == ""){ // 정규표현식 사용하기.
			alert("제목 입력!");
			return;
		} else if($("#boardSubject").val().length > 15 ){ // 정규표현식 사용하기.
			alert("제목을 15자 이하로 입력해주세요!"); 
			return;
		} else if ($("#boardContent").val() == "") {    
			alert("내용 입력!"); 
			return;
		} else {
			$("#writeForm").attr("action","${root}/board/write").submit();
		}
	});
});


</script>



<div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h2 class="mt-4 mb-3">자취생활 팁
      <small>- 글쓰기</small>
    </h2>

    <!-- <ol class="breadcrumb" style="background-color: #004085!important;"></ol> -->




    <div class="row">
    <!-- 메인 중앙 -->
    <div class="col-lg-10 mb-4">
      
    <div class="container">
		<form class="form-horizontal boardwriting"
			id="writeForm" name="writeForm" method="post" action="" >
			
			
			<!-- 페이지 가지고 다니는 것. -->
			<input type="hidden" name="boardListNum" value="${boardListNum}">
			<!-- 새 글을 쓰면 무조건 1페이지 -->
			<input type="hidden" name="pg" value="1">
			<input type="hidden" name="key" value="">
			<input type="hidden" name="word" value="">
			
			
			
			<div class="form-group">
				
				<!-- 제목 -->
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">제목</span>
					</div>
					<input type="text" class="form-control" id=boardSubject name="boardSubject">
				</div>

				<label for="content" class="col-sm-2 control-label"><p3>내용입력</p3></label>
				
				<!-- 내용 -->
				<div class="col-sm-10">
					<textarea name="boardContent" id="boardContent" class="summernote"></textarea>
				</div>
				
			</div>
			<div class="row">
				<div class="col-lg-12">
					<p>태그 : <input type="text" id="tags" name="tags" style="width: 80%;"><p>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="button" id="writeBtn" name="writeBtn" class="btn btn-default" style="color: #007bff; border-color: #007bff;">Save</button>
				</div>
			</div>
		</form>
    </div> 	
     
     
      	
      	
      	
	</div>
	  
	  
	  
	  
	<!-- Sidebar Column -->
	<%@ include file = "/WEB-INF/views/commons/singlecategory.jsp" %>
		
		
		
		
	</div>
	<!-- row -->

</div>
<br><br><br><br><br><br><br><br>






  
  
  
  
  
  
  
<%@ include file = "/WEB-INF/views/commons/template/modern_business_bottom.jsp" %>
