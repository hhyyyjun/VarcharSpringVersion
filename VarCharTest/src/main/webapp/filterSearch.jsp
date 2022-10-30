<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="koala"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
<head>
<title>VARCHAR</title>
 <link rel="shortcut icon" href="./images/vc.ico" >
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link rel="shortcut icon" href="./images/vc.ico" >
<link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet" />
<link rel="stylesheet" href="css/open-iconic-bootstrap.min.css" />
<link rel="stylesheet" href="css/animate.css" />
<link rel="stylesheet" href="css/owl.carousel.min.css" />
<link rel="stylesheet" href="css/owl.theme.default.min.css" />
<link rel="stylesheet" href="css/magnific-popup.css" />
<link rel="stylesheet" href="css/aos.css" />
<link rel="stylesheet" href="css/ionicons.min.css" />
<link rel="stylesheet" href="css/bootstrap-datepicker.css" />
<link rel="stylesheet" href="css/flaticon.css" />
<link rel="stylesheet" href="css/icomoon.css" />
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="css/filterSearch.css" />
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
                  <span class="mr-2"><a href="main.do">Home <i
                        class="ion-ios-arrow-forward"></i>
                  </a></span> 
               </p>
               <h1 class="mb-3 bread"><spring:message code = "filtersearch.h1.mb3bread.choose" /></h1>
            </div>
         </div>
      </div>
   </section>

   <section class="ftco-section bg-light">
      <div class="filterOpenner">
         <strong><spring:message code = "filtersearch.strong.filteropen" /></strong>
      </div>
    
      <div class="filterContainer">
         <div class="filterCloser">
            <h2 class="filterTitle"><spring:message code = "filtersearch.h2.filtertitle" /></h2>
          
         </div>
         <hr />
        
         <form action="filter.do" method="get">
            <div class="filterBox hideFilter">
               <div class="filterBoxTitle">
                  <label><spring:message code = "filtersearch.label.carlineup" /></label> <i class="openArrow"><img
                     src="images/down_arrow.png" alt="down arrow" /></i>
               </div>
               <select name="checksort" id="sort">
               
                  <option <c:if test="${sort== '최신순'}">selected='selected'</c:if>><spring:message code = "filtersearch.option.new" /></option>
                  <option <c:if test="${sort == '제목순정렬'}">selected='selected'</c:if>><spring:message code = "filtersearch.option.title" /></option>
                  <option <c:if test="${sort == '가격순정렬'}">selected='selected'</c:if>><spring:message code = "filtersearch.option.price" /></option>
                  <option <c:if test="${sort == '주행거리순'}">selected='selected'</c:if>><spring:message code = "filtersearch.option.km" /></option>
               </select>
            </div>
            <hr />
          
            <div class="filterBox hideFilter">
               <div class="filterBoxTitle">
                  <label><spring:message code = "filtersearch.label.carage" /></label> <i class="openArrow"><img
                     src="images/down_arrow.png" alt="down arrow" /></i>
               </div>
             
               <select name="year_min" class="minSelect" id="ymin">
                  <option <c:if test="${ymin == 2000}">selected='selected'</c:if>>2000</option>
                  <option <c:if test="${ymin == 2001}">selected='selected'</c:if>>2001</option>
                  <option <c:if test="${ymin == 2002}">selected='selected'</c:if>>2002</option>
                  <option <c:if test="${ymin == 2003}">selected='selected'</c:if>>2003</option>
                  <option <c:if test="${ymin == 2004}">selected='selected'</c:if>>2004</option>
                  <option <c:if test="${ymin == 2005}">selected='selected'</c:if>>2005</option>
                  <option <c:if test="${ymin == 2006}">selected='selected'</c:if>>2006</option>
                  <option <c:if test="${ymin == 2007}">selected='selected'</c:if>>2007</option>
                  <option <c:if test="${ymin == 2008}">selected='selected'</c:if>>2008</option>
                  <option <c:if test="${ymin == 2009}">selected='selected'</c:if>>2009</option>
                  <option <c:if test="${ymin == 2010}">selected='selected'</c:if>>2010</option>
                  <option <c:if test="${ymin == 2011}">selected='selected'</c:if>>2011</option>
                  <option <c:if test="${ymin == 2012}">selected='selected'</c:if>>2012</option>
                  <option <c:if test="${ymin == 2013}">selected='selected'</c:if>>2013</option>
                  <option <c:if test="${ymin == 2014}">selected='selected'</c:if>>2014</option>
                  <option <c:if test="${ymin == 2015}">selected='selected'</c:if>>2015</option>
                  <option <c:if test="${ymin == 2016}">selected='selected'</c:if>>2016</option>
                  <option <c:if test="${ymin == 2017}">selected='selected'</c:if>>2017</option>
                  <option <c:if test="${ymin == 2018}">selected='selected'</c:if>>2018</option>
                  <option <c:if test="${ymin == 2019}">selected='selected'</c:if>>2019</option>
                  <option <c:if test="${ymin == 2020}">selected='selected'</c:if>>2020</option>
                  <option <c:if test="${ymin == 2021}">selected='selected'</c:if>>2021</option>
                  <option <c:if test="${ymin == 2022}">selected='selected'</c:if>>2022</option>
               </select> <span class="between"> ~</span> <select name="year_max" class="maxSelect" id = "ymax">
                  <option value="3000"><spring:message code = "filtersearch.option.wholeage" /></option>
                  <option <c:if test="${ymax == 2001}">selected='selected'</c:if>>2001</option>
                  <option <c:if test="${ymax == 2002}">selected='selected'</c:if>>2002</option>
                  <option <c:if test="${ymax == 2003}">selected='selected'</c:if>>2003</option>
                  <option <c:if test="${ymax == 2004}">selected='selected'</c:if>>2004</option>
                  <option <c:if test="${ymax == 2005}">selected='selected'</c:if>>2005</option>
                  <option <c:if test="${ymax == 2006}">selected='selected'</c:if>>2006</option>
                  <option <c:if test="${ymax == 2007}">selected='selected'</c:if>>2007</option>
                  <option <c:if test="${ymax == 2008}">selected='selected'</c:if>>2008</option>
                  <option <c:if test="${ymax == 2009}">selected='selected'</c:if>>2009</option>
                  <option <c:if test="${ymax == 2010}">selected='selected'</c:if>>2010</option>
                  <option <c:if test="${ymax == 2011}">selected='selected'</c:if>>2011</option>
                  <option <c:if test="${ymax == 2012}">selected='selected'</c:if>>2012</option>
                  <option <c:if test="${ymax == 2013}">selected='selected'</c:if>>2013</option>
                  <option <c:if test="${ymax == 2014}">selected='selected'</c:if>>2014</option>
                  <option <c:if test="${ymax == 2015}">selected='selected'</c:if>>2015</option>
                  <option <c:if test="${ymax == 2016}">selected='selected'</c:if>>2016</option>
                  <option <c:if test="${ymax == 2017}">selected='selected'</c:if>>2017</option>
                  <option <c:if test="${ymax == 2018}">selected='selected'</c:if>>2018</option>
                  <option <c:if test="${ymax == 2019}">selected='selected'</c:if>>2019</option>
                  <option <c:if test="${ymax == 2020}">selected='selected'</c:if>>2020</option>
                  <option <c:if test="${ymax == 2021}">selected='selected'</c:if>>2021</option>
                  <option <c:if test="${ymax == 2022}">selected='selected'</c:if>>2022</option>
               </select>
            </div>
            <hr />

            <div class="filterBox hideFilter">
               <div class="filterBoxTitle">
                  <label><spring:message code = "filtersearch.label.fuel" /></label> <i class="openArrow"><img
                     src="images/down_arrow.png" alt="down arrow" /></i>
               </div>
			  
               <ul id="fuelFilter">
                  <li><span> <input type="checkbox" value="<spring:message code = "filtersearch.option.wholeage" />"
                        name="fuel"
                        <c:if test="${fList.contains('전체')}">checked='checked'</c:if> />
                        <label class="fuel"><spring:message code = "filtersearch.option.wholeage" /></label>
                  </span></li>
                  <li><span> <input type="checkbox" value="<spring:message code = "filtersearch.label.gasoline" />"
                        name="fuel"
                        <c:if test="${fList.contains('가솔린')}">checked='checked'</c:if> />
                        <label class="fuel"><spring:message code = "filtersearch.label.gasoline" /></label>
                  </span></li>
                  <li><span> <input type="checkbox" value="<spring:message code = "filtersearch.label.diesel" />"
                        name="fuel"
                        <c:if test="${fList.contains('디젤')}">checked='checked'</c:if> />
                        <label class="fuel"><spring:message code = "filtersearch.label.diesel" /></label>
                  </span></li>
                  <li><span> <input type="checkbox" value="LPG"
                  name="fuel"
                  <c:if test="${fList.contains('LPG')}">checked='checked'</c:if> />
                  <label class="fuel">LPG</label>
            </span></li>
                  <li><span> <input type="checkbox" value="<spring:message code = "filtersearch.label.elec" />"
                        name="fuel"
                        <c:if test="${fList.contains('전기')}">checked='checked'</c:if> />
                        <label class="fuel"><spring:message code = "filtersearch.label.elec" /></label>
                  </span></li>
               </ul>
            </div>
            <hr />
      
            <div class="filterBox hideFilter">
               <div class="filterBoxTitle">
                  <label><spring:message code = "filtersearch.label.carkm" /></label> <i class="openArrow"><img
                     src="images/down_arrow.png" alt="down arrow" /></i>
               </div>
               
               <div class="slideContainer">
                  <div>
                     <div class="col-sm-12">
                        <div id="slider-range"></div>
                     </div>
                  </div>
                  <div class="slider-labels">
                     <div>
                   
                        <strong><spring:message code = "filtersearch.strong.min" /> :&nbsp;&nbsp;</strong> <span id="slider-range-value1"></span>&nbsp;&nbsp;km
                     </div>
                     <div>
                        <strong><spring:message code = "filtersearch.strong.max" /> :&nbsp;&nbsp;</strong> <span id="slider-range-value2"></span>&nbsp;&nbsp;km
                     </div>
                  </div>
                  <div>
                     <div class="col-sm-12">
                        <input type="hidden" name="km_min" value="" /> <input
                           type="hidden" name="km_max" value="" />
                     </div>
                  </div>
               </div>
            </div>
            <hr />
           
            <div class="filterBox hideFilter">
               <div class="filterBoxTitle">
                  <label><spring:message code = "filtersearch.label.carprice" /></label> <i class="openArrow"><img
                     src="images/down_arrow.png" alt="down arrow" /></i>
               </div>

               <select name="price_min" class="minSelect" id = "pmin">
                  <option <c:if test="${pmin == 0}">selected='selected'</c:if>>0</option>
                  <option <c:if test="${pmin == 1000}">selected='selected'</c:if>>1000</option>
                  <option <c:if test="${pmin == 2000}">selected='selected'</c:if>>2000</option>
                  <option <c:if test="${pmin == 3000}">selected='selected'</c:if>>3000</option>
                  <option <c:if test="${pmin == 4000}">selected='selected'</c:if>>4000</option>
                  <option <c:if test="${pmin == 5000}">selected='selected'</c:if>>5000</option>
                  <option <c:if test="${pmin == 6000}">selected='selected'</c:if>>6000</option>
                  <option <c:if test="${pmin == 7000}">selected='selected'</c:if>>7000</option>
                  <option <c:if test="${pmin == 8000}">selected='selected'</c:if>>8000</option>
                  <option <c:if test="${pmin == 9000}">selected='selected'</c:if>>9000</option>
                  <option <c:if test="${pmin == 10000}">selected='selected'</c:if>>10000</option>
                  <option <c:if test="${pmin == 11000}">selected='selected'</c:if>>11000</option>
                  <option <c:if test="${pmin == 12000}">selected='selected'</c:if>>12000</option>
                  <option <c:if test="${pmin == 13000}">selected='selected'</c:if>>13000</option>
                  <option <c:if test="${pmin == 14000}">selected='selected'</c:if>>14000</option>
                  <option <c:if test="${pmin == 15000}">selected='selected'</c:if>>15000</option>
               </select> <span class="between"> ~</span> <select name="price_max" class="maxSelect" id = "pmax">
                  <option value="2147483647"><spring:message code = "filtersearch.label.wholeregion" /></option>
                  <option <c:if test="${pmax == 1000}">selected='selected'</c:if>>1000</option>
                  <option <c:if test="${pmax == 2000}">selected='selected'</c:if>>2000</option>
                  <option <c:if test="${pmax == 3000}">selected='selected'</c:if>>3000</option>
                  <option <c:if test="${pmax == 4000}">selected='selected'</c:if>>4000</option>
                  <option <c:if test="${pmax == 5000}">selected='selected'</c:if>>5000</option>
                  <option <c:if test="${pmax == 6000}">selected='selected'</c:if>>6000</option>
                  <option <c:if test="${pmax == 7000}">selected='selected'</c:if>>7000</option>
                  <option <c:if test="${pmax == 8000}">selected='selected'</c:if>>8000</option>
                  <option <c:if test="${pmax == 9000}">selected='selected'</c:if>>9000</option>
                  <option <c:if test="${pmax == 10000}">selected='selected'</c:if>>10000</option>
                  <option <c:if test="${pmax == 11000}">selected='selected'</c:if>>11000</option>
                  <option <c:if test="${pmax == 12000}">selected='selected'</c:if>>12000</option>
                  <option <c:if test="${pmax == 13000}">selected='selected'</c:if>>13000</option>
                  <option <c:if test="${pmax == 14000}">selected='selected'</c:if>>14000</option>
                  <option <c:if test="${pmax == 15000}">selected='selected'</c:if>>15000</option>
               </select>
            </div>
            <hr />
            <div class="filterBox hideFilter">
               <div class="filterBoxTitle">
                  <label><spring:message code = "filtersearch.label.carregion" /></label> <i class="openArrow"><img
                     src="images/down_arrow.png" alt="down arrow" /></i>
               </div>
				
               <ul id="regionFilter">
                  <li><span> <input type="checkbox" value="전체"
                        name="city"
                        <c:if test="${cList.contains('전체')}">checked='checked'</c:if> />
                        <label class="region"><spring:message code = "filtersearch.label.wholeregion" /></label>
                  </span></li>
                  <li><span> <input type="checkbox" value="서울"
                        name="city"
                        <c:if test="${cList.contains('서울')}">checked='checked'</c:if> />
                        <label class="region">서울</label>
                  </span></li>
                  <li><span> <input type="checkbox" value="경기"
                        name="city"
                        <c:if test="${cList.contains('경기')}">checked='checked'</c:if> />
                        <label class="region">경기</label>
                  </span></li>
                  <li><span> <input type="checkbox" value="인천"
                        name="city"
                        <c:if test="${cList.contains('인천')}">checked='checked'</c:if> />
                        <label class="region">인천</label>
                  </span></li>
                  <li><span> <input type="checkbox" value="강원"
                        name="city"
                        <c:if test="${cList.contains('강원')}">checked='checked'</c:if> />
                        <label class="region">강원</label>
                  </span></li>
                  <li><span> <input type="checkbox" value="충북"
                        name="city"
                        <c:if test="${cList.contains('충북')}">checked='checked'</c:if> />
                        <label class="region">충북</label>
                  </span></li>
                  <li><span> <input type="checkbox" value="충남"
                        name="city"
                        <c:if test="${cList.contains('충남')}">checked='checked'</c:if> />
                        <label class="region">충남</label>
                  </span></li>
                  <li><span> <input type="checkbox" value="대전"
                        name="city"
                        <c:if test="${cList.contains('대전')}">checked='checked'</c:if> />
                        <label class="region">대전</label>
                  </span></li>
                  <li><span> <input type="checkbox" value="세종"
                        name="city"
                        <c:if test="${cList.contains('세종')}">checked='checked'</c:if> />
                        <label class="region">세종</label>
                  </span></li>
                  <li><span> <input type="checkbox" value="경북"
                        name="city"
                        <c:if test="${cList.contains('경북')}">checked='checked'</c:if> />
                        <label class="region">경북</label>
                  </span></li>
                  <li><span> <input type="checkbox" value="경남"
                        name="city"
                        <c:if test="${cList.contains('경남')}">checked='checked'</c:if> />
                        <label class="region">경남</label>
                  </span></li>
                  <li><span> <input type="checkbox" value="대구"
                        name="city"
                        <c:if test="${cList.contains('대구')}">checked='checked'</c:if> />
                        <label class="region">대구</label>
                  </span></li>
                  <li><span> <input type="checkbox" value="부산"
                        name="city"
                        <c:if test="${cList.contains('부산')}">checked='checked'</c:if> />
                        <label class="region">부산</label>
                  </span></li>
                  <li><span> <input type="checkbox" value="울산"
                        name="city"
                        <c:if test="${cList.contains('울산')}">checked='checked'</c:if> />
                        <label class="region">울산</label>
                  </span></li>
                  <li><span> <input type="checkbox" value="전북"
                        name="city"
                        <c:if test="${cList.contains('전북')}">checked='checked'</c:if> />
                        <label class="region">전북</label>
                  </span></li>
                  <li><span> <input type="checkbox" value="전남"
                        name="city"
                        <c:if test="${cList.contains('전남')}">checked='checked'</c:if> />
                        <label class="region">전남</label>
                  </span></li>
                  <li><span> <input type="checkbox" value="광주"
                        name="city"
                        <c:if test="${cList.contains('광주')}">checked='checked'</c:if> />
                        <label class="region">광주</label>
                  </span></li>
                  <li><span> <input type="checkbox" value="제주"
                        name="city"
                        <c:if test="${cList.contains('제주')}">checked='checked'</c:if> />
                        <label class="region">제주</label>
                  </span></li>
               </ul>
            </div>
            <hr />
           
            <button id="submitClick" type="submit" class="filterBtn"><spring:message code = "filtersearch.button.submitclick" /></button>
            
            <button type="button" class="intializeBtn"><spring:message code = "filtersearch.button.intializebtn" /></button>
         </form>
      </div>

      <koala:zzim />
      
      <div class="container">
         <div class="row" id = "viewItems">
     <c:if test="${fn:length(datas) == 0}">
      <div id="noItems">
    
         <p><spring:message code = "filtersearch.p.noitem" /></p>
         <div id="noItemsBtn">
     
            <button id="viewAllItems" type="button" onclick="location.href='filter.do';"><spring:message code = "filtersearch.button.viewallitems" /></button>
       
            <button id="goToMain" type="button" onclick="location.href='main.do';"><spring:message code = "filtersearch.button.gotomain" /></button>   
         </div>         
      </div>
   </c:if>
  
   <c:if test="${fn:length(datas) > 0}">
         <c:forEach var="c" items="${datas}">
          <div class="col-md-4">
            <div class="car-wrap rounded ftco-animate">
            
              <div
                class="img rounded d-flex align-items-end"
              >
              <img style="width:100%;height:100%;" alt="크롤링한 페이지" src="${c.cimg}"/>
             </div>
             
              <div class="text">
                <h2 class="mb-0">
                  <a href="detail.do?cnum=${c.cnum}">${c.ctitle}</a>
                </h2>
            
                <div class="d-flex mb-3">
                  <span class="cat">${c.ckm} km</span>
              
                  <c:choose>
                     <c:when test="${c.cprice >= 400000}">
                        <p class="price ml-auto"><spring:message code = "filtersearch.p.pricemlauto.reserve" /></p>
                     </c:when>
                     <c:otherwise>
                        <p class="price ml-auto">${c.cprice}<span>만원</span></p>
                     </c:otherwise>
                  </c:choose>
                </div>
                <p class="d-flex mb-0 d-block">
              
                  <a href="storeAdd.do?cnum=${c.cnum}" class="btn btn-primary py-2 mr-1"><spring:message code = "filtersearch.a.btnbtnprimarypy2mr1.reserve" /></a>
             
                 <a href="detail.do?cnum=${c.cnum}" class="btn btn-secondary py-2 ml-1"><spring:message code = "filtersearch.a.btnbtnsecondarypy2ml1.info" /></a>
                </p>
              </div>
            </div>
          </div>
   </c:forEach>
   </c:if>   
  </div>

         <div class="row mt-5">
            <div class="col text-center">
             
              <p id = "totalAmount">  <spring:message code = "filtersearch.p.totalamountbefore" /> ${fn:length(datas)}/${totalDatas} <spring:message code = "filtersearch.p.totalamountafter" /></p>
                 <c:if test="${totalDatas > 12}">
                    <button class = "moreContent"><spring:message code = "filtersearch.button.morecontent.viewmore" /></button>
                 </c:if>
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
   	<script src="js/filterOpenner.js"></script>
   	<script src="js/cartOpenner.js"></script>
   	<script id="Slider" kmin="${kmin}" kmax="${kmax}" src="js/rangeSlider.js"></script>
   	<script src="js/selectOption.js"></script>
   	<script src="js/clickCheckbox.js"></script>
   	<script src="js/initializeFilter.js"></script>
   	<script>
   // Oracle 보여줄 상품 범위(range1 ~ range2)
   // MySQL : range1부터 range2개 만큼 상품 가져오기(비동기)
   let range1 = 0; 
 //Oracle : range = 1, range2 = 12
 // MySQL : range = 0, 더 가져올 상품 개수는 [c]에서 setting
  // let range2 = 12;
   // 페이지 출력 상품 개수
   let contentAmount = 12;
   // 더 보여줄 상품 개수
   const moreContent = 12;
                  // 더보기 버튼 클릭 --> 상품 더보기
                  document.querySelector(".moreContent").onclick = () => {
                     console.log("ajax 시작");
                     range1 += moreContent;
                  //   range2 += moreContent;
                  //   console.log("range1 = "+range1+"/ range2 = "+range2);
                  //  json 데이터 setting
                     const cityCheckbox = document.querySelectorAll("input[name='city']");
                     const fuelCheckbox = document
                           .querySelectorAll("input[name='fuel']");
                     let cityList = [];
                     let fuelList = [];
                     // 지역 setting
                     for (let i = 0; i < cityCheckbox.length; i++) {
                        if (cityCheckbox[i].checked) {
                           cityList.push(cityCheckbox[i].value);
                        }
                     }
                     console.log(cityList);
                     // 연료 setting
                     for (let i = 0; i < fuelCheckbox.length; i++) {
                        if (fuelCheckbox[i].checked) {
                           fuelList.push(fuelCheckbox[i].value);
                        }
                     }
                    console.log(fuelList);
                     // 정렬 setting
                     const sortSelect = document.getElementById("sort");
                     const sort = sortSelect.children[sortSelect.selectedIndex].value;
                     console.log(sort);
                     // 가격 setting
                     const pminSelect = document.getElementById("pmin");
                     const pmin = pminSelect.children[pminSelect.selectedIndex].value;
                     console.log(pmin);
                     const pmaxSelect = document.getElementById("pmax");
                     const pmax = pmaxSelect.children[pmaxSelect.selectedIndex].value;
                     console.log(pmax);
                     // 연식 setting
                     const yminSelect = document.getElementById("ymin");
                     const ymin = yminSelect.children[yminSelect.selectedIndex].value;
                     console.log(ymin);
                     const ymaxSelect = document.getElementById("ymax");
                     const ymax = ymaxSelect.children[ymaxSelect.selectedIndex].value;
                     console.log(ymax);
                     // 주행거리 setting
                     const kmin = document
                           .querySelector("input[name='km_min']").value;
                     console.log(kmin);
                     const kmax = document
                           .querySelector("input[name='km_max']").value;
                     console.log(kmax);
                  console.log(range1);
                  //console.log(range2);
                           $.ajax({
                              type : 'GET',
                              url : '${pageContext.request.contextPath}/showMore.do', 
                              data : {
                                 cityList : JSON.stringify(cityList),
                             //    cityList : cityList,
                                 fuelList : JSON.stringify(fuelList),
                             //    fuelList : fuelList,
                                 checksort : sort,
                                 price_min : pmin,
                                 price_max : pmax,
                                 year_min : ymin,
                                 year_max : ymax,
                                 km_min : kmin,
                                 km_max : kmax,
                                 range1 : range1,
                               //  range2 : range2,
                              },
                              success : function(result) {
                                 // dataList : 더 보여줄 상품 / result : 더보기 버튼 hiding 여부
                                 console.log(result.dataList);
                                 console.log(result.showMore);
                              //   console.log(typeof result.showMore);
                                 if (result.dataList.length == 0 ) {
                                 //   console.log("ajax로그 : 더 보여줄 결과 없음");
                                    return;
                                 } else {
                                    // 총 N개의 상품을 보고 있습니다.
                                    contentAmount += result.dataList.length;
                                    $("#totalAmount").text("총 " + contentAmount + "/${totalDatas} 개의 상품을 보고 있습니다");
                                 //   $("#totalAmount").css("font-weight", "600");
                                 //   $("#totalAmount").css("color", "#000");
                                 //   console.log("ajax로그 : 더 보여줄 결과 존재");
                                    let NodeList = "";
                           $(result.dataList).each(function() {
                              let newNode = "";
                              newNode += "<div class='col-md-4'>";
                              newNode += "<div class='car-wrap rounded'>";
                              newNode += "<div class='img rounded d-flex align-items-end'>";
                              newNode += "<img style='width:100%;height:100%;' alt='크롤링한 페이지' src=" + this.cimg + " >"; 
                              newNode += "</div>";
                              newNode += "<div class='text'>";
                              newNode += "<h2 class='mb-0'>";
                              newNode += "<a href='detail.do?cnum=" + this.cnum + "'>" + this.ctitle + "</a>";
                              newNode += "</h2>";
                              newNode += "<div class='d-flex mb-3'>";
                              newNode += "<span class='cat'>" + this.ckm + " km</span>";
                              // 상담예약 상품의 가격 저장은 2147483647
                              cprice = this.cprice >= 400000 ? "상담예약" : this.cprice + "<span>만원</span>";
                              newNode += "<p class='price ml-auto'>" + cprice + "</p>";
                              newNode += "</div>";
                              newNode += "<p class='d-flex mb-0 d-block'>";
                              newNode += "<a href='storeAdd.do?cnum=" + this.cnum + "' class='btn btn-primary py-2 mr-1'>예약 하기</a>";
                              newNode += "<a href='detail.do?cnum=" + this.cnum + "' class='btn btn-secondary py-2 ml-1' >자세한 정보</a>";
                              newNode += "</p>";
                              newNode += "</div>";
                              newNode += "</div>";
                              newNode += "</div>";
                              NodeList += newNode;
                                    })
                                    $(NodeList).appendTo($("#viewItems")); // 상품 내용 추가할 html 영역
                                 if(!result.showMore) { // 상품 모두 출력 -> 더보기 버튼 XX
                                    document.querySelector(".moreContent").style.display = "none";
                                 }
                              }
                           },
                           error : function(request, status,
                                 error) {
                              console.log("상태코드 : "
                                    + request.status);
                              console.log("오류메세지 : "
                                    + request.responseText);
                              console.log("에러 : " + error);
                           }
                        });
                  };
</script>
</body>
</html>