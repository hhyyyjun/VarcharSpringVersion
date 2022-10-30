<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="koala" %>

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
<link rel="stylesheet" href="css/jquery.timepicker.css" />
<link rel="stylesheet" href="css/flaticon.css" />
<link rel="stylesheet" href="css/icomoon.css" />
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="css/findAccount.css" />
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
</head>
<body>
	<koala:nav/>

	<section class="hero-wrap hero-wrap-2 js-fullheight"
		style="background-image: url('images/bg_3.jpg')"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
				<div class="col-md-9 ftco-animate pb-5">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="main.do">Home <i
								class="ion-ios-arrow-forward"></i>
						</a></span> 
					</p>
					<h1 class="mb-3 bread">Find Account</h1>
				</div>
			</div>
		</div>
	</section>
	<div id="wrap">
		<div>
			
			<ul id="searchInner">
				<li id="searchId" class="searchInfo"><span><spring:message code = "findAccount.searchId" /></span></li>
				<li id="searchPassword" class="searchInfo"><span><spring:message code = "findAccount.searchPassword" /></span>
				</li>
			</ul>
		</div>
		<div id="Container">
		
			<div id="idBox">
				<form name="findId" action="/FindId.do" method="post">
					<p id="nameTitle"><spring:message code = "findAccount.nameTitle" /></p>
					
					<input name="mname" type="text" id="nameInput" placeholder="<spring:message code = "findAccount.nameTitle" />"
						autocomplete="off" />
					<p id="emailTitleForId"><spring:message code = "findAccount.emailTitleForId" /></p>
					<div id="certificateInnerForId">
				
						<input name="memail" type="text" id="emailInputForId"
							placeholder="<spring:message code = "findAccount.emailTitleForId" />" autocomplete="off" />
					
						<button type="button" id="certificateBtnForId"><spring:message code = "findAccount.certificateBtnForId" /></button>
					</div>
					<div id="checkResultBox">
						<span id="checkResult"></span>
					</div>
					<div>
			
						<button type="button" id="idSearchBtn" onclick="location.href='login.do';"><spring:message code = "findAccount.idSearchBtn" /></button>
					</div>
				</form>
			
				<div id="phoneMsg">
					<p><spring:message code = "findAccount.phoneMsg" /></p>
				</div>
			</div>
		
			<div id="passwordBox">
				<form name="findPw" action="" method="post">
					<p id="idTitle"><spring:message code = "findAccount.idTitle" /></p>
				
					<input name="mid" type="text" id="idInput" placeholder="<spring:message code = "findAccount.idTitle" />"
						autocomplete="off" />
					<p id="emailTitleForPw"><spring:message code = "findAccount.emailTitleForPw" /></p>
					<div id="certificateInnerForPw">
						
						<input name="memail" type="email" id="emailInputForPw"
							placeholder="이메일 주소" autocomplete="off" />
						
						<button type="button" id="certificateBtnForPw"><spring:message code = "findAccount.certificateBtnForPw" /></button>
					</div>
					<div id="checkResultBox">
						<span id="checkResult2"></span>
					</div>
					<div>
						
						<button type="button" id="passwordSearchBtn" onclick="location.href='login.do';"><spring:message code = "findAccount.passwordSearchBtn" />
						</button>
					</div>
				</form>
				
				<div id="emailMsg">
					<p><spring:message code = "findAccount.emailMsg" /></p>
				</div>
			</div>
			
			<div id="onlyName">
				<p><spring:message code = "findAccount.onlyName" /></p>
			</div>
		
			<div id="onlyId">
				<p><spring:message code = "findAccount.onlyId" /></p>
			</div>
			
			<div id="missing1">
				<p><spring:message code = "findAccount.missing1" /></p>
			</div>
			
			<div id="missing2">
				<p><spring:message code = "findAccount.missing2" /></p>
			</div>
		
			<div id="blank">
				<p><spring:message code = "findAccount.blank" /></p>
			</div>

			<h2 class="subLogin">
				<span><spring:message code = "findAccount.subLogin" /></span>
			</h2>
		
			<div id="registerInner">
				<a id="registerButton" href="signup.do"> <span><spring:message code = "findAccount.registerButton" /></span>
				</a>
			</div>
			<div id="moreService">
				<p>
				<spring:message code = "findAccount.moreService" /><br /><spring:message code = "findAccount.br.moreService" />
				</p>
			</div>
		</div>
		<div id="footer">
			<address>Ⓒ VARCHAR. All Rights Reserved.</address>
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
	<script src="js/findAccount.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

	<script type="text/javascript">
		//아이디 전송
	  document.getElementById("certificateBtnForId").onclick = () => {
	      const name = $("#nameInput").val(); 
		  const email = $("#emailInputForId").val();
	       console.log("로그 : name " + name);
	       console.log("로그 : email " + email );
	          $.ajax({
	             type:'POST',
	             url: '${pageContext.request.contextPath}/sendIdEmail.do',
	             data: {name:name ,email:email},
	             success: function(mid){
	                console.log("로그 mid : ["+mid+"]");
	                if(mid != null){
		                   console.log("로그 mid1 : ["+mid+"]");
	                   $('#checkResult').text("아이디 전송 완료");
	                   $('#checkResult').css("color", "blue");

	                }else{
	                   console.log("로그 mid2 : ["+mid+"]");
	                   $('#checkResult').text("아이디 전송 불가");
	                   $('#checkResult').css("color", "red");
	                }
	             }, 
	            error: function(request, status, error){ // 서블릿에서 에러 발생 시 
	               console.log("code: "+request.status);
	               console.log("message: "+request.responseText);
	               console.log("error: "+error);
	            }
	          });
		}
	  	//비밀번호 전송
	  	  document.getElementById("certificateBtnForPw").onclick = () => {
	      const mid = $("#idInput").val(); 
		  const email = $("#emailInputForPw").val();
	       console.log("로그 : mid " + mid);
	       console.log("로그 : email " + email );
	          $.ajax({
	             type:'POST',
	             url: '${pageContext.request.contextPath}/sendPwEmail.do',
	             data: {mid:mid ,email:email},
	             success: function(randomPw){ //
	                console.log("로그 mpw : ["+randomPw+"]");
	                if(randomPw != null){
		                   console.log("로그 랜덤번호 : ["+randomPw+"]");
	                   $('#checkResult2').text("비밀번호 재발행 완료");
	                   $('#checkResult2').css("color", "blue");
	                }else{
	                   console.log("로그 랜덤번호 null : ["+randomPw+"]");
	                   $('#checkResult2').text("비밀번호 재발행 불가");
	                   $('#checkResult2').css("color", "red");
	                }
	             }, 
	            error: function(request, status, error){ // 서블릿에서 에러 발생 시 
	               console.log("code: "+request.status);
	               console.log("message: "+request.responseText);
	               console.log("error: "+error);
	            }
	          });
		}
		</script>
</body>
</html>