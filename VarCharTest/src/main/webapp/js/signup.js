// 회원가입 form
const inputBox = document.getElementsByClassName("form-control");
const idBox = inputBox[0];
const pwBox = inputBox[1];
const pwCheckBox = inputBox[2];
const nameBox = inputBox[3];
const nicknameBox = inputBox[4];
const addressBox = inputBox[5];
const detailedAddressBox = inputBox[6];
const phoneBox = inputBox[7];
const emailBox = inputBox[8];
/*const birthBox = inputBox[7];*/
// 인증번호 입력 input
const certificateBox = document.getElementById("certificateInput");

// 회원가입 form 항목 이름
const inputTitle = document.querySelectorAll(".inputbox > label");
const idTitle = inputTitle[0];
const pwTitle = inputTitle[1];
const pwCheckTitle = inputTitle[2];
const nameTitle = inputTitle[3];
const nicknameTitle = inputTitle[4];
const addressTitle = inputTitle[5];
const detailedAddressTitle = inputTitle[6]
const phoneTitle = inputTitle[7];
const emailTitle = inputTitle[8];
/*const birthTitle = inputTitle[7];*/
const personInfoTitle = document.querySelector(
  ".inputbox > #myinfock > strong"
);
// 아이디 중복검사 버튼
const idCheckBtn = document.getElementById("idboxbottomright");
// 인증번호 발송 버튼
const certificateBtn = document.getElementById("phoneboxright");

// 유효성 검사 msg
const warnMsg = document.getElementsByClassName("warnbox");
const idMsg = warnMsg[0];
const pwMsg = warnMsg[1];
const pwCheckMsg = warnMsg[2];
const nameMsg = warnMsg[3];
const nicknameMsg = warnMsg[4];
const addressMsg = warnMsg[5];
const detailedAddressMsg = warnMsg[6];
const phoneMsg = warnMsg[7];
const emailMsg = warnMsg[8];
/*const birthMsg = warnMsg[7];*/

//필수약관 전체동의
const agreeEssentialAll = document.querySelector(".agreeEssentialAll");
//필수약관 3개
const agreeEssentialBtn = document.getElementsByClassName("agreeEssential");
// 마케팅 수신 동의
const agreeMarketMsg = document.querySelector(".agreeMarketMsg");
// 이메일, SMS 수신 동의
const marketMsg = document.getElementsByClassName("marketMsg");

// 회원가입 버튼
const signupBtn = document.getElementById("submitbox");

// 각 input 클릭 시 border, title --> blue
for (let i = 0; i < inputBox.length; i++) {
  // console.log("로그 : prepareInput 호출 : " + i);
  inputBox[i].addEventListener("click", () => {
    inputBox[i].style.border = "1px solid #1089ff";
    inputTitle[i].style.color = "#1089ff";
  });
}
certificateBox.addEventListener("click", () => {
  // console.log("signup.js 로그 : 인증번호 입력");
  certificateBox.style.border = "1px solid #01d28e";
});
document.getElementById("infoValidation").addEventListener("click", () => {
  personInfoTitle.style.color = "#1089ff";
});

// 유효성 검사 ---------------------------------------------
// 유효하지 않은 값 --> 회원가입 버튼 비활성화 / input 타이틀, 테두리 red
//정규표현식
// 아이디 영문, 숫자 조합 (영문, 숫자 각각 적어도 1문자 포함 / 특수 문자 불가능)
const idReg = /^(?=.*\d)(?=.*[a-zA-Z]).{2,}$/;
const idRegExclude = /[^(가-힣ㄱ-ㅎㅏ-ㅣa-zA-Z0-9)]/gi;
//이메일 @포함 여부 및 대소문자 미구분
const emailReg =
  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
