<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    
<c:forEach var="c" items="${cdata}">
   <div class="item">
      <div class="car-wrap rounded ftco-animate">
         <div class="img rounded d-flex align-items-end"
            style="background:url('${c.cimg}') no-repeat center 80%;background-size:cover;">
         </div>
         <div class="text">
            <h2 class="mb-0">
               <a href="detail.do?cnum=${c.cnum}">${c.ctitle}</a>
            </h2>
            <div class="d-flex mb-3">
               <span class="cat">${c.ckm} km</span>
               <c:choose>
                  <c:when test="${c.cprice==2147483647}">
                     <p class="price ml-auto"><spring:message code = "recommend.pricemlauto" /></p>
                  </c:when>
                  <c:otherwise>
                     <p class="price ml-auto">${c.cprice}<span>만원</span>
                     </p>
                  </c:otherwise>
               </c:choose>
            </div>
            <p class="d-flex mb-0 d-block">
               <a href="storeAdd.do?cnum=${c.cnum}"
                  class="btn btn-primary py-2 mr-1"><spring:message code = "recommend.reservation" /></a> <a
                  href="detail.do?cnum=${c.cnum}"
                  class="btn btn-secondary py-2 ml-1"><spring:message code = "recommend.detail" /></a>
            </p>
         </div>
      </div>
   </div>
</c:forEach>