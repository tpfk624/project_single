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

	<br> <br>

	<div class="wrap">
		<div class="config_area">
			<div class="config_title">
				<!--계정설정-->
				계정설정
			</div>
			<table class="config_table" width="100%">
				<colgroup>
					<col width="250">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th>
							<!--이메일 주소-->이메일 주소
						</th>
						<td><input type="text" name="email_address" class="t_input"
							value="tpfk624@gmail.com" disabled=""></td>
					</tr>
					<tr>
						<td class="space">&nbsp;</td>
					</tr>
					<tr>
						<th>
							<!--이름-->이름
						</th>
						<td><input type="text" name="name" class="t_input"
							value="고세라"></td>
					</tr>
					<tr>
						<td class="space">&nbsp;</td>
					</tr>

					<tr>
						<th>
							<!--비밀번호-->비밀번호
						</th>
						<td>
							<!-- Button to Open the Modal -->
							<button type="button" class="btn btn-primary" data-toggle="modal"
								data-target="#myModal">비밀번호 재설정</button> <!-- The Modal -->
							<div class="modal" id="myModal">
								<div class="modal-dialog modal-sm">
									<div class="modal-content">

										<!-- Modal Header -->
										<div class="modal-header">
											<h4 class="modal-title">비밀번호 재설정</h4>
											<button type="button" class="close" data-dismiss="modal">&times;</button>
										</div>

										<!-- Modal body -->
										<form action="/ko/member/change_pw" method="post" id="pw_form">
											<div class="modal-body">
												<input type="password" placeholder="현재 비밀번호"
													class="pw_input old_pw" name="old_pw"> <input
													type="password" placeholder="신규 비밀번호"
													class="pw_input new_pw" name="new_pw"> <input
													type="password" placeholder="신규 비밀번호 확인"
													class="pw_input pw_vali" name="pw_vali">
											</div>

											<!-- Modal footer -->
											<div class="modal-footer">
												<button type="button" class="btn btn-danger" id="btn-danger"
													data-dismiss="modal">Close</button>
											</div>
										</form>
									</div>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="space">&nbsp;</td>
					</tr>


				</tbody>
			</table>

			<div class="config_foot">
				<a
					href="javascript:et_modal('465', '383', '', '0', '/ko/member/leave', '0', '1', '0','0');"
					class="leavelink"> <!--회원탈퇴-->회원탈퇴
				</a> <a href="#" class="btn_submit"> <!--변경사항 저장-->변경사항 저장
				</a>
				<div class="clear"></div>
			</div>
		</div>
	</div>
</div>
<%@ include
	file="/WEB-INF/views/commons/template/modern_business_bottom.jsp"%>