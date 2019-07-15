<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="chat" class="chat">
	<div class="chatheader">
		<a class="text-gray-500 mr-4 mr-lg-5 lead chat-toggle">
			<i class="fas fa-align-left" id="togglechat"></i>
		</a>
		<label>채팅창</label>
	</div>
	<textarea class="chatMsgArea form-control" readonly="readonly"></textarea>
	<div class="chatfooter">
		<input class="form-control msgInput" type="text" placeholder="입력해주세요">
		<button class="btn btn-info sendBtn">전송</button>
	</div>
</div>
<script type="text/javascript">
var groupNum = "${group.groupNum}";
var userId = "${groupMember.userId}";
var serverIP = "${serverIP}";
var serverUrl = serverIP + "${root}" + "/chat/websocket?groupNum=" + groupNum;
var websocket; 
chatInit();
function chatInit() {
	websocket = new WebSocket(serverUrl);
	websocket.onopen = webSocketOpen;
	websocket.onclose = webSocketClose;
	websocket.onerror = webSocketError;
	websocket.onmessage = webSocketMessage;
	
	$("#chat .sendBtn").click(msgSend);
	$("#chat #togglechat").click(chatToggle);
	$("#chat .msgInput").keyup(msgInputKeyUp);
	
	//content영역 조절
	$(".contents").css("margin-right", "17rem");
}
function msgInputKeyUp(e){
	if(e.keyCode == 13){
		$("#chat .sendBtn").trigger("click");
		var msgInput = $("#chat .msgInput");
		msgInput.val("");
	}
}
function chatToggle(){
	var chat = $("#chat");
	var chatClass = chat.attr("class");
	if(chatClass == "chat"){
		chat.attr("class", "chatSmall");
		$(".contents").css("margin-right", "3rem");
	}else{
		chat.attr("class", "chat");
		$(".contents").css("margin-right", "17rem");
	}
	return false;
}

function webSocketOpen(message){
	//console.log("서버와 연결 : " + message.data);
};

function webSocketClose(message){
	//console.log("서버와 연결 끊김 : " + message.data);
};

function webSocketError(message) {
	//console.log("에러남 : " + message.data);
}

function webSocketMessage(message) {
	//console.log("메시지 옴 :" + message.data);
	var msg = JSON.parse(message.data);
	if(msg.resultCode == 1){
		appendMsg(msg.resultData);
	}else if(msg.resultCode == 2){
		appendMsgList(msg.resultData);
	}	
}

function appendMsgList(chatDtoList){
	for(var i=0 ; i<chatDtoList.length ; i++){
		appendMsg(chatDtoList[i]);
	}
}

function appendMsg(chatDto){
	var result = "\n" + chatDto.userNickname + " " + chatDto.chatTime + " : \n" + chatDto.chatContent + "\n";
	
	var chatTextArea = $("#chat .chatMsgArea");
	chatTextArea.append(result);
	chatTextArea.scrollTop(chatTextArea.prop("scrollHeight"));
	
}

function msgSend(){
	var input = $(".chat .msgInput").val();
	
	if(input == null || input.length == 0){
		//alert("입력해주세요.");
		return;
	}
	
	//JSON 형태로 변형
	var type = "message";
	var msg = makeMsg(type, groupNum, input);
	
	websocket.send(JSON.stringify(msg));
	var msgInput = $("#chat .msgInput");
	msgInput.val("");
}

function makeMsg(type, groupNum, text) {
	//console.log(nowdate);
	var msg = {
		"type" : type
		, "groupNum" : groupNum
		, "chatContent" : text
	};
	return msg;
}

</script>