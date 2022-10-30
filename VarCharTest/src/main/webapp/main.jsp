<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="koala"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
 <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
 
<!DOCTYPE html>
<html>
<head>
<title>VARCHAR</title>
<link rel="shortcut icon" href="./images/vc.ico">
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/aos.css">
<link rel="stylesheet" href="css/ionicons.min.css">
<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<link rel="stylesheet" href="css/jquery.timepicker.css">
<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/icomoon.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/filterSearch.css" />

<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
</head>
<body>
	
	<koala:nav />
	<koala:zzim />

	<div class="hero-wrap ftco-degree-bg"
		style="background-image: url('images/bg_1.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text justify-content-start align-items-center justify-content-center">
				<div class="col-lg-8 ftco-animate">
					<div class="text w-100 text-center mb-md-5 pb-md-5">
						<h1 class="mb-4"><spring:message code = "main.h1.mb4" /></h1>
						<p class="topSubTitle"><spring:message code = "main.p.topSubTitle" /></p>
					
					</div>
				</div>
			</div>
		</div>
	</div>

	<section class="ftco-section ftco-no-pt bg-light">
		<div class="container">
			<div class="row no-gutters">
				<div class="col-md-12   featured-top">
					<div class="row no-gutters">
						<div class="col-md-4 d-flex align-items-center">

						
							<form action="filter.do"
								class="request-form ftco-animate bg-primary mainFilterBox">
								<h2 class="mainFilterTitle"><spring:message code = "main.h2.mainFilterTitle" /></h2>
								
							
								<div class="form-group">
									<label for="" class="label"><spring:message code = "filter.label.price" /></label>
									<div class="d-flex">
										<div class="form-group mr-2">
										
											<select name="price_min" class="form-control minSelect" id="">
												<option>0</option>
												<option>1000</option>
												<option>2000</option>
												<option>3000</option>
												<option>4000</option>
												<option>5000</option>
												<option>6000</option>
												<option>7000</option>
												<option>8000</option>
												<option>9000</option>
												<option>10000</option>
												<option>11000</option>
												<option>12000</option>
												<option>13000</option>
												<option>14000</option>
												<option>15000</option>
											</select>
										</div>
										<div class="form-group ml-2">
											<select name="price_max" class="form-control maxSelect" id="">
												<option value="2147483647"><spring:message code = "filter.option.all" /></option>
												<option>1000</option>
												<option>2000</option>
												<option>3000</option>
												<option>4000</option>
												<option>5000</option>
												<option>6000</option>
												<option>7000</option>
												<option>8000</option>
												<option>9000</option>
												<option>10000</option>
												<option>11000</option>
												<option>12000</option>
												<option>13000</option>
												<option>14000</option>
												<option>15000</option>
											</select>
										</div>
									</div>
								</div>
						
								<div class="form-group">
									<label for="" class="label"><spring:message code = "filter.label.year" /></label>
									<div class="d-flex">
										<div class="form-group mr-2">
											<select name="year_min" class="form-control minSelect" id="">
												<option>2000</option>
												<option>2001</option>
												<option>2002</option>
												<option>2003</option>
												<option>2004</option>
												<option>2005</option>
												<option>2006</option>
												<option>2007</option>
												<option>2008</option>
												<option>2009</option>
												<option>2010</option>
												<option>2011</option>
												<option>2012</option>
												<option>2013</option>
												<option>2014</option>
												<option>2015</option>
												<option>2016</option>
												<option>2017</option>
												<option>2018</option>
												<option>2019</option>
												<option>2020</option>
												<option>2021</option>
												<option>2022</option>
											</select>
										</div>
										<div class="form-group ml-2">
											<select name="year_max" class="form-control maxSelect" id="">
												<option value="2023"><spring:message code = "filter.option.all" /></option>
												<option>2001</option>
												<option>2002</option>
												<option>2003</option>
												<option>2004</option>
												<option>2005</option>
												<option>2006</option>
												<option>2007</option>
												<option>2008</option>
												<option>2009</option>
												<option>2010</option>
												<option>2011</option>
												<option>2012</option>
												<option>2013</option>
												<option>2014</option>
												<option>2015</option>
												<option>2016</option>
												<option>2017</option>
												<option>2018</option>
												<option>2019</option>
												<option>2020</option>
												<option>2021</option>
												<option>2022</option>
											</select>
										</div>
									</div>
								</div>
								
								<div class="form-group mainFuelFilter">
									<label for="" class="label"><spring:message code = "filter.label.fuel" /></label>
									<select name="fuel" class="form-control" id="">
										<option selected><spring:message code = "filter.option.all" /></option>
										<option><spring:message code = "filter.option.gasoline" /></option>
										<option><spring:message code = "filter.option.electric" /></option>
										<option><spring:message code = "filter.option.diesel" /></option>
									</select>
								</div>
							
								<div class="form-group mainRegionFilter">
									<label for="" class="label"><spring:message code = "filter.label.city" /></label>
									<select name="city" class="form-control" id="">
										<option selected><spring:message code = "filter.option.all" /></option>
										<option><spring:message code = "filter.option.seoul" /></option>
										<option><spring:message code = "filter.option.gyeonggi" /></option>
										<option><spring:message code = "filter.option.incheon" /></option>
										<option><spring:message code = "filter.option.daejeon" /></option>
										<option><spring:message code = "filter.option.daegu" /></option>
										<option><spring:message code = "filter.option.ulsan" /></option>
										<option><spring:message code = "filter.option.busan" /></option>
										<option><spring:message code = "filter.option.gwangju" /></option>
										<option><spring:message code = "filter.option.gangwon" /></option>
										<option><spring:message code = "filter.option.chungbuk" /></option>
										<option><spring:message code = "filter.option.chungnam" /></option>
										<option><spring:message code = "filter.option.gyeongbuk" /></option>
										<option><spring:message code = "filter.option.gyeongnam" /></option>
										<option><spring:message code = "filter.option.jeonbuk" /></option>
										<option><spring:message code = "filter.option.jeonnam" /></option>
										<option><spring:message code = "filter.option.jaeju" /></option>
										<option><spring:message code = "filter.option.sejong" /></option>
									</select>
								</div>
							
								<input type="hidden" name="min-value" value="1000" /> <input
									type="hidden" name="max-value" value="700000" /> <input
									type="hidden" name="sort" value="최신순" />
									
								<div class="form-group">
									<input type="submit" value="상세조건 검색"
										class="btn btn-secondary py-3 px-4 mainFilterBtn" />
								</div>
							</form>
						</div>
						<div class="col-md-8 d-flex align-items-center">
							<div class="services-wrap rounded-right w-100 mainService">
								<h3 class="heading-section mb-4 startWithVarchar"><spring:message code = "main.h3.headingsection" /></h3>
								<div class="row d-flex mb-4">
									<div class="col-md-4 d-flex align-self-stretch ftco-animate">
										<div class="services w-100 text-center">
											<div
												class="icon d-flex align-items-center justify-content-center">
												<span class="flaticon-route"></span>
											</div>
											<div class="text w-100">
												<h3 class="heading mb-2"><spring:message code = "main.h3.closedStore" /></h3>
											</div>
										</div>
									</div>
									<div class="col-md-4 d-flex align-self-stretch ftco-animate">
										<div class="services w-100 text-center">
											<div
												class="icon d-flex align-items-center justify-content-center">
												<span class="flaticon-handshake"></span>
											</div>
											<div class="text w-100">
												<h3 class="heading mb-2"><spring:message code = "main.h3.recommend" /></h3>
											</div>
										</div>
									</div>
									<div class="col-md-4 d-flex align-self-stretch ftco-animate">
										<div class="services w-100 text-center">
											<div
												class="icon d-flex align-items-center justify-content-center">
												<span class="flaticon-rent"></span>
											</div>
											<div class="text w-100">
												<h3 class="heading mb-2"><spring:message code = "main.h3.youNeedCar" /></h3>
											</div>
										</div>
									</div>
								</div>
								<p class="mainServiceMsg">
								
									<a href="boardMain.do" class="btn btn-primary py-3 px-4"><spring:message code = "main.h3.question" /></a>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
	</section>

	<section class="ftco-counter ftco-section img bg-light"
		id="section-counter">

		<div class="container">
			<div class="row">
				<div
					class="col-md-6 col-lg-3 justify-content-center counter-wrap ftco-animate">
					<div class="block-18">
						<div class="text text-border d-flex align-items-center">
							<strong class="number" data-number="127">0</strong> <span><spring:message code = "main.span.tradeOneYear" /></span>
						</div>
					</div>
				</div>
				<div
					class="col-md-6 col-lg-3 justify-content-center counter-wrap ftco-animate">
					<div class="block-18">
						<div class="text text-border d-flex align-items-center">
							<strong class="number" data-number="${countC}">0</strong> <span><spring:message code = "main.span.tradeAll" /></span>
						</div>
					</div>
				</div>
				<div
					class="col-md-6 col-lg-3 justify-content-center counter-wrap ftco-animate">
					<div class="block-18">
						<div class="text text-border d-flex align-items-center">
							<strong class="number" data-number="${countM}">0</strong> <span><spring:message code = "main.span.userNumber" /></span>
						</div>
					</div>
				</div>
				<div
					class="col-md-6 col-lg-3 justify-content-center counter-wrap ftco-animate">
					<div class="block-18">
						<div class="text d-flex align-items-center">
							<strong class="number" data-number="${countC}">0</strong> <span><spring:message code = "main.span.filteredItem" /></span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<section class="ftco-section ftco-no-pt bg-light">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-12 heading-section text-center ftco-animate mb-5">
					<h2 class="mb-2"><spring:message code = "main.h2.mb2" /></h2>
					<span class="subheading"><spring:message code = "main.span.subHeading" /></span>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="carousel-car owl-carousel">
						<koala:recommend />
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section ftco-intro"
		style="background-image: url(images/bg_3.jpg);">
		<div class="overlay"></div>
		<div class="container">
			<div class="row justify-content-end">
				<div
					class="col-md-6 heading-section heading-section-white ftco-animate">
					<h2 class="mb-3"><spring:message code = "main.h2.mb3" /></h2>
				
					<c:if test="${userId == null}">
						<div class="beMember">
				
							<a href="login.do" class="btn btn-primary btn-lg"><spring:message code = "main.a.signin" /></a> <a
								href="signup.do" class="btn btn-primary btn-lg"><spring:message code = "main.a.signup" /></a>
						</div>
					</c:if>

				</div>
			</div>
		</div>
	</section>
	
	<section class="ftco-section">
		<div class="container">

			<div class="row justify-content-center mb-5">
				<div class="col-md-7 heading-section text-center ftco-animate">
					<span class="subheading"><spring:message code = "main.span.QA" /></span>
					<h2><spring:message code = "main.h2.service" /></h2>
				</div>
			</div>
			<div class="row d-flex">
				<koala:recentBoard />
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
	<script src="js/cartOpenner.js"></script>
	<script src="js/selectOption.js"></script>
	
</body>
</html>