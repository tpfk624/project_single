<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/commons/template/modern_business_top.jsp" %>
<script>
$(function () {
	$(document).on("click", "#okBtn", function(){
		location.href="${root}/board/singlemain";
	}); 
});
</script>


<div class="container">
	<br>
	<div class="row" style="text-align: center;">
		
		<div class="col-lg-12">
			<%-- <img src="${root}/resources/img/bimg/king.PNG" class="rounded-circle" alt="3등" width="100" height="100"> --%>
			<img alt="실패" src="${root}/resources/img/bimg/fail.jpg">
		</div>

		<div class="col-lg-12"><br><br>
			<b>게시물 등록이 실패 되었습니다.</b>
		</div>
		
	</div>
	<br><br><br>
	
	
	<div class="row"  style="text-align: center;">
	
		<div class="col-lg-4"></div>
		<div class="col-lg-1"></div>
		<div class="col-lg-2" style="padding-right: 0;">
			<button type="button" class="btn btn-primary" id="okBtn">확인</button>
		</div>
		<div class="col-lg-1">
		</div>
		<div class="col-lg-4"></div>
	
	</div><br><br><br><br><br><br><br><br>
</div>









<%@ include file = "/WEB-INF/views/commons/template/modern_business_bottom.jsp" %>















