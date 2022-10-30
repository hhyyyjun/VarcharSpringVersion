<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="koala"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
<head>
<title>VARCHAR</title>
 <link rel="shortcut icon" href="./images/vc.ico" >
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet"/>
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
    <link rel="stylesheet" href="css/myPage.css" />
  </head>
  <body>
   	<koala:nav/>
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
              <span class="mr-2"
                ><a href="main.do"
                  ><spring:message code = "mypage.a.home" /><i class="ion-ios-arrow-forward"></i></a
              ></span>
              <span><spring:message code = "mypage.span.mypage" /> <i class="ion-ios-arrow-forward"></i></span>
            </p>
            <h1 class="mb-3 bread"><spring:message code = "mypage.h1.Info" /></h1>
          </div>
        </div>
      </div>
    </section>
    <section class="ftco-section contact-section">
      <div class="container">
        <div class="row d-flex mb-5 contact-info">
          <div class="col-md-8 block-9 mb-md-5 myInfoContainer">
            <form action="updateM.do" class="bg-light p-5 contact-form" method="POST">
              <h2 class="myInfoTitle"><spring:message code = "mypage.h2.myInfoTitle" /></h2>
              <div class="myInfoBox">
                <div class="myInfo firstColumn">
                  <div class="form-group">
                    <span><spring:message code = "mypage.span.name" /></span>
                 
                    <input
                      type="text"
                      class="form-control"
                      name= "mname"
                      value="${userInfo.mname}"
                      readonly
                    />
                  </div>
                  <div class="form-group">
                    <span><spring:message code = "mypage.span.nickname" /></span>
                 
                    <input
                      type="text"
                      class="form-control"
                      name="mnickname"
                      value = "${userInfo.mnickname}"
                      placeholder="<spring:message code = "mypage.span.nickname.in" />"
                    />
                  </div>
                  <div class="form-group">
                    <span><spring:message code = "mypage.span.id" /></span>
                    <div class="form-group">
                    
                      <input
                        type="text"
                        class="form-control"
                        name="mid"
                        value="${userInfo.mid}"
                        readonly
                      />
                    </div>
                    <span><spring:message code = "mypage.span.pw" /></span>
              
                    <input
                      type="password"
                      class="form-control"
                      name="mpw"
                      value = "${userInfo.mpw}"
                      placeholder="<spring:message code = "mypage.span.pw.in" />"
                    />
                  </div>
                  <div class="form-group deleteUserBtn">
           
                    <input
                      readonly
                      type="text"
                      value="<spring:message code = "mypage.input.deleteBtn" />"
                      class="btn btn-primary py-3 px-5"
                      id="deleteUserBtn"
                    />
                  </div>
          
                  <div id="deleteMsgBox">
                    <p><spring:message code = "mypage.p.treat" /></p>
                    <div id="deleteMsgBtn">
                      <button name="deleteAll" id="deleteAll" value="deleteAll"><spring:message code = "mypage.button.deleteAll" /></button>
                      <button name="deleteOnlyMsg" id="deleteOnlyMsg" value="deleteOnlyMsg"><spring:message code = "mypage.button.keepItAll" /></button>
                      <button name="stopDelete" type="button" id="stopDelete" value="stopDelete"><spring:message code = "mypage.button.cancelWithdrawal" /></button>
                    </div>
                    <p id="deleteOnlyMsgInfo">
                      <spring:message code = "mypage.p.deleteOnlyMsgInfo" />
                    </p>
                  </div>
                </div>
                <div class="myInfo secondColumn">
                  <div class="form-group">
                    <span><spring:message code = "mypage.span.phoneNum" /></span>
                    <div class="form-group">
                   
                      <input
                        type="text"
                        class="form-control"
                        name = "mphone"
                         value = "${userInfo.mphone}"
                        placeholder="<spring:message code = "mypage.span.phoneNum.in" />"
                      />
                    </div>
                    <span><spring:message code = "mypage.span.add" /></span>
                    <div class="form-group">
               
                      <input
                        type="text"
                        class="form-control"
                        name = "madd"
                         value = "${userInfo.madd}"
                        placeholder="<spring:message code = "mypage.span.add.in" />"
                      />
                    </div>
                    <span><spring:message code = "mypage.span.email" /></span>
                    <div class="form-group">
                    
                      <input
                        type="text"
                        class="form-control"
                        name = "memail"
                         value = "${userInfo.memail}"
                        placeholder="<spring:message code = "mypage.span.email.in" />"
                      />
                    </div>
                    <span><spring:message code = "mypage.span.role" /></span>
                    <div class="form-group">
                   
                      <input
                        type="text"
                        class="form-control"
                         name = "mrole"
                        value="${userInfo.mrole}"
                        readonly
                      />
                    </div>
                    <div class="form-group updateUserBtn">
                 
                      <input
                        type="submit"
                        value="<spring:message code = "mypage.input.confirm" />"
                        class="btn btn-primary py-3 px-5"
                      />
                    </div>
                  </div>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </section>
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
    <script src="js/deleteUser.js" id="deleteUser" userPw="${userInfo.mpw}"></script>
  </body>
</html>