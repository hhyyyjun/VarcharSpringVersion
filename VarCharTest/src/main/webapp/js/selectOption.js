// select option 최소 / 최대 자동 변경
// 주의 : 최소 / 최대 select option의 개수는 동일 가정
// 최소 select의 0번 index : 0
// 최대 select의 0번 index : 전체
const minSelect = document.getElementsByClassName("minSelect");
const maxSelect = document.getElementsByClassName("maxSelect");
// select한 최소값보다 큰 최대값 select
for (let i = 0; i < minSelect.length; i++) {
  // options
  const maxOptions = maxSelect[i].children;
  const minOptions = minSelect[i].children;
  const totalLength = minSelect[i].length; // === maxSelect[i].length
  minSelect[i].onchange = () => {
    for (let j = 0; j < totalLength; j++) {
      // reset
      maxOptions[j].style.display = "block";
      minOptions[j].style.display = "block";
    }
    const minValIndex = minSelect[i].selectedIndex;
    //   console.log("minValIndex : " + minValIndex);
    if (minValIndex === 0) {
      // 최소값 0 선택 --> 최대값 모두 보여주기
      return;
    }
    // 선택한 최소값보다 크거나 같은 최대값만 보여주기
    for (let k = 1; k < minValIndex; k++) {
      maxOptions[k].style.display = "none";
    }
  };
}
// select한 최대값보다 작은 최소값 select
for (let i = 0; i < maxSelect.length; i++) {
  // options
  const maxOptions = maxSelect[i].children;
  const minOptions = minSelect[i].children;
  const totalLength = maxSelect[i].length; // === minSelect[i].length
  maxSelect[i].onchange = () => {
    for (let j = 0; j < totalLength; j++) {
      // reset
      maxOptions[j].style.display = "block";
      minOptions[j].style.display = "block";
    }
    const maxValIndex = maxSelect[i].selectedIndex;
    //   console.log("maxValIndex : " + maxValIndex);
    if (maxValIndex === 0) {
      // 최대값 전체 선택 --> 최소값 모두 보여주기
      return;
    }
    // 선택한 최대값보다 작거나 같은 최소값만 보여주기
    for (let k = maxValIndex + 1; k < maxSelect[i].length; k++) {
      minOptions[k].style.display = "none";
    }
  };
}