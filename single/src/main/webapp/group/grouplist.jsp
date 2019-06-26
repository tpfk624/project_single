<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/commons/template/modern_business_top.jsp"%>
<link rel="stylesheet" href="${root}/resources/css/group/group.css" >
<%@ include file="/WEB-INF/views/commons/movetop.jsp"%>
<style>
#groupDetailModal .card-img-top{
	max-width: 70%;
	max-height: 70%;
}
</style>
<script>
$(function() {
	$(".groupcard").click(groupcardClick);
});

function groupcardClick(){
	$("#groupDetailModal").modal("show");
}
</script>

<div id="groupDetailModal" class="modal fade" role="dialog">
	<div class="modal-dialog modal-dialog-scrollable modal-lg">
		<div class="modal-content">
			<div class="modal-header text-center">
				<label style="margin-left: auto; margin-bottom:auto; margin-top:auto; font-size: 1.5rem">그룹 상세 설명</label>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">X</span>
				</button>
			</div>
			<div class="modal-body text-center">
				<img class="card-img-top"
					src="https://cdn.studysearch.co.kr/images/leader/357/4564-1560735145.png?v=1560735145"
					alt="">
				<h4 class="card-title">영어단어 스터디</h4>
				<div class="card-body">
					<p class="card-text">그룹 설명 블라블라블라 욜그룹 설명 블라블라블라 욜그룹 설명 블라블라블라
						욜그룹 설명 블라블라블라 욜
						그룹 설명 블라블라블라 욜그룹 설명 블라블라블라 욜그룹 설명 블라블라블라
						욜그룹 설명 블라블라블라 욜
						그룹 설명 블라블라블라 욜그룹 설명 블라블라블라 욜그룹 설명 블라블라블라
						욜그룹 설명 블라블라블라 욜
						그룹 설명 블라블라블라 욜그룹 설명 블라블라블라 욜그룹 설명 블라블라블라
						욜그룹 설명 블라블라블라 욜
						그룹 설명 블라블라블라 욜그룹 설명 블라블라블라 욜그룹 설명 블라블라블라
						욜그룹 설명 블라블라블라 욜	
						그룹 설명 블라블라블라 욜그룹 설명 블라블라블라 욜그룹 설명 블라블라블라
						욜그룹 설명 블라블라블라 욜	
						그룹 설명 블라블라블라 욜그룹 설명 블라블라블라 욜그룹 설명 블라블라블라
						욜그룹 설명 블라블라블라 욜	
						그룹 설명 블라블라블라 욜그룹 설명 블라블라블라 욜그룹 설명 블라블라블라
						욜그룹 설명 블라블라블라 욜	
						그룹 설명 블라블라블라 욜그룹 설명 블라블라블라 욜그룹 설명 블라블라블라
						욜그룹 설명 블라블라블라 욜	
					</p>
					<p class="card-text">카테고리 : 스터디</p>
					<p class="card-text">#쿵쿵짝 #쿵쿵짝 #쿵쿵짝</p>
					<p class="card-text">인원 : 15/30</p>
					<p class="card-text">장소 : 구로디지털 단지</p>
				</div>
			</div>
			
			<!-- Modal footer -->
	        <div class="modal-footer">
	        	<button type="button" class="btn btn-primary">가입신청</button>
	          	<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
	        </div>
		</div>
	</div>
</div>
<header>
	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner" role="listbox">
			<!-- Slide One - Set the background image for this slide in the line below -->
			<div class="carousel-item active"
				style="background-image: url('https://cdn.studysearch.co.kr/images/leader/1939/8742-1547710638.png?v=1547710638')">
				<div class="carousel-caption d-none d-md-block">
					<h3>First Slide</h3>
					<p>This is a description for the first slide.</p>
				</div>
			</div>
			<!-- Slide Two - Set the background image for this slide in the line below -->
			<div class="carousel-item"
				style="background-image: url('https://cdn.studysearch.co.kr/images/leader/1939/8739-1528697685.png?v=1528697686')">
				<div class="carousel-caption d-none d-md-block">
					<h3>Second Slide</h3>
					<p>This is a description for the second slide.</p>
				</div>
			</div>
			<!-- Slide Three - Set the background image for this slide in the line below -->
			<div class="carousel-item"
				style="background-image: url('https://cdn.studysearch.co.kr/images/leader/1939/8740-1547710638.png?v=1547710638')">
				<div class="carousel-caption d-none d-md-block">
					<h3>Third Slide</h3>
					<p>This is a description for the third slide.</p>
				</div>
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
</header>

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

