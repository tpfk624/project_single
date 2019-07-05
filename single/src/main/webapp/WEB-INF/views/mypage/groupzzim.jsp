<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include
	file="/WEB-INF/views/commons/template/modern_business_top.jsp"%>
<link rel="stylesheet" href="${root}/resources/css/group/group.css">
<link rel="stylesheet" href="${root}/resources/css/user/groupzzim.css">


<!-- <div class="container py-xl-5 py-lg-3"> -->
<section class="contents">
	<div id="my-page-wrap">
		<div id="my-page-header">
			<div id="header-content" class="my-page-content">
				<div class="user-photo"
					style="display: inline-block; background-image: url(&quot;https://cdn.studysearch.co.kr/images/users/199883/profile/1561443247&quot;); background-size: cover; background-position: 50% 50%;"></div>
				<div id="tabs">
					<div id="user-name">고세라</div>
					<div id="tab-box">
						<a class="tab" href="${root}/user_mypage/myPage.jsp">내 프로필</a> 
						<a class="tab" href="${root}/user_mypage/myPageGroup.jsp">나의 모임관리</a> 
						<a class="tab selected" href="${root}/user_mypage/myPageGroupZzim.jsp">찜한 모임</a> 
						<a class="tab" href="${root}/user_mypage/myPageWrite.jsp">게시물관리</a>
					</div>
				</div>
			</div>
		</div>

		<br>

		<div class="container">
			<div class="jumbotron">
				<div class="jumbotronTop">
					<label class="moimTitle">찜한 모임 목록 </label> <select
						class="moimOption">
						<option value="제목" selected="selected">전체보기</option>
						<option value="작성자">스터디</option>
						<option value="작성자">취미</option>
						<option value="작성자">친목도모</option>
						<option value="작성자">맛집탐방</option>
					</select>
					<hr>
				</div>

				<div class="jumbotronBottom">


					<div class="row">
						<!-- 모임 출력 시작 -->
						<c:forEach items="${groupList}" var="group">

							<!-- 카드 사진 위버전 -->

							<div class="col-lg-4 col-sm-6 portfolio-item groupcard"
								data-num="${group.groupNum}">

								<div class="card h-100">

									<img class="card-img-top" src="${group.groupImgSrc}" alt="">

									<h4 class="card-title">${group.groupName}</h4>

									<div class="card-body">

										<p class="card-text">

											<c:choose>

												<c:when test="${fn:length(group.groupDescription) > 100}">${fn:substring(group.groupDescription, 0, 100)}...</c:when>

												<c:otherwise>${group.groupDescription}</c:otherwise>

											</c:choose>

										</p>

										<p class="card-text">인원 :

											${group.groupMemberCount}/${group.groupMemberLimit}</p>

										<p class="card-text">장소 : ${group.groupMainPlace}</p>

									</div>



									<div class="overlay">

										<div class="text">상세보기</div>

									</div>

								</div>

							</div>

						</c:forEach>
						<!-- 모임 출력 종료 -->
					</div>




				</div>
			</div>
		</div>
	</div>
</section>

<%@ include
	file="/WEB-INF/views/commons/template/modern_business_bottom.jsp"%>