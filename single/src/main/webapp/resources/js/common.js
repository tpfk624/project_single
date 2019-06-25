/**
 * 2019.06.25 일반적으로 사용되는 js 등록해둠
 */

$("div.dropdown .dropdown-item").click(dropdownItemClick);
function dropdownItemClick(){
	var text = $(this).text();
	var button = $(this).parent().siblings(".dropdown-toggle");
	var hidden = $(this).parent().siblings("input[type=hidden]");
	$(this).addClass("active");
	$(this).siblings().removeClass("active");
	
	button.text(text);
	hidden.val(text);
	
}