<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
/* Pagination links */
.page{
	padding-bottom: 1rem;
	padding-top: 1rem;
}
.pagination{
	margin-left: auto;
	margin-right: auto;
	display: block; 
}

.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  transition: background-color .3s;
  cursor: pointer;
}

/* Style the active/current link */
.pagination a.active {
  background-color: dodgerblue;
  color: white;
}

/* Add a grey background color on mouse-over */
.pagination a:hover:not(.active) {background-color: #ddd;}
</style>
<section class="row page">
	<div class="pagination">
		  <c:if test="${pagination.nowFirst}">
		  <a>&laquo;</a>
		  </c:if>
		  <c:if test="${!pagination.nowFirst}">
		  <a class="page-pre">&laquo;</a>
		  </c:if>
		  <c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" step="1" varStatus="stat">
		  <c:if test="${pagination.currentPage == stat.current}">
		  <a class="page-move active">${stat.current}</a>
		  </c:if>
		  <c:if test="${pagination.currentPage != stat.current}">
		  <a class="page-move">${stat.current}</a>
		  </c:if>
		  </c:forEach>
		  <c:if test="${pagination.nowEnd}">
		  <a>&raquo;</a>
		  </c:if>
		  <c:if test="${!pagination.nowEnd}">
		  <a class="page-next">&raquo;</a>
		  </c:if>
	</div>
</section>
<script>
function clickFunctionSetting(func){
	$(".page>.pagination>.page-move").click(function() {
		func($(this).text());
	});
	
	$(".page>.pagination>.page-pre").click(function () {
		func("${pagination.startPage - 1}");
	}); 
	
	$(".page>.pagination>.page-next").click(function () {
		func("${pagination.endPage +1}");
	});
}

</script>