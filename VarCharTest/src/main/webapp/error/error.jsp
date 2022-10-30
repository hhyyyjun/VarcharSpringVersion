<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
    <%@ taglib tagdir="/WEB-INF/tags" prefix="koala"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<link rel = "shortcut icon" href = "#">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<head>
    <title>Carbook - Free Bootstrap 4 Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/error.css" />
    
  </head>
  <body>
    <!-- 에러페이지 시작  -->
    <div id="errorPageHeaderBox">
     <a id="errorPageBrand" href="main.do">VAR<span>CHAR</span></a>
    </div>
    <div class="hero-wrap ftco-degree-bg" style="background-image: url('./images/아우디1.png');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="mainErrorMsgBox">
      <h1 class ="mainErrorMsg">요청하신 페이지를 찾을 수 없습니다...</h1>
      <h3 class = "mainErrorMsg">${exception.message}</h3>
      </div>
    <div id="errorMain">
       <button onclick="location.href='index.jsp'" id="errorMainGo">메인화면 이동</button >
	</div>
    </div>
   <koala:footer/>
    
   
</body>
</html>