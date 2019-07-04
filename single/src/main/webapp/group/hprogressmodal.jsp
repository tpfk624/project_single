<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="hprogressModal" class="modal fade" role="dialog">
	<div class="modal-dialog modal-dialog-scrollable modal-lg">
		<div class="modal-content">
			<div class="modal-header text-center">
				<label style="margin-left: auto; margin-bottom:auto; margin-top:auto; font-size: 1.5rem">과제 진행등록</label>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">X</span>
				</button>
			</div>
			<div class="modal-body text-center">
				<section class="groupsection group-info">
					<label class="group-info-label col-sm-2">이름</label>
					<div class="group-info-content col-sm-10">
						<input type="text" class="form-control" placeholder="" value="안병욱" disabled="disabled">
					</div>
				</section>
				<section class="groupsection group-info">
					<label class="group-info-label col-sm-2">제목</label>
					<div class="group-info-content col-sm-10">
						<input type="text" class="form-control" placeholder="제목을 입력해주세요" disabled="disabled">
					</div>
				</section>
				<section class="groupsection group-info">
					<label class="group-info-label col-sm-2">내용</label>
					<div class="group-info-content col-sm-10">
						<textarea rows="10" cols="100" class="form-control" id="message"
							placeholder="내용을 입력해주세요" style="resize: none" disabled="disabled"></textarea>
					</div>
				</section>
				
				<section class="groupsection group-info">
					<label class="group-info-label col-sm-2">파일업로드</label>
					<div class="group-info-content col-sm-10">
						<div class="input-group-prepend fileupload">
							<input type="file" class="form-control file-hidden" id="ex_file"
								accept="" name="imgdata" style="display: none;"> 
							<input type="text" placeholder="파일을 등록해주세요" id="ex_file_input" class="form-control col-lg-4 col-md-4 col-sm-4"
								name="" readonly> 	
							<button type="button" class="file-cancel btn btn-secondary" style="margin-left: 0.5rem;">내려받기</button>
						</div>
					</div>
				</section>
			</div>
			<!-- Modal footer -->
	        <div class="modal-footer">
	        	<button type="button" class="btn btn-primary">등록</button>
	          	<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
	        </div>
		</div>
	</div>
</div>
<script>
$(".file-cancel").click(function() {
	$(".fileupload input[type=file]")[0].files[0].value = "";
	$(this).siblings("input[type=text]").val("");
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
	var filename = this.files[0].name;
						
	$(this).siblings("input[type=text]").val(filename);

}
</script>