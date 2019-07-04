<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/commons/template/modern_business_top.jsp"%>
<%@ include file="/WEB-INF/views/commons/alert_danger.jsp"%>
<%@ include file="/WEB-INF/views/commons/alert_success.jsp"%>
<link rel="stylesheet" href="${root}/resources/css/group/group.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" 
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<style>
/* 페이지에 유지할 부분*/
.carousel-item{
	height : 30vh;
}

</style>
<script>
$(function() {
	
	
	$(".writeBtn").click(function() {
		$("#hprogressCreateModal").modal("show");
	});
	
});
</script>


<%@ include file="groupheader.jsp"%>

<section class="contents">
	<%@ include file="hprogresscreatemodal.jsp"%>
	<%@ include file="hprogressmodal.jsp"%>
	<div class="container col-lg-9 col-md-9 col-sm-9 whitespace">		
		<div class="groupmain">
		<!-- 모임 이름 뿌져지는 곳 -->
		<section class="groupsection groupheader">
			<div class="row">
				<div class="groupname center">모임멤버관리</div>
			</div>
		</section>
		
		<section class="groupsection group-info">
			<div>
				<input class="col-sm-9 form-control search-input" type="text" 
					id="myInput" onkeyup="" placeholder="이름을 검색해주세요" title="이름을 검색해주세요">
				<button type="button" class="btn btn-danger col-sm-2 right writeBtn">모임삭제</button>
			</div>
			<table class="table hprogress-table">
				<thead>
					<tr>
						<th style="width: 10%;">번호</th>
						<th style="width: 15%;">이름</th>
						<th style="width: 20%;">요청일</th>
						<th style="width: 20%;">가입일</th>
						<th style="width: 20%;">상태</th>
						<th style="width: 20%;"></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>안병욱<i class="far fa-file file-icon"></i></td>
						<td></td>
						<td>2019/04/07</td>
						<td></td>						
						<td>
							<div class="dropdown">
								<input type="hidden" name="groupCategoryNum" value="" >
								<button type="button" class="btn btn-primary dropdown-toggle"
									data-toggle="dropdown">모임장</button>
								<div class="dropdown-menu">
									<a class="dropdown-item" href="" role="1">모임장위임</a> 
									<a class="dropdown-item" href="" role="2">으아앙</a> 
									<a class="dropdown-item" href="" role="3">친목도모</a>
									<a class="dropdown-item" href="" role="4">맛집탐방</a>
								</div>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</section>
		</div>
	</div>
</section>
<!-- /.container -->

<%@ include file="/WEB-INF/views/commons/template/modern_business_bottom.jsp"%>
