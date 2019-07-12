<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!-- 게시물 출력 시작 -->
<c:forEach items="${boardList}" var="board">
	<!-- 글목록 -->
	<div class="cardWrite" data-num="${board.boardNum}">
		<div class="cardWriteTop" >
			<h5 class="card-title" id="card-title">${board.boardSubject}</h5>
			<c:if test="${board.userId != null }">
				<h6 class="card-title" id="card-title-body">글쓴이: ${board.userId}</h6>			
			</c:if>
			<c:if test="${board.userId == null}">
				<h6 class="card-title" id="card-title-body"><br></h6>			
			</c:if>
		</div>
		<div class="cardWriteCenter">
			<h6 class="card-content">${board.boardContent}</h6>
		</div>
		<div class="cardWriteBottom">
			<h8 class="card-date">${board.boardCreatedate}</h8>
			
<%-- 			<img id="like-img" src="${root}/resources/img/user/heart.png" alt="좋아요" width="20" height="20" align="right"> --%>
<%-- 			<h8 class="card-date" id="card-like">${board.boardLike}</h8> --%>
			<%-- <img src="${root}/resources/img/user/chat.png" alt="좋아요" width="20" height="20" align="right"> --%>
		</div>
	</div>
	<!-- 글목록 -->
</c:forEach>
<!-- 게시물 출력 종료 -->

