<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section class="search">
	<!-- Search Widget -->
	<div class="container">
	<div class="card mb-4">
		<h5 class="card-header">검색</h5>
		<div class="card-body">
			<div class="input-group">
				<div class="dropdown col-lg-2 col-sm-4">
					<input type="hidden" name="key" value="" >
					<button type="button" class="btn btn-primary dropdown-toggle"
						data-toggle="dropdown">추천</button>
					<div class="dropdown-menu">
						<a class="dropdown-item active" href="#">추천</a> 
						<a class="dropdown-item" href="#">그룹이름</a> 
						<a class="dropdown-item" href="#">키워드</a> 
						<a class="dropdown-item" href="#">위치</a>
					</div>
				</div>
				<input type="text" class="form-control" placeholder="검색단어를 입력하세요">
				<span class="input-group-btn col-lg-2 col-sm-4 span-btn">
					<button class="btn btn-primary" type="button">검색</button>
				</span>
			</div>
		</div>
	</div>
	</div>
</section>