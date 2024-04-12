<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방 상세 정보</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- 캘린더 import -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script src="${contextPath}/util/Calendar.js"></script>
<style>
	div {
		border: 1px solid;
	}
	body {
    margin: 0;
    padding: 0;
	}
	#container {
		width: 100%;
	    padding-right: 15px;
	    padding-left: 15px;
	    margin-right: auto;
	    margin-left: auto;
	    max-width: 1100px;
	}
	#mainContainer {
	    display: flex;
	    flex-direction: column;
	    align-items: center; /* 세로 중앙 정렬 */
	    width: 100%;
	    height: 100vh; /* 세로 길이를 브라우저 높이에 맞춤 */
	}
	
	#imgContainer {
	    width: 95%;
	    max-width: 800px; /* 최대 너비 설정 */
	    flex-grow: 1; /* 가변적인 세로 길이를 위해 */
	    border: 1px solid #000; /* 테스트용 보더 */
	}
	
	#infoContainer {
	    display: flex;
	    justify-content: center; /* 가로 중앙 정렬 */
	    width: 95%;
	    max-width: 800px; /* imgContainer에 맞춤 */
	}
	
	#info1 {
	    width: 60%;
	    flex-grow: 1; /* 가변적인 세로 길이를 위해 */
	    border: 1px solid #000; /* 테스트용 보더 */
	}
	
	#info2 {
	    width: 40%;
	    flex-grow: 1; /* 가변적인 세로 길이를 위해 */
	    border: 1px solid #000; /* 테스트용 보더 */
	    max-width: 300px; /* 최대 너비 설정 */
	    height: 500px;
	}
	
	#revBtn {
	    width: 100%;
	    height: 50px; /* 예약 버튼의 높이 */
	}
</style>
<script>

</script>
</head>
<body>
<div id="container"> <!-- 메인 컨테이너 -->
<jsp:include page="/include/Header.jsp" flush="false"/>

<div class="row justify-content-center">

	<div id="mainContainer">
		<div id="imgContainer">
			사진 슬라이드 기능
		</div>
		<div id="infoContainer">
			<div id="info1">
				<img alt="" src="${contextPath }/data/${imgVO.infoImg }" style="width: 100%"><!-- 룸 설명 이미지 -->
			</div>
			<div id="info2">
				<table>
					<tr>
						<td>
						${roomVO.roomName }
						</td>
					</tr>
					<tr>
						<td>
						${roomVO.roomType }
						</td>
					</tr>
					<tr>
						<td>
						${roomVO.headCount } <!-- 최대 가능 인원 수 -->
						</td>
					</tr>
					<tr>
						<td>
						${roomVO.roomCost } 
						</td>
					</tr>
				</table>
				예약 가능한 캘린더 표시
				<button id="revBtn" onclick="location.href='${contextPath}/RevInsert?roomNo=${roomVO.roomNo }'">예약하기</button> <!-- 예약 버튼 클릭시 세션값 확인 -->
			</div>
		</div>
	</div>
</div>
</div>
</body>
</html>