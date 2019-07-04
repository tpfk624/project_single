<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/commons/template/modern_business_top.jsp"%>
<%@ include file="/WEB-INF/views/commons/alert_danger.jsp"%>
<%@ include file="/WEB-INF/views/commons/alert_success.jsp"%>
<link rel="stylesheet" href="${root}/resources/css/group/group.css">
<script type="text/javascript">
$(function() {
	$(".okbtn").click(function() {
		defaultSetting("${root}/resources/img/group/group_default.png");
		var groupName = $("#groupCreateForm input[name=groupName]").val();
		var groupCategoryNum = $("#groupCreateForm input[name=groupCategoryNum]").val();
		
		if(groupName == null || groupName == ''){
			showAlertModal("필수값이 누락", "그룹명을 입력해주세요");

			$("#alert").on('hide.bs.modal', function () {
				$("#groupCreateForm input[name=groupName]").focus();
			  });
			return;
		}
		
		if(groupCategoryNum == null || groupCategoryNum == ''){
			showAlertModal("필수값이 누락", "그룹 종류를 결정해주세요");
			
			$("#alert").on('hide.bs.modal', function () {
				$("#groupCreateForm input[name=groupCategoryNum]").next().focus();
			  });
			
			
			return;
		}
		
		$.ajax({
			url : "${root}/group/create"
			, method : "post"
			, processData : false
			, contentType : false
			, data : new FormData($("#groupCreateForm")[0])
			, dataType : "json"
			, success : function(result) {
				console.log(result);
			}
		});	
	});
})
</script>

<section class="contents">
	<div class="container col-lg-5 col-md-5 col-sm-5 mb-4">
		<div class="row">
			<h1 class="center">모임 만들기</h1>
		</div>
		<!-- Marketing Icons Section -->
		<div class="row">
			<!-- Contact Form -->
			<form name="sentMessage" id="groupCreateForm" method="post" enctype="multipart/form-data">
				<div class="control-group form-group">
					<div class="controls">
						<label>모임명(*) : </label> 
						<input type="text" class="form-control"
							id="name" placeholder="모임 이름을 입력해주세요" name="groupName">
						<p class="help-block"></p>
					</div>
				</div>
				<div class="control-group form-group">
					<div class="controls">
						<label>모임분류(*) :</label> 
						<div class="dropdown col-lg-4 col-md-4 col-sm-4">
							<input type="hidden" name="groupCategoryNum" value="" >
							<button type="button" class="btn btn-primary dropdown-toggle"
								data-toggle="dropdown">모임분류</button>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="" role="1">스터디</a> 
								<a class="dropdown-item" href="" role="2">취미</a> 
								<a class="dropdown-item" href="" role="3">친목도모</a>
								<a class="dropdown-item" href="" role="4">맛집탐방</a>
							</div>
						</div>
					</div>
				</div>
				
				<%@ include file="/WEB-INF/views/commons/fileupload.jsp"%>
				
				<div class="control-group form-group">
					<div class="controls">
						<label>모임 태그 : </label> 
						<input type="text" name="groupHashtag"
							class="form-control" id="text" placeholder="모임을 표현할 수 있는 태그를 입력해주세요">
					</div>
				</div>
				<div class="control-group form-group">
					<div class="controls">
						<label>모임 장소 : </label> 
						<input type="text" name="groupMainPlace"
							class="form-control" id="phone" placeholder="주요 모임 장소를 입력해주세요(빈칸도 가능합니다.)">
					</div>
				</div>
				<div class="control-group form-group">
					<div class="controls">
						<label>인원 :</label> 
						<div class="dropdown col-lg-4 col-md-4 col-sm-4">
							<input type="hidden" name="groupMemberLimit" value="5" >
							<button type="button" class="btn btn-primary dropdown-toggle"
								data-toggle="dropdown">5</button>
							<div class="dropdown-menu">
								<a class="dropdown-item active">5</a> 
								<a class="dropdown-item" >10</a> 
								<a class="dropdown-item" >15</a> 
								<a class="dropdown-item" >20</a>
							</div>
						</div>
					</div>
				</div>
				<div class="control-group form-group">
					<div class="controls">
						<label>모임설명 :</label>
						<textarea rows="10" cols="100" class="form-control" id="message"
							placeholder="모임을 설명해주세요" style="resize: none" name="groupDescription"></textarea>
					</div>
				</div>
				<div id="success"></div>
				<!-- For success/fail messages -->
				<button type="button" class="btn btn-primary okbtn" id="">모임 만들기</button>
			</form>
		</div>
	</div>
</section>

<!-- /.container -->

<%@ include
	file="/WEB-INF/views/commons/template/modern_business_bottom.jsp"%>
