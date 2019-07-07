/**
 * 2019.06.25 일반적으로 사용되는 js 등록해둠
 */

//dropdown 관련 기능
//이벤트 등록
$("div.dropdown .dropdown-item").click(dropdownItemClick);
//hidden :  dropdown 부분을 form 으로 날릴때 사용할 부분
//만약 dropdown-item 에 role 에 자신의 code 값을 넣어두면 그것을 사용함
//해당 부분이 없으면 아무 일 없음
function dropdownItemClick(){
	var text = $(this).text();
	var button = $(this).parent().siblings(".dropdown-toggle");
	var hidden = $(this).parent().siblings("input[type=hidden]");
	$(this).addClass("active");
	$(this).siblings().removeClass("active");
	
	if(hidden != null){
		var role = $(this).attr("role");
		if(role == null || role.length == 0){
			hidden.val(text);
		}else{
			hidden.val(role);
		}
	}
	button.text(text);
	
	//$(this).parent().removeClass("show");
	$(this).parent().trigger("click");
	return false;
}