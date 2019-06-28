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


:focus {
	outline: -webkit-focus-ring-color auto 1px;
}
/* 마이페이지 헤더부분 */




/* 밑부분 몸체 */
.jumbotron {
	/* padding: 50rem 1rem; */
	background-color: #ebebeb;
}

.contents {
	background-color: white;
}



.jumbotronTop {
	height: 70px;
	margin-bottom: 30px;
}

.jumbotronBottom{
	 overflow: hidden;
}

.moimTitle {
	display: inline-block;
	margin-bottom: .5rem;
	font-size: 23px;
}

.moimOption {
	word-wrap: normal;
	float: right;
	width: 100px;
	height: 30px;
}

/* 모임 박스  */
.col-sm-6 {
	-ms-flex: 0 0 50%;
	flex: 0 0 50%;
	max-width: 30%;
	position: relative;
	width: 100%;
	padding-right: 15px;
	g-left: 15px;
	float: left;
	margin-left: 20px;
}
/* 모임 박스  */


    
.cardWrite{
	width: 100%;
	height: 150px;
	background-color: white;
	border: 1px solid rgba(0,0,0,.125);
	margin-bottom: 30px;
}

.card-title {
    margin: 0px 24px;
    border-bottom: 1px solid rgb(235, 235, 235);
    color: black;
    padding: 1rem 1.25rem;
    
    text-align: left;
}

.card-content {
    margin: 0px 24px;
    color: darkgray;
    padding: 0.6rem 1.25rem;
    text-align: left;
}


.cardWriteBottom {
    margin: 0px 24px;
    color: gray;
    padding: 0.5rem 1.rem;
    text-align: left;
}


img{
 margin-left: 10px;
}

section {
    margin-top: 0rem;
    padding-left: 0;
    padding-right: 0;
}

</style>

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
						<a class="tab" href="${root}/user_mypage/myPage.jsp">내 프로필</a> <a
							class="tab" href="${root}/user_mypage/myPageGroup.jsp">나의
							모임관리</a> <a class="tab"
							href="${root}/user_mypage/myPageGroupZzim.jsp">찜한 모임</a> <a
							class="tab selected" href="${root}/user_mypage/myPageWrite.jsp">게시물관리</a>
					</div>
				</div>
			</div>
		</div>

		<br>

		
		<div class="container">
			<div class="jumbotron">
				<div class="jumbotronTop">
					<label class="moimTitle">게시물 관리</label> <select class="moimOption">
						<option value="제목" selected="selected">내가 쓴 글</option>
						<option value="작성자">나의 댓글</option>
						<option value="작성자">찜한 글</option>
					</select>
					<hr>
				</div>


				<div class="jumbotronBottom">
				
					<!-- 글목록 -->
					<div class="cardWrite">
						<div class="cardWriteTop">
							<h5 class="card-title">배고파여</h5>
						</div>
						<div class="cardWriteCenter">
							<h6 class="card-content">안쌤 왕글씨 공격 따라해보자 글을 길게 써보자 오류를 확인해야하니까 길게 길게 길게 영차영차여차어러니러ㅣㅇ너리넝리너리ㅓㅣ
							안쌤 왕글씨 공격 따라해보자!!글을 길게 써보자 오류를 확인해야하니까 길게 길게 길게 영차영차여차어러니러ㅣㅇ너리넝리너리ㅓㅣ</h6>
						</div>
						<div class="cardWriteBottom">
							<h8 class="card-date">2019-06-28 02:06</h8>
							
								<img src="${root}/resources/img/userMy/heart.png" alt="좋아요" width="20" height="20" align="right">
								<!-- <h6 class = "heartCount">3</h6> -->
								<img src="${root}/resources/img/userMy/chat.png" alt="좋아요" width="20" height="20" align="right">
								<!-- <h6 class = "heartCount">3</h6> -->
						</div>
					</div>
					<!-- 글목록 -->
					
					<!-- 글목록 -->
					<div class="cardWrite">
						<div class="cardWriteTop">
							<h5 class="card-title">나는야 코딩천재</h5>
						</div>
						<div class="cardWriteCenter">
							<h6 class="card-content">안쌤 왕글씨 공격 따라해보자 글을 길게 써보자 오류를 확인해야하니까 길게 길게 길게 영차영차여차어러니러ㅣㅇ너리넝리너리ㅓㅣ
							안쌤 왕글씨 공격 따라해보자!!글을 길게 써보자 오류를 확인해야하니까 길게 길게 길게 영차영차여차어러니러ㅣㅇ너리넝리너리ㅓㅣ</h6>
						</div>
						<div class="cardWriteBottom">
							<h8 class="card-date">2019-06-28 02:06</h8>
							
								<img src="${root}/resources/img/userMy/heart.png" alt="좋아요" width="20" height="20" align="right">
								<!-- <h6 class = "heartCount">3</h6> -->
								<img src="${root}/resources/img/userMy/chat.png" alt="좋아요" width="20" height="20" align="right">
								<!-- <h6 class = "heartCount">3</h6> -->
						</div>
					</div>
					<!-- 글목록 -->
					
					<!-- 글목록 -->
					<div class="cardWrite">
						<div class="cardWriteTop">
							<h5 class="card-title">오늘의 요리는 가지덮밥입니다앙</h5>
						</div>
						<div class="cardWriteCenter">
							<h6 class="card-content">안쌤 왕글씨 공격 따라해보자 글을 길게 써보자 오류를 확인해야하니까 길게 길게 길게 영차영차여차어러니러ㅣㅇ너리넝리너리ㅓㅣ
							안쌤 왕글씨 공격 따라해보자!!글을 길게 써보자 오류를 확인해야하니까 길게 길게 길게 영차영차여차어러니러ㅣㅇ너리넝리너리ㅓㅣ</h6>
						</div>
						<div class="cardWriteBottom">
							<h8 class="card-date">2019-06-28 02:06</h8>
							
								<img src="${root}/resources/img/userMy/heart.png" alt="좋아요" width="20" height="20" align="right">
								<!-- <h6 class = "heartCount">3</h6> -->
								<img src="${root}/resources/img/userMy/chat.png" alt="좋아요" width="20" height="20" align="right">
								<!-- <h6 class = "heartCount">3</h6> -->
						</div>
					</div>
					<!-- 글목록 -->
					
					<!-- 글목록 -->
					<div class="cardWrite">
						<div class="cardWriteTop">
							<h5 class="card-title">룰루랄라 </h5>
						</div>
						<div class="cardWriteCenter">
							<h6 class="card-content">안쌤 왕글씨 공격 따라해보자 글을 길게 써보자 오류를 확인해야하니까 길게 길게 길게 영차영차여차어러니러ㅣㅇ너리넝리너리ㅓㅣ
							안쌤 왕글씨 공격 따라해보자!!글을 길게 써보자 오류를 확인해야하니까 길게 길게 길게 영차영차여차어러니러ㅣㅇ너리넝리너리ㅓㅣ</h6>
						</div>
						<div class="cardWriteBottom">
							<h8 class="card-date">2019-06-28 02:06</h8>
							
								<img src="${root}/resources/img/userMy/heart.png" alt="좋아요" width="20" height="20" align="right">
								<!-- <h6 class = "heartCount">3</h6> -->
								<img src="${root}/resources/img/userMy/chat.png" alt="좋아요" width="20" height="20" align="right">
								<!-- <h6 class = "heartCount">3</h6> -->
						</div>
					</div>
					<!-- 글목록 -->
					
					
					
				</div>
			</div>
		</div>
		
	</div>
</section>

<%@ include file="/WEB-INF/views/commons/template/modern_business_bottom.jsp"%>