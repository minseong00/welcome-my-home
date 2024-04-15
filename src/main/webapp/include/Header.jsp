<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<title>Deluxe - Free Bootstrap 4 Template by Colorlib</title>
    <meta charset="utf-8">
 
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i" rel="stylesheet">

    <link rel="stylesheet" href="${contextPath}/style/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="${contextPath}/style/css/animate.css">
    
    <link rel="stylesheet" href="${contextPath}/style/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${contextPath}/style/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${contextPath}/style/css/magnific-popup.css">

    <link rel="stylesheet" href="${contextPath}/style/css/aos.css">

    <link rel="stylesheet" href="${contextPath}/style/css/ionicons.min.css">

    <link rel="stylesheet" href="${contextPath}/style/css/bootstrap-datepicker.css">

    
    <link rel="stylesheet" href="${contextPath}/style/css/flaticon.css">
    <link rel="stylesheet" href="${contextPath}/style/css/icomoon.css">
    <link rel="stylesheet" href="${contextPath}/style/css/style.css">

</head>
<body>
	<nav class="navbar" id="ftco-navbar">
    <div class="container-fluid" align="right">
        <a class="navbar-brand" href="${contextPath}/members/MainForm.jsp" style="color: #8d703b;">MyHome</a>
        <!-- 삭제: 네비게이션 토글러 버튼 -->
        <div class="navbar justify-content-end flex-row" id="ftco-nav"> 
            <ul class="navbar-nav flex-row" style="margin-left: 20px;"> 
               
                <li class="nav-item" style="margin-left: 20px;"><a href="${contextPath}/RevList?type=calendar" class="nav-link">예약목록</a></li> <!-- 스타일 추가 -->
                <li class="nav-item" style="margin-left: 20px;"><a href="${contextPath}/RoomList?type=member" class="nav-link">객실목록</a></li> <!-- 스타일 추가 -->
                <li class="nav-item" style="margin-left: 20px;"><a href="${contextPath}/members/Conven.jsp" class="nav-link">주변정보</a></li> <!-- 스타일 추가 -->
                
                <c:choose>
                	<c:when test="${sessionScope.idType eq 'member' }">
                		<li class="nav-item" style="margin-left: 20px;"><a href="${contextPath}/MemModify?type=MemUpdate" class="nav-link">내 정보</a></li> <!-- 스타일 추가 -->
                		<li class="nav-item" style="margin-left: 20px;"><a href="${contextPath}/Login" class="nav-link">로그아웃</a></li> <!-- 스타일 추가 -->
                	</c:when>
                	<c:when test="${sessionScope.idType eq 'admin' }">
                	    <li class="nav-item" style="margin-left: 20px;"><a href="${contextPath}/admin/adminMain" class="nav-link">관리자 페이지</a></li> <!-- 스타일 추가 -->
                		<li class="nav-item" style="margin-left: 20px;"><a href="${contextPath}/Login" class="nav-link">로그아웃</a></li> <!-- 스타일 추가 -->
                	</c:when>
                	<c:otherwise>
                	     <li class="nav-item" style="margin-left: 20px;"><a href="${contextPath}/common/Login.jsp" class="nav-link">로그인</a></li> <!-- 스타일 추가 -->
               			 <li class="nav-item" style="margin-left: 20px;"><a href="${contextPath}/members/MemJoin.jsp" class="nav-link">회원가입</a></li> <!-- 스타일 추가 -->
                	</c:otherwise>
                </c:choose>

            </ul>
        </div>
    </div>
</nav>
</body>
</html>