<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	<div class="container">
		<a class="navbar-brand" href="main.do">VAR<span>CHAR</span></a>
		<i class="languageSelector"></i>
        <span class="languageSelectorMsg"></span>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#ftco-nav" aria-controls="ftco-nav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="oi oi-menu"></span> <spring:message code = "navigation.main" />
		</button>
		<div class="collapse navbar-collapse" id="ftco-nav">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a href="main.do" class="nav-link"><spring:message code = "navigation.main" /></a></li>
				<c:if test="${userId!=null}">
					<c:if test="${loginType ==null}">
						<li class="nav-item"><a href="logout.do" class="nav-link"><spring:message code = "navigation.logout" /></a></li>
						<li class="nav-item"><a href="mypage.do" class="nav-link"><spring:message code = "navigation.mypage" /></a></li>
						<c:if test="${mrole!='일반회원'}">
							<li class="nav-item"><a href="manager.do" class="nav-link"><spring:message code = "navigation.manger" /></a></li>
						</c:if>					
					</c:if>
					<c:if test="${loginType !=null}">
						<li class="nav-item"><a href="logout.do" id="kakaoLogoutBtn"
							class="nav-link"><spring:message code = "navigation.logout" /></a></li>
					</c:if>
					<li class="nav-item"><a href="javascript:chatWinOpen('${userId}')" class="nav-link"><spring:message code = "navigation.liveconsult" /></a></li>
				</c:if>
				<c:if test="${userId==null}">
					<li class="nav-item"><a href="login.do" class="nav-link"><spring:message code = "navigation.login" /></a></li>
					<li class="nav-item"><a href="signup.do" class="nav-link"><spring:message code = "navigation.signup" /></a></li>
				</c:if>
				<li class="nav-item"><a href="boardMain.do" class="nav-link"><spring:message code = "navigation.board" /></a></li>

				<li class="nav-item"><a href="filter.do" class="nav-link"><spring:message code = "navigation.buycar" /></a></li>
			
			</ul>
		</div>
	</div>
</nav>

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="js/kakaoLogout.js"></script>


<script>
    function chatWinOpen(userId) {
        /* var id = document.getElementById("chatId");
        if (id.value == "") {
            alert("대화명을 입력 후 채팅창을 열어주세요.");
            id.focus();
            return;
        } */
        window.open("ChatWindow.jsp?chatId=" + userId, "", "width=400,height=467");
        //id.value = "";
    }
    </script>
