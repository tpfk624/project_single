<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/commons/template/modern_business_top.jsp"%>
<%@ include file="/WEB-INF/views/commons/alert_danger.jsp"%>
<%@ include file="/WEB-INF/views/commons/alert_success.jsp"%>
<link rel="stylesheet" href="${root}/resources/css/group/group.css">
<section class="contents">
	<div class="container col-lg-5 col-md-5 col-sm-5 mb-4">
		<div class="row">
			<h1 class="center">모임 수정</h1>
		</div>
		<!-- Marketing Icons Section -->
		<div class="row">
			<!-- Contact Form -->
			<div class="">
				<form name="sentMessage" id="contactForm" novalidate>
					<div class="control-group form-group">
						<div class="controls">
							<label>모임명(*) : </label> 
							<input type="text" class="form-control"
								id="name" placeholder="모임 이름을 입력해주세요">
							<p class="help-block"></p>
						</div>
					</div>
					<div class="control-group form-group">
						<div class="controls">
							<label>모임분류(*) :</label> 
							<div class="dropdown col-lg-4 col-md-4 col-sm-4">
								<input type="hidden" name="key" value="" >
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
							<label>모임 태그 : </label> <input type="text"
								class="form-control" id="text" placeholder="모임을 표현할 수 있는 태그를 입력해주세요">
						</div>
					</div>
					<div class="control-group form-group">
						<div class="controls">
							<label>모임 장소 : </label> 
							<input type="text"
								class="form-control" id="phone" placeholder="주요 모임 장소를 입력해주세요(빈칸도 가능합니다.)">
						</div>
					</div>
					<div class="control-group form-group">
						<div class="controls">
							<label>인원 :</label> 
							<div class="dropdown col-lg-4 col-md-4 col-sm-4">
								<input type="hidden" name="key" value="" >
								<button type="button" class="btn btn-primary dropdown-toggle"
									data-toggle="dropdown">5</button>
								<div class="dropdown-menu">
									<a class="dropdown-item active" href="#">5</a> 
									<a class="dropdown-item" href="#">10</a> 
									<a class="dropdown-item" href="#">15</a> 
									<a class="dropdown-item" href="#">20</a>
								</div>
							</div>
						</div>
					</div>
					<div class="control-group form-group">
						<div class="controls">
							<label>모임설명 :</label>
							<textarea rows="10" cols="100" class="form-control" id="message"
								placeholder="모임을 설명해주세요" style="resize: none"></textarea>
						</div>
					</div>
					<div id="success"></div>
					<!-- For success/fail messages -->
					<button type="button" class="btn btn-primary"
						id="sendMessageButton">모임 만들기</button>
				</form>
			</div>
		</div>
	</div>
</section>

<!-- /.container -->

<%@ include file="/WEB-INF/views/commons/template/modern_business_bottom.jsp"%>
