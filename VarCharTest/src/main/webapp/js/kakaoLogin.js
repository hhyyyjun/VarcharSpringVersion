// window.Kakao.init('본인 JAVASCRIPT API 키');
        window.Kakao.init('b2cb5a1c49207d19e1c947876401ef30');
      
     // 카카오톡 로그인
           function kakaoLogin() {
               Kakao.Auth.login({
                 success: function (response) {
                   Kakao.API.request({
                     url: '/v2/user/me',
                     success: function (response) {
                        console.log(response);
                      //  console.log(response.kakao_account.profile.nickname);
                      sendLoginData(response.kakao_account.profile.nickname, 'kakao');
                     },
                     fail: function (error) {
                       console.log(error);
                     },
                   })
                 },
                 fail: function (error) {
                   console.log(error);
                 },
               })
             }
             function sendLoginData(userName, loginType) {
                document.getElementById("kakaoUserName").value = userName;
                document.getElementById("loginType").value= loginType;
                document.getElementById("kakaoLoginForm").submit();
             }
        document.getElementById("kakaoLoginBtn").onclick = () => {kakaoLogin();}