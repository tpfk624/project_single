<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/commons/template/modern_business_top.jsp" %>


<br>
<br>
<br>
아이디: ${userInfo.snsDto.userId} <br>
이름: ${userInfo.snsDto.snsName }<br>
닉네임: ${userInfo.snsDto.snsNickname}<br>
생일: ${userInfo.snsDto.snsBirthday }<br>
성별: ${userInfo.snsDto.snsGender }<br>

<br>
<br>
<br>
{
  "resultcode": "00",
  "message": "success",
  "response": {
    "email": "openapi@naver.com",
    "nickname": "OpenAPI",
    "profile_image": "https://ssl.pstatic.net/static/pwe/address/nodata_33x33.gif",
    "age": "40-49",
    "gender": "F",
    "id": "32742776",
    "name": "오픈 API",
    "birthday": "10-01"
  }
}


<br>
<br>
<br>


<%@ include file = "/WEB-INF/views/commons/template/modern_business_bottom.jsp" %>
   