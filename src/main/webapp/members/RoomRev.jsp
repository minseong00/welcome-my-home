<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RoomDetail에서 예약 버튼 클릭시 출력</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- 캘린더 import -->
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script src="${contextPath}/util/Calendar.js"></script>
<script src="${contextPath}/util/CountHead.js"></script>
<style>
form {
	display: flex;
	justify-content: space-between;
	width: 100%;
}

#container {
	width: 100%;
	padding-right: 15px;
	padding-left: 15px;
	margin-right: auto;
	margin-left: auto;
	max-width: 1100px;
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
	width: 100%;
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

img {
	width: 300px;
	height: auto; /* 이미지의 가로 세로 비율을 유지하면서 가로 너비를 300px로 지정 */
}

.slider {
	width: 600px; /* 슬라이드의 너비 */
	overflow: hidden; /* 넘치는 이미지 숨김 */
	position: relative; /* 상대 위치 지정 */
}

.slider ul {
	list-style-type: none; /* 리스트 스타일 제거 */
	margin: 0; /* 마진 제거 */
	padding: 0; /* 패딩 제거 */
	width: 3000px; /* 모든 이미지 너비의 합 */
	transition: margin-left 0.5s; /* 애니메이션 속성 추가 */
	justify-content:center;
	display: flex;
}

.slider ul li {
	float: left; /* 왼쪽으로 정렬 */
	width: 600px; /* 이미지 너비 */
}
/* 이전/다음 버튼 스타일 */
.prev, .next {
	cursor: pointer; /* 커서 모양 변경 */
	position: absolute; /* 절대 위치 지정 */
	top: 50%; /* 상단 여백 */
	transform: translateY(-50%); /* 수직 정렬 */
	background-color: rgba(0, 0, 0, 0.5); /* 배경색 */
	color: white; /* 글자색 */
	padding: 10px; /* 안쪽 여백 */
	z-index: 1; /* 위에 표시 */
}

.prev {
	left: 0; /* 왼쪽에 배치 */
}

.next {
	right: 0; /* 오른쪽에 배치 */
}
.visual_img {
	margin-right: 20px;
}

.image-container {
	width: 600px; /* 이미지 컨테이너의 너비를 설정합니다. */
	height: 200px; /* 이미지 컨테이너의 높이를 설정합니다. */
	overflow: hidden; /* 이미지가 넘치는 경우를 처리합니다. */
}

.image-container img {
	width: 100%; /* 이미지의 너비를 부모 요소에 맞게 설정합니다. */
	height: auto; /* 이미지의 높이를 자동으로 조절하여 비율을 유지합니다. */
	display: block; /* 이미지를 블록 요소로 표시합니다. */
}
</style>
s

</head>
<body>
	<div id="container">
		<!-- 메인 컨테이너 -->
		<jsp:include page="/include/Header.jsp" flush="false" />

		<div class="row justify-content-center">
			<form>

				<div id="leftDiv">
					<!-- 왼쪽 컨테이너 -->
					<table class="leftTable">
						<div class="slider">
							<ul class="visual_img">
								<!-- 이미지 리스트 -->
								<div class="prev">&lt;</div>
								<li class="image-container"><img
									src="${contextPath }/data/${imgVO.img1}" alt="Image 1"></li>
								<li class="image-container"><img
									src="${contextPath }/data/${imgVO.img2}" alt="Image 2"></li>
								<li class="image-container"><img
									src="${contextPath }/data/${imgVO.img3}" alt="Image 3"></li>
								<li class="image-container"><img
									src="${contextPath }/data/${imgVO.img4}" alt="Image 4"></li>
								<li class="image-container"><img
									src="${contextPath }/data/${imgVO.img5}" alt="Image 5"></li>
								<div class="next">&gt;</div>
							</ul>
						</div>
						<!-- 이전/다음 버튼 -->


						<!-- 슬라이드 스크립트 -->
						<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
						<script>
							$(function() {
								$(".visual_img li:last").prependTo(
										".visual_img");

								$(".next").click(function() {
									$(".visual_img").animate({
										marginLeft : "-=600px"
									},
									function() {
										$(".visual_img li:first").appendTo(".visual_img");
										$(".visual_img").css({
											marginLeft : 0
										});
									});
								});

								$(".prev").click(function() {
									$(".visual_img").animate({
										marginLeft : "+=600px"
									},
									function() {
										$(".visual_img li:last").prependTo(".visual_img");
										$(".visual_img").css({
											marginLeft : 0
										});
									});
								});
							});
						</script>
						<tr>
							<td>이름</td>
						</tr>
						<tr>
							<td align="right">가격</td>
						</tr>
						<tr>
							<td>룸 정보</td>
						</tr>
					</table>
				</div>

				<div id="rightDiv">
					<!-- 오른쪽 컨테이너 -->
					<table class="rightTable">
						<tr>
							<td>예약 가능한 날짜<br> <input type="text" name="checkIn"
								id="roomRevDate">
							</td>
						</tr>
						<tr>
							<td>인원수</td>
						</tr>
						<tr>
							<td id="headTd">
								<button type="button" id="downCount" onclick="downValue()">
									<b>-</b>
								</button> <input type="text" name="headCount" value="1" id="headCount"
								readonly>
								<button type="button" id="upCount" onclick="upValue()">
									<b>+</b>
								</button>
							</td>
						</tr>
						<tr>
							<td>총 가격<br> <input type="text" name="price"
								value="240000" id="price" readonly>
							</td>
						</tr>
						<tr>
							<td align="center"><input type="submit" value="예약하기" /></td>
						</tr>
					</table>
				</div>

			</form>
		</div>
	</div>
</body>
</html>