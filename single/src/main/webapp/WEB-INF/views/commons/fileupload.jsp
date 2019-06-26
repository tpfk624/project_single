<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.file-hidden {
	display: none;
}

.fileuploadimg {
	margin-left: 20px;
	min-width: 15rem;
	max-width: 15rem;
	min-height: 10rem;
	max-height: 10rem;
	padding: 0px;
}
</style>
<div class="control-group form-group">
	<label>대표이미지 : </label>
	<div class="input-group-prepend fileupload">
		<input type="file" class="form-control file-hidden" id="ex_file"
			accept="image/*" name="imgdata"> 
		<input type="text" placeholder="파일을 등록해주세요" id="ex_file_input" class="form-control col-lg-4 col-md-4 col-sm-4"
			name="userimg" readonly> 
		<img alt="" class="col-md-2 fileuploadimg"
			src="https://cdn.studysearch.co.kr/images/leader/357/4564-1560735145.png?v=1560735145">
	</div>
</div>
<script>
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