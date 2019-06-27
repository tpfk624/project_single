<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="${root}/resources/css/group/group.css">
<%@ include
	file="/WEB-INF/views/commons/template/modern_business_top.jsp"%>

<style>
div {
	display: block;
}

body, html {
	height: 100%;
	font-size: 11pt;
	font-family: Apple SD Gothic Neo, notokr, dotum, serif !important;
	text-rendering: optimizeLegibility;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
	-moz-font-feature-settings: "liga";
}

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

/* 밑부분 */
#my-product-list-section {
	margin: 50px auto 75pt;
	padding: 24px;
	width: 60pc;
	background: #e9ecef;
	box-sizing: border-box;
}

/*  */
.subbox {
	padding: 4rem 5rem;
	margin-bottom: 2rem;
	background-color: #e9ecef;
	border-radius: 0.3rem;
	width: 500px;
	height: 500px;
	margin-left: 300px;
}

.wrap {
	width: 1092px;
	margin: 0 auto;
	position: relative;
}

body {
	background: #f8f8fa;
}

.config_area {
	width: 706px;
	background: white;
	border: 1px solid #bbbbbd;
	margin: 0 auto;
	margin-top: 40px;
	margin-bottom: 40px;
}

.config_title {
	width: 100%;
	height: 60px;
	line-height: 60px;
	font-size: 20px;
	color: #363636;
	border-bottom: 1px solid #bbbbbd;
	padding-left: 22px;
}

.config_table {
	margin: 20px 0px 20px 0px;
}

.config_table th {
	font-weight: bold;
	color: #363636;
	font-size: 13px;
	line-height: 31px;
	height: 31px;
	text-align: left;
	padding-left: 60px;
}

.config_table .t_input {
	height: 29px;
	line-height: 29px;
	border: 1px solid #c8c8ca;
	width: 421px;
	padding-left: 15px;
}

.config_table .t_input_s {
	height: 29px;
	line-height: 29px;
	border: 1px solid #c8c8ca;
	width: 305px;
}

.config_table td {
	font-size: 13px;
	line-height: 31px;
	color: #808080;
}

.config_table td.space {
	height: 20px;
	line-height: 0px;
	font-size: 0px;
}

.config_foot {
	width: 100%;
	border-top: 1px solid #bbbbbd;
	font-size: 14px;
	color: #555555;
	padding-left: 22px;
	padding-right: 22px;
	line-height: 82px;
	height: 82px;
}

.leavelink {
	font-size: 14px;
	color: #555555;
}

.btn_submit {
	font-size: 15px;
	font-weight: bold;
	color: white;
	display: block;
	width: 121px;
	height: 40px;
	line-height: 40px;
	border: 1px solid #3099dd;
	background: #49b2e9;
	text-align: center;
	float: right;
	margin-top: 21px;
}

.et-radio_txt {
	font-size: 13px;
	color: #363636;
}

.pw_reset {
	height: 29px;
	line-height: 29px;
	text-align: center;
	font-size: 13px;
	color: white;
	font-weight: bold;
	background: #ff9320;
	border: 1px solid #f7870f;
	display: block;
	width: 150px;
}

.dup_url {
	font-weight: bold;
	font-family: 'dotum';
	font-size: 12px;
	height: 25px;
	line-height: 18px;
	width: 100%;
	text-align: right;
	padding-right: 60px;
	color: red;
}

.modal-body {
	padding: 20px;
}

.pw_input {
	width: 100%;
	height: 29px;
	line-height: 29px;
	padding-left: 10px;
	padding-right: 10px;
	font-size: 13px;
	color: #808080;
	border: 1px solid #c8c8ca;
	margin-bottom: 10px;
}

#btn-danger {
	width: 100%;
}

.jumbotron {
	padding: 11rem 1rem;
	background-color: white;
}

.contents {
	background-color: #ebebeb;
	height: 1000px;
}
</style>

<br>
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
							<a class="tab selected" href="/member/product/list/">내 프로필</a><a
								class="tab" href="/member/bookmark/list/">나의 모임관리</a><a
								class="tab" href="/member/transaction/list/">찜한 모임</a><a
								class="tab" href="/member/credit-and-coupon/">게시물관리</a>
						</div>
					</div>
				</div>
			</div>

			<br>

			<div class="container">
				<div class="jumbotron">
				
				
				</div>
			</div>
		</div>
	</section>

</div>

<%@ includefile="/WEB-INF/views/commons/template/modern_business_bottom.jsp"%>