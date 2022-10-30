let timer;
let isRunning = false; // 타이머 작동 여부
const certificateCheckBtn = document.getElementById("certificateCheckBtn");
// 인증번호 발송하고 타이머 함수 실행
function sendAuthNum() {
  // 남은 시간(초) 아래에서 setting(leftSec)
  const leftSec = 5;
  display = document.querySelector("#timer");
  // 이미 타이머가 작동중이면 중지
  certificateCheckBtn.disabled = false;
  certificateCheckBtn.style.backgroundColor = "#01d28e";
  certificateCheckBtn.style.cursor = "pointer";
  // console.log("로그 : 시작  " + isRunning);
  if (isRunning) {
    // console.log("로그 : 다시 누르기 " + isRunning);
    clearInterval(timer);
  }
  startTimer(leftSec, display);
}

function startTimer(count, display) {
  isRunning = true;
  let minutes, seconds;
  timer = setInterval(function () {
    minutes = parseInt(count / 60, 10);
    seconds = parseInt(count % 60, 10);
    minutes = minutes < 10 ? "0" + minutes : minutes;
    seconds = seconds < 10 ? "0" + seconds : seconds;
    display.textContent = " (" + minutes + ":" + seconds + ")";
    // 타이머 끝
    if (--count < 0) {
      clearInterval(timer);
      display.textContent = "";
      isRunning = false;
      certificateCheckBtn.disabled = true;
      certificateCheckBtn.style.backgroundColor = "rgb(222, 229, 236)";
      certificateCheckBtn.style.cursor = "no-drop";
      // console.log("로그 : 종료  " + isRunning);
    }
  }, 1000);
}

// 인증번호 발송 버튼 (signup.js 에 선언)
// const certificateBtn = document.getElementById("phoneboxright");
certificateBtn.onclick = sendAuthNum;
