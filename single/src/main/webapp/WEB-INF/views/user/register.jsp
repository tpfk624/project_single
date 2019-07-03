<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/commons/template/modern_business_top.jsp" %>


<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
<link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />

<script>
$(document).ready(function(){
	$('#datepicker').datepicker({
	    uiLibrary: 'bootstrap4'
	});
	$('#registerBtn').click(function(){
		$('#memberform').attr('action','${root}/user/register').submit();
	});

});
 
</script>


<style>
#memberform{
	margin: auto;
	width: 70%;
}
</style>



<br/>
<form id="memberform" method="post" action="">
<%-- 소셜 유형:${userInfo.snsDto.snsType }<br> --%>
<%-- 소셜 시간:${userInfo.snsDto.snsConnectDate } --%>
 	<h1>회원가입</h1>
	    <p>안의 내용들을 채워주세요</p>
	    <hr>
		<input type="hidden" name="act" value="register">
		<div class="form-group" align="left">
		<label for="">아이디</label>* 특수문자가 들어가면 안됩니다 (소셜로그인 아이디와 충돌가능성 있기 때문)
			<c:if test="${empty userInfo.userId }">
					<input type="text" class="form-control" id="id" name="userId" placeholder="4자이상 16자 이하" >
					<div id="idresult"></div>
			</c:if>
			<c:if test="${userInfo.userId != null}">
					<input type="text" class="form-control" id="id" name="userId" placeholder="4자이상 16자 이하" readonly="readonly"
					value= "${userInfo.userId}">
			</c:if>	
		</div>
		
		<div class="form-group" align="left">
		<label for="name">이름</label>*
			<c:if test="${userInfo.userId == null}">
				<input type="text" class="form-control" id="name" name="userName" placeholder="이름입력" >
			</c:if>
			<c:if test="${userInfo.userId != null}">
				<input type="text" class="form-control" id="name" name="userName" placeholder="이름입력" value= "${userInfo.userName}">
			</c:if>
		
		</div>
		

		
		<div class="form-group" align="left">
		<label for="">닉네임</label>*
			<c:if test="${userInfo.userId == null}">
				<input type="text" class="form-control" id="nickname" name="userNickname" placeholder="이름입력">
			</c:if>
			<c:if test="${userInfo.userId != null}">
				<input type="text" class="form-control" id="nickname" name="userNickname" placeholder="이름입력" value ="${userInfo.userNickname}">
			</c:if>
		</div>
<!-- 		<div class="form-group" align="left"> -->
<!-- 			<label for="">비밀번호입력</label>  -->
<%-- 			<c:if test="${userInfo.userId == null}"> --%>
<!-- 				<input type="password" class="form-control" id="pass" name="passcheck" placeholder=""> -->
<%-- 			</c:if> --%>
<%-- 			<c:if test="${userInfo.userId != null}"> --%>
<%-- 				<input type="password" class="form-control" id="pass" name="passcheck" placeholder="" value ="${userInfo.userPassword }"> --%>
<%-- 			</c:if> --%>
<!-- 		</div> -->
		
<!-- 		<div class="form-group" align="left"> -->
<!-- 			<label for="">비밀번호재입력</label>  -->
<%-- 			<c:if test="${userInfo.userId == null}"> --%>
<!-- 				<input type="password" class="form-control" id="passcheck" name="passcheck" placeholder=""> -->
<%-- 			</c:if> --%>
<%-- 			<c:if test="${userInfo.userId != null}"> --%>
<%-- 				<input type="password" class="form-control" id="passcheck" name="passcheck" placeholder="" value ="${userInfo.userPassword }"> --%>
<%-- 			</c:if> --%>
<!-- 		</div> -->
		
<!-- 	<div class="form-group" align="left"> -->
<!-- 		<label for="email">이메일</label><br> -->
<!-- 		<div id="email" class="custom-control-inline"> -->
<!-- 			<input type="text" class="form-control" id="emailid" -->
<!-- 				name="emailid" placeholder="" size="25"> -->
<!-- 				 @ <select -->
<!-- 				class="form-control" id="emaildomain" name="emaildomain"> -->
<!-- 				<option value="naver.com">naver.com</option> -->
<!-- 				<option value="google.com">google.com</option> -->
<!-- 				<option value="daum.net">daum.net</option> -->
<!-- 				<option value="nate.com">nate.com</option> -->
<!-- 				<option value="hanmail.net">hanmail.net</option> -->
<!-- 			</select> -->
<!-- 		</div> -->
<!-- 	</div> -->
	<div class="form-group" align="left">
		<label for="tel">전화번호</label>
		<div id="tel" class="custom-control-inline">
		<c:if test="${userInfo.userId != null}">
			<input type= "text" name ="userPhone" value= "${userInfo.userPhone }">
		</c:if>
		<c:if test="${userInfo.userId == null}">
			<input type= "text" name ="userPhone" >
		</c:if>
			
<!-- 			<select class="form-control" id="tel1" name="tel1"> -->
<!-- 				<option value="010">010</option> -->
<!-- 				<option value="02">02</option> -->
<!-- 				<option value="031">031</option> -->
<!-- 				<option value="032">032</option> -->
<!-- 				<option value="041">041</option> -->
<!-- 				<option value="051">051</option> -->
<!-- 				<option value="061">061</option> -->
<!-- 			</select> _ <input type="text" class="form-control" id="tel2" name="tel2" -->
<!-- 				placeholder="1234"> _ <input type="text" -->
<!-- 				class="form-control" id="tel3" name="tel3" placeholder="5678"> -->
		</div>
	</div>
	<div class="form-group" align="left">
		<label for="">주소</label><br>
		<div id="addressdiv" class="custom-control-inline">
			<input type="text" class="form-control" id="zipcode"
				name="userZipcode" placeholder="우편번호" size="7" maxlength="5"
				readonly="readonly">
		</div>
		<input type="text" class="form-control" id="userAddress" name="userAddress"
			placeholder="" readonly="readonly"> <input type="text"
			class="form-control" id="userAddressDetail" name="userAddressDetail"
			placeholder="" readonly="readonly">
	</div>
    
    <div class="form-group" align="left">
    	<label for="">생일</label><br>
    	<c:if test="${userInfo.userId != null}">
		    <input id="datepicker" name ="userBirthday" width="276" />
    	</c:if >
    	<c:if  test="${userInfo.userId == null}">
		    <input id="datepicker" name= "userBirthday" width="276" />
    	</c:if >
    </div>
    
    <div class="form-group" align="left">
    <label for="">성별</label><br>
    	<c:if  test="${userInfo.userId != null}">
    		<input type="radio" name="userGender" value="M">남 
			<input type="radio" name="userGender" value="F">여
    	</c:if >
    	<c:if  test="${userInfo.userId == null}">
    		<input type="radio" name="userGender" value="M">남 
			<input type="radio" name="userGender" value="F">여
    	</c:if >
    </div>
    
    <div class="form-group" align="center">
		<c:choose>
			<c:when test="${userInfo.userId != null}">
				<button type="button" class="btn btn-primary" id="modifyBtn">정보변경</button>
			</c:when>
			<c:when test="${userInfo.userId == null}">
				<button type="button" class="btn btn-primary" id="registerBtn">회원가입</button>
				<button type="reset" class="btn btn-warning">초기화</button>
			</c:when>
		</c:choose>			
	</div>
	
</form>


<%@ include file = "/WEB-INF/views/commons/template/modern_business_bottom.jsp" %>