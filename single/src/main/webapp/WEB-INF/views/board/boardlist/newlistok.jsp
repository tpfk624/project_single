<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<table class="table">
	<thead>
		<tr>
			 <th width="17%">카테고리</th>
			 <th width="33%">제목</th>
			 <th width="33%">작성자</th>
			 <th width="17%">작성일</th>
		</tr>
	</thead>


	<tbody>
		<!-- BoardPageDto안에 list가 있기 때문에 bp.list로 씀. List로 가져온게 아님. -->
		<c:forEach var="bp" items='${bp.list}'>
			<tr>
				<c:if test="${bp.boardListNum == 1 }">
					<td>자취생활팁</td>
				</c:if>
				<c:if test="${bp.boardListNum == 2 }">
					<td>요리레시피</td>
				</c:if>
				<c:if test="${bp.boardListNum == 3 }">
					<td>명예의전당</td>
				</c:if>
				<td>
					<label class="contentDetail">
						<a class="boardDetail">
							<input class="boardNum" type="hidden" value="${bp.boardNum }">
							<strong>${bp.boardSubject }</strong>
						</a>
					</label>
				</td>
				<td>${bp.userNickname }</td>
				<td>${bp.boardCreatedate }</td>
			</tr>
		</c:forEach>
	</tbody>
</table><hr>




	<div class="row">
		
		<div class="col-lg-2">
			<c:if test="${bp.startPage > 1 }">
				<span class="page">
					<button class="page-link" value="${bp.startPage - 1}">이전</button>
				</span>
			</c:if>
		</div>

		<div class="col-lg-2"></div>

		<div class="col-lg-4">
			<ul class="pagination" style="width: 240px; margin-left: auto; margin-right: auto;">

				<c:forEach begin="${bp.startPage}" end="${bp.endPage}" step="1" varStatus="i">
					<c:choose>

						<c:when test="${bp.currentPage == i.index}">
							<li class="page-item">
								<span>
									<a class="page-link">${i.index}</a>
								</span>
							</li>
						</c:when>

						<c:otherwise>
							<li class="page-item">
								<span class="page">
									<input class="page-link" type="button" value="${i.index}">
								</span>
							</li>
						</c:otherwise>

					</c:choose>
				</c:forEach>

			</ul>
		</div>

		<div class="col-lg-2"></div>

		<div class="col-lg-2">

			<c:if test="${bp.totalPage > bp.endPage }">
				<span class="page">
					<button class="page-link" value="${bp.endPage+1}">다음</button>
				</span>
			</c:if>

		</div>
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	