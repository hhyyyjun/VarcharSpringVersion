//휴대폰 번호 인증
var code = "";
$(".certificateBtn").click(function () {
  alert(
    "인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오."
  );
  var phone = $("#phone").val();
  $.ajax({
    type: "GET",
    url: "phoneCheck?phone=" + phone,
    cache: false,
    success: function (data) {
      if (data == "error") {
        alert("휴대폰 번호가 올바르지 않습니다.");
        $(".successPhoneChk").text("유효한 번호를 입력해주세요.");
        $(".successPhoneChk").css("color", "red");
        $("#phone").attr("autofocus", true);
      } else {
        $("#phone2").attr("disabled", false);
        $("#phoneChk2").css("display", "inline-block");
        $(".successPhoneChk").text(
          "인증번호를 입력한 뒤 본인인증을 눌러주십시오."
        );
        $(".successPhoneChk").css("color", "green");
        $("#phone").attr("readonly", true);
        code = data;
      }
    },
  });
});
