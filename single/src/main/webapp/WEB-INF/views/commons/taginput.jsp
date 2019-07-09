<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="taglist">
	<c:forEach var="hashtag" items="${group.hashtagList}">
	<tag>${hashtag}<input type="button" value="x"></tag></c:forEach>
</div>
<input type="hidden" name="groupHashtag" value="">
<input type="text" class="form-control input-tag" 
		id="text" placeholder="엔터키로 태그를 추가할 수 있습니다"
		value="" style="width: 20rem">
<script>
function makeTagList(){
	var taglist = $(".taglist>tag");
	var groupHashtag = "";
	$.each(taglist, function(index, item) {
		if($(item).text().charAt(0) != '#'){
			groupHashtag += "#"+$(item).text().trim() + " ";
		}else{
			groupHashtag += $(item).text().trim() + " ";
		}
		
	});
	$(".input-tag").siblings("input[type=hidden]").val(groupHashtag);
}
$("tag>input[type=button]").on("click", function(){
	$(this).parent().remove();
	return false;
});

$(".input-tag").on("keyup", function(e){
	if(e.keyCode == 13){
		var text = $(this).val();
		if(text != null && text.length != 0){
			var tag = $("<tag>" + $(this).val() + "<input type='button' value='x'></tag>");
			tag.find("input[type=button]").click(function () {
				$(this).parent().remove();
				return false;
			});
			$(this).siblings(".taglist").append(tag);
			$(this).val("");
		}
	}
	return false;
});
</script>