<section class="contents">
	<!-- Page Content -->
	<div class="container">
		
		<div class="row">
			<h1 class="col-lg-10 col-sm-8 my-4">2014개의 스터디</h1>
			<div class="dropdown col-lg-2 col-sm-4 my-4 category">
				<button type="button" class="btn btn-primary dropdown-toggle"
					data-toggle="dropdown">카테고리</button>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">스터디</a> 
					<a class="dropdown-item" href="#">취미</a> 
					<a class="dropdown-item" href="#">친목도모</a>
					<a class="dropdown-item" href="#">맛집탐방</a>
				</div>
			</div>
		</div>
		<!-- Marketing Icons Section -->
		<div class="row">
			
			<!-- 카드 사진 위버전 -->
			<div class="col-lg-4 col-sm-6 portfolio-item groupcard">
				<div class="card h-100">
					<img class="card-img-top"
						src="https://cdn.studysearch.co.kr/images/leader/357/4564-1560735145.png?v=1560735145"
						alt="">
					<h4 class="card-title">영어단어 스터디</h4>
					<div class="card-body">
						<p class="card-text">그룹 설명 블라블라블라 욜그룹 설명 블라블라블라 욜그룹 설명 블라블라블라
							욜그룹 설명 블라블라블라 욜</p>
						<p class="card-text">#쿵쿵짝 #쿵쿵짝 #쿵쿵짝</p>
						<p class="card-text">인원 : 15/30</p>
						<p class="card-text">장소 : 구로디지털 단지</p>
					</div>

					<div class="overlay">
						<div class="text">상세보기</div>
					</div>
				</div>
			</div>
			
			<!-- 카드 사진 위버전 -->
			<div class="col-lg-4 col-sm-6 portfolio-item groupcard">
				<div class="card h-100">
					<img class="card-img-top"
						src="https://cdn.studysearch.co.kr/images/leader/357/4564-1560735145.png?v=1560735145"
						alt="">
					<h4 class="card-title">영어단어 스터디</h4>
					<div class="card-body">
						<p class="card-text">그룹 설명 블라블라블라 욜그룹 설명 블라블라블라 욜그룹 설명 블라블라블라
							욜그룹 설명 블라블라블라 욜</p>
						<p class="card-text">#쿵쿵짝 #쿵쿵짝 #쿵쿵짝</p>
						<p class="card-text">인원 : 15/30</p>
						<p class="card-text">장소 : 구로디지털 단지</p>
					</div>

					<div class="overlay">
						<div class="text">상세보기</div>
					</div>
				</div>
			</div>
			
			<!-- 카드 사진 위버전 -->
			<div class="col-lg-4 col-sm-6 portfolio-item groupcard">
				<div class="card h-100">
					<img class="card-img-top"
						src="https://cdn.studysearch.co.kr/images/leader/357/4564-1560735145.png?v=1560735145"
						alt="">
					<h4 class="card-title">영어단어 스터디</h4>
					<div class="card-body">
						<p class="card-text">그룹 설명 블라블라블라 욜그룹 설명 블라블라블라 욜그룹 설명 블라블라블라
							욜그룹 설명 블라블라블라 욜</p>
						<p class="card-text">#쿵쿵짝 #쿵쿵짝 #쿵쿵짝</p>
						<p class="card-text">인원 : 15/30</p>
						<p class="card-text">장소 : 구로디지털 단지</p>
					</div>

					<div class="overlay">
						<div class="text">상세보기</div>
					</div>
				</div>
			</div>
			
			<!-- 카드 사진 아래버전 -->
			<div class="col-lg-4 col-sm-6 portfolio-item groupcard">
				<div class="card h-100">
					<h4 class="card-title">영어단어 스터디</h4>
					<div class="card-body">
						<p class="card-text">그룹 설명 블라블라블라 욜그룹 설명 블라블라블라 욜그룹 설명 블라블라블라
							욜그룹 설명 블라블라블라 욜</p>
						<p class="card-text">#쿵쿵짝 #쿵쿵짝 #쿵쿵짝</p>
						<p class="card-text">인원 : 15/30</p>
						<p class="card-text">장소 : 구로디지털 단지</p>
					</div>
					<img class="card-img-top"
						src="https://cdn.studysearch.co.kr/images/leader/357/4564-1560735145.png?v=1560735145"
						alt="">
					<div class="overlay">
						<div class="text">상세보기</div>
					</div>
				</div>
			</div>

			<!-- 카드 사진 아래버전 -->
			<div class="col-lg-4 col-sm-6 portfolio-item groupcard">
				<div class="card h-100">
					<img class="card-img-top"
						src="https://cdn.studysearch.co.kr/images/leader/357/4564-1560735145.png?v=1560735145"
						alt="">
					<h4 class="card-title">영어단어 스터디</h4>
					<div class="card-body">
						<p class="card-text">그룹 설명 블라블라블라 욜그룹 설명 블라블라블라 욜그룹 설명 블라블라블라
							욜그룹 설명 블라블라블라 욜</p>
						<p class="card-text">인원 : 15/30</p>
						<p class="card-text">장소 : 구로디지털 단지</p>
					</div>

					<div class="overlay">
						<div class="text">상세보기</div>
					</div>
				</div>
			</div>


			<div class="col-lg-4 mb-4">
				<div class="card card-outline-primary h-100">
					<h3 class="card-header bg-primary text-white">Plus</h3>
					<div class="card-body">
						<div class="display-4">$39.99</div>
						<div class="font-italic">per month</div>
					</div>
					<ul class="list-group list-group-flush">
						<li class="list-group-item">Cras justo odio</li>
						<li class="list-group-item">Dapibus ac facilisis in</li>
						<li class="list-group-item">Vestibulum at eros</li>
						<li class="list-group-item"><a href="#"
							class="btn btn-primary">Sign Up!</a></li>
					</ul>
				</div>
			</div>

			<div class="col-lg-4 mb-4">
				<div class="card h-100">
					<h4 class="card-header">영어 스터디</h4>
					<div class="card-body">
						<img class="group-img"
							src="https://cdn.studysearch.co.kr/images/leader/357/4564-1560735145.png?v=1560735145" />
						<p class="card-text">하루에 영어단어 10개씩 외우실 분 모읍니다.</p>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary">Learn More</a>
					</div>
				</div>
			</div>
			<div class="col-lg-4 mb-4">
				<div class="card h-100">
					<h4 class="card-header">Card Title</h4>
					<div class="card-body">
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Reiciendis ipsam eos, nam perspiciatis natus
							commodi similique totam consectetur praesentium molestiae atque
							exercitationem ut consequuntur, sed eveniet, magni nostrum sint
							fuga.</p>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary">Learn More</a>
					</div>
				</div>
			</div>
			<div class="col-lg-4 mb-4">
				<div class="card h-100">
					<h4 class="card-header">Card Title</h4>
					<div class="card-body">
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Sapiente esse necessitatibus neque.</p>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary">Learn More</a>
					</div>
				</div>
			</div>
		</div>
		<!-- /.row -->

		<!-- Portfolio Section -->
		<h2>Portfolio Heading</h2>

		<div class="row">
			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/700x400" alt=""></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#">Project One</a>
						</h4>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Amet numquam aspernatur eum quasi sapiente
							nesciunt? Voluptatibus sit, repellat sequi itaque deserunt,
							dolores in, nesciunt, illum tempora ex quae? Nihil, dolorem!</p>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/700x400" alt=""></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#">Project Two</a>
						</h4>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipiscing elit. Nam viverra euismod odio, gravida pellentesque
							urna varius vitae.</p>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/700x400" alt=""></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#">Project Three</a>
						</h4>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Quos quisquam, error quod sed cumque, odio
							distinctio velit nostrum temporibus necessitatibus et facere
							atque iure perspiciatis mollitia recusandae vero vel quam!</p>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/700x400" alt=""></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#">Project Four</a>
						</h4>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipiscing elit. Nam viverra euismod odio, gravida pellentesque
							urna varius vitae.</p>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/700x400" alt=""></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#">Project Five</a>
						</h4>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipiscing elit. Nam viverra euismod odio, gravida pellentesque
							urna varius vitae.</p>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a href="#"><img class="card-img-top"
						src="http://placehold.it/700x400" alt=""></a>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#">Project Six</a>
						</h4>
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Itaque earum nostrum suscipit ducimus nihil
							provident, perferendis rem illo, voluptate atque, sit eius in
							voluptates, nemo repellat fugiat excepturi! Nemo, esse.</p>
					</div>
				</div>
			</div>
		</div>
		<!-- /.row -->

		<!-- Features Section -->
		<div class="row">
			<div class="col-lg-6">
				<h2>Modern Business Features</h2>
				<p>The Modern Business template by Start Bootstrap includes:</p>
				<ul>
					<li><strong>Bootstrap v4</strong></li>
					<li>jQuery</li>
					<li>Font Awesome</li>
					<li>Working contact form with validation</li>
					<li>Unstyled page elements for easy customization</li>
				</ul>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
					Corporis, omnis doloremque non cum id reprehenderit, quisquam totam
					aspernatur tempora minima unde aliquid ea culpa sunt. Reiciendis
					quia dolorum ducimus unde.</p>
			</div>
			<div class="col-lg-6">
				<img class="img-fluid rounded" src="http://placehold.it/700x450"
					alt="">
			</div>
		</div>
		<!-- /.row -->

		<hr>

		<!-- Call to Action Section -->
		<div class="row mb-4">
			<div class="col-md-8">
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
					Molestias, expedita, saepe, vero rerum deleniti beatae veniam harum
					neque nemo praesentium cum alias asperiores commodi.</p>
			</div>
			<div class="col-md-4">
				<a class="btn btn-lg btn-secondary btn-block" href="#">Call to
					Action</a>
			</div>
		</div>

	</div>
</section>

<!-- /.container -->

<%@ include file="/WEB-INF/views/commons/template/modern_business_bottom.jsp"%>
