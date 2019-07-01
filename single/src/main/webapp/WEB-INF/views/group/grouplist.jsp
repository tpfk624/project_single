<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/commons/template/modern_business_top.jsp"%>
<link rel="stylesheet" href="${root}/resources/css/group/group.css" >
<%@ include file="/WEB-INF/views/commons/movetop.jsp"%>

<script>
$(function() {
	$(".groupcard").click(groupcardClick);
});

function makeParameterJson(userId, groupNum, key, word){
	var param = JSON.stringify({});
	if(userId != null && userId != ''){
		param.userId = userId;
	}
	if(groupNum != null && groupNum != ''){
		param.groupNum = groupNum;
	}
	if(key != null && key != ''){
		param.key = key;
	}
	if(word != null && word != ''){
		param.word = word;
	}
	console.log(param);
	return param;
}

function groupcardClick(){
	var groupNum = $(this).attr("data-num");
	console.log(groupNum);
	var param = makeParameterJson('', groupNum, '', '');
	$.ajax({
		url : "${root}/group/grouplist"
		, method : "get"
		, contentType : "application/json; charset=utf-8"
		, dataType : "json"
		, data : param
		, success : function(result) {
			console.log(result);
		}
	});
	$("#groupDetailModal").modal("show");
}


</script>

<%@ include file="groupdetailmodal.jsp"%>
<%@ include file="groupheader.jsp"%>
<%@ include file="groupsearch.jsp" %>

<!-- 여기서부터 실제 데이터 영역 -->
<section class="contents">
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
		
			<c:forEach items="${requestScope.groupList}" var="group">
			<!-- 카드 사진 위버전 -->
			<div class="col-lg-4 col-sm-6 portfolio-item groupcard" data-num="${group.groupNum}">
				<div class="card h-100">
					<img class="card-img-top"
						src="${group.groupImgSrc}"
						alt="">
					<h4 class="card-title">${group.groupName}</h4>
					<div class="card-body">
						<p class="card-text"><c:choose>
							<c:when test="${fn:length(group.groupDescription) > 100}">${fn:substring(group.groupDescription, 0, 100)}...</c:when>
							<c:otherwise>${group.groupDescription}</c:otherwise>
						</c:choose>
						</p>
						<p class="card-text">인원 : ${group.groupMemberCount}/${group.groupMemberLimit}</p>
						<p class="card-text">장소 : ${group.groupMainPlace}</p>
					</div>

					<div class="overlay">
						<div class="text">상세보기</div>
					</div>
				</div>
			</div>
			</c:forEach>
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
