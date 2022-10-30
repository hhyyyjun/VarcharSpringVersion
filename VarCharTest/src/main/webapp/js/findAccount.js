// 변수 선언 ----------------------------------------------------

// 상단 아이디 / 비밀번호 찾기 메뉴
const searchId = document.getElementById("searchId");
const searchPassword = document.getElementById("searchPassword");

// 아이디 / 비밀번호 찾기에 맞는 화면 보여주기
const idBox = document.getElementById("idBox");
const passwordBox = document.getElementById("passwordBox");

// 아이디 찾기 input / label / 이메일 발송 버튼
const nameBtn = document.getElementById("nameInput");
const emailBtnForId = document.getElementById("emailInputForId");
const idSearchBtn = document.getElementById("idSearchBtn");
const certificateBtnForId = document.getElementById("certificateBtnForId");

const nameTitle = document.getElementById("nameTitle");
const idTitle = document.getElementById("idTitle");
const emailTitleForId = document.getElementById("emailTitleForId");
const emailTitleForPw = document.getElementById("emailTitleForPw");

// 비밀번호 찾기 input / label / 이메일 발송 버튼
const idBtn = document.getElementById("idInput");
const emailBtnForPw = document.getElementById("emailInputForPw");
const pwSearchBtn = document.getElementById("passwordSearchBtn");
const certificateBtnForPw = document.getElementById("certificateBtnForPw");

// 유효성 검사 msg
const blankMsg = document.getElementById("blank"); // 이메일 or 휴대폰 번호 or 이름이 공란일 때 msg
const missingMsg1 = document.getElementById("missing1"); // 이메일에 @가 누락된 경우 msg
const missingMsg2 = document.getElementById("missing2"); // 이메일에 .이 누락된 경우 msg
const wrongIdMsg = document.getElementById("onlyId"); // 휴대폰 번호에 숫자 외 입력한 경우 msg
const wrongNameMsg = document.getElementById("onlyName"); // 이름에 글자 외 문자가 포함된 경우 msg

// 아이디 / 비밀번호 찾기 메뉴 바 클릭--------------------

// 인자 (클릭한 메뉴, 클릭 안한 메뉴, 보여줄 화면, 숨길 화면)
function showBox(activeBtn, disableBtn, activeBox, disableBox) {
  activeBtn.addEventListener("click", () => {
    //선택한 버튼 --> black, border : yellow
    activeBtn.style.border = "2px solid #01d28e";
    activeBtn.style.borderBottom = "#ffffff";
    activeBtn.style.color = "#222";
    activeBox.style.display = "block";
    // 선택하지 않은 버튼 --> gray, border : white
    disableBtn.style.border = "2px solid #ffffff";
    disableBtn.style.color = "#bec8d2";
    disableBox.style.display = "none";
    // 유효성 검사 msg 초기화(hide)
    blankMsg.style.display = "none";
    missingMsg1.style.display = "none";
    missingMsg2.style.display = "none";
    wrongIdMsg.style.display = "none";
    wrongNameMsg.style.display = "none";
  });
}

showBox(searchId, searchPassword, idBox, passwordBox);
showBox(searchPassword, searchId, passwordBox, idBox);

// 유효성 검사 ----------------------------------------------

// 아이디 찾기 유효성 검사--------------------------------------
function btnActive1() {
  // 유효성 검사 --> 확인 버튼 비/활성화
  // 이름, 이메일 입력 공란 & 이름 영문, 한글 여부 & 이메일 '@', '.' 포함 여부
  if (
    !(
      nameBtn.value &&
      emailBtnForId.value &&
      nameBtn.value.search(/[^a-zA-Z가-힣]/g) === -1 &&
      emailBtnForId.value.search("@") !== -1 &&
      emailBtnForId.value.search(/[.]/g) !== -1
    )
  ) {
    // 유효하지 않으면
    certificateBtnForId.disabled = true; // 확인 버튼 비활성화
    certificateBtnForId.style.backgroundColor = "#dee5ec"; // 확인 버튼 비활성화 --> gray
    certificateBtnForId.style.cursor = "no-drop"; // 커서 모양 변경
    certificateBtnForId.style.color = "#ffffff";

    nameTitle.style.color = "#eb5a46"; // 유효하지 않을 때 --> 글자, 밑줄 red
    emailTitleForId.style.color = "#eb5a46";
    nameBtn.style.borderBottom = "2px solid #eb5a46";
    emailBtnForId.style.borderBottom = "2px solid #eb5a46";

    // 유효성 검사 msg는 1개만 보여주기
    // console.log("함수 시작");
    if (!(nameBtn.value && emailBtnForId.value)) {
      // 이름 or 이메일 공란
      // console.log("공란");
      blankMsg.style.display = "block"; // 항목이 비어있다는 msg
      wrongNameMsg.style.display = "none";
      missingMsg1.style.display = "none";
      missingMsg2.style.display = "none";
    } else if (nameBtn.value.search(/[^a-zA-Z가-힣]/g) !== -1) {
      // console.log("이름 검사");
      blankMsg.style.display = "none";
      wrongNameMsg.style.display = "block"; // 이름에 글자 외 문자 포함 msg
      missingMsg1.style.display = "none";
      missingMsg2.style.display = "none";
    } else if (emailBtnForId.value.search("@") === -1) {
      // 이메일에 @누락
      // console.log("이메일 검사1");
      blankMsg.style.display = "none";
      wrongNameMsg.style.display = "none";
      missingMsg1.style.display = "block"; // 이메일 @ 누락 msg
      missingMsg2.style.display = "none";
    } else if (emailBtnForId.value.search(/[.]/g) === -1) {
      // 이메일에 .누락
      // console.log("이메일 검사2");
      blankMsg.style.display = "none";
      wrongNameMsg.style.display = "none";
      missingMsg1.style.display = "none";
      missingMsg2.style.display = "block"; // 이메일 . 누락 msg
    }
  } else {
    // 유효성 검사 통과
    certificateBtnForId.disabled = false; // 확인 버튼 활성화
    certificateBtnForId.style.backgroundColor = "#1089ff"; // 확인 버튼 활성화 --> blue
    certificateBtnForId.style.cursor = "pointer"; // 커서 모양 포인터로 변경
    certificateBtnForId.style.color = "#fff";
    nameTitle.style.color = "#01d28e"; // 유효할 때 --> 글자, 밑줄 green
    emailTitleForId.style.color = "#01d28e";
    nameBtn.style.borderBottom = "2px solid #01d28e";
    emailBtnForId.style.borderBottom = "2px solid #01d28e";
    // 유효성 검사 msg --> hide
    blankMsg.style.display = "none";
    wrongNameMsg.style.display = "none";
    missingMsg1.style.display = "none";
    missingMsg2.style.display = "none";
  }
}

