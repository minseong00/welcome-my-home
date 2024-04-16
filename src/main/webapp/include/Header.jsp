<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<title>Header 고정</title>
    <meta charset="utf-8">
 
</head>
<body>
	<nav class="navbar" id="ftco-navbar">
    <div class="container-fluid" align="right">
        <a class="navbar-brand" href="${contextPath}/members/MainForm.jsp" style="color: #8d703b;">MyHome</a>
        <!-- 삭제: 네비게이션 토글러 버튼 -->
        <div class="navbar justify-content-end flex-row" id="ftco-nav"> 
            <ul class="navbar-nav flex-row" style="margin-left: 20px;"> 
               
                <li class="nav-item" style="margin-left: 20px;"><a href="${contextPath}/RevList?type=calendar" class="nav-links">예약목록</a></li> <!-- 스타일 추가 -->
                <li class="nav-item" style="margin-left: 20px;"><a href="${contextPath}/RoomList?type=member" class="nav-links">객실목록</a></li> <!-- 스타일 추가 -->
                <li class="nav-item" style="margin-left: 20px;"><a href="${contextPath}/members/Conven.jsp" class="nav-links">주변정보</a></li> <!-- 스타일 추가 -->
                
                <c:choose>
                	<c:when test="${sessionScope.idType eq 'member' }">
                		<li class="nav-item" style="margin-left: 20px;"><a href="${contextPath}/MemModify" class="nav-links">내 정보</a></li> <!-- 스타일 추가 -->
                		<li class="nav-item" style="margin-left: 20px;"><a href="${contextPath}/Login" class="nav-links">로그아웃</a></li> <!-- 스타일 추가 -->
                	</c:when>
                	<c:when test="${sessionScope.idType eq 'admin' }">
                	    <li class="nav-item" style="margin-left: 20px;"><a href="${contextPath}/admin/adminMain" class="nav-links">관리자 페이지</a></li> <!-- 스타일 추가 -->
                		<li class="nav-item" style="margin-left: 20px;"><a href="${contextPath}/Login" class="nav-links">로그아웃</a></li> <!-- 스타일 추가 -->
                	</c:when>
                	<c:otherwise>
                	     <li class="nav-item" style="margin-left: 20px;"><a href="${contextPath}/common/Login.jsp" class="nav-links">로그인</a></li> <!-- 스타일 추가 -->
               			 <li class="nav-item" style="margin-left: 20px;"><a href="${contextPath}/members/MemJoin.jsp" class="nav-links">회원가입</a></li> <!-- 스타일 추가 -->
                	</c:otherwise>
                </c:choose>

            </ul>
        </div>
    </div>
</nav>
</body>
</html>