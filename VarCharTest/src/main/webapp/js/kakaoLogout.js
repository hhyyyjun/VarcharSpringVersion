  // window.Kakao.init('본인 JAVASCRIPT API 키');
        window.Kakao.init('dbe3d62c0f648a82c098b77d268862a8');
 
 // 카카오톡 로그아웃
        function kakaoLogout() {
           if (!Kakao.Auth.getAccessToken()) {
              console.log('Not logged in.');
              return;
           }
           else {
              Kakao.API.request({
                   url: '/v1/user/unlink',
                   success: function (response) {
                      console.log(response);
                      location.href="/app/logout.do";
                   },
                   fail: function (error) {
                     console.log(error);
                   },
                 })
                 Kakao.Auth.setAccessToken(undefined);
               }
        }
        document.getElementById("kakaoLogoutBtn").onclick = () => {kakaoLogout();}