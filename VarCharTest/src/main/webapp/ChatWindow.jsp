<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>채팅창</title>
    <link rel="stylesheet" href="css/chat.css">
</head>
<body>
    <div id="wrapper">
        <div id="wrapperTop">
    
            <div id="varchar"><a href="main.do" target="_blank">Var<span>char</span></a></div>
            <div id="TopCenter">상담</div>
          
            <div id="finish"><button class="buttonStyle buttons" type="button" id="endChatBtn" onclick="disconnect();">종료하기</button></div>
        </div>
        <div id="messagesWrap">
            <div id="messages"> 
            </div>
        </div>
        <div id="wrapperBottom">
      
            <input type="text" id="sender" placeholder="VarChar에게 물어보세요!" onkeyup="enterKey();">
          
            <button class="buttons buttonStyle" type="button" onclick="sendMessage();">전송</button>
        </div>
    </div>

    <script>
    let webSocket
    = new WebSocket("<%= application.getInitParameter("CHAT_ADDR") %>/ChatingServer");
    let chatWindow, chatMessage, chatId; // 채팅창이 열리면 대화창, 메시지, 대화명으로 사용할 변수를 선언
    const messagesWrap = document.getElementById("messagesWrap"); // document.getElementById는 id요소에 접근하는 함수
    // 채팅창이 열리면 대화창, 메시지 입력창, 대화명 표시란으로 사용할 DOM 객체 저장
    window.onload = function() {
        chatWindow = document.getElementById("messages"); // 메시지 저장
        chatMessage = document.getElementById("sender"); // 보낸 사람의 대화명 저장
        /*chatId = document.getElementById('chatId').value;*/
        if(${userId != null}) { // 세션에 저장되있는 사용자의 속성 값이 null이 아닌경우. 즉, 정상적으로 로그인이 되었다면
        	chatId = "${userId}"; // 로그인한 사용자의 PK값 mid를 저장한다.
        }
        else { // 로그인 실패했다면
        	chatId = "unknown";
        }
    }
    // 메시지 전송
    function sendMessage() {
        // 대화창에 표시
        chatWindow.innerHTML += "<p class='chatText mychat'><span class='chatTextMsg'>" + chatMessage.value + "</span></p>"
        webSocket.send(chatId + '|' + chatMessage.value);  // '대화명|메시지' 형태로 가공 후 서버로 전송
        chatMessage.value = "";  // 메시지를 전송한 후 입력창 비우기
    /*chatWindow.scrollTop = chatWindow.scrollHeight;*/
		messagesWrap.scrollTop = messagesWrap.scrollHeight; // 스크롤바는 항상 아래로 위치
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
//        chatWindow.innerHTML += "웹소켓 서버가 종료되었습니다.<br/>";
        chatWindow.innerHTML += "상담이 종료되었습니다!<br/>";
    };
    // 에러 발생 시 실행
    webSocket.onerror = function(event) { 
        alert(event.data);
//        chatWindow.innerHTML += "채팅 중 에러가 발생하였습니다.<br/>";
        chatWindow.innerHTML += "상담 중 에러가 발생하였습니다.<br/>";
    }; 
    // 메시지를 받았을 때 실행
    webSocket.onmessage = function(event) { 
        let message = event.data.split("|");  // 대화명과 메시지 분리
        let sender = message[0];   // 보낸 사람의 대화명
        let content = message[1];  // 메시지 내용
        if (content != "") {
            if (content.match("/")) {  // 귓속말 / match함수는 동일한 단어를 문자열에서 찾는 함수
                if (content.match(("/" + chatId))) {  // 나에게 보낸 메시지만 출력
                   // let temp = content.replace(("/" + chatId), "[귓속말] : ");
                    let temp = content.replace(("/" + chatId), "");
                    chatWindow.innerHTML += "<p class='whoSends'><span>" + sender + "[귓속말]</span></p>";
                    chatWindow.innerHTML += "<p class='chatText'><span class='chatTextMsg whisperChat'>" + temp + "</span></p>";
                }	
            }
            else {  // 일반 대화
                chatWindow.innerHTML += "<p class='whoSends'><span>" + sender + "</span></p>";
                chatWindow.innerHTML += "<p class='chatText youchat'><span class='chatTextMsg'>" + content + "</span></div>";
            }
        }
//        chatWindow.scrollTop = chatWindow.scrollHeight; 
			 messagesWrap.scrollTop = messagesWrap.scrollHeight; 	
    };
    document.getElementById("endChatBtn").onclick = () => {
    	disconnect();
    	setTimeout(() => {
    		window.close();    		
    	}, 1000);
    }
</script>
</body>

</html>