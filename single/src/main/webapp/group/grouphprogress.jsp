<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/commons/template/modern_business_top.jsp"%>
<%@ include file="/WEB-INF/views/commons/alert_danger.jsp"%>
<%@ include file="/WEB-INF/views/commons/alert_success.jsp"%>
<link rel="stylesheet" href="${root}/resources/css/group/group.css">

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

#myInput {
  background-image: url('${root}/resources/img/group/search.png');
  background-position: left;
  background-repeat: no-repeat;
  background-size: contain;
  width: 100%;
  font-size: 16px;
  padding: 12px 20px 12px 40px;
  border: 1px solid #ddd;
  margin-bottom: 12px;
}

.right{
	float: right;
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
});
</script>


<%@ include file="groupheader.jsp"%>

<section class="contents">
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
			과제 집어치워
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
				<input class="col-sm-9" type="text" id="myInput" onkeyup="" placeholder="이름을 검색해주세요" title="Type in a name">
				<button type="button" class="btn btn-primary col-sm-2 right">글작성</button>
			</div>
			<table class="table table-hover">
				<thead>
					<tr>
						<td>이름</td>
						<td>올린날짜</td>
						<td>수정날짜</td>
						<td>달성여부</td>
					</tr>
				</thead>
				<tbody>
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
		
	</div>
</section>
<!-- /.container -->
<!-- 채팅부분 -->
<%-- <%@ include file="chat.jsp"%> --%>

<%@ include file="/WEB-INF/views/commons/template/modern_business_bottom.jsp"%>
