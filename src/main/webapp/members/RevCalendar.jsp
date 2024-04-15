<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>현재 모든 예약 상태를 캘린더 형태로 출력</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
 <!-- fullcalendar CDN -->
  <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.9.0/main.min.css' rel='stylesheet' />
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.9.0/main.min.js'></script>
  <!-- fullcalendar 언어 CDN -->
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.9.0/locales-all.min.js'></script>
<script>
	const servletUrl = "${contextPath}/RevList?type=calendar";
</script>
<script src="${contextPath}/util/RevListCalendar.js"></script>

<style>
	.container {
		width: 100%;
	    padding-right: 15px;
	    padding-left: 15px;
	    margin-right: auto;
	    margin-left: auto;
	    max-width: 1100px;
	}
	#calendar {
		width: 90%;
	}
</style>

</head>
<body>
	<div id="container"> <!-- 메인 컨테이너 -->
		<jsp:include page="/include/Header.jsp" flush="false"/>
		
		<div class="row justify-content-center">
		<div id="calendar"></div>
		
		</div>
	</div>
</body>
</html>