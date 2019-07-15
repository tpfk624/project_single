<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>    
$(function (){
	
	$(document).on("click","#news", function () {
		var boardNum = $(this).find('input').val()
		location.href="${root}/board/view?boardNum=" + boardNum;
	});
	
	$(document).on("click","#loginGo", function () {
		location.href="${root}/member/login";
	});
	
});    
</script>

<style>
/* #floating {
	position: fixed;
	right: 60%; 
	top: 20%;
	width: 80%;
	margin-right: -720px;
	text-align: center;
}
id="floating" */
</style>

<div class="col-lg-2 mb-4" align="center" style="background-color: #dee4ea">
	<br>
	
	<!-- 카테고리 유저 -->
	<!-- 로그인 일때 -->
	<c:if test="${categoryU != null }">
	<div class="container" style="border-top: 1px solid #696969; border-bottom: 1px solid #696969;">
		<div class="row">
			<div class="col-lg-12"><br>
				<c:if test="${categoryU.userProfile != null}">
					<img src="${categoryU.userProfile }" class="rounded-circle" alt="이미지" width="100" height="100">
				</c:if>
				<c:if test="${categoryU.userProfile == null}">
					<img src='${root}/resources/img/seonimg/kakaopic.png' class="rounded-circle" alt="이미지" width="100" height="100">
				</c:if>
			</div>        
			<div class="col-lg-12" align="center">
				<div align="center"><br>     
					<small> - 닉네임 - </small> 
				</div>
				<div>
					<small>${categoryU.userNickname }</small>   
				</div>
				<div align="left">
					<small>총 글수 : ${totalCnt }</small>
				</div>
				<div align="left">
					<small>총 좋아요 수 : ${totalCntL }</small>   
				</div> 
			</div>
		</div>
	<br>    
	</div>   
	</c:if>
	<!-- 로그인 안됬을때 -->
	<c:if test="${categoryU == null }">
	<div id="loginGo" class="container" style="border-top: 1px solid #696969; border-bottom: 1px solid #696969;">
		<div class="row">
			<div class="row">
				<div class="col-lg-12" align="center"><br>   
					<img alt="로그인을 해주세요." src="${root}/resources/img/bimg/16.jpg">			
				</div>        
				<div class="col-lg-12" align="center"><br>
					<strong>로그인을 해주세요</strong>
				</div>
			</div>
		</div>	
	</div>
	</c:if>
	<br>
	
	
	<!-- 카테고리 -->
	<div class="list-group">
		<a href="${root }/board/singlemain" class="list-group-item">메인</a> 
		<a href="${root }/board/singlelifeboard" class="list-group-item">자취러 이야기</a> 
		<a href="${root }/board/singlecookboard" class="list-group-item">요리 레시피</a>
	</div>
	<br>
	
	<!-- 시계 -->
	<!-- <div>
	<iframe scrolling="no" frameborder="no" clocktype="html5" 
	style="overflow:hidden;border:0;margin:0;padding:0;width:130px;height:70px;"
	src="https://www.clocklink.com/html5embed.php?clock=042&timezone=KoreaRepublicof_Seoul&color=blue&size=356&Title=&Message=&Target=&From=2019,1,1,0,0,0&Color=blue">
	</iframe>
	</div> -->
 
	<!-- 새글 -->   
	<br>
	<div class="container" style="border-top: 1px solid; border-bottom:1px solid;"><br> 
		<div align="center">
		- 최신글 제목 -     
		</div>
		<div id="news">
			<small>     
				<input type="hidden" value="${categoryN.boardNum }">${categoryN.boardSubject}
			</small>
		</div>
	<br></div><br><br>   


</div>
