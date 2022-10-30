<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="koala" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
<head>
<title>VARCHAR</title>
<link rel="shortcut icon" href="./images/vc.ico" >
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet" />
<link rel="stylesheet" href="css/open-iconic-bootstrap.min.css" />
<link rel="stylesheet" href="css/animate.css" />
<link rel="stylesheet" href="css/owl.carousel.min.css" />
<link rel="stylesheet" href="css/owl.theme.default.min.css" />
<link rel="stylesheet" href="css/magnific-popup.css" />
<link rel="stylesheet" href="css/aos.css" />
<link rel="stylesheet" href="css/ionicons.min.css" />
<link rel="stylesheet" href="css/bootstrap-datepicker.css" />
<link rel="stylesheet" href="css/jquery.timepicker.css" />
<link rel="stylesheet" href="css/flaticon.css" />
<link rel="stylesheet" href="css/icomoon.css" />
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="./css/signup.css" />

<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>

</head>
<body>
   <koala:nav />


   <section class="hero-wrap hero-wrap-2 js-fullheight"
      style="background-image: url('images/bg_3.jpg')"
      data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
         <div
            class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
            <div class="col-md-9 ftco-animate pb-5">
               <p class="breadcrumbs">
                  <span class="mr-2"><a href="main.do"><spring:message code = "signup.span.home" /> <i
                        class="ion-ios-arrow-forward"></i>
                  </a></span>
               </p>
               <h1 class="mb-3 bread"><spring:message code = "signup.h1.signup" /></h1>
            </div>
         </div>
      </div>
   </section>

   <div class="joinbox">
      <div id="signupContainer">
         <form action="insertM.do" class="contact-form" data-aos="fade-up" method="POST"
            data-aos-delay="200">
     
            <div class="inputbox">
               <label class="text-black" for="id"><spring:message code = "signup.label.id" /></label>
               <div id="idboxtop">
                  <span id="idinput"> <input type="text" class="form-control"
                     id="id" name="mid" placeholder="<spring:message code = "signup.label.id" />" autocomplete="off" />
                  </span>
              
                  <button type="button" id="idboxbottomright" disabled><spring:message code = "signup.button.duplicate" /></button>
               </div>
               <div id="checkidResultBox">
                  <span id="checkidResult"></span>
               </div>
    
               <div class="warnbox">
                  <span><spring:message code = "signup.span.idCombination" /></span>
               </div>
              
            </div>
			
		
            <div class="inputbox">
               <label class="text-black" for="fname"><spring:message code = "signup.label.password" /></label>
               <div id="pwboxtop">
                  <input type="password" class="form-control"
                     placeholder="<spring:message code = "signup.div.pwCombination.in" />" id="password" name="mpw"
                     autocomplete="off" />
               </div>
           
               <div class="warnbox"><spring:message code = "signup.label.checkPw" /></div>
               <label class="text-black checkPwLabel" for="fname"><spring:message code = "signup.label.checkPw" /></label>
              
               <div id="pwboxbottom">
                  <input type="password" class="form-control" placeholder="<spring:message code = "signup.label.checkPw" />"
                     id="passwordck" autocomplete="off" />
               </div>
               
               <div class="warnbox">
                  <span><spring:message code = "signup.span.notCorrect" /></span>
               </div>
            </div>
           
            <div class="inputbox">
               <label class="text-black" for="fname"><spring:message code = "signup.label.name" /></label>
               <div id="namebox">
                  <input type="text" class="form-control" placeholder="<spring:message code = "signup.label.name" />"
                     id="nameinput" name="mname" autocomplete="off" />
               </div>
               
               <div class="warnbox">
                  <span><spring:message code = "signup.span.nameCombination" /></span>
               </div>
            </div>
			
			
            <div class="inputbox">
               <label class="text-black" for="fname"><spring:message code = "signup.label.nickname" /></label>
               <div id="nicknamebox">
                  <input type="text" class="form-control" placeholder="<spring:message code = "signup.label.nickname" />"
                     id="nicknameinput" name="mnickname" autocomplete="off" />
               </div>
             
               <div class="warnbox">
                  <span><spring:message code = "signup.span.freeText" /></span>
               </div>
            </div>

		
            <div class="inputbox">
               <label class="text-black" for="fname"><spring:message code = "signup.label.address" /></label>
               <div id="addressbox">
                  <input type="text" class="form-control" placeholder="<spring:message code = "signup.label.address" />"
                     id="addressinput" name ="madd" autocomplete="off"  />
              
                     <button id="searchAddressBtn" type="button"  onclick="kakaoaddress()" ><spring:message code = "signup.button.findAddress" /></button>
                  </div>
        
                     <div class="warnbox">
                  <span><spring:message code = "signup.span.writeAddress" /></span>
               </div>
            </div>
            
 
            <div class="inputbox">
               <label class="text-black" for="fname"><spring:message code = "signup.label.detailAdd" /></label>
               <div id="detailedAddressbox">
                  <input type="text" class="form-control" placeholder="<spring:message code = "signup.label.detailAdd" />"
                     id="detailedAddressinput" name="maddDetail" autocomplete="off" />
               </div>
              
               <div class="warnbox">
                  <span><spring:message code = "signup.span.writeDetailAdd" /></span>
               </div>
            </div>

		
            <div class="inputbox">
               <label class="text-black" for="fname"><spring:message code = "signup.label.phone" /></label>
               <div id="phonebox">
                  <div id="phoneboxleft">
                     <input type="text" class="form-control"
                        placeholder="<spring:message code = "signup.label.phone.in" />" id="phoneinput" name="mphone"
                        autocomplete="off" />
                  </div>
                 
                  <button id="phoneboxright" type="button" disabled><spring:message code = "signup.button.sendAuthenticationNumber" />
                  </button>
               </div>
             
               <div class="warnbox"><spring:message code = "signup.div.warn" /></div>

      
               <div id="phonebox" class="certificateBox">
                  <div id="phoneboxleft">
                     <input type="text" placeholder="<spring:message code = "signup.checkAuthenticationNumber" />" id="certificateInput"
                        autocomplete="off" />
                  </div>
              
                  <button id="certificateCheckBtn" type="button">
                     <spring:message code = "signup.checkAuthenticationNumber" /><span id="timer"></span>
                  </button>
               </div>
               <div id="checkResultBox">
                  <span id="checkResult"></span>
               </div>
            </div>
			
		
            <div class="inputbox">
               <label class="text-black" for="fname"><spring:message code = "signup.label.email" /></label>
               <div id="emailboxtop">
                  <span id="emailinput"> <input type="email"
                     class="form-control" id="email" name="memail" placeholder="<spring:message code = "signup.label.email" />"
                     autocomplete="off" />
                  </span>
               </div>
        
               <div class="warnbox">
                  <span><spring:message code = "signup.span.wrongEmail" /></span>
               </div>
             
               <div id="emailboxbottom">
                  <span id="emailboxbottomleft"><spring:message code = "signup.span.announceEmail" /></span>
                  
               </div>
            </div>


            
            <div class="inputbox" id="infoValidation">
               <div id="myinfock">
                  <strong><spring:message code = "signup.strong.validity" />&nbsp;</strong>
                  <button type="button" class="btn_infomore"></button>
               </div>
               <div class="hiddenbox">
                  <ul class="hiddenboxul">
                     <li><spring:message code = "signup.li.1" /></li>
                     <li><spring:message code = "signup.li.2" /></li>
                     <li><spring:message code = "signup.li.3" /></li>
                  </ul>
               </div>
               <div>
                  <span class="yearbox"><input type="radio"
                     class="yearboxcheck" checked="checked" name="year" />&nbsp;&nbsp;<spring:message code = "signup.span.1" /></span> <span class="yearbox"><input type="radio"
                     class="yearboxcheck" checked="checked" name="year" />&nbsp;&nbsp;<spring:message code = "signup.span.2" /></span>
                  <span class="yearbox"><input type="radio"
                     class="yearboxcheck" checked="checked" name="year" />&nbsp;&nbsp;<spring:message code = "signup.span.3" /></span>
                  <span class="yearbox"><input type="radio"
                     class="yearboxcheck" checked="checked" name="year" />&nbsp;&nbsp;<spring:message code = "signup.span.4" /></span>
               </div>
            </div>
			
			
            <div id="inputbox">
               <div id="agreeboxtop">
                  <span><input type="checkbox" id="agree1"
                     class="agreeck agreeEssentialAll" /><label for="agree1"
                     class="agreelabel">&nbsp;<spring:message code = "signup.span.required1" /></label></span>
                  
             
               </div>
               <div id="agreeboxbottom">
                  <ul id="agreeul">
                     <li class="agreeli"><input type="checkbox" id="agree3"
                        class="agreeck agreeEssential" /><label for="agree3"
                        class="agreelabel">&nbsp;<spring:message code = "signup.li.required2" /></label></li>
                     <li class="agreeli"><input type="checkbox" id="agree4"
                        class="agreeck agreeEssential" /><label for="agree4"
                        class="agreelabel">&nbsp;<spring:message code = "signup.li.required3" /></label></li>
                     <li class="agreeli"><input type="checkbox" id="agree5"
                        class="agreeck agreeEssential" /> <label for="agree5"
                        class="agreelabel">&nbsp;<spring:message code = "signup.li.required4" /></label></li>
                     <li class="agreeli"><input type="checkbox" id="agree6"
                        class="agreeck agreeOptional" /><label for="agree6"
                        class="agreelabel">&nbsp;<spring:message code = "signup.li.select1" /></label></li>
                     <li class="agreeli"><span><input type="checkbox"
                           id="agree7" class="agreeck agreeOptional agreeMarketMsg" /><label
                           for="agree7" class="agreelabel">&nbsp;<spring:message code = "signup.li.select2" /></label></span>
                        <div id="agreelibottom">
                           <span><input type="checkbox"
                              class="checkboxbottom agreeck marketMsg" id="agree8" /><label
                              for="agree8" class="agreelabel">&nbsp;<spring:message code = "signup.span.email" /></label></span> <span><input
                              type="checkbox" class="checkboxbottom agreeck marketMsg"
                              id="agree9" /><label for="agree9" class="agreelabel">&nbsp;SMS</label></span>
                        </div></li>
                  </ul>
               </div>
            </div>
    
            <button type="submit" id="submitbox" disabled><spring:message code = "signup.button.signup" /></button>
         </form>
      </div>
   </div>

