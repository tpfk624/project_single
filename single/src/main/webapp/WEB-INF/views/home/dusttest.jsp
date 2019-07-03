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
				'stationName' : $('#stationName').val(),
				'dataTerm' : $('#dataTerm').val()
		};
		//alert("읭!!!!!!");
		$.ajax({
			url : "${root}/home/dusttest.do",
			type : "POST",
			data : JSON.stringify(form)	,
			contentType:"application/json; charset=UTF-8;",
			dataType : "json",
			success : function(data){
				var list = data.list;
				var dt = list[0].pm25Grade;
				//console.log(list[0].dataTime);
				$("#here").html(list[0].dataTime);
				if(dt == 2){
					$("#here1").html(list[0].pm25Grade + "날씨가 좋아요!");
				}else{
					$("#here1").html(list[0].pm25Grade + "그렇지 않아요!");
					
				}
				for(var i=0 ; i<list.length ; i++){
					list[i].pm25Grade;
					//console.log("옹?? >> " + list[i].pm25Grade);
				}
			},
			error: function(){
				//console.log(form);
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
		<button type="button" id="btn">어디한번해볼까나</button>
	</form>

	<div id="here"></div>
	<div id="here1"></div>

</body>
</html>