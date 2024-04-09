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
<script src="${contextPath}/util/CountHead.js"></script>
<style>
	div {
		border: 1px solid;
	}
	form {
		display: flex;
		justify-content: space-between;
		width: 100%;
	}
	#container {
	    display: flex;
	    justify-content: space-between; /* 메인 컨테이너 내 요소들 사이의 간격을 조절합니다. */
	    width: 100%;
	}
	#leftDiv {
	    display: flex;
	    flex-direction: column; /* 내부 요소를 세로로 정렬합니다. */
	    flex: 0 0 calc(60% - 10px); /* 부모 컨테이너 너비의 60%에서 10px를 뺀 값으로 설정합니다. */
	    padding: 20px;
	    margin-right: 10px;
	    align-items: center; /* 내부 요소를 오른쪽으로 정렬합니다. */
	}
	.leftTable {
		width:100%;
		text-align: center;
	}
	#rightDiv {
	    display: flex;
	    flex-direction: column; /* 내부 요소를 세로로 정렬합니다. */
	    flex: 1; /* rightDiv가 부모 컨테이너 내에서 적절한 공간을 차지할 수 있도록 설정합니다. */
	    padding: 20px;
	    box-sizing: border-box; /* 패딩을 요소의 크기에 포함시킵니다. */
	}
	.rightTable {
		width: 200px;
		border-collapse: separate;
		border-spacing: 10px;
		padding: 10px; 
	}
	#price-range-slider {
		width: 140px;
		margin-left: 5px;
	}
	.filter {
		width: 150px;
	}
	.filter_select {
		width: 155px;
	}
	.headCount {
		width: 60px;
	}
	#headTd {
		display: flex; /* 요소들을 가로로 나열 */
	  	align-items: center; /* 요소들을 세로 중앙 정렬 */
	}
	#headTd button {
		margin: 0 5px 0 5px; 
	}
	#headCount {
		width: 50px;
	}
	#price {
		width: 150px;
		border: none;  
		outline: none; 
		text-align: right;
		font-size: 15pt;
	}
</style>
<script>

</script>
</head>
<body>
	<div id="container"> <!-- 메인 컨테이너 -->
		<form>
			<div id="leftDiv"> <!-- 왼쪽 컨테이너 -->
				<table class="leftTable">
					<tr>
						<td>
							사진
						</td>
					</tr>
					<tr>
						<td align="left" style="font-size: 20pt;">
							이름
						</td>
					</tr>
					<tr>
						<td align="right" style="font-size: 15pt;">
							가격
						</td>
					</tr>
					<tr>
						<td>
							룸 정보
						</td>
					</tr>
				</table>
			</div>
			
			<div id="rightDiv"> <!-- 오른쪽 컨테이너 -->
				<table class="rightTable">
						<tr>
							<td>
								예약 가능한 날짜<br>
								<input type="text" name="checkIn" id="roomRevDate">
							</td>
						</tr>
						<tr>
							<td>인원수</td>
						</tr>
						<tr>
							<td id="headTd">
								<button type="button" id="downCount" onclick="downValue()"><b>-</b></button>
								<input type="text" name="headCount" value="1" id="headCount" readonly>
								<button type="button" id="upCount" onclick="upValue()"><b>+</b></button>
							</td>
						</tr>
						<tr>
							<td>
								총 가격<br>
								<input type="text" name="price" value="240000" id="price" readonly>
							</td>
						</tr>
						<tr>
							<td align="center">
								<input type="submit" value="예약하기" />
							</td>
						</tr>
				</table>
			</div>
		</form>
	</div>
</body>
</html>