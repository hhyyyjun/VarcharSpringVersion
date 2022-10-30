// 회원탈퇴 버튼
const deleteUserBtn = document.getElementById("deleteUserBtn");
// 그동안 작성한 글 삭제/유지/탈퇴 중지 버튼
const deleteMsgBox = document.getElementById("deleteMsgBox");
// 그동안 작성한 글 모두 삭제 버튼
const deleteAllBtn = document.getElementById("deleteAll");
// 그동안 작성한 글 모두 유지 버튼
const deleteOnlyMsgBtn = document.getElementById("deleteOnlyMsg");
// 회원 탈퇴 취소 버튼
const stopDeleteBtn = document.getElementById("stopDelete");
// '모두 유지' 안내 msg
const deleteOnlyMsgInfo = document.getElementById("deleteOnlyMsgInfo");
const userPw = document.getElementById("deleteUser").getAttribute("userPw");

// 회원탈퇴 버튼 클릭 --> 그동안 작성한 글 처리 msg 보이기
deleteUserBtn.addEventListener("click", () => {
  //   console.log("로그: deleteUserBtn 클릭");
  deleteMsgBox.style.display = "block";
  // console.log("로그: display block");
});

// 회원탈퇴 취소 클릭 --> 메인페이지 이동
stopDeleteBtn.addEventListener("click", () => {
  window.location.href = "/myPage.jsp";
});

// 작성한 글 모두 유지 마우스오버 --> 안내 메시지 show
deleteOnlyMsgBtn.addEventListener("mouseover", () => {
  deleteOnlyMsgInfo.style.display = "block";
  //   console.log("마우스 오버");
});

// 탈퇴 버튼 클릭
deleteAllBtn.addEventListener("click", () => {
  const finalCheck = confirm("정말로 탈퇴하시겠습니까?");
  if (finalCheck == true) {
    const pw = prompt("비밀번호를 입력해주세요!");
    if (pw == userPw) {
   alert("탈퇴 완료했습니다.");
      document.querySelector("form.contact-form").action="deleteM.do";
      document.querySelector("form.contact-form").submit();
    }
    else {
   alert("탈퇴실패.....메인으로 돌아갑니다.");
   location.href="main.do";
   }
  }
});

deleteOnlyMsgBtn.addEventListener("click", () => {
  const finalCheck = confirm("정말로 탈퇴하시겠습니까?");
  if (finalCheck == true) {
    const pw = prompt("비밀번호를 입력해주세요!");
    if (pw == userPw) {
   alert("탈퇴 완료했습니다.");
      document.querySelector("form.contact-form").action="deleteM.do";
      document.querySelector("form.contact-form").submit();
    }
    else {
   alert("탈퇴실패.....메인으로 돌아갑니다.");
   location.href="main.do";
   }
  }
});
