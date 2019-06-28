<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include
	file="/WEB-INF/views/commons/template/modern_business_top.jsp"%>
<link rel="stylesheet" href="${root}/resources/css/group/group.css">
<style>

/* 마이페이지 헤더부분 */
#my-page-wrap #my-page-header {
	background-color: #5a5e64;
}

#my-page-wrap #header-content {
	overflow: hidden;
	padding-top: 24px;
	width: 60pc;
	margin: 0 auto;
}

/* 프로필사진 */
element.style {
	display: inline-block;
	background-image:
		url(https://cdn.studysearch.co.kr/images/users/199883/profile/1561443247);
	background-size: cover;
	background-position: 50% 50%;
}

#my-page-wrap #header-content .user-photo {
	float: left;
	width: 72px;
	height: 72px;
	border-radius: 50%;
}

/* taps 유저네임 */
#my-page-wrap #header-content #tabs {
	margin-left: 81pt;
	padding-top: 22px;
}

#my-page-wrap #header-content #tabs #user-name {
	box-sizing: border-box;
	height: 50px;
	border-bottom: 1px solid #6a6e73;
	font-size: 16pt;
	color: #fff;
}

/* tab box */
#my-page-wrap #header-content #tabs #tab-box {
	margin-left: -20px;
}

/* tab */
#my-page-wrap #header-content #tabs .tab.selected {
	color: #fff;
	border-bottom: 3px solid #ef6c00;
	font-weight: 700;
}

#my-page-wrap #header-content #tabs .tab {
	display: inline-block;
	width: 75pt;
	height: 72px;
	line-height: 72px;
	color: #aeb5be;
	font-size: 14px;
	text-decoration: none;
	text-align: center;
}

element.style {
	
}

#my-page-wrap #header-content #tabs .tab.selected {
	color: #fff;
	border-bottom: 3px solid #ef6c00;
	font-weight: 700;
}

#my-page-wrap #header-content #tabs .tab {
	display: inline-block;
	width: 75pt;
	height: 72px;
	line-height: 72px;
	color: #aeb5be;
	font-size: 14px;
	text-decoration: none;
	text-align: center;
}

a {
	color: #000;
	text-decoration: none;
}

a:-webkit-any-link {
	color: -webkit-link;
	cursor: pointer;
	/* text-decoration: underline; */
}

:focus {
	outline: -webkit-focus-ring-color auto 1px;
}
/*  마이페이지 헤더부분 */

</style>

<div id="my-page-wrap">
	<div id="my-page-header">
		<div id="header-content" class="my-page-content">
			<div class="user-photo"
				style="display: inline-block; background-image: url(&quot;https://cdn.studysearch.co.kr/images/users/199883/profile/1561443247&quot;); background-size: cover; background-position: 50% 50%;"></div>
			<div id="tabs">
				<div id="user-name">고세라</div>
				<div id="tab-box">
					<a class="tab selected" href="${root}/user_mypage/myPage.jsp">내
						프로필</a> <a class="tab" href="${root}/user_mypage/myPageGroup.jsp">나의
						모임관리</a> <a class="tab" href="${root}/user_mypage/myPageGroupZzim.jsp">찜한
						모임</a> <a class="tab" href="${root}/user_mypage/myPageWrite.jsp">게시물관리</a>
				</div>
			</div>
		</div>
	</div>


</div>
<%@ include
	file="/WEB-INF/views/commons/template/modern_business_bottom.jsp"%>