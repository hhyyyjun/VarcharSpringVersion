// 게시글 사이트
// 게시글 펼침/닫기 에 따라 화살표 방향 변경

// 게시글 제목
const boardList = document.querySelectorAll(".menuBox > li");
// 게시글 내용
const content = document.querySelectorAll(".menuBox > li > ul");
// 화살표
const arrow = document.querySelectorAll(".openArrow > img");

// 게시글 제목 클릭 --> 내용 숨김 여부에 따라 화살표 방향 변경
for (let i = 0; i < boardList.length; i++) {
  boardList[i].addEventListener("click", () => {
    if (content[i].style.display == "none") {
      arrow[i].setAttribute("src", "images/up_arrow.png");
    } else {
      arrow[i].setAttribute("src", "images/down_arrow.png");
    }
  });
}
