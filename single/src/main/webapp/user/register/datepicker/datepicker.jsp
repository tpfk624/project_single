<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/commons/template/modern_business_top.jsp" %>
  
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- <script src="./jquery-ui-1.12.1/datepicker-ko.js"></script> -->




<!-- //해당 메소드에서 선택자로 지명한 id가 testDatepicker인 input 태그를 추가합니다. -->
<input type="text" id="testDatepicker">  
<script type='text/javascript'>

$(function() {
  $( "#testDatepicker" ).datepicker({
        showOn: "both", 
//         buttonImage: "button.png", 
        buttonImageOnly: true 
  });
});
</script>
<%@ include file = "/WEB-INF/views/commons/template/modern_business_bottom.jsp" %>





