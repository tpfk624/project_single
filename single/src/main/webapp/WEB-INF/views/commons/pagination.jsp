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
		  <a href="#">&laquo;</a>
		  <a class="active" href="#">1</a>
		  <a href="#">2</a>
		  <a href="#">3</a>
		  <a href="#">4</a>
		  <a href="#">5</a>
		  <a href="#">6</a>
		  <a href="#">&raquo;</a>
	</div>
</section>
<script>
$(".page>.pagination>a").click(function() {
	$(this).addClass("active");
	$(this).siblings().removeClass("active");
});
</script>