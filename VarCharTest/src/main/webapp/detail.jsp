<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="koala" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
<head>
<title>VARCHAR</title>
 <link rel="shortcut icon" href="./images/vc.ico" >
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

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
    <link rel="stylesheet" href="css/detail.css" />
    <link rel="stylesheet" href="css/filterSearch.css" />
    
  </head>
  <body>
    <koala:nav/>
   <koala:zzim/>
    <section
      class="hero-wrap hero-wrap-2 js-fullheight"
      style="background-image: url('images/bg_3.jpg')"
      data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
          <div class="col-md-9 ftco-animate pb-5">
            <p class="breadcrumbs">
              <span class="mr-2"><a href="main.do"
                  ><spring:message code = "detail.a.smallhome" /><i class="ion-ios-arrow-forward"></i></a></span>
              
            </p>
            <h1 class="mb-3 bread"><spring:message code = "detail.h1.mb3bread" /></h1>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section ftco-car-details">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-md-12">
            <div class="car-details">
             <!-- 차량 상세정보 -->
              <div
                class="img rounded"
                style="background-image: url('${data.cimg}')">
              </div>
              <div class="text carTitle">
                <h2>${data.ctitle}</h2>
                <span class="subheading">${data.ckm}km</span>
      
                <div class="buyCar">
                   <c:choose>
                      <c:when test="${data.cprice >= 400000}">
                   
                         <h2><spring:message code = "detail.h2.reserveprice" /></h2>
                      </c:when>
             
                      <c:otherwise>
                  
                        <h2>${data.cprice}만원</h2>
                      </c:otherwise>
                   </c:choose>
             
                  <button type="submit" onclick="location.href='storeAdd.do?cnum=${data.cnum}';"><spring:message code = "detail.button.onclickzzim" /></button>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services">
              <div class="media-body py-md-4">
                <div class="d-flex mb-3 align-items-center">
                  <div
                    class="icon d-flex align-items-center justify-content-center">
                    <span class="flaticon-dashboard"></span>   
                  </div>
              	
                  <div class="text">
                    <h3 class="heading mb-0 pl-3">
                      <spring:message code = "detail.h3.headingmb0pl3.joohaeng" />
                      <span>${data.ckm}km</span>
                    </h3>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services">
              <div class="media-body py-md-4">
                <div class="d-flex mb-3 align-items-center">
                  <div
                    class="icon d-flex align-items-center justify-content-center">
                    <span class="flaticon-pistons"></span>
                  </div>
                  <div class="text">
                    <h3 class="heading mb-0 pl-3">
                      <spring:message code = "detail.h3.headingmb0pl3.price" />
                      <c:choose>
                         <c:when test="${data.cprice >= 400000}">
                            <span><spring:message code = "detail.h2.reserveprice" /></span>
                         </c:when>
                         <c:otherwise>
                         <span>${data.cprice}만원</span>
                         </c:otherwise>
                      </c:choose>
                    </h3>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services">
              <div class="media-body py-md-4">
                <div class="d-flex mb-3 align-items-center">
                  <div
                    class="icon d-flex align-items-center justify-content-center">
                    <span class="flaticon-car-seat"></span>
                  </div>
                  <div class="text">
                    <h3 class="heading mb-0 pl-3">
                      <spring:message code = "detail.h3.headingmb0pl3.age" />
                      <span>${data.cyear}</span>
                    </h3>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services">
              <div class="media-body py-md-4">
                <div class="d-flex mb-3 align-items-center">
                  <div
                    class="icon d-flex align-items-center justify-content-center">
                    <span class="flaticon-backpack"></span>
                  </div>
                  <div class="text">
                    <h3 class="heading mb-0 pl-3">
                      <spring:message code = "detail.h3.headingmb0pl3.city" />
                      <span>${data.ccity}</span>
                    </h3>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services">
              <div class="media-body py-md-4">
                <div class="d-flex mb-3 align-items-center">
                  <div
                    class="icon d-flex align-items-center justify-content-center">
                    <span class="flaticon-diesel"></span>
                  </div>
                  <div class="text">
                    <h3 class="heading mb-0 pl-3">
                     <spring:message code = "detail.h3.headingmb0pl3.fuel" />
                      <span>${data.cfuel}</span>
                    </h3>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12 pills">
            <div class="bd-example bd-example-tabs">
              <div class="d-flex justify-content-center">
                <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                 
                  <li class="nav-item">
                
                    <a
                      class="nav-link"
                      id="pills-manufacturer-tab"
                      data-toggle="pill"
                      href="#pills-manufacturer"
                      role="tab"
                      aria-controls="pills-manufacturer"
                      aria-expanded="true"><spring:message code = "detail.navlink.pillsmanufacturer" /></a>
                  </li>
                  <li class="nav-item">
                  
                    <a
                      class="nav-link"
                      id="pills-review-tab"
                      data-toggle="pill"
                      href="#pills-review"
                      role="tab"
                      aria-controls="pills-review"
                      aria-expanded="true"><spring:message code = "detail.navlink.pillsreview" /></a>
                  </li>
                </ul>
              </div>

              <div class="tab-content" id="pills-tabContent">
				
                <div
                  class="tab-pane fade"
                  id="pills-manufacturer"
                  role="tabpanel"
                  aria-labelledby="pills-manufacturer-tab">
                  <div class = "moredetail" style="text-align: center;">
                  <p>
                  <h4 class="ex"><spring:message code = "detail.h4.ex.cardetail" /> : [${data.csubtitle}] </h4>
                  <br>
                  </p>
                  <p> 
                     <h4 class="ex"><spring:message code = "detail.h4.ex.dealercare" /></h4>
                     <br>
                     <h4 class="ex"> [${data.ctitle}] <spring:message code = "detail.h4.ex.dealeropinion" /></h4>
                     <br>
                  </p>
                 <br><br>
                  </div>
                  <h4 class="exam"> <${data.ctitle}> <spring:message code = "detail.h4.exam.checkresult" /></h4>
                  <br><br>
                  <div class = "globisPicture">
                     <img alt="현대글로비스 좌측사진" src="https://autobell.co.kr/images/contents/suv-panel.png">
                  <div class = "detail-carlist-left">
                                      <ul>
       <li><spring:message code = "detail.li.detailcarlistleft.hood" /></li>						
      	<li><spring:message code = "detail.li.detailcarlistleft.front" /></li>
        	<li><spring:message code = "detail.li.detailcarlistleft.door" /></li>
          <li><spring:message code = "detail.li.detailcarlistleft.sidepanel" /></li>
                 	<li><spring:message code = "detail.li.detailcarlistleft.hood" /></li>
                     	<li><spring:message code = "detail.li.detailcarlistleft.roof" /></li>
                                 	<li><spring:message code = "detail.li.detailcarlistleft.quarter" /></li>
                                 </ul>
                                
                                 <ol class = "detail-carlist-left-ol">
                                 	<li><spring:message code = "detail.ol.detailcarlistleftol" /></li>
                                 	<li><spring:message code = "detail.ol.detailcarlistleftol" /></li>
                                 	<li><spring:message code = "detail.ol.detailcarlistleftol" /></li>
                                 	<li><spring:message code = "detail.ol.detailcarlistleftol" /></li>
                                 	<li><spring:message code = "detail.ol.detailcarlistleftol" /></li>
                                 	<li><spring:message code = "detail.ol.detailcarlistleftol" /></li>
                                 	<li><spring:message code = "detail.ol.detailcarlistleftol" /></li>
                                 </ol>
                                </div>
                     		   </div>      
                  <div><hr></div>
                  <div class = "globisPicture">
                     <img alt="현대글로비스 우측사진" src="https://autobell.co.kr/images/contents/suv-frame.png">
                       <div class = "detail-carlist-right">
                                      <ul>
                                 	<li><spring:message code = "detail.li.detailcarlistright.front" /></li>						
                                 	<li><spring:message code = "detail.li.detailcarlistright.cross" /></li>
                                 	<li><spring:message code = "detail.li.detailcarlistright.inside" /></li>
                                 	<li><spring:message code = "detail.li.detailcarlistright.sidemember" /></li>
                                 	<li><spring:message code = "detail.li.detailcarlistright.wheel" /></li>
                                 	<li><spring:message code = "detail.li.detailcarlistright.package" /></li>
                                 	<li><spring:message code = "detail.li.detailcarlistright.dash" /></li>
                                 	<li><spring:message code = "detail.li.detailcarlistright.floor" /></li>
                                 	<li><spring:message code = "detail.li.detailcarlistright.piller" /></li>
                                 </ul>
                                 
                                 <ol class = "detail-carlist-right-ol">
                                 	<li><spring:message code = "detail.ol.detailcarlistleftol" /></li>
                                 	<li><spring:message code = "detail.ol.detailcarlistleftol" /></li>
                                 	<li><spring:message code = "detail.ol.detailcarlistleftol" /></li>
                                 	<li><spring:message code = "detail.ol.detailcarlistleftol" /></li>
                                 	<li><spring:message code = "detail.ol.detailcarlistleftol" /></li>
                                 	<li><spring:message code = "detail.ol.detailcarlistleftol" /></li>
                                 	<li><spring:message code = "detail.ol.detailcarlistleftol" /></li>
                                 	<li><spring:message code = "detail.ol.detailcarlistleftol" /></li>
                                 	<li><spring:message code = "detail.ol.detailcarlistleftol" /></li>
                                 </ol>
                                </div>
                               </div>

                <hr>
                  <div class = "detail-ment-background">
                   <h5 class = "detail-ment">
                           <spring:message code = "detail.h5.detailmentone" /><br>
                     <spring:message code = "detail.h5.detailmenttwo" /><br>
                   </h5>                 
                        <span >
                     <spring:message code = "detail.span.detailmentthree" /><br>
                     <spring:message code = "detail.span.detailmentfour" />
                        </span>
                  </div>
                        <br><br><br>
                        <div class = "detail-logo">
                        <strong>
                        <spring:message code = "detail.strong.beforement" /> <a href="main.do"><img alt="로고" src="./images/VARCHARWHITE.png"></a> <spring:message code = "detail.strong.afterment" />
                        </strong> 
                        </div>
                </div>
				
                <div
                  class="tab-pane fade"
                  id="pills-review"
                  role="tabpanel"
                  aria-labelledby="pills-review-tab">
                  <div class="row">
                    <div class="col-md-7">
                      <h3 class="head"><spring:message code = "detail.h3.head.dealerthree" /></h3>
                      <div class="review d-flex">
                        <div class="user-img1"></div>
                        <div class="desc">
                          <h4>
                            <span class="text-left">이준선</span>
                            <span class="text-right"></span>
                          </h4>
                          <p>
                            <spring:message code = "detail.p.beforeleement" /> ${data.ctitle} <spring:message code = "detail.p.afterleement" />
                          </p>
                        </div>
                      </div>
                      <div class="review d-flex">
                        <div class="user-img2"></div>
                        <div class="desc">
                          <h4>
                            <span class="text-left">황지민</span>
                            <span class="text-right"></span>
                          </h4>
                          <p>
                            ${data.ctitle} <spring:message code = "detail.p.hwangment"></spring:message>
                          </p>
                        </div>
                      </div>
                      <div class="review d-flex">
                        <div class="user-img3"></div>
                        <div class="desc">
                          <h4>
                            <span class="text-left">김종현</span>
                            <span class="text-right"></span>
                          </h4>
                          
                            <span class="text-right"
                              ></span>
                         
                          <p>
                           <spring:message code = "detail.p.beforekimment" /> ${data.ctitle} <spring:message code = "detail.p.afterkimment" />
                          </p>
                        </div>
                      </div>
                    </div>
                    <div class="col-md-5">
                    
                      <div class="rating-wrap">
                        <h3 class="head"><spring:message code = "detail.h3.head.askdealer" /></h3>
                        <div class="wrap">
                          <h5><spring:message code = "detail.h5.askcar" /></h5>
                          <br>
                          <h6><spring:message code = "detail.h6.carname" />  ${data.ctitle}</h6>
                          <br>
                          
                          <h6><spring:message code = "detail.h6.getcarstore" />  ${data.ccity}</h6>
                          <br>
                          <div><a href="board.jsp">WHERE IS VARCHAR ?</a><br>
                          <spring:message code = "detail.div.gomap" /></div>
                          <br>
                          <div><a href="board.jsp" class="btn btn-primary py-2 mr-1 QnABtn"><spring:message code = "detail.a.qna" /></a></div>
                         
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    
    <section style="text-align: center;" class="ftco-section ftco-no-pt">
      	<div class = "moveSiteBtn">
        <a href="javascript:history.back();" class="btn btn-primary py-2 mr-1"><spring:message code = "detail.a.btnbtnprimarypy2mr1.back" /></a>
        <a href="main.do" class="btn btn-primary py-2 mr-1"><spring:message code = "detail.a.btnbtnprimarypy2mr1.gomain" /></a>
 		</div>
   </section>
   
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
    <script src="js/cartOpenner.js"></script>
  </body>
</html>