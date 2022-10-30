// 필터 검색란 펼치기 / 닫기

// 필터 오픈 아이콘
const cartOpenner = document.querySelector(".cartOpenner");
// 필터 닫기
const cartCloser = document.querySelector(".cartCloser");
const cartContainer = document.querySelector(".cartContainer");

cartOpenner.addEventListener("click", () => {
  cartOpenner.style.display = "none";
  cartContainer.style.padding = "15px 0 15px 15px";
  cartContainer.style.width = "320px";
});

cartCloser.addEventListener("click", () => {
  cartOpenner.style.display = "block";
  cartContainer.style.padding = "0";
  cartContainer.style.width = "0";
});
