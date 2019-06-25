<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
#topBtn {
  display: none;
  position: fixed;
  bottom: 20px;
  right: 30px;
  z-index: 99;
  font-size: 18px;
  border: none;
  outline: none;
  background-color: #004085;
  color: white;
  cursor: pointer;
  padding: 15px;
  border-radius: 4px;
}

#topBtn:hover {
  background-color: #004085cc;
}
</style>
<button id="topBtn" title="Go to top">Top</button>
<script>
$(window).scroll(scrollFunction);
function scrollFunction() {
	if($("body").scrollTop() > 20 || $(document).scrollTop() > 20){
		$("#topBtn").css("display", "block");
	}else{
		$("#topBtn").css("display", "none");
	}
}
$("#topBtn").click(topBtnClick);
function topBtnClick(){
	$("body").scrollTop(0);
	$(document).scrollTop(0);
}
</script>