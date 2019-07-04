<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 사용법
1. 원하는 위치에 include
2. css 조절
3. 반드시 자신의 page loading부분에서 defaultSetting("기본이미지 경로"); 를 호출하고 사용할것
ex ) defaultSetting("${root}/resource/img/group/group_default.png"); 
4. 만약 수정페이지라면 디폴트 이미지는 기존의 이미지 경로가 될 것.
-- 수정페이지에서는 기존 이미지의 경로를 뿌려주는것이 맞을듯
5. defaultSetting 의 두번째 인자값을 통해 label 여부를 쓸수도 있고 안쓸수도 있다.
-- 2번째 인자값이 없으면 라벨을 살리고 "non-label"이라고 들어오면 라벨을 없앰
--%>
<style>
.file-hidden {
	display: none;
}

.fileuploadimg {
	margin-left: 20px;
	min-width: 15rem;
	max-width: 15rem;
	/*  min-height: 10rem; */
	max-height: 10rem;
	padding: 0px;
}
.file-cancel{
	margin-left: 0.5rem;
	height: fit-content;
}
</style>
<div class="control-group form-group">
	<label>대표이미지 : </label>
	<div class="input-group-prepend fileupload">
		<input type="file" class="form-control file-hidden" id="ex_file"
			accept="image/*" name="imgdata"> 
		<input type="text" placeholder="파일을 등록해주세요" id="ex_file_input" class="form-control col-lg-4 col-md-4 col-sm-4"
			name="userimg" readonly> 
		<button type="button" class="file-cancel btn btn-secondary">X</button>
		<img alt="" class="col-md-2 fileuploadimg"
			src="">
	</div>
</div>
<script>
var defaultImgSrc = "";
function defaultSetting(src, label){
	defaultImgSrc = src;
	//console.log(defaultImgSrc);
	$(".fileuploadimg").attr("src", defaultImgSrc);
	if(label != null || label == "non-label"){
		$(".fileupload").prev().remove();
	}
}
$(".file-cancel").click(function() {
	$(".fileupload input[type=file]")[0].files.value = "";
	$(this).siblings("input[type=text]").val("");
	$(this).siblings("img").attr("src" , defaultImgSrc);
});
$("#ex_file_input").click(fileInputClick);
function fileInputClick() {
	$("#ex_file").trigger("click");
}
$("#ex_file").change(fileChange);
fileDropDown();
function fileDropDown() {
	var fileInputText = $(".fileupload input[type=text]");
	var fileInput = $(".fileupload input[type=file]");

	//드래그 한채로 들어오기
	fileInputText.on("dragenter", function(e) {
		e.stopPropagation();
		e.preventDefault();
		fileInputText.css("border-color", "#c6d8ff");
		fileInputText.css("box-shadow",
				"0 0 0 0.2rem rgba(70, 128, 255, 0.25)");
	});

	//드래그 한채로 나가기
	fileInputText.on("dragleave", function(e) {
		e.stopPropagation();
		e.preventDefault();
		fileInputText.css("border-color", "#ced4da");
		fileInputText.css("box-shadow", "");
	});
	//??
	fileInputText.on('dragover', function(e) {
		e.stopPropagation();
		e.preventDefault();
		fileInputText.css("border-color", "#c6d8ff");
		fileInputText.css("box-shadow",
				"0 0 0 0.2rem rgba(70, 128, 255, 0.25)");
	});

	//드래그 객체 놓기
	fileInputText.on('drop', function(e) {
		e.preventDefault();
		fileInputText.css("border-color", "#ced4da");
		fileInputText.css("box-shadow", "");

		var files = e.originalEvent.dataTransfer.files;

		if (files != null) {
			if (files.length < 1) {
				showAlertModal("이미지 업로드 경고", "잘못된 파일입니다.");
				return;
			}
			fileInput[0].files = files;
			fileInput.trigger("change");
			
		} else {
			showAlertModal("이미지 업로드 경고", "프로필 등록을 실패하였습니다.");
		}
	});
}

function fileChange() {
	if(this.files[0] == null){
		return;
	}
	var filename = this.files[0].name;
	var imgtag = $(this).siblings("img");
						
	if (!this.files[0].type.startsWith("image/")) {
		this.files[0].value = "";
		showAlertModal("이미지 업로드 경고", "올릴수 없는 확장자입니다.");
		return;
	}
	
	var reader =new FileReader();
	reader.onload = function (e) {
		imgtag.prop("src", e.target.result);
	}
	reader.readAsDataURL(this.files[0]);
	$(this).siblings("input[type=text]").val(filename);

}
</script>