<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	    align-items: flex-end; /* 내부 요소를 오른쪽으로 정렬합니다. */
	}
	
	#rightDiv {
	    display: flex;
	    flex-direction: column; /* 내부 요소를 세로로 정렬합니다. */
	    flex: 1; /* rightDiv가 부모 컨테이너 내에서 적절한 공간을 차지할 수 있도록 설정합니다. */
	    padding: 20px;
	    box-sizing: border-box; /* 패딩을 요소의 크기에 포함시킵니다. */
	}
	.room {
		width: 200px;
	}
	.lineDiv {
		flex: 1;
	    display: flex;
	    justify-content: space-between; /* 내부 요소들 사이의 간격을 조절합니다. */
	    margin-bottom: 20px; /* 각 lineDiv 사이의 여백을 조절합니다. */
	    width: 100%;
	    height: 300px;
	}
	.leftTable {
		width:100%;
		text-align: center;
	}
	.rightTable {
		width: 80%;
		border: 1px solid;
		border-collapse: separate;
		border-spacing: 10px; 
	}

</style>
</head>
<body>
	<div id="container"> <!-- 메인 컨테이너 -->
		<div id="leftDiv"> <!-- 왼쪽 컨테이너 -->
		
			<div class="lineDiv"><!-- 첫번째 라인 -->
				<div class="room"> <!-- 첫번째 요소 -->
					<table class="leftTable">
						<tr>
							<td>사진</td>
						</tr>
						<tr>
							<td>이름</td>
						</tr>
						<tr>
							<td>가격</td>
						</tr>
						<tr>
							<td>버튼</td>
						</tr>
						
					</table>
				</div>
				<div class="room"><!-- 두번째 요소 -->
					<table class="leftTable">
						<tr>
							<td>사진</td>
						</tr>
						<tr>
							<td>이름</td>
						</tr>
						<tr>
							<td>가격</td>
						</tr>
						<tr>
							<td>버튼</td>
						</tr>
						
					</table>
				</div>
				<div class="room"><!-- 세번째 요소 -->
					<table class="leftTable">
						<tr>
							<td>사진</td>
						</tr>
						<tr>
							<td>이름</td>
						</tr>
						<tr>
							<td>가격</td>
						</tr>
						<tr>
							<td>버튼</td>
						</tr>
						
					</table>
				</div>
			</div>

		</div>
		
		<div id="rightDiv"> <!-- 사이드바 컨테이너 -->
			<table class="rightTable">
					<tr>
						<td>
							<input type="text" name="dateOne">
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" name="dateOne">
						</td>
					</tr>
					<tr>
						<td>
							<select>
								<option>스페셜</option>
								<option>디럭스</option>
								<option>스위트</option>
								<option>스텐다드</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>
							<select>
								<option>1인</option>
								<option>2인</option>
								<option>3인</option>
								<option>4인</option>
								<option>5인</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>가격</td>
					</tr>
			</table>
		</div>
	</div>
</body>
</html>