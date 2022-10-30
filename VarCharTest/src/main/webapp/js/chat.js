const startChat = document.getElementById("startChat");

let webSocket
= new WebSocket("<%= application.getInitParameter('CHAT_ADDR') %>/ChatingServer");
let chatWindow, chatMessage, chatId;
// 채팅창이 열리면 대화창, 메시지 입력창, 대화명 표시란으로 사용할 DOM 객체 저장
window.onload = function() {
    chatWindow = document.getElementById("messages");
    chatMessage = document.getElementById("sender");
  //  chatId = document.getElementById('chatId').value;
    if(startChat.getAttribute("userId")) {
    	chatId = startChat.getAttribute("userId");     	
    }
    else {
    	chatId = "unknown";
    }
}
// 메시지 전송
function sendMessage() {
    // 대화창에 표시
    chatWindow.innerHTML += "<p class='chatText mychat'><span class='chatTextMsg'>" + chatMessage.value + "</span></p>"
    webSocket.send(chatId + '|' + chatMessage.value);  // 서버로 전송
    chatMessage.value = "";  // 메시지 입력창 내용 지우기
    chatWindow.scrollTop = chatWindow.scrollHeight;  // 대화창 스크롤
}
// 서버와의 연결 종료
function disconnect() {
    webSocket.close();
}
// 엔터 키 입력 처리
function enterKey() {
    if (window.event.keyCode == 13) {  // 13은 'Enter' 키의 코드값
        sendMessage();
    }
}
// 웹소켓 서버에 연결됐을 때 실행
webSocket.onopen = function(event) {   
  //  chatWindow.innerHTML += "웹소켓 서버에 연결되었습니다.<br/>";
  chatWindow.innerHTML += "상담을 시작합니다!<br/>";
};
// 웹소켓이 닫혔을 때(서버와의 연결이 끊겼을 때) 실행
webSocket.onclose = function(event) {
//    chatWindow.innerHTML += "웹소켓 서버가 종료되었습니다.<br/>";
    chatWindow.innerHTML += "상담이 종료되었습니다!<br/>";
};
// 에러 발생 시 실행
webSocket.onerror = function(event) { 
    alert(event.data);
//    chatWindow.innerHTML += "채팅 중 에러가 발생하였습니다.<br/>";
    chatWindow.innerHTML += "상담 중 에러가 발생하였습니다.<br/>";
}; 
// 메시지를 받았을 때 실행
webSocket.onmessage = function(event) { 
    let message = event.data.split("|");  // 대화명과 메시지 분리
    let sender = message[0];   // 보낸 사람의 대화명
    let content = message[1];  // 메시지 내용
    if (content != "") {
        if (content.match("/")) {  // 귓속말
            if (content.match(("/" + chatId))) {  // 나에게 보낸 메시지만 출력
                let temp = content.replace(("/" + chatId), "[귓속말] : ");
                chatWindow.innerHTML += "<p class='chatText whisperChat'><span class='chatTextMsg'>" + sender + "" + temp + "</span></p>";
            }
        }
        else {  // 일반 대화
            chatWindow.innerHTML += "<p class='chatText youchat'><span class='chatTextMsg'>" + sender + " : " + content + "</span></div>";
        }
    }
    chatWindow.scrollTop = chatWindow.scrollHeight; 
};