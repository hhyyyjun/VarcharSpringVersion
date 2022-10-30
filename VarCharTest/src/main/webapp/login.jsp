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
<link rel="shortcut icon" href="./images/vc.ico" >
    <link
      href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap"
      rel="stylesheet"/>

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
    <link rel="stylesheet" href="css/login.css" />
  </head>
  <body>
   <koala:nav />
    
    <section
      class="hero-wrap hero-wrap-2 js-fullheight"
      style="background-image: url('images/bg_3.jpg')"
      data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div
          class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-5">
            <p class="breadcrumbs">
              <span class="mr-2"><a href="main.do">
       
                <spring:message code = "login.a" /> <i class="ion-ios-arrow-forward"></i></a></span>
            </p>
            <h1 class="mb-3 bread"><spring:message code = "login.hi.mb3" /></h1>
          </div>
        </div>
      </div>
    </section>
    
    <div id="wrap">
      
      <div id="loginContainer">
   
        <form name="login" action="login.do" method="post">
          <p id="idTitle"><spring:message code="login.p.idTitle" /></p>
     
          <input
            name="mid"
            type="text"
            id="idInput"
            placeholder="<spring:message code="login.p.idTitle" />"
            autocomplete="off" />
          <p id="pwTitle"><spring:message code = "login.p.pwTitle" /></p>
      
          <input
            name="mpw"
            type="password"
            id="pwInput"
            placeholder="<spring:message code = "login.p.pwTitle" />"
            autocomplete="off"/>
          <div>
      
            <button type="submit" id="loginBtn" disabled><spring:message code = "login.button.loginBtn" /></button>
          </div>
		 
          <div id="blank">
            <p><spring:message code = "login.p.missSomething" /></p>
          </div>
         
          <div id="short">
            <p><spring:message code = "login.p.forPw" /></p>
          </div>
        </form>
       
        <div id="findInner">
          <span><a id="findIdPassword" href="findAccount.do">
              <spring:message code = "login.a.findIdPassword" /></a ></span>
        </div>
      
     <h2 class="subLogin"><span><spring:message code = "login.span.simpleLogin" /></span></h2>
        <ul id="otherLogin">
          <li id="kakaoLoginBtn"></li>  
        </ul>
      
        <form action="kakaoLogin.do" method="POST" id="kakaoLoginForm">
        <input type="hidden" name="kakaoUserName" value="" id="kakaoUserName">
        <input type="hidden" name="loginType" value="" id="loginType">
     </form>
      
        <h2 class="subLogin"><span><spring:message code = "login.span.notMemberYet" /></span></h2>
        <div id="registerInner">
          <a id="registerButton" href="signup.do">
            <span><spring:message code = "login.span.join" /></span>
          </a>
        </div>
        <div id="moreService">
          <p>
            <spring:message code = "login.p.moreService" /> <br /> <spring:message code = "login.br.moreService" />
          </p>
        </div>
        <div id="footer">
          <address>Ⓒ VARCHAR. All Rights Reserved.</address>
        </div>
      </div>
    </div>

    <koala:footer />
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
    <script src="js/login.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script src="js/kakaoLogin.js"></script>
  </body>
</html>