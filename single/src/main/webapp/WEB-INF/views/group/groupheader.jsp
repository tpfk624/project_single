<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
	<div id="carouselExampleIndicators" class="carousel slide"
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
		</ol>
		<div class="carousel-inner" role="listbox">
			<!-- Slide One - Set the background image for this slide in the line below -->
			<div class="carousel-item active"
				style="background-image: url('${root}/resources/img/group/study.jpg')">
				<div class="carousel-caption d-none d-md-block">
					<h3>스터디</h3>
					<!-- <p>같이 공부하실분 모집해요</p> -->
				</div>
			</div>
			<!-- Slide Two - Set the background image for this slide in the line below -->
			<div class="carousel-item"
				style="background-image: url('${root}/resources/img/group/hobby1.jpg')">
				<div class="carousel-caption d-none d-md-block">
					<h3>취미</h3>
					<!-- <p>너 내 동료가 되라</p> -->
				</div>
			</div>
			<!-- Slide Three - Set the background image for this slide in the line below -->
			<div class="carousel-item"
				style="background-image: url('${root}/resources/img/group/friends.jpg')">
				<div class="carousel-caption d-none d-md-block">
					<h3>친목도모</h3>
					<!-- <p>이제 혼자는 싫어요...</p> -->
				</div>
			</div>
			<!-- Slide Four - Set the background image for this slide in the line below -->
			<div class="carousel-item"
				style="background-image: url('${root}/resources/img/group/mealmeeting1.jpg')">
				<div class="carousel-caption d-none d-md-block">
					<h3>맛집탐방</h3>
					<!-- <p>세상의 모든 음식을 다 먹을때까지!!</p> -->
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