<koala:footer/>
   <koala:languageSelector />
	<script src="js/languageSelector.js" ></script>


   <script src="js/jquery.min.js"></script>
   <script src="js/jquery-migrate-3.0.1.min.js"></script>
   <script src="js/popper.min.js"></script>
   <script src="js/bootstrap.min.js"></script>
   <script src="js/jquery.easing.1.3.js"></script>
   <script src="js/jquery.waypoints.min.js"></script>
   <script src="js/jquery.stellar.min.js"></script>
   <script src="js/owl.carousel.min.js"></script>
   <script src="js/jquery.magnific-popup.min.js"></script>
   <script src="js/aos.js"></script>
   <script src="js/jquery.animateNumber.min.js"></script>
   <script src="js/bootstrap-datepicker.js"></script>
   <script src="js/jquery.timepicker.min.js"></script>
   <script src="js/scrollax.min.js"></script>
   <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
   <script src="js/google-map.js"></script>
   <script src="js/main.js"></script>
   <script src="js/signup.js"></script>
   <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   
   <script type="text/javascript">
   let timer;
   let isRunning = false; // 타이머 작동 여부
   // 인증번호 발송 버튼
   const certificateCheckBtn = document.getElementById("certificateCheckBtn");
   // 아이디 중복검사 버튼
   const idDoubleCheckBtn = document.getElementById("idboxbottomright");

   let number = 0;//인증할 번호를 저장할 변수
   // 인증번호 발송하고 타이머 함수 실행
   function sendAuthNum() {
     // 남은 시간(초) 아래에서 setting(leftSec)
     const leftSec = 180;
     display = document.querySelector("#timer");
     // 이미 타이머가 작동중이면 중지
     certificateCheckBtn.disabled = false;
     certificateCheckBtn.style.backgroundColor = "#01d28e";
     certificateCheckBtn.style.cursor = "pointer";
     // console.log("로그 : 시작  " + isRunning);
     if (isRunning) {
       // console.log("로그 : 다시 누르기 " + isRunning);
       number = 0; // 인증번호 초기화
       clearInterval(timer);
     }
     startTimer(leftSec, display);
   }
   function startTimer(count, display) {
      console.log("로그 : startTimer 시작");
      //문자 API
       const phone = $("#phoneinput").val();
       console.log("로그 : phone " + phone );
          $.ajax({
             type:'POST',
             url: '${pageContext.request.contextPath}/sendMSG.do',
             data: {phone:phone},
             success: function(randomNumber){
                console.log("로그: ["+randomNumber+"]")
                if(randomNumber != null){
                   $('#checkResult').text("인증번호 전송 완료");
                   $('#checkResult').css("color", "blue");
                   number = randomNumber;
                }else{
                   console.log("로그: ["+randomNumber+"]")
                   $('#checkResult').text("인증번호 전송 불가");
                   $('#checkResult').css("color", "red");
                }
             }, 
            error: function(request, status, error){ // 서블릿에서 에러 발생 시 
               console.log("code: "+request.status);
               console.log("message: "+request.responseText);
               console.log("error: "+error);
            }
          });
       // 타이머 시작
         console.log("로그 : 타이머 시작");
           isRunning = true;
           let minutes, seconds;
           timer = setInterval(function () {
          minutes = parseInt(count / 60, 10);
          seconds = parseInt(count % 60, 10);
          minutes = minutes < 10 ? "0" + minutes : minutes;
          seconds = seconds < 10 ? "0" + seconds : seconds;
          display.textContent = " (" + minutes + ":" + seconds + ")";
          // 타이머 끝
          if (--count < 0) {
            clearInterval(timer);
            display.textContent = "";
            isRunning = false;
            number = 0; // 인증번호 초기화
            certificateCheckBtn.disabled = true;
            certificateCheckBtn.style.backgroundColor = "rgb(222, 229, 236)";
            certificateCheckBtn.style.cursor = "no-drop";
            // console.log("로그 : 종료  " + isRunning);
          }
     }, 1000);
   }
   // 인증번호 발송 버튼 (signup.js 에 선언)
   // const certificateBtn = document.getElementById("phoneboxright");
   certificateBtn.onclick = sendAuthNum;
   certificateCheckBtn.onclick = function sendCheck(){
         const checkNum = $("#certificateInput").val();
         $.ajax({
            type:'POST',
            url: '${pageContext.request.contextPath}/sendCheck.do',
            data : {randomNumber:number, checkNum:checkNum},
            success: function(result){
               console.log("로그: ["+result+"]");
               if(result ==1){
                  $('#checkResult').text("본인 인증 성공!");
                  $('#checkResult').css("color", "#01d28e");   
                  $('#timer').remove();//타이머 제거 
            // 성공하면 인증번호 발송 / 확인 버튼 비활성화           
                  certificateCheckBtn.disabled = true; 
                  document.getElementById("phoneboxright").style.backgroundColor = "rgb(222, 229, 236)";
                  document.getElementById("phoneboxright").disabled = true;
                  document.getElementById("phoneboxright").style.cursor = "no-drop";
               }
               else{
                  $('#checkResult').text("인증번호 불일치!");
                  $('#checkResult').css("color", "#eb5a46");   
                  certificateCheckBtn.disabled = false;
               }
             }
          });
      }
   //아이디 중복검사
   idDoubleCheckBtn.onclick = function IDcheck() {
      const mid = $("#id").val();
      $.ajax({
         type : 'GET',
         url : '${pageContext.request.contextPath}/IDCheck.do?mid='+mid, 
         success : function(result) {
            console.log("로그 : [" + result + "]");
            if(result == 1) {
               $('#checkidResult').text("사용가능한 아이디");
               $('#checkidResult').css("color", "blue");
            } else {
               $('#checkidResult').text("이미 사용중인 아이디");
               $('#checkidResult').css("color", "red");
            }
         },
         error : function(request, status, error) {
            console.log("code : " + request.status);
            console.log("message : " + request.responseText);
            console.log("error : " + error);
         }
      });
   }
   // 카카오 주소 API 
   function kakaoaddress() {
       new daum.Postcode({
           oncomplete: function(data) {
              document.querySelector("#addressinput").value =  data.address
           }
       }).open();
   }
    </script>
</html>