<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/commons/template/modern_business_top.jsp" %>

<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script> -->







<div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h2 class="mt-4 mb-3">혼자놀아요
      <small>- 자취생활 팁</small>
    </h2>

    <ol class="breadcrumb" style="background-color: #004085!important;"></ol>




    <div class="row">
    <!-- 메인 중앙 --> 
    <div class="col-lg-10 mb-4">
      
      
	<!-- 이달의 자취왕 -->
	<div class="container" style="background-color: #007bff21;">
	
	    <h2 class="my-4" align="center">이달의 최고 자취왕</h2>
		
		<div class="container">
			<div class="row" align="center">
				<div class="col-lg-4">
					<div class="container">
						<h3>1등</h3>
						<img src="${root}/resources/img/bimg/king.PNG" class="rounded-circle" alt="1등" width="100" height="100">
					</div>
					<!-- 글 제목 좋아요 높은순으로 for문 돌리기 -->
					<div>
						<div><a href="#">1.라면이 좋아요</a></div>
						<div><a href="#">2.이게 좋아요가 1등이라니</a></div>
						<div><a href="#">3.공부는 싫어요</a></div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="container">
						<h3>2등</h3>
						<img src="${root}/resources/img/bimg/king.PNG" class="rounded-circle" alt="2등" width="100" height="100">
					</div>
					<!-- 글 제목 좋아요 높은순으로 for문 돌리기 -->
					<div>
						<div><a href="#">1.라면이 좋아요</a></div>
						<div><a href="#">2.안뇽하세요 에베베베베베베베</a></div>
						<div><a href="#">3.공부는 싫어요</a></div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="container">
						<h3>3등</h3>
						<img src="${root}/resources/img/bimg/king.PNG" class="rounded-circle" alt="3등" width="100" height="100">
					</div>
					<!-- 글 제목 좋아요 높은순으로 for문 돌리기 -->
					<div>
						<div><a href="#">1.라면이 좋아요</a></div>
						<div><a href="#">2.띠요오오오옹오오오오오옹띠</a></div>
						<div><a href="#">3.공부는 싫어요</a></div>
					</div>
				</div>
			</div><br>
		</div>
	</div>
	<br><br><br>	
	
	
	<!-- 오늘의 새글 테이블 -->
	<div class="container">
		<div class="row">
			<div class="col-lg-2">
				<button class="btn btn-outline-secondary" style="color: #007bff; border-color: #007bff;">글작성</button>
			</div>
			<div class="col-lg-2"></div>
			<div class="col-lg-1" style="margin-top: 0.5rem;">
			<select name="fruit">
				<option value="제목" selected="selected">제목</option>
				<option value="작성자">작성자</option>
			</select>
			</div>
			<div class="col-lg-7" style="margin-bottom: 1rem;">
				<div class="input-group lg-3">
					<input type="text" class="form-control" placeholder="검색 내용">
					<div class="input-group-prepend">
						<button class="btn btn-outline-primary" type="button">검색</button>  
					</div>
				</div>
			</div>
			
		</div>
	</div> 
	  
	<div class="container">
		<table class="table">
			<thead>
				<tr>
					 <th>제목</th>
					 <th>작성자</th>
					 <th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td width="70%"><strong>맛나는 라면</strong></td>
					<td width="15%">john@example.com</td>
					<td width="15%">2019-06-25</td>
				</tr>
				<tr>
					<td width="70%"><strong>맛나는 라면</strong></td>
					<td width="15%">john@example.com</td>
					<td width="15%">2019-06-25</td>
				</tr>
				<tr>
					<td width="70%"><strong>맛나는 라면</strong></td>
					<td width="15%">john@example.com</td>
					<td width="15%">2019-06-25</td>
				</tr>
				<tr>
					<td width="70%"><strong>맛나는 라면</strong></td>
					<td width="15%">john@example.com</td>
					<td width="15%">2019-06-25</td>
				</tr>
				<tr>
					<td width="70%"><strong>맛나는 라면</strong></td>
					<td width="15%">john@example.com</td>
					<td width="15%">2019-06-25</td>
				</tr>
				<tr>
					<td width="70%"><strong>맛나는 라면</strong></td>
					<td width="15%">john@example.com</td>
					<td width="15%">2019-06-25</td>
				</tr>
				<tr>
					<td width="70%"><strong>맛나는 라면</strong></td>
					<td width="15%">john@example.com</td>
					<td width="15%">2019-06-25</td>
				</tr>
				<tr>
					<td width="70%"><strong>맛나는 라면</strong></td>
					<td width="15%">john@example.com</td>
					<td width="15%">2019-06-25</td>
				</tr>
				<tr>
					<td width="70%"><strong>맛나는 라면</strong></td>
					<td width="15%">john@example.com</td>
					<td width="15%">2019-06-25</td>
				</tr>
				<tr>
					<td width="70%"><strong>맛나는 라면</strong></td>
					<td width="15%">john@example.com</td>
					<td width="15%">2019-06-25</td>
				</tr>
			</tbody>
		</table><hr>
	</div>
	<div class="row">
		<div class="col-lg-2"><small>총 글수 : </small></div>
		<div class="col-lg-8">
			<ul class="pagination justify-content-center">
				<li class="page-item"><a class="page-link" href="javascript:void(0);">Previous</a></li>
				<li class="page-item"><a class="page-link" href="javascript:void(0);">1</a></li>
				<li class="page-item"><a class="page-link" href="javascript:void(0);">2</a></li>
				<li class="page-item"><a class="page-link" href="javascript:void(0);">3</a></li>
				<li class="page-item"><a class="page-link" href="javascript:void(0);">4</a></li>
				<li class="page-item"><a class="page-link" href="javascript:void(0);">5</a></li>
				<li class="page-item"><a class="page-link" href="javascript:void(0);">Next</a></li>
			</ul>
		</div>
		<div class="col-lg-2">
			<button class="btn btn-outline-secondary" style="color: #007bff; border-color: #007bff;">글작성</button>
		</div>
    </div> 
      
      
      
	</div>
	  
	  
	  
	  
	<!-- Sidebar Column -->
	<div class="col-lg-2 mb-4" align="center"><br>
		<div class="list-group">
			<a href="index.html" class="list-group-item">메인</a>
			<a href="about.html" class="list-group-item">자취생활 팁</a>
			<a href="services.html" class="list-group-item">요리 레시피</a>
			<a href="contact.html" class="list-group-item">명예의 전당</a>
		</div>
	</div>
		
		
		
		
	</div>
	<!-- row -->

</div>
<br><br><br><br><br><br><br><br>






  
  
  
  
  
  
  
<%@ include file = "/WEB-INF/views/commons/template/modern_business_bottom.jsp" %>
