// 필터 검색란 펼치기 / 닫기

// 필터 오픈 아이콘
const filterOpenner = document.querySelector(".filterOpenner");
// 필터 닫기
const filterCloser = document.querySelector(".filterCloser");
const filterContainer = document.querySelector(".filterContainer");
filterOpenner.addEventListener("click", () => {
  filterOpenner.style.display = "none";
  filterContainer.style.padding = "15px";
  filterContainer.style.width = "220px";
});

filterCloser.addEventListener("click", () => {
  filterOpenner.style.display = "block";
  filterContainer.style.padding = "0";
  filterContainer.style.width = "0";
});

// 필터 펼치기 (필터 제목 클릭 --> 펼치기 / 닫기)
// 필터 제목
const filterBoxTitle = document.getElementsByClassName("filterBoxTitle");
// 필터 내용
const filterBox = document.getElementsByClassName("filterBox");
const arrow = document.querySelectorAll(".openArrow > img");

for (let i = 0; i < filterBoxTitle.length; i++) {
  filterBoxTitle[i].addEventListener("click", () => {
    if (filterBox[i].classList.contains("hideFilter")) {
      filterBox[i].classList.remove("hideFilter");
      arrow[i].setAttribute("src", "images/up_arrow.png");
    } else {
      filterBox[i].classList.add("hideFilter");
      arrow[i].setAttribute("src", "images/down_arrow.png");
    }
  });
}