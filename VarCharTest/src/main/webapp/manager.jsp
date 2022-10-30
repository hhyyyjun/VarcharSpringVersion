<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="koala"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="css/manager.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>

</head>
<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
	
		<a class="navbar-brand ps-3" href="main.do">Varchar</a>
		<div id="newInput">
		
			<a href="managerClear.do">새로 등록하기</a>
		</div>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_content">
			<main>
				<div id="addCar" class="px-4">
					<div id="addCarImg">
						
						<c:set var="imgSrc" value="${data.cimg}" />
						
						<c:if test="${imgSrc ==null}">
							<img id="preview" src="images/manager.png">
						</c:if>
						
						<c:if test="${imgSrc != null}">
							<img id="preview" src="${imgSrc}">
						</c:if>
					</div>
				
					<div id="addCarInfo">
						<c:choose>
							<c:when test="${data!=null}">
								<form action="managerUpdate.do" method="post"
									enctype="multipart/form-data">
									<ul id="addCarInfoUl">
										<li><input type="hidden" name="cnum" value="${data.cnum}"></li>
										<li>차량명<input class="dataTable-input" type="text"
											name="ctitle" required value="${data.ctitle}"
											autocomplete="off"></li>
										<li>상세설명<input class="dataTable-input" type="text"
											name="csubtitle" required value="${data.csubtitle}"
											autocomplete="off"></li>
										<li>연식 <select name="cyear" class="dataTable-input"
											id="ymin">
										
										
												<option
													<c:if test="${data.cyear == 2000}">selected='selected'</c:if>>2000</option>
												<option
													<c:if test="${data.cyear == 2001}">selected='selected'</c:if>>2001</option>
												<option
													<c:if test="${data.cyear == 2002}">selected='selected'</c:if>>2002</option>
												<option
													<c:if test="${data.cyear == 2003}">selected='selected'</c:if>>2003</option>
												<option
													<c:if test="${data.cyear == 2004}">selected='selected'</c:if>>2004</option>
												<option
													<c:if test="${data.cyear == 2005}">selected='selected'</c:if>>2005</option>
												<option
													<c:if test="${data.cyear == 2006}">selected='selected'</c:if>>2006</option>
												<option
													<c:if test="${data.cyear == 2007}">selected='selected'</c:if>>2007</option>
												<option
													<c:if test="${data.cyear == 2008}">selected='selected'</c:if>>2008</option>
												<option
													<c:if test="${data.cyear == 2009}">selected='selected'</c:if>>2009</option>
												<option
													<c:if test="${data.cyear == 2010}">selected='selected'</c:if>>2010</option>
												<option
													<c:if test="${data.cyear == 2011}">selected='selected'</c:if>>2011</option>
												<option
													<c:if test="${data.cyear == 2012}">selected='selected'</c:if>>2012</option>
												<option
													<c:if test="${data.cyear == 2013}">selected='selected'</c:if>>2013</option>
												<option
													<c:if test="${data.cyear == 2014}">selected='selected'</c:if>>2014</option>
												<option
													<c:if test="${data.cyear == 2015}">selected='selected'</c:if>>2015</option>
												<option
													<c:if test="${data.cyear == 2016}">selected='selected'</c:if>>2016</option>
												<option
													<c:if test="${data.cyear == 2017}">selected='selected'</c:if>>2017</option>
												<option
													<c:if test="${data.cyear == 2018}">selected='selected'</c:if>>2018</option>
												<option
													<c:if test="${data.cyear == 2019}">selected='selected'</c:if>>2019</option>
												<option
													<c:if test="${data.cyear == 2020}">selected='selected'</c:if>>2020</option>
												<option
													<c:if test="${data.cyear == 2021}">selected='selected'</c:if>>2021</option>
												<option
													<c:if test="${data.cyear == 2022}">selected='selected'</c:if>>2022</option>
										</select>
										</li>
										
										<li>연료 <select name="cfuel" class="dataTable-input"
											id="ymin">
												<option
													<c:if test="${data.cfuel == '가솔린'}">selected='selected'</c:if>>가솔린</option>
												<option
													<c:if test="${data.cfuel == '디젤'}">selected='selected'</c:if>>디젤</option>
												<option
													<c:if test="${data.cfuel == 'LPG'}">selected='selected'</c:if>>LPG</option>
												<option
													<c:if test="${data.cfuel == '전기'}">selected='selected'</c:if>>전기</option>
										</select>
										</li>
										<li>주행거리<input class="dataTable-input" type="number" min="0" step="1000" max="2147483600"
											name="ckm" required value="${data.ckm}" autocomplete="off"></li>
										<li>가격<input class="dataTable-input" type="number" min="0" step="100" max="2147483600"
											name="cprice" required value="${data.cprice}"
											autocomplete="off"></li>
											
										<li>지역<select name="ccity" class="dataTable-input">
												<option
													<c:if test="${data.ccity == '서울'}">selected='selected'</c:if>>서울</option>
												<option
													<c:if test="${data.ccity == '경기'}">selected='selected'</c:if>>경기</option>
												<option
													<c:if test="${data.ccity == '인천'}">selected='selected'</c:if>>인천</option>
												<option
													<c:if test="${data.ccity == '강원'}">selected='selected'</c:if>>강원</option>
												<option
													<c:if test="${data.ccity == '충북'}">selected='selected'</c:if>>충북</option>
												<option
													<c:if test="${data.ccity == '충남'}">selected='selected'</c:if>>충남</option>
												<option
													<c:if test="${data.ccity == '대전'}">selected='selected'</c:if>>대전</option>
												<option
													<c:if test="${data.ccity == '세종'}">selected='selected'</c:if>>세종</option>
												<option
													<c:if test="${data.ccity == '경북'}">selected='selected'</c:if>>경북</option>
												<option
													<c:if test="${data.ccity == '경남'}">selected='selected'</c:if>>경남</option>
												<option
													<c:if test="${data.ccity == '대구'}">selected='selected'</c:if>>대구</option>
												<option
													<c:if test="${data.ccity == '부산'}">selected='selected'</c:if>>부산</option>
												<option
													<c:if test="${data.ccity == '울산'}">selected='selected'</c:if>>울산</option>
												<option
													<c:if test="${data.ccity == '전북'}">selected='selected'</c:if>>전북</option>
												<option
													<c:if test="${data.ccity == '전남'}">selected='selected'</c:if>>전남</option>
												<option
													<c:if test="${data.ccity == '광주'}">selected='selected'</c:if>>광주</option>
												<option
													<c:if test="${data.ccity == '제주'}">selected='selected'</c:if>>제주</option>
										</select>
										</li>
										<li>이미지<input class="dataTable-input" type="file"
											name="file" onchange="loadFile(this);" value="${data.cimg}"
											autocomplete="off"></li>
											
										<li id="submitUDBtn"><div>
												<input class="dataTable-input ManagerBtn" type="submit"
													value="수정하기"><a class="dataTable-input ManagerBtn"
													href="deleteCar.do?cnum=${data.cnum}">삭제하기</a>
											</div></li>
									</ul>
								</form>
							</c:when>
							<c:otherwise>
							
								<form action="insertCar.do" method="post"
									enctype="multipart/form-data">
									<ul id="addCarInfoUl">
										<li>차량명<input class="dataTable-input" type="text"
											name="ctitle" required autocomplete="off"></li>
										<li>상세설명<input class="dataTable-input" type="text"
											name="csubtitle" required autocomplete="off"></li>
									
										<li>연식 <select name="cyear" class="dataTable-input">
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
										</li>
									
										<li>연료<select name="cfuel" class="dataTable-input">
												<option>가솔린</option>
												<option>디젤</option>
												<option>LPG</option>
												<option>전기</option>
										</select></li>
										<li>주행거리<input class="dataTable-input" type="number" min="0" step="1000" max="2147483600"
											name="ckm" required autocomplete="off">
										</li>
										<li>가격<input class="dataTable-input" type="number" min="0" step="100" max="2147483600"
											name="cprice" required autocomplete="off"></li>
									
										<li>지역<select name="ccity" class="dataTable-input">
												<option>서울</option>
												<option>경기</option>
												<option>인천</option>
												<option>강원</option>
												<option>충북</option>
												<option>충남</option>
												<option>대전</option>
												<option>세종</option>
												<option>경북</option>
												<option>경남</option>
												<option>대구</option>
												<option>부산</option>
												<option>울산</option>
												<option>전북</option>
												<option>전남</option>
												<option>광주</option>
												<option>제주</option>
										</select>
										</li>
										<li>이미지<input class="dataTable-input" type="file"
											name="file" onchange="loadFile(this);" required
											autocomplete="off"></li>
									
										<li><input class="dataTable-input submitBtn"
											type="submit" value="등록하기"></li>
									</ul>
								</form>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="container-fluid px-4">
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> Car Information
						</div>
						<div class="card-body carTableContainer">
					
							<table id="datatablesSimple1">
								<thead>
									<tr>
										<th>차량명</th>
										<th>설명</th>
										<th>연료</th>
										<th>주행거리</th>
										<th>가격</th>
										<th>지역</th>
										<th>연식</th>
									</tr>
								</thead>
								<tbody>
								
									<c:forEach var="c" items="${cdata}">
										<tr>
										
											<td><a href="selectCar.do?cnum=${c.cnum}">${c.ctitle}</a></td>
											<td>${c.csubtitle}</td>
											<td>${c.cfuel}</td>
											<td>${c.ckm}</td>
											<td>${c.cprice}</td>
											<td>${c.ccity}</td>
											<td>${c.cyear}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="container-fluid px-4">
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i> User Information
						</div>
						<div class="card-body">
				
							<table id="datatablesSimple2">
								<thead>
									<tr>
										<th>userId</th>
										<th>userPw</th>
										<th>userName</th>
										<th>userNickname</th>
										<th>useradd</th>
										<th>userphone</th>
										<th>useremail</th>
									</tr>
									</thead>
									<tbody>
									<c:forEach var="m" items="${mdata}">
										<tr>
											<td>${m.mid}</td>
											<td>${m.mpw}</td>
											<td>${m.mname}</td>
											<td>${m.mnickname}</td>
											<td>${m.madd}</td>
											<td>${m.mphone}</td>
											<td>${m.memail}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</main>
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; Varchar</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
	<script src="js/datatables-simple-demo.js"></script>
	
	<script>
		function loadFile(input) {
			console.log("Ddddd");
			if (input.files && input.files[0]) { //파일이 업로드 되었는지?
				console.log("Dddddsssss");
				var fr = new FileReader();
				fr.onload = function(event) { //파일이 로드 되었을 떄
					console.log("Dddddasdqweqweq");
					document.getElementById("preview").src = event.target.result; //input 대신 js를 이용해 src속성을 부여할 예정
				};
				fr.readAsDataURL(input.files[0]);
			} else {
				document.getElementById("preview").src = "";
			}
		}
	</script>
</body>
</html>