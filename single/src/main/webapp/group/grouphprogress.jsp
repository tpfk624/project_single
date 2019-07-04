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
/*진행률바*/
.progress{
	margin-top : 1rem;
	width: 100%;
  	background-color: grey;
}

.progress-bar{
	width: 1%;
  	background-color: green;
}

.search-input {
  background-image: url('${root}/resources/img/group/search.png');
  background-position: left;
  background-repeat: no-repeat;
  background-size: contain;
  font-size: 16px;
  padding: 12px 20px 12px 40px;
  margin-bottom: 12px;
  display: inline-block;
}

.right{
	float: right;
}

.file-icon{
	font-size: 20px;
	margin-left: 0.5rem;
}
</style>
<script>
$(function() {
	var width = 1;
	var interval = setInterval(frame, 10);
	
	function frame() {
		var progress = $(".ing");
		var progressBar = $(".progressBar");
		if(progress.length == 0){
			clearInterval(interval);
		}
		
		$.each(progress, function(index, item) {
			var progressBar = $(item).children(".progress-bar");
			var width = parseInt(progressBar.attr("data-prog"));
			var maxWidth = parseInt($(item).attr("data-prog"));
			//console.log("width : " + width + "//" + "maxWidth : " + maxWidth);
			if(width >= maxWidth){
				$(item).removeClass("ing");
			}else{
				progressBar.attr("data-prog" , width + 1);
				progressBar.css("width", width + 1 + "%");
			}
		});
	}
	
	$(".writeBtn").click(function() {
		$("#hprogressCreateModal").modal("show");
	});
	
	$(".hprogress-table tbody tr").click(function() {
		$("#hprogressModal").modal("show");
	});
	
});
</script>


<%@ include file="groupheader.jsp"%>

