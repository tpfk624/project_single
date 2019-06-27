<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/commons/template/modern_business_top.jsp" %>
<c:set var="user" value="$"/>


<br>
<br>
<br>
아이디: ${userProfile.id} <br>
이름: ${userProfile.name } <br>

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
   