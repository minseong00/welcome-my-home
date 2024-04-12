<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자의 예약 수정</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />

<style type="text/css">
	body{
		line-height: normal;
		display: flex;
	}
	.rightside{
		display: flex;
		flex-direction: column;
		flex-grow: 1;
		margin-left: 0.5rem;
		width: calc(100vh - 235px);
	}
</style>
<script src="http://code.jquery.com/jquery-2.2.1.min.js"></script>
</head>
<body>
	<div class="container">
		<jsp:include page="/include/Header.jsp" flush="false"/>
		
		<div class="row justify-content-center">
		
			<div class="col-md-4"> 
				<jsp:include page="/include/AdminSidebar.jsp" flush="false"/>
			</div>
		
			<div class="rightside">
				<!-- 예약 수정 화면 -->
			</div>
		</div>
	
	</div>
</body>
</html>