<section class="contents">
	<%@ include file="hprogresscreatemodal.jsp"%>
	<%@ include file="hprogressmodal.jsp"%>
	<div class="container col-lg-9 col-md-9 col-sm-9 whitespace">		
		<!-- 모임 이름 뿌져지는 곳 -->
		<section class="groupsection groupheader">
			<div class="row">
				<div class="groupname center">기타를 칩시다</div>
			</div>
		</section>
		<section class="groupsection group-info">
			<label class="group-info-label col-sm-2">과제 설명</label>
			<div class="group-info-content col-sm-10">
			먼저 기타를 부십니다
			</div>
		</section>
		
		<section class="groupsection group-info">
			<label class="group-info-label col-sm-2">과제달성률</label>
			<div class="group-info-content col-sm-10">
				<div class="progress ing" style="height: 2rem;" data-prog="30">
					<div class="progress-bar" data-prog="1">10/20</div>
				</div>
			</div>
		</section>
		
		<section class="groupsection group-info">
			<div>
				<input class="col-sm-9 form-control search-input" type="text" id="myInput" onkeyup="" placeholder="이름을 검색해주세요" title="Type in a name">
				<button type="button" class="btn btn-primary col-sm-2 right writeBtn">글작성</button>
			</div>
			<table class="table table-hover hprogress-table">
				<thead>
					<tr>
						<th style="width: 15%;">이름</th>
						<th>제목</th>
						<th style="width: 20%;">올린날짜</th>
						<th style="width: 15%;">달성여부</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>안병욱</td>
						<td>과제물 공유합니다<i class="far fa-file file-icon"></i></td>
						<td>2019/04/07</td>
						<td>달성</td>
					</tr>
					<tr>
						<td>김태희</td>
						<td>이번 과제 좀 어렵네요</td>
						<td>2019/04/07</td>
						<td>달성</td>
					</tr>
					<tr>
						<td>권범준</td>
						<td>이번 과제 이지이지</td>
						<td>2019/04/07</td>
						<td>달성</td>
					</tr>
					<tr>
						<td>황선혜</td>
						<td>아직도 기타치는 사람이 있다구?</td>
						<td>2019/04/07</td>
						<td>진행중</td>
					</tr>
					<tr>
						<td>고세라</td>
						<td>먼저 포기합니다</td>
						<td>2019/04/07</td>
						<td>미참여</td>
					</tr>
					<tr>
						<td>안병욱</td>
						<td>기타 다 필요해여</td>
						<td>2019/04/07</td>
						<td>달성</td>
					</tr>
					<tr>
						<td>김태희</td>
						<td>기타치기 전에 질문해도 되나요?</td>
						<td>2019/04/07</td>
						<td>달성</td>
					</tr>
					<tr>
						<td>권범준</td>
						<td>2019/04/05</td>
						<td>2019/04/07</td>
						<td>달성</td>
					</tr>
					<tr>
						<td>황선혜</td>
						<td>2019/04/05</td>
						<td>2019/04/07</td>
						<td>진행중</td>
					</tr>
					<tr>
						<td>고세라</td>
						<td>2019/04/05</td>
						<td>2019/04/07</td>
						<td>미참여</td>
					</tr>
					<tr>
						<td>안병욱</td>
						<td>2019/04/05</td>
						<td>2019/04/07</td>
						<td>달성</td>
					</tr>
					<tr>
						<td>김태희</td>
						<td>2019/04/05</td>
						<td>2019/04/07</td>
						<td>달성</td>
					</tr>
					<tr>
						<td>권범준</td>
						<td>2019/04/05</td>
						<td>2019/04/07</td>
						<td>달성</td>
					</tr>
					<tr>
						<td>황선혜</td>
						<td>2019/04/05</td>
						<td>2019/04/07</td>
						<td>진행중</td>
					</tr>
					<tr>
						<td>고세라</td>
						<td>2019/04/05</td>
						<td>2019/04/07</td>
						<td>미참여</td>
					</tr>
					<tr>
						<td>안병욱</td>
						<td>2019/04/05</td>
						<td>2019/04/07</td>
						<td>달성</td>
					</tr>
					<tr>
						<td>김태희</td>
						<td>2019/04/05</td>
						<td>2019/04/07</td>
						<td>달성</td>
					</tr>
					<tr>
						<td>권범준</td>
						<td>2019/04/05</td>
						<td>2019/04/07</td>
						<td>달성</td>
					</tr>
					<tr>
						<td>황선혜</td>
						<td>2019/04/05</td>
						<td>2019/04/07</td>
						<td>진행중</td>
					</tr>
					<tr>
						<td>고세라</td>
						<td>2019/04/05</td>
						<td>2019/04/07</td>
						<td>미참여</td>
					</tr>
					<tr>
						<td>안병욱</td>
						<td>2019/04/05</td>
						<td>2019/04/07</td>
						<td>달성</td>
					</tr>
					<tr>
						<td>김태희</td>
						<td>2019/04/05</td>
						<td>2019/04/07</td>
						<td>달성</td>
					</tr>
					<tr>
						<td>권범준</td>
						<td>2019/04/05</td>
						<td>2019/04/07</td>
						<td>달성</td>
					</tr>
					<tr>
						<td>황선혜</td>
						<td>2019/04/05</td>
						<td>2019/04/07</td>
						<td>진행중</td>
					</tr>
					<tr>
						<td>고세라</td>
						<td>2019/04/05</td>
						<td>2019/04/07</td>
						<td>미참여</td>
					</tr>
				</tbody>
			</table>
		</section>
		
		<!--  
		<section class="row page">
			<div class="pagination">
				  <a href="#">&laquo;</a>
				  <a href="#">1</a>
				  <a class="active" href="#">2</a>
				  <a href="#">3</a>
				  <a href="#">4</a>
				  <a href="#">5</a>
				  <a href="#">6</a>
				  <a href="#">&raquo;</a>
			</div>
		</section>
		-->
	</div>
</section>
<!-- /.container -->

<%@ include file="/WEB-INF/views/commons/template/modern_business_bottom.jsp"%>
