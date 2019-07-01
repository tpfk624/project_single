<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/commons/template/modern_business_top.jsp" %>
<%@ include file = "/WEB-INF/views/commons/board_common.jsp" %>


<script>
$(document).ready(function() {
   
   $("#viewBtn").click(function() {
      $("#boardListNum").val("${boardListNum}");
      $("#pg").val("${pg}");
      $("#key").val("${key}");
      $("#word").val("${word}");
      $("#boardNum").val("${boardNum}");
      $("#commonForm").attr("method", "GET").attr("action", "${root}/board/view").submit();
   });
   
   $("#listBtn").click(function() {
      $("#boardListNum").val("${boardListNum}");
      $("#pg").val("1");
      $("#key").val("");
      $("#word").val("");
      $("#commonForm").attr("method", "GET").attr("action", "${root}/board/list").submit();
   });
   
});
</script>


<div class="container">
	<br>
	<div class="row" style="text-align: center;">
		
		<div class="col-lg-12">
			<%-- <img src="${root}/resources/img/bimg/king.PNG" class="rounded-circle" alt="3등" width="100" height="100"> --%>
			<img alt="성공" src="${root}/resources/img/bimg/success.jpg">
		</div>

		<div class="col-lg-12"><br><br>
			<b>게시물이 등록되었습니다.</b>
		</div>
		
	</div>
	<br><br><br>
	
	
	<div class="row"  style="text-align: center;">
	
		<div class="col-lg-4"></div>
		<div class="col-lg-2" style="padding-right: 0;">
			<button type="button" class="btn btn-primary" id="viewBtn">작성한 글 확인</button>
		</div>
		<div class="col-lg-2" style="padding-left: 0;">
			<button type="button" class="btn btn-primary" id="listBtn">목록보기</button>
		</div>
		<div class="col-lg-4"></div>
	
	</div><br><br><br><br><br><br><br><br>
</div>
<br>










<%@ include file = "/WEB-INF/views/commons/template/modern_business_bottom.jsp" %>















