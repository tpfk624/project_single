<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include
	file="/WEB-INF/views/commons/template/modern_business_top.jsp"%>
<style>
.carousel-item {
	height: 40vh;
}

.contents {
	background-color: #ebebeb;
}

.container {
	margin-top: 1.5rem;
	padding-left: 0;
	padding-right: 0;
}

.card-title {
	margin: 0px 24px;
	border-bottom: 1px solid rgb(235, 235, 235);
	color: #007bff;
	padding: .75rem 1.25rem;
	text-align: center;
}

.group-img {
	width: 100%;
	height: 70%;
}

.overlay {
	position: absolute;
	bottom: 0;
	background: rgb(0, 0, 0);
	background: rgba(239, 108, 0, 0.8); /* Black see-through */
	color: #f1f1f1;
	width: 100%;
	transition: .5s ease;
	opacity: 0;
	color: white;
	font-size: 20px;
	padding: 20px;
	text-align: center;
}

.groupcard:hover .overlay {
	opacity: 1;
}

.text {
	color: white;
	font-size: 20px;
	position: absolute;
	top: 50%;
	left: 50%;
	-webkit-transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
	text-align: center;
}

.leftside{
	right: 0px;
}



</style>
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
	<div class="card mb-4 container">
		<h5 class="card-header">Search</h5>
		<div class="card-body">
			<div class="input-group">
				<div class="dropdown" style="margin-right: 10px;">
					<button type="button" class="btn btn-primary dropdown-toggle"
						data-toggle="dropdown">추천</button>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">스터디</a> 
						<a class="dropdown-item" href="#">취미</a> 
						<a class="dropdown-item" href="#">친목도모</a>
						<a class="dropdown-item" href="#">맛집탐방</a>
					</div>
				</div>
				<input type="text" class="form-control" placeholder="Search for...">
				<span class="input-group-btn">
					<button class="btn btn-secondary" type="button">Go!</button>
				</span>
			</div>
		</div>
	</div>
</section>

<section class="contents">
	<!-- Page Content -->
	<div class="container">
		
		<div class="row">
			<h1 class="col-lg-4 my-4">2014개의 스터디</h1>
			<div class="dropdown my-4 leftside">
				<button type="button" class="btn btn-primary dropdown-toggle"
					data-toggle="dropdown">카테고리</button>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">그룹이름</a> <a
						class="dropdown-item" href="#">키워드</a> <a
						class="dropdown-item" href="#">위치</a>
				</div>
			</div>
		</div>
		<!-- Marketing Icons Section -->
		<div class="row">

			<!-- 카드 사진 위버전 -->
			<div class="col-lg-4 col-sm-6 portfolio-item groupcard">
				<div class="card h-100">
					<h4 class="card-title">영어단어 스터디</h4>
					<div class="card-body">
						<p class="card-text">그룹 설명 블라블라블라 욜그룹 설명 블라블라블라 욜그룹 설명 블라블라블라
							욜그룹 설명 블라블라블라 욜</p>
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

<%@ include
	file="/WEB-INF/views/commons/template/modern_business_bottom.jsp"%>
