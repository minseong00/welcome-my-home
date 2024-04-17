<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약현황</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- css 적용 -->
<link rel="stylesheet" href="${contextPath }/style/css/flaticon.css">
<link rel="stylesheet" href="${contextPath }/style/css/style.css">
 <!-- fullcalendar CDN -->
  <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.9.0/main.min.css' rel='stylesheet' />
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.9.0/main.min.js'></script>
  <!-- fullcalendar 언어 CDN -->
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.9.0/locales-all.min.js'></script>
<script>
	const revList = JSON.parse('${revList}');
</script>
<script src="${contextPath}/util/RevListCalendar.js"></script>

<style>
	#container {
		width: 100%;
	    padding-right: 15px;
	    padding-left: 15px;
	    margin-right: auto;
	    margin-left: auto;
	    margin-bottom: 200px;
	}
	#calendar {
		width: 90%;
	}
	#main-content {
		display: flex;
		justify-content: center;
	}
	
</style>

</head>
<body>
	<div id="container"> <!-- 메인 컨테이너 -->
		<jsp:include page="/include/Header.jsp" flush="false"/>
		
		<div id="main-content">
		<div id="calendar"></div>
		
		</div>
	</div>
    <jsp:include page="/include/Footer.jsp" flush="false"/>
</body>
</html>