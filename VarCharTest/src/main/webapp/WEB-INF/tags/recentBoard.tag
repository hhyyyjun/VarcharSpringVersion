<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<c:forEach var="r" items="${recentB}" varStatus="status">
      <div class="col-md-4 d-flex ftco-animate">
         <div class="blog-entry justify-content-end">
            <a href="blog-single.html" class="block-20"
               style="background-image: url('images/image_${status.count}.jpg');"> </a>
            <div class="text pt-4">
               <div class="meta mb-3">
                  <div>
                     <a href="boardMain.do">${r.bdate}</a>
                  </div>
                  <div>
                     <a href="boardMain.do">${r.mnickname}</a>
                  </div>
                  <div>
                     <a href="boardMain.do" class="meta-chat"><span class="icon-chat"></span>
                        ${r.bcnt}</a>
                  </div>
               </div>
               <h3 class="heading mt-2">
                  <a href="boardMain.do">${r.btitle}</a>
               </h3>
               <p>
                  <a href="boardMain.do" class="btn btn-primary">Read more</a>
               </p>
            </div>
         </div>
      </div>
</c:forEach>