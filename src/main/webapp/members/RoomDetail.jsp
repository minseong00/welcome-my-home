<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>객실상세 정보</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- css 적용 -->
<link rel="stylesheet" href="${contextPath }/style/css/flaticon.css">
<link rel="stylesheet" href="${contextPath }/style/css/style.css">
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
	    height: 140vh; /* 세로 길이를 브라우저 높이에 맞춤 */
	}
	
	.sliderouter{
		margin: 20px auto;
		width: 1100px;
		height: 650px;
	}
	.slider {
	width: 100%;
	height: 100%;
	overflow: hidden; /* 넘치는 이미지 숨김 */
	position: relative; /* 상대 위치 지정 */
}

.slider ul {
	list-style-type: none; /* 리스트 스타일 제거 */
	margin: 0; /* 마진 제거 */
	padding: 0; /* 패딩 제거 */
/*  	width: calc(1100px * liCount); /* 모든 이미지 너비의 합 */  */
	
	justify-content:center;
	display: flex;
}


/* 이전/다음 버튼 스타일 */
.prev, .next {
	cursor: pointer; /* 커서 모양 변경 */
	position: absolute; /* 절대 위치 지정 */
	top: 50%; /* 상단 여백 */
	transform: translateY(-50%); /* 수직 정렬 */
	transition: width 0.5s ease;
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
/* 	width: 700px; /* 이미지 컨테이너의 너비를 설정합니다. */ */
/* 	height: 500px; /* 이미지 컨테이너의 높이를 설정합니다. */ */
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
	   
	   
	}
	
	#info1 {
	    
	    flex-grow: 1; /* 가변적인 세로 길이를 위해 */
/* 	    border: 1px solid #000; /* 테스트용 보더 */ */
	}
	
	#info2 {
		background-color: #FFFFFF;
	    width: 35%;
	    flex-grow: 1; /* 가변적인 세로 길이를 위해 */
	    max-width: 300px; /* 최대 너비 설정 */
	    height: 500px;
	    
	    box-shadow: 0 2px 5px rgba(0, 0, 0, .25); /* 테이블에 그림자 효과 */
	    border-radius: 10px;
	    border-collapse: collapse; /* 테이블의 보더 라인을 하나로 합침 */
	    margin-left: 20px;
	}
	#info2 table {
		width: 80%;
		margin: 10px auto;
		text-align: center;
	}
	
	#revBtn {
	    width: 50%;
	    height: 50px; /* 예약 버튼의 높이 */
	}
	.btn_css {
	-webkit-border-radius: 13px;
	-moz-border-radius: 13px;
	border-radius: 13px;
	
	border : 0px;
	color: #FFFFFF;
	font-family: Arial;
	font-size: 15px;
	font-weight: 100;
	padding: 10px;
	background-color: #8D703B;
	text-decoration: none;
	display: inline-block;
	cursor: pointer;
	text-align: center;
	}
	
	.btn_css:hover {
	background-color: #73685d;
	}
	
	hr {
        border: none;
        border-top: 1px solid #ccc;
        margin-top: 10px ;
        width: 70%;
    }
    #footer{
   		display: block;
    	
    	width: 100%;
    	background-color: #f2f2f2; /* 배경색은 필요에 따라 조정 */
    	padding: 20px 0; /* 필요에 따라 내용 여백 조정 */
    }
</style>
	<!-- 슬라이드 스크립트 -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function() {
    $(".prev").click(function() {
        $(".visual_img").animate({
            marginLeft: "1100px"
        },
        function() {
            $(".visual_img li:last").prependTo(".visual_img");
            $(".visual_img").css({
            	marginLeft: 0,
            	marginRight: 0
            });
        });
    });

    $(".next").click(function() {
        $(".visual_img").animate({
            marginLeft: "-1100px"
        },
        function() {
            $(".visual_img li:first").appendTo(".visual_img");
            $(".visual_img").css({
                marginLeft: 0
            });
        });
    });
});
window.onload = function() {
    var slider = document.querySelector('.visual_img');
    var liCount = slider.querySelectorAll('li').length; // li 요소의 개수를 가져옵니다.
    var sliderWidth = 1100 * liCount; // 슬라이더의 너비를 계산합니다.
    slider.style.width = sliderWidth + 'px'; // 슬라이더의 너비를 설정합니다.
};
</script> 

</head>
<body>
<div id="container"> <!-- 메인 컨테이너 -->
<jsp:include page="/include/Header.jsp" flush="false"/>

<div class="row justify-content-center">

	<div id="mainContainer">
		<div class="sliderouter">
            <div class="slider">
                <div class="prev">&lt;</div>
               <ul class="visual_img">
				    <c:if test="${not empty imgVO}">
				            <c:if test="${not empty imgVO.img1}">
				                <li class="image-container"><img src="${contextPath}/data/${imgVO.img1}" alt="Image 1" /></li>
				            </c:if>
				            <c:if test="${not empty imgVO.img2}">
				                <li class="image-container"><img src="${contextPath}/data/${imgVO.img2}" alt="Image 2" /></li>
				            </c:if>
				            <c:if test="${not empty imgVO.img3}">
				                <li class="image-container"><img src="${contextPath}/data/${imgVO.img3}" alt="Image 3" /></li>
				            </c:if>
				            <c:if test="${not empty imgVO.img4}">
				                <li class="image-container"><img src="${contextPath}/data/${imgVO.img4}" alt="Image 4" /></li>
				            </c:if>
				            <c:if test="${not empty imgVO.img5}">
				                <li class="image-container"><img src="${contextPath}/data/${imgVO.img5}" alt="Image 5" /></li>
				            </c:if>
				    </c:if>
				</ul>
                <div class="next">&gt;</div>
            </div>
          </div>
		<div id="infoContainer">
			<div id="info1">
				<img alt="" src="${contextPath }/data/${imgVO.infoImg }" style="width: 100%"><!-- 룸 설명 이미지 -->
			</div>
			<div id="info2"  style="text-align: center;">
				<table>
					<tr>
						<td style="font-size: 20pt; text-align: left; font-weight: bold;">
							${roomVO.roomName }
						</td>
					</tr>
					<tr>
						<td style="text-align: left; font-size: 14pt">
							${roomVO.roomType }
							
						</td>
					</tr>
					<tr>
						<td style="font-size: 16pt; font-weight: bold; text-align: right;">
						<span style="font-size: 10pt; font-weight: bold;">KRW  </span>${roomVO.roomCost }~ 
						</td>
					</tr> 
					<tr>
						<td style="text-align: right; font-size: 8pt">
						기준 ${roomVO.headCount }인 <!-- 최대 가능 인원 수 -->
						</td>
					</tr>
				</table>
				<hr>
				예약 가능한 캘린더 표시<br>
				<button class="btn_css" id="revBtn" onclick="location.href='${contextPath}/RevInsert?roomNo=${roomVO.roomNo }'">예약하기</button> <!-- 예약 버튼 클릭시 세션값 확인 -->
			</div>
		</div>
	</div>
</div>
</div>

	<jsp:include page="/include/Footer.jsp" ></jsp:include>

</body>
</html>