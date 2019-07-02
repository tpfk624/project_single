<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/commons/template/roadtrip_top.jsp" %>
    	 <!-- 일단 써두고 지울거 -->
    	 <script src="${root}/resources/template/roadtrip/assets/js/jquery.min.js"></script>
         <script src="${root}/resources/template/roadtrip/assets/js/jquery.scrolly.min.js"></script>
         <script src="${root}/resources/template/roadtrip/assets/js/jquery.scrollex.min.js"></script>
         <script src="${root}/resources/template/roadtrip/assets/js/skel.min.js"></script>
         <script src="${root}/resources/template/roadtrip/assets/js/util.js"></script>
         <script src="${root}/resources/template/roadtrip/assets/js/main.js"></script>
<script>
$(document).ready(function() {
	$('#btn').on("click", function(){
		var form = {
				stationName : $('#stationName').val(),
				dataTerm : $('#dataTerm').val()
		};
		alert("읭!!!!!!");
		$.ajax({
			url : "${root}/home/dusttest.do",
			type : "GET",
			data : encodeURI(JSON.stringify(form))	,
			contentType:"application/json; charset=UTF-8;",
			dataType : "json",
			success : function(data){
				console.log(data.response.body.items);
			},
			error: function(){
				console.log(form);
				alert("에러났어요!!!!!!");
			}
		});
	});
});
</script>

<body>
	<form>
		<input id="stationName" name="stationName" value="구로구">
		<input id="dataTerm" name="dataTerm" value="DAILY">
		<button id="btn">어디한번해볼까나</button>
	</form>
	

</body>
</html>