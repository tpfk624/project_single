<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/commons/template/modern_business_top.jsp" %>

<%-- 리퀘스트 스코프 : ${requestScope.userInfo } --%>
<%-- 세션스코프 : ${sessionScope.userInfo } --%>
<script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
<link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />


<script>
$(document).ready(function(){
	//달력
	$('#datepicker').datepicker({
	    uiLibrary: 'bootstrap4',
   		onSelect: function(dateText) {
//    	console.log("Selected date: " + dateText + "; input's current value: " + this.value);
   	    }
	}).on("change", function() {
		//달력 눌를때 이벤트 콜백 위치
	});
	
	//회원가입
	$('#registBtn').click(function(){
		var value =$('#datepicker').val();
		value = $('#datepicker').val().replace('/','');
		value = value.replace('/','');
		console.log(value);
		$('#datepicker').val(value);
		$('#memberform').attr('action','${root}/member/register').submit();
	});
	
	//이메일인증버튼
	$('#emailAuthBtn').click(function() {
	 	$('.emailAuthForm').attr("action", "${root}/member/joinpost").submit();
	});
});

</script>


<style>
#memberform{
	margin: auto;
	width: 70%;
}
</style>


<form id="memberform" method="post" action="">
<%-- 소셜 유형:${userInfo.snsDto.snsType }<br> --%>
<%-- 소셜 시간:${userInfo.snsDto.snsConnectDate } --%>
	
 	<h1>회원가입</h1>
	    <p>안의 내용들을 채워주세요 *: 필수입력</p>
	    <hr>
		<input type="hidden" name="snsId" value="${userInfo.snsDto.snsId }">
		<input type="hidden" name="snsType" value="${userInfo.snsDto.snsType }">
		<input type="hidden" name="userId" value="${userInfo.snsDto.userId }">
		<input type="hidden" name="snsToken" value="${userInfo.snsDto.snsToken }">
		<input type="hidden" name="snsConnectDate" value="${userInfo.snsDto.snsConnectDate }">
		<div class="form-group" align="left">
		
		<label for="">아이디</label>* (이메일과 동일)
			<input type="text" class="form-control" id="id" name="userId" placeholder="4자이상 16자 이하" readonly="readonly" required="required" value= "${userInfo.userId}">
		</div>
		<div class="form-group" align="left">
			<label for="">비밀번호입력</label>* 
			<input style="font-family:돋움" type="password" class="form-control" id="userPassword" name="userPassword" placeholder=""  required="required">

		</div>
		
		<div class="form-group" align="left">
			<label for="">비밀번호재입력</label>* 
				<input style="font-family:돋움" type="password" class="form-control" id="passcheck" name="passcheck" placeholder=""  required="required">
		</div>
		
		<div class="form-group" align="left">
		<label for="name">이름</label>*
				<input type="text" class="form-control" id="name" name="userName" placeholder="이름입력" value= "${userInfo.userName}" required="required">
		</div>
		
		<div class="form-group" align="left">
		<label for="">닉네임</label>*
				<input type="text" class="form-control" id="nickname" name="userNickname" placeholder="이름입력" required="required">
		</div>
		
	<div class="form-group" align="left">
		<label for="tel">전화번호</label>
			<input type= "text" name ="userPhone" value= "${userInfo.userPhone }">

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
		    <input id="datepicker" name ="userBirthday" width="276" value= "${userInfo.userBirthday }">
    </div>
    
    <div class="form-group" align="left">
    <label for="">성별</label><br>
    	<input type="radio" name="userGender" value="M">남 
		<input type="radio" name="userGender" value="F">여
    </div>
    
    <div class="form-group" align="center">
<%-- 		<c:choose> --%>
<%-- 			<c:when test="${userInfo.userId != null}"> --%>
<!-- 				<button type="button" class="btn btn-primary" id="modifyBtn">정보변경</button> -->
<%-- 			</c:when> --%>
<%-- 			<c:when test="${userInfo.userId == null}"> --%>
				<button type="button" class="btn btn-primary" id="registBtn">회원가입</button>
				<button type="reset" class="btn btn-warning">초기화</button>
<%-- 			</c:when> --%>
<%-- 		</c:choose>			 --%>
	</div>
		
</form>


<%@ include file = "/WEB-INF/views/commons/template/modern_business_bottom.jsp" %>