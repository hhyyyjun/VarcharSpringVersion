// 모든 checkbox / label
const checkBox = document.querySelectorAll("input[type='checkbox']");
const label = document.querySelectorAll("ul > li > span > label");

// 연료 검색 checkbox / label
const fuelCheckBox = document.querySelectorAll(
  "#fuelFilter input[type='checkbox']"
);
const fuelLabel = document.querySelectorAll("#fuelFilter .fuel");
// 지역 검색 checkbox / label
const regionCheckBox = document.querySelectorAll(
  "#regionFilter input[type='checkbox']"
);
const regionLabel = document.querySelectorAll("#regionFilter .region");

// initialize ----------------------------------
for (let i = 0; i < label.length; i++) {
  if (checkBox[i].checked) {
    // 체크박스 check
    label[i].style.color = "#000";
    label[i].style.border = "1px solid #000";
  } else {
    // 재차 클릭 --> check 취소
    label[i].style.color = "#999999";
    label[i].style.border = "1px solid #e5e5e5";
  }
}

// -----------------------------------------------

// 체크 박스 클릭 --> check
// 재차 클릭 --> check 해제
for (let i = 0; i < label.length; i++) {
  label[i].onclick = () => {
    if (!checkBox[i].checked) {
      // 체크박스 check
      label[i].style.color = "#000";
      label[i].style.border = "1px solid #000";
    } else {
      // 재차 클릭 --> check 취소
      label[i].style.color = "#999999";
      label[i].style.border = "1px solid #e5e5e5";
    }
    // 체크 / 체크 취소
    checkBox[i].checked = !checkBox[i].checked;
    // console.log(checkBox[i].checked);
  };
}

// 연료, 지역 검색
// 전체 체크 박스 클릭 --> 전체 check
// 재차 클릭 --> 전체 check 해제
fuelLabel[0].onclick = () => {
  console.log("연료 전체 선택 시작");
  if (!fuelCheckBox[0].checked) {
    console.log("연료 전체 선택");
    for (let i = 0; fuelLabel.length; i++) {
      fuelLabel[i].style.color = "#000";
      fuelLabel[i].style.border = "1px solid #000";
      fuelCheckBox[i].checked = true;
    }
  } else {
    console.log("연료 전체 해제");
    for (let i = 0; fuelLabel.length; i++) {
      fuelLabel[i].style.color = "#999999";
      fuelLabel[i].style.border = "1px solid #e5e5e5";
      fuelCheckBox[i].checked = false;
    }
  }
};
regionLabel[0].onclick = () => {
  if (!regionCheckBox[0].checked) {
    for (let i = 0; regionLabel.length; i++) {
      regionLabel[i].style.color = "#000";
      regionLabel[i].style.border = "1px solid #000";
      regionCheckBox[i].checked = true;
    }
  } else {
    for (let i = 0; regionLabel.length; i++) {
      regionLabel[i].style.color = "#999999";
      regionLabel[i].style.border = "1px solid #e5e5e5";
      regionCheckBox[i].checked = false;
    }
  }
};