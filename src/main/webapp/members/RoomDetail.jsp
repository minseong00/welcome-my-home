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
	
	.slider {
	 margin: auto; /* 가운데 정렬 */
	width: 700px; /* 슬라이드의 너비 */
	
	overflow: hidden; /* 넘치는 이미지 숨김 */
	position: relative; /* 상대 위치 지정 */
}

.slider ul {
	list-style-type: none; /* 리스트 스타일 제거 */
	margin: 0; /* 마진 제거 */
	padding: 0; /* 패딩 제거 */
	width: 3500px; /* 모든 이미지 너비의 합 */
	
	justify-content:center;
	display: flex;
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
	width: 700px; /* 이미지 컨테이너의 너비를 설정합니다. */
	height: 300px; /* 이미지 컨테이너의 높이를 설정합니다. */
	overflow: hidden; /* 이미지가 넘치는 경우를 처리합니다. */
}

.image-container img {
	width: 100%; /* 이미지의 너비를 부모 요소에 맞게 설정합니다. */
	height: auto; /* 이미지의 높이를 자동으로 조절하여 비율을 유지합니다. */
	display: block; /* 이미지를 블록 요소로 표시합니다. */
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

</head>
<body>
<div id="container"> <!-- 메인 컨테이너 -->
<jsp:include page="/include/Header.jsp" flush="false"/>

<div class="row justify-content-center">

	<div id="mainContainer">
		
            <div class="slider">
                <div class="prev">&lt;</div>
                <ul class="visual_img">
                    <li class="image-container"><img 
                    	src="${contextPath}/style/images/airport.jpg" alt="Image 1" /></li>
                    <li class="image-container"><img 
                    	src="${contextPath}/data/${imgVO.img2}" alt="Image 2" /></li>
                    <li class="image-container"><img 
                    	src="${contextPath}/data/${imgVO.img3}" alt="Image 3" /></li>
                    <li class="image-container"><img
                    	src="${contextPath}/data/${imgVO.img4}" alt="Image 4" /></li>
                    <li class="image-container"><img 
                    	src="${contextPath}/data/${imgVO.img5}" alt="Image 5" /></li>
                </ul>
                <div class="next">&gt;</div>
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