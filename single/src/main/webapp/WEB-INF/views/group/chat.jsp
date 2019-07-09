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
//var nickName = "${user.nickname}";
//var serverUrl = "ws://192.168.14.53:80/plzdaengs/chatserver?groupid="+groupId;
var serverUrl = "wss://localhost:8443/single/chat/websocket?groupNum="+groupNum;
//?groupNum="+groupNum;
//var serverUrl = "${chatserver}" + "?groupid="+groupId;
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
	console.log("서버와 연결 : " + message.data);
};

function webSocketClose(message){
	console.log("서버와 연결 끊김 : " + message.data);
};

function webSocketError(message) {
	console.log("에러남 : " + message.data);
}

function webSocketMessage(message) {
	//console.log("메시지 옴 :" + message.data);
	//JSON으로 변환	
	//console.log(msgJSON.length);
	var msgJSON = JSON.parse(message.data);
	
	var length = msgJSON.length;
	if(msgJSON == null){
		return;
	}
	//console.log(length);
	if(length == null || length == 0){
		appendMsg(msgJSON);
		return;
	}
	for(var i = 0 ; i<msgJSON.length ; i++){
		appendMsg(msgJSON[i]);
	}
	
}
function appendMsg(msgJSON){
	var userid = msgJSON.user_id;
	var groupid = msgJSON.group_id;
	var nickname = msgJSON.nickname;
	var chatContents = msgJSON.chat_contents;
	var chatDate = msgJSON.chat_date;
	chatDate = chatDate.substr(11, 8);
	var result = "\n" + nickname + "(" + userid + ") " + chatDate + " : \n" + chatContents + "\n";
	//console.log(chatDate);
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
	var groupid = parseInt(groupId);
	var userid = userId;
	var nickname = nickName;
	var msg = makeMsg(type, userid, nickname, groupid, input);
	
	websocket.send(JSON.stringify(msg));
	var msgInput = $("#chat .msgInput");
	msgInput.val("");
}

function makeMsg(type, userid, nickname, groupid, text) {
	var nowdate = nowDate();
	//console.log(nowdate);
	var msg = {
		type : type
		, group_id : groupid
		, user_id : userid
		, nickname : nickname
		, chat_contents : text
		, chat_date : nowdate
	};
	return msg;
}

function nowDate(){
	var date = new Date();
	var year = date.getFullYear();
	var month = date.getMonth()+1;
	var day = date.getDay();
	var hour = date.getHours();
	var minute = date.getMinutes();
	var second = date.getSeconds();
	var miliSecond = date.getMilliseconds();
	
	//변환
	month = (month < 10 ? "0" + month : month);
	day = (day < 10 ? "0" + day : day);
	hour = (hour < 10 ? "0" + hour : hour);
	minute = (minute < 10 ? "0" + minute : minute);
	second = (second < 10 ? "0" + second : second);
	
	return year + "/" + month + "/" + day + " " + hour + ":" + minute + ":" + second + ":" + miliSecond;
	
}
</script>