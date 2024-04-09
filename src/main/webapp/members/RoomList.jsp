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

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
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
		margin-left: 20px;
	}
	.lineDiv {
		flex: 1;
	    display: flex;
	    justify-content: flex-end; /* 내부 요소들 사이의 간격을 조절합니다. */
	    margin-bottom: 20px; /* 각 lineDiv 사이의 여백을 조절합니다. */
	    width: 100%;
	    height: 300px;
	}
	.leftTable {
		width:100%;
		text-align: center;
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
	.price {
		width: 60px;
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
							<td>
								사진
							</td>
						</tr>
						<tr>
							<td>
								이름
							</td>
						</tr>
						<tr>
							<td>
								가격
							</td>
						</tr>
						<tr>
							<td>
								룸 정보
							</td>
						</tr>
						<tr>
							<td>
								버튼
							</td>
						</tr>
						
					</table>
				</div>
				<div class="room"><!-- 두번째 요소 -->
					<table class="leftTable">
						<tr>
							<td>
								사진
							</td>
						</tr>
						<tr>
							<td>
								이름
							</td>
						</tr>
						<tr>
							<td>
								가격
							</td>
						</tr>
						<tr>
							<td>
								룸 정보
							</td>
						</tr>
						<tr>
							<td>
								버튼
							</td>
						</tr>
					</table>
				</div>
				<div class="room"><!-- 세번째 요소 -->
					<table class="leftTable">
						<tr>
							<td>
								사진
							</td>
						</tr>
						<tr>
							<td>
								이름
							</td>
						</tr>
						<tr>
							<td>
								가격
							</td>
						</tr>
						<tr>
							<td>
								룸 정보
							</td>
						</tr>
						<tr>
							<td>
								버튼
							</td>
						</tr>
					</table>
				</div>
			</div>
			
		</div>
		
		<div id="rightDiv"> <!-- 사이드바 컨테이너 -->
		
			<form>
				<table class="rightTable">
						<tr>
							<td>
								체크인<br>
								<input type="text" name="checkIn" class="filter">
							</td>
						</tr>
						<tr>
							<td>
								체크아웃<br>
								<input type="text" name="checkOut" class="filter">
							</td>
						</tr>
						<tr>
							<td>
								<select class="filter_select" name="roomType">
									<option>스페셜</option>
									<option>디럭스</option>
									<option>스위트</option>
									<option>스텐다드</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>
								<select class="filter_select" name="headCount">
									<option>1인</option>
									<option>2인</option>
									<option>3인</option>
									<option>4인</option>
									<option>5인</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>
								<p>가격</p>
								<div id="price-range-slider"></div>
								<script>
								    $(document).ready(function() {
								        $("#price-range-slider").slider({
								            range: true,
								            min: 0,
								            max: 30,
								            values: [0, 30], // 초기값 설정
								            slide: function(event, ui) {// 가격 범위 업데이트
								                $("#price-min").val(ui.values[0]*10000);
								                $("#price-max").val(ui.values[1]*10000);
								            }
								        });
								        $("#price-min").val($("#price-range-slider").slider("values", 0));
								        $('#price-max').val($("#price-range-slider").slider("values", 1)*10000); // 초기 가격 범위 표시
								    });
								</script>
							</td>
						</tr>
						<tr>
							<td>
								<input type="text" id="price-min" name="priceMin" class="price" readonly> - 
								<input type="text" id="price-max" name="priceMax" class="price" readonly>
							</td>
						</tr>
						<tr>
							<td align="center">
								<input type="submit" value="조건 검색" />
							</td>
						</tr>
				</table>
			</form>
			
		</div>
	</div>
</body>
</html>