<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include
	file="/WEB-INF/views/commons/template/modern_business_top.jsp"%>
<link rel="stylesheet" href="${root}/resources/css/group/group.css">
<%@ include file="/WEB-INF/views/commons/movetop.jsp"%>

<section class="contents">
	<div class="container">
		<h1 class="col-lg-8 my-4">모임 만들기</h1>
		<!-- Marketing Icons Section -->
		<div class="row">
			<!-- Contact Form -->
			<div class="col-lg-8 mb-4">
				<form name="sentMessage" id="contactForm" novalidate>
					<div class="control-group form-group">
						<div class="controls">
							<label>모임명 : </label> <input type="text" class="form-control"
								id="name" required
								data-validation-required-message="Please enter your name.">
							<p class="help-block"></p>
						</div>
					</div>
					<div class="control-group form-group">
						<div class="controls">
							<label>모임 태그 : </label> <input type="tel"
								class="form-control" id="phone" required
								data-validation-required-message="Please enter your phone number.">
						</div>
					</div>
					<div class="control-group form-group">
						<div class="controls">
							<label>인원 :</label> <input type="email"
								class="form-control" id="email" required
								data-validation-required-message="Please enter your email address.">
						</div>
					</div>
					<div class="control-group form-group">
						<div class="controls">
							<label>모임설명 :</label>
							<textarea rows="10" cols="100" class="form-control" id="message"
								required
								data-validation-required-message="Please enter your message"
								maxlength="999" style="resize: none"></textarea>
						</div>
					</div>
					<div id="success"></div>
					<!-- For success/fail messages -->
					<button type="submit" class="btn btn-primary"
						id="sendMessageButton">Send Message</button>
				</form>
			</div>
		</div>
	</div>
</section>

<!-- /.container -->

<%@ include
	file="/WEB-INF/views/commons/template/modern_business_bottom.jsp"%>