// 비밀번호 찾기 유효성 검사----------------------------------
function btnActive2() {
  // 유효성 검사 --> 확인 버튼 비/활성화
  // 아이디, 이메일 공란 && 이메일 @, . 포함 여부
  if (
    !(
      idBtn.value &&
      emailBtnForPw.value &&
      emailBtnForPw.value.search("@") !== -1 &&
      emailBtnForPw.value.search(/[.]/g) !== -1
    )
  ) {
    // 유효하지 않으면
    certificateBtnForPw.disabled = true; // 확인 버튼 비활성화
    certificateBtnForPw.style.backgroundColor = "#dee5ec"; // 확인 버튼 비활성화 --> gray
    certificateBtnForPw.style.cursor = "no-drop"; // 커서 모양 변경
    certificateBtnForPw.style.color = "#ffffff";
    idTitle.style.color = "#eb5a46";
    emailTitleForPw.style.color = "#eb5a46"; // 유효하지 않을 때 --> 글자, 밑줄 red
    idBtn.style.borderBottom = "2px solid #eb5a46";
    emailBtnForPw.style.borderBottom = "2px solid #eb5a46";

    // 유효성 검사 msg는 1개만 보여주기
    if (!(idBtn.value && emailBtnForPw.value)) {
      // 아이디 or 이메일 공란
      blankMsg.style.display = "block"; // 항목이 비어있다는 msg
      wrongIdMsg.style.display = "none";
      missingMsg1.style.display = "none";
      missingMsg2.style.display = "none";
    } else if (emailBtnForPw.value.search("@") === -1) {
      // 이메일에 @누락
      blankMsg.style.display = "none";
      wrongIdMsg.style.display = "none";
      missingMsg1.style.display = "block"; // 이메일 @ 누락 msg
      missingMsg2.style.display = "none";
    } else if (emailBtnForPw.value.search(/[.]/g) === -1) {
      // 이메일에 .누락
      blankMsg.style.display = "none";
      wrongIdMsg.style.display = "none";
      missingMsg1.style.display = "none";
      missingMsg2.style.display = "block"; // 이메일 . 누락 msg
    }
  } else {
    // 유효성 검사 통과
    certificateBtnForPw.disabled = false; // 확인 버튼 활성화
    certificateBtnForPw.style.backgroundColor = "#1089ff"; // 확인 버튼 활성화 --> blue
    certificateBtnForPw.style.cursor = "pointer"; // 커서 모양 포인터로 변경
    certificateBtnForPw.style.color = "#fff";
    idTitle.style.color = "#01d28e";
    emailTitleForPw.style.color = "#01d28e"; // 유효할 때 --> 글자, 밑줄 green
    idBtn.style.borderBottom = "2px solid #01d28e";
    emailBtnForPw.style.borderBottom = "2px solid #01d28e";
    // 유효성 검사 msg --> hide
    blankMsg.style.display = "none";
    wrongIdMsg.style.display = "none";
    missingMsg1.style.display = "none";
    missingMsg2.style.display = "none";
  }
}
// -----------------------------------------------------------------
// input 클릭 시 입력 준비 --> label, border --> green
function prepareInput1() {
  nameTitle.style.color = "#01d28e";
  emailTitleForId.style.color = "#01d28e";

  nameBtn.style.borderBottom = "2px solid #01d28e";
  emailBtnForId.style.borderBottom = "2px solid #01d28e";
}
function prepareInput2() {
  idTitle.style.color = "#01d28e";
  emailTitleForPw.style.color = "#01d28e";
  idBtn.style.borderBottom = "2px solid #01d28e";
  emailBtnForPw.style.borderBottom = "2px solid #01d28e";
}
// input tag에 event 적용 -----------------------------------------------------------------------
nameBtn.addEventListener("keyup", btnActive1);
nameBtn.addEventListener("click", prepareInput1);

emailBtnForId.addEventListener("keyup", btnActive1);
emailBtnForId.addEventListener("click", prepareInput1);

idBtn.addEventListener("keyup", btnActive2);
idBtn.addEventListener("click", prepareInput2);

emailBtnForPw.addEventListener("keyup", btnActive2);
emailBtnForPw.addEventListener("click", prepareInput2);