//패스워드가 영문숫자 조합 8자리~12자리(특수문자 허용)
const pwReg = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,12}$/;
//이름 한글(2~4글자) or 영어(2~10, 2~10글자)
const koreanNameReg = /^[가-힣]{2,4}$/;
const englishNameMsg = /^[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
// 닉네임(한글, 영문, 숫자)
const nicknameReg = /^[가-힣a-zA-Z0-9]{1,}$/;
//번호 앞2~3자리 중간3~4자리 뒷번호4자리
const phoneReg = /^\d{2,3}?\d{3,4}?\d{4}$/;
//생년월일 8자리
/*const birthReg = /^[0-9]{8}$/;*/

// 아이디 유효성 검사
function idValCheck() {
  const flag = idReg.test(idBox.value) && !idRegExclude.test(idBox.value);
  if (flag) {
    idMsg.style.display = "none";
    idBox.style.border = "1px solid1089ff";
    idTitle.style.color = "#1089ff";
    // 아이디 중복검사 버튼 활성화
    idCheckBtn.disabled = false;
    idCheckBtn.style.background = "#1089ff";
    idCheckBtn.style.cursor = "pointer";
  } else {
    idMsg.style.display = "block";
    idBox.style.border = "1px solid #eb5a46";
    idTitle.style.color = "#eb5a46";
    // 아이디 중복검사 버튼 비활성화
    idCheckBtn.disabled = true;
    idCheckBtn.style.background = "#dee5ec";
    idCheckBtn.style.cursor = "no-drop";
  }
  return flag;
}
// 비밀번호 유효성 검사
function pwValCheck() {
  const flag = pwReg.test(pwBox.value);
  if (flag) {
    pwMsg.style.display = "none";
    pwBox.style.border = "1px solid #1089ff";
    pwTitle.style.color = "#1089ff";
  } else {
    pwMsg.style.display = "block";
    pwBox.style.border = "1px solid #eb5a46";
    pwTitle.style.color = "#eb5a46";
  }
  return flag;
}
// 비밀번호 재확인 유효성 검사
function pwDoubleCheck() {
  const flag = pwBox.value === pwCheckBox.value ? true : false;
  if (flag) {
    pwCheckMsg.style.display = "none";
    pwCheckBox.style.border = "1px solid #1089ff";
    pwCheckTitle.style.color = "#1089ff";
  } else {
    pwCheckMsg.style.display = "block";
    pwCheckBox.style.border = "1px solid #eb5a46";
    pwCheckTitle.style.color = "#eb5a46";
  }
  return flag;
}

// 이름 유효성 검사
function nameValCheck() {
  const flag =
    koreanNameReg.test(nameBox.value) || englishNameMsg.test(nameBox.value);
  if (flag) {
    nameMsg.style.display = "none";
    nameBox.style.border = "1px solid #1089ff";
    nameTitle.style.color = "#1089ff";
  } else {
    nameMsg.style.display = "block";
    nameBox.style.border = "1px solid #eb5a46";
    nameTitle.style.color = "#eb5a46";
  }
  return flag;
}

// 주소 유효성 검사
function addressValCheck() {
  if (addressBox.value) {
    addressMsg.style.display = "none";
    addressBox.style.border = "1px solid #1089ff";
    addressTitle.style.color = "#1089ff";
    return true;
  } else {
 //   addressMsg.style.display = "block";
    addressBox.style.border = "1px solid #eb5a46";
    addressTitle.style.color = "#eb5a46";
    return false;
  }
}

// 주소 유효성 검사
function detailedAddressValCheck() {
  if (detailedAddressBox.value) {
    detailedAddressMsg.style.display = "none";
    detailedAddressBox.style.border = "1px solid #1089ff";
    detailedAddressTitle.style.color = "#1089ff";
    return true;
  } else {
    detailedAddressMsg.style.display = "block";
    detailedAddressBox.style.border = "1px solid #eb5a46";
    detailedAddressTitle.style.color = "#eb5a46";
    return false;
  }
}

// 닉네임 유효성 검사
function nicknameValCheck() {
  const flag = nicknameReg.test(nicknameBox.value);
  if (flag) {
    nicknameMsg.style.display = "none";
    nicknameBox.style.border = "1px solid #1089ff";
    nicknameTitle.style.color = "#1089ff";
  } else {
    nicknameMsg.style.display = "block";
    nicknameBox.style.border = "1px solid #eb5a46";
    nicknameTitle.style.color = "#eb5a46";
  }
  return flag;
}
// 전화번호 유효성 검사
function phoneValCheck() {
  const flag = phoneReg.test(phoneBox.value);
  if (flag) {
    phoneMsg.style.display = "none";
    phoneBox.style.border = "1px solid #1089ff";
    phoneTitle.style.color = "#1089ff";
    // 인증번호 발송 버튼 활성화
    certificateBtn.disabled = false;
    certificateBtn.style.background = "#1089ff";
    certificateBtn.style.cursor = "pointer";
  } else {
    phoneMsg.style.display = "block";
    phoneBox.style.border = "1px solid #eb5a46";
    phoneTitle.style.color = "#eb5a46";
    // 인증번호 발송 버튼 비활성화
    certificateBtn.disabled = true;
    certificateBtn.style.background = "#dee5ec";
    certificateBtn.style.cursor = "no-drop";
  }
  return flag;
}
// 이메일 유효성 검사
function emailValCheck() {
  const flag = emailReg.test(emailBox.value);
  if (flag) {
    emailMsg.style.display = "none";
    emailBox.style.border = "1px solid #1089ff";
    emailTitle.style.color = "#1089ff";
  } else {
    emailMsg.style.display = "block";
    emailBox.style.border = "1px solid #eb5a46";
    emailTitle.style.color = "#eb5a46";
  }
  return flag;
}

// 인증번호 발송
certificateBtn.addEventListener("click", () => {
  if (phoneValCheck) {
    document.querySelector(".certificateBox").style.display = "flex";
    certificateBtn.innerText = "다시 요청";
  } else {
    document.querySelector(".certificateBox").style.display = "none";
  }
});

// 필수 약관 전체 동의 클릭 --> 모든 필수 약관 버튼 checked
// 재차 클릭 --> 전체 버튼 checked 해제
agreeEssentialAll.addEventListener("click", function (e) {
  for (let i = 0; i < agreeEssentialBtn.length; i++) {
    agreeEssentialBtn[i].checked = e.target.checked;
  }
});
// 마케팅 수신 여부 클릭 --> 이메일, SMS 수신 동의 버튼 checked
agreeMarketMsg.addEventListener("click", function (e) {
  for (let i = 0; i < marketMsg.length; i++) {
    marketMsg[i].checked = e.target.checked;
  }
});

idBox.addEventListener("keyup", idValCheck);
pwBox.addEventListener("keyup", pwValCheck);
pwCheckBox.addEventListener("keyup", pwDoubleCheck);
nameBox.addEventListener("keyup", nameValCheck);
nicknameBox.addEventListener("keyup", nicknameValCheck);
addressBox.addEventListener("keyup", addressValCheck);
detailedAddressBox.addEventListener("keyup", detailedAddressValCheck);
phoneBox.addEventListener("keyup", phoneValCheck);
emailBox.addEventListener("keyup", emailValCheck);

// 회원가입 버튼 활성화 함수
function btnActive() {
  // signupFlag == true --> 회원가입 버튼 활성화
  let signupFlag = true;
  for (let i = 0; i < inputBox.title; i++) {
    // 모든 입력에 공란 유무 확인
    signupFlag = signupFlag && inputBox[i].value;
  }
  for (let i = 0; i < agreeEssentialBtn.length; i++) {
    // 필수 약관을 전부 체크 여부 확인
    signupFlag = signupFlag && agreeEssentialBtn[i].checked;
  }

  // 아이디 중복 검사 & 본인 인증 성공 여부 -----------------------------------------------
  signupFlag =
    signupFlag &&
    document.getElementById("checkidResult").innerText === "사용가능한 아이디";
  console.log(signupFlag);
  signupFlag =
    signupFlag &&
    document.getElementById("checkResult").innerText === "본인 인증 성공!";
  console.log(signupFlag);
 
   // ------------------------------------------------------------
  if (
    // 모든 입력값 유효 여부 확인
    signupFlag &&
    idValCheck() &&
    pwValCheck() &&
    nameValCheck() &&
    nicknameValCheck() &&
    phoneValCheck() &&
    emailValCheck() &&
   addressValCheck() &&
   detailedAddressValCheck()
  ) {
    // 회원가입 버튼 활성화
    // console.log("btnActive 로그 : true");
    signupBtn.disabled = false; // 회원가입 버튼 활성화
    signupBtn.style.backgroundColor = "#1089ff"; // 회원가입버튼 활성화 --> blue
    signupBtn.style.cursor = "pointer"; // 커서 모양 포인터로 변경
  } else {
    // 회원가입 버튼 비활성화
    // console.log("btnActive 로그 : false");
    signupBtn.disabled = true; // 회원가입 버튼 비활성화
    signupBtn.style.backgroundColor = "#dee5ec"; // 로그인 버튼 비활성화 --> gray
    signupBtn.style.cursor = "no-drop"; // 커서 모양 변경
  }
}

// 모든 input 유효한 값 입력 -> 필수 약관 동의 => 회원가입 버튼 활성화
for (let i = 0; i < inputBox.length; i++) {
  inputBox[i].addEventListener("keyup", btnActive);
}
// 모든 필수 약관 동의 -> input 유효한 값 입력 => 회원가입 버튼 활성화
agreeEssentialAll.addEventListener("click", btnActive);
for (let i = 0; i < agreeEssentialBtn.length; i++) {
  agreeEssentialBtn[i].addEventListener("click", btnActive);
}


//★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
// 모든 input 유효한 값 입력 & 필수약관 동의 --> 인증번호 입력 => 회원가입 버튼 활성화
document
  .getElementById("certificateCheckBtn")
  .addEventListener("click", btnActive);

// 모든 input 유효한 값 입력 & 필수약관 동의 --> 아이디 중복 검사 완료 ==> 회원가입 버튼 활성화
document.getElementById("idboxbottomright").addEventListener("click", btnActive);
// ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
  