// 필터 검색 초기화 버튼

const initializeBtn = document.querySelector(".intializeBtn");

// 모든 select 필터(select 태그 저장 배열)
const selectOption = document.getElementsByTagName("select");
// 모든 checkbox / label
// const checkBox = document.querySelectorAll("input[type='checkbox']");
// const label = document.querySelectorAll("ul > li > span > label");

initializeBtn.onclick = () => {
  console.log("초기화 시작");
  // 모든 select 태그의 첫 번째 option을 selected
  for (let i = 0; i < selectOption.length; i++) {
    selectOption[i].children[0].selected = true;
  }
  // 주행거리 reset
  document.getElementById("slider-range-value1").innerText = 1000;
  document.getElementById("slider-range-value2").innerText = 1000000;
  document.querySelector("input[name='km_min']").value = 1000;
  document.querySelector("input[name='km_max']").value = 1000000;
  // 체크 박스 reset
  for (let i = 0; i < label.length; i++) {
 //    console.log(checkBox[i]);
 //    console.log(label[i]);
    checkBox[i].checked = false;
    label[i].style.color = "#999999";
    label[i].style.border = "1px solid #e5e5e5";
  }
};