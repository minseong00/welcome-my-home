<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인</title>
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
<!-- css 적용 -->
<link rel="stylesheet" href="${contextPath }/style/css/flaticon.css">
<link rel="stylesheet" href="${contextPath }/style/css/style.css">
<style type="text/css">
	body{
		padding:1.5em;
		background: #f5f5f5;
  		
	}
	.rightside{
		display: flex;
		flex-direction: column;
		flex-grow: 1;
		margin-left: 0.5rem;
	}
	.include-gap {
    margin-bottom: 100px; /* 원하는 만큼의 간격을 설정합니다. */
}
</style>
</head>
<body>
	<div class="container">
	    <jsp:include page="/include/Header.jsp" flush="false"/>
		<div class="row justify-content-center">
		<div class="col-md-4"> 
			<jsp:include page="/include/AdminSidebar.jsp" flush="false"/>
		</div>
        
	        <div class="rightside">
	            <div class="include-gap" >
	                <div>
	                    <jsp:include page="/admins/MemTable.jsp" flush="false"/>
	                </div>
	                <div class="include-gap" style="margin-top: 50px;">
	                    <jsp:include page="/admins/RevTable.jsp" flush="false"/>
	                </div>
	               
	            </div>
	        </div>
   		</div>
	</div>
	
	                
	               
</body>
</html>
