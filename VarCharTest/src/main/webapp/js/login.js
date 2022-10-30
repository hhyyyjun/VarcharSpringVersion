const idBtn = document.getElementById("idInput"); // 아이디 입력
const pwBtn = document.getElementById("pwInput"); // 비밀번호 입력
const login = document.getElementById("loginBtn"); // 로그인 버튼

const blankMsg = document.getElementById("blank"); // 아이디 or 비밀번호가 공란일 때 msg
const shortMsg = document.getElementById("short"); // 비밀번호가 7자리 이하일 때 msg

// 유효한 비밀번호는 8자리 이상
const idTitle = document.getElementById("idTitle"); // 아이디 글자, 유효하지 않으면 red
const pwTitle = document.getElementById("pwTitle"); // 비밀번호 글자, 유효하지 않으면 red

function btnActive() {
  // 유효성 검사 --> 로그인 버튼 비/활성화
  // 아이디, 비밀번호가 공란 or 비밀번호가 8자리 이상인지
  if (!(idBtn.value && pwBtn.value && pwBtn.value.length > 7)) {
    // 유효하지 않으면
    login.disabled = true; // 로그인 버튼 비활성화
    login.style.backgroundColor = "#dee5ec"; // 로그인 버튼 비활성화 --> gray
    login.style.cursor = "no-drop"; // 커서 모양 변경
    login.style.color = "#ffffff";
    idTitle.style.color = "#eb5a46"; // 유효하지 않을 때 --> 글자, 밑줄 red
    pwTitle.style.color = "#eb5a46";
    idBtn.style.borderBottom = "2px solid #eb5a46";
    pwBtn.style.borderBottom = "2px solid #eb5a46";
    // 유효성 검사 msg는 1개만 보여주기
    if (!(idBtn.value && pwBtn.value)) {
      // 아이디 or 비밀번호 공란
      blankMsg.style.display = "block"; // 항목이 비어있다는 msg
      shortMsg.style.display = "none";
    } else if (pwBtn.value.length <= 7) {
      // 아이디와 비밀번호 모두 입력했지만, 비밀번호가 7자리 이하
      blankMsg.style.display = "none";
      shortMsg.style.display = "block"; // 비밀번호 길이 부족 msg
    }
  } else {
    // 아이디, 비밀번호 공란XX and 비밀번호 8자리 이상 and 이메일에 '@','.'  포함
    login.disabled = false; // 로그인 버튼 활성화
    login.style.backgroundColor = "#1089ff"; // 로그인버튼 활성화 --> blue
    login.style.cursor = "pointer"; // 커서 모양 포인터로 변경
    idTitle.style.color = "#1089ff"; // 유효할 때 --> 글자, 밑줄 blue
    pwTitle.style.color = "#1089ff";
    idBtn.style.borderBottom = "2px solid #1089ff";
    pwBtn.style.borderBottom = "2px solid #1089ff";
    // 유효성 검사 msg는 1개만 보여주기
    blankMsg.style.display = "none"; // 항목이 비어있는 msg --> hide
    shortMsg.style.display = "none"; // 비밀번호 길이 부족 msg --> hide
  }
}

function prepareInput() {
  idTitle.style.color = "#1089ff";
  pwTitle.style.color = "#1089ff";
  idBtn.style.borderBottom = "2px solid #1089ff";
  pwBtn.style.borderBottom = "2px solid #1089ff";
}

idBtn.addEventListener("keyup", btnActive);
idBtn.addEventListener("keyup", prepareInput);
pwBtn.addEventListener("keyup", btnActive);
pwBtn.addEventListener("keyup", prepareInput);