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
				<form action="post" enctype="multipart/form-data" id="hpModifyForm">
				<input type="hidden" value="${homework.groupNum}" name="groupNum">
				<input type="hidden" value="${homework.homeworkNum}" name="homeworkNum">
				<input type="hidden" value="modify" name="type">
				<section class="groupsection group-info">
					<label class="group-info-label col-sm-2">이름</label>
					<div class="group-info-content col-sm-10">
						<input type="text" name="userNickname" class="form-control" placeholder="" value="" disabled="disabled">
					</div>
				</section>
				<section class="groupsection group-info">
					<label class="group-info-label col-sm-2">제목</label>
					<div class="group-info-content col-sm-10">
						<input type="text" name="hprogressSubject" class="form-control" placeholder="제목을 입력해주세요">
					</div>
				</section>
				<section class="groupsection group-info">
					<label class="group-info-label col-sm-2">상태</label>
					<div class="group-info-content col-sm-10">
						<div class="dropdown col-lg-4 col-md-4 col-sm-4">
							<input type="hidden" name="hprogressSuccess" value="" >
							<button type="button" class="btn btn-primary dropdown-toggle"
								data-toggle="dropdown">진행상태</button>
							<div class="dropdown-menu">
								<a class="dropdown-item" role="P">진행중</a> 
								<a class="dropdown-item" role="S">완료</a>
							</div>
						</div>
					</div>
				</section>
				<section class="groupsection group-info">
					<label class="group-info-label col-sm-2">내용</label>
					<div class="group-info-content col-sm-10">
						<textarea rows="10" cols="100" class="form-control" name="hprogressContent" id="message"
							placeholder="내용을 입력해주세요" style="resize: none"></textarea>
					</div>
				</section>
				
				<section class="groupsection group-info">
					<label class="group-info-label col-sm-2">파일업로드</label>
					<div class="group-info-content col-sm-10">
						<div class="input-group-prepend fileupload">
							<input type="hidden" value="" name="fileurl">
							<input type="file" class="form-control file-hidden" id="ex_file"
								accept="" name="filedata" style="display: none;"> 
							<input type="text" placeholder="파일을 등록해주세요" id="ex_file_input" class="form-control col-lg-4 col-md-4 col-sm-4"
								name="hprogressFileOrigin" readonly> 	
							<button type="button" class="file-cancel btn btn-secondary" style="margin-left: 0.5rem;">등록취소</button>
							<a href="" id="fileurl" download=""><button type="button" class="btn btn-info" id="filedownload">내려받기</button></a>
						</div>
					</div>
				</section>
				</form>
			</div>
			<!-- Modal footer -->
	        <div class="modal-footer">
	        	<button type="button" class="btn btn-danger left">삭제</button>
	        	<button type="button" class="btn btn-primary right">수정</button>
	          	<button type="button" class="btn btn-secondary right" data-dismiss="modal">닫기</button>
	        </div>
		</div>
	</div>
</div>
<script>
//다운로드 버튼
/* $("#filedownload").on("click", function() {
	console.log($(this).siblings("input[name=fileurl]").val());
	window.open($(this).siblings("input[name=fileurl]").val(), "_blank");
}); */

//수정버튼
$("#hprogressModal .modal-footer .btn-primary").on("click", function() {
	if($("#hprogressModal input[name=hprogressSubject]").val() == ''){
		showAlertModal("필수값이 누락", "제목을 입력해주세요");

		$("#alert").on('hidden.bs.modal', function () {
			$("#hprogressModal input[name=hprogressSubject]").focus().get(0).scrollIntoView(true);
		});
		return false
	}
	
	if($("#hprogressModal textarea[name=hprogressContent]").val() == ''){
		showAlertModal("필수값이 누락", "내용을 입력해주세요");

		$("#alert").on('hidden.bs.modal', function () {
			$("#hprogressModal textarea[name=hprogressContent]").focus().get(0).scrollIntoView(true);
		});
		return false
	}
	
	var url = "${root}/homework/hprogress";
	var data = new FormData($("#hpModifyForm")[0]);
	var success = function(result) {
		if(result.resultCode == 1){
			showSuccessAlertModal("과제진행 수정 성공", result.resultData);
			$("#alertSuccess").off("hidden.bs.modal").on("hidden.bs.modal", function() {
				$("#hprogressModal").modal("hide").off("hidden.bs.modal").on("hidden.bs.modal", function() {
					homeworkdetail("${homework.groupNum}", "${homework.homeworkNum}");
				});
			});
		}else{
			showAlertModal("과제진행 수정 실패", result.resultData);
		}
	}
	
	ajaxFunc(data, url, "post", success)
});
//삭제버튼
$("#hprogressModal .modal-footer .btn-danger").on("click", function() {
	var url = "${root}/homework/hprogress";
	var data = {
		homeworkNum : "${homework.homeworkNum}"
		, userId : "${sessionScope.userInfo.userId}"
	}
	var success = function(result) {
		if(result.resultCode == 1){
			showSuccessAlertModal("과제진행 삭제 성공", result.resultData);
			$("#alertSuccess").off("hidden.bs.modal").on("hidden.bs.modal", function() {
				$("#hprogressModal").modal("hide").off("hidden.bs.modal").on("hidden.bs.modal", function() {
					homeworkdetail("${homework.groupNum}", "${homework.homeworkNum}");
				});
			});
		}else{
			showAlertModal("과제진행 삭제 실패", result.resultData);
		}
	}
	
	ajaxFunc(JSON.stringify(data), url, "delete", success)
});

$("#hpModifyForm .dropdown").on("show.bs.dropdown", function(){
	var height = $(this).css("height").substr(0, $(this).css("height").length-2);
	$(this).parent().parent().css("height", height * ($(this).find(".dropdown-item").length+2));
});
$("#hpModifyForm .dropdown").on("hide.bs.dropdown", function(){
	$(this).parent().parent().css("height", "");
});
$("#hpModifyForm .dropdown-item").click(dropdownItemClick);

$("#hprogressModal").off("hidden.bs.modal").on("hidden.bs.modal", function() {
	$("#hprogressModal .file-cancel").trigger("click");
	$(this).find("input[name=userNickname]").val("");
	$(this).find("input[name=hprogressSubject]").val("");
	$(this).find("input[name=hprogressSuccess]").val();
	$(this).find("textarea[name=hprogressContent]").val("");
	$(this).find("input[name=hprogressFile]").val("");
});

$("#hprogressModal .file-cancel").click(function() {
	$("#hprogressModal .fileupload input[type=file]")[0].files.value = "";
	$(this).siblings("input[type=text]").val("");
});
$("#hprogressModal #ex_file_input").click(fileInputClick);
function fileInputClick() {
	$("#hprogressModal #ex_file").trigger("click");
}
$("#hprogressModal #ex_file").change(fileChange);
fileDropDown();
function fileDropDown() {
	var fileInputText = $("#hprogressModal .fileupload input[type=text]");
	var fileInput = $("#hprogressModal .fileupload input[type=file]");

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
						
	$(this).siblings("input[type=text]").val(filename);

}
</script>