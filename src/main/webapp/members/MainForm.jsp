<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>


<!DOCTYPE html>
<html>
  <head>  
    <title>MYHOME</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 캐러셀 -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" ></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" >
<!-- play icon -->
<script src="https://kit.fontawesome.com/4e5b2f86bb.js" ></script>
<!-- 캘린더 import -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script src="${contextPath}/util/MainFormCalendar.js"></script>

<!-- css 적용 -->
<link rel="stylesheet" href="../style/css/flaticon.css">
<link rel="stylesheet" href="../style/css/style.css">
<!-- 구글 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

<style type="text/css">
/* 폰트 적용 */
h1, h2, h3, h4, h5, span, a, p, button {
	font-family: "Noto Sans KR", sans-serif;
	font-optical-sizing: auto;
	font-weight: <weight>;
	font-style: normal;
}
	.carousel h5 {
		color: #fff;
	}
	.carousel h5, .carousel p {
		font-size: 16pt;
	}
	.eng {
		font-size: 14pt;
		font-family: "Rajdhani", sans-serif;
  		font-weight: 400;
  		font-style: normal;
	}
	
/* 검색 폼 */
	.searchbox{
		width: 90%;
		display: flex;
		justify-content: center;
		margin: 20px auto;
		height: 100px;
		font-size: 16pt;
	}
	.searchbox form{
		display: flex;
	}
	.searchbox form > div {
		flex: 2;
		margin: 10px 5px;
		
	}
	.searchbox form > button{
		flex: 3;
		margin: 10px auto;
	}
	.checkinbox{
		flex: 2;
		display: inline-block;
		margin: 0 auto;
	}
	.searchbox input, .searchbox select{
		flex: 2;
		width: 100%;
		border: none;
	}
	.checkoutbox{
		display: inline-block;
		flex: 2;
		margin: auto auto;
	}
	.roombox{
		display: inline-block;
		flex: 2;
		height: 80px;
		margin: 0 auto;
	}
	.headCountbox{
		display: inline-block;
		margin: 0 auto;
	}
	.searchbox_button{
 		display: inline-block;
 		line-height: 60px;
		height: 80px;
		border: none;
		background-color: #8d703b;
		color: #fff;
	}
	.searchbox_button:hover{
 		background-color: #000;
	}
	.searchbox_button:active{
 		background-color: ##78d5ef;
	}
	
	/* main_1 */
	.main_1 {
		display: flex;
		width: 80%;
		margin: 50px auto;
	}
	.main_1 > div{
		flex:1;
	}
	.main_1 >div:nth-child(1) {
		display: flex;
		width: 50%;
		text-align: center;
		align-items: center;
		justify-content: center;
	}
	.main_1 >div:nth-child(1) > span {
		display: block;
	}
	
	.main_1 >div:nth-child(2) {
		width: 50%;
	}
	.playicon{
		display: flex;
		justify-content: center;
		align-items: center;
		width: 80px;
		height: 80px;
		border-radius: 50%;
		background-color: #8d703b;
		margin: auto;
	}
	
	/* main_2 */
	.main_2{
		display: flex;
		width: 80%;
		margin: 20px auto;
	}
	.main_2 > div{
		flex: 1;
		text-align: center;
		margin: 0 10px;
	}
	
	.round{
		display: flex;
		align-items: center;
		justify-content: center;
		width: 100px;
		height: 100px;
		background-color: #f6f2ea;
		border-radius: 50%;
		margin: 0 auto;
	}
	.round > span{
		font-size: 30pt;
		color: #8d703b;
		margin: 0 auto;
	}
	
	/* roomList */
	.roomList{
		width: 70%;
		margin: 20px auto;
	}
	.OurRoom{
		display: block;
		width: 100%;
		margin: 0 auto;
		text-align: center;
	}
	.roompack{
		display: flex;
		flex-wrap: wrap; 
		justify-content: center;
		margin: 0 auto;
	}
	.roompack > .room {
		margin: 10px 20px;
		width: 500px;
		aspect-ratio: 16 / 9;
	}

	/* 모달 */
	.modal {
		display: none;
		position: fixed;
		z-index: 1;
		left: 0;
		top: 0;
		width: 100%;
		height: 100%;
		overflow: auto;
		background-color: rgba(0, 0, 0, 0.5);
	}
	.modal-content {
		background-color: #fefefe;
		margin: 15% auto;
		padding: 20px;
		border: 1px solid #888;
		width: 80%;
	}
	.close {
		color: #aaa;
		float: right;
		font-size: 28px;
		font-weight: bold;
	}
	.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
.playicon {
	border-radius:0%;
    display: block;
    width: 100%; /* 적절한 크기로 조절 */
    height: 50%;
    padding-top: 56.25%; /* 16:9 비율 */
    background-size: cover;
    position: relative;
}

.fa-play {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    font-size: 48px; /* 아이콘 크기 조절 가능 */
}

</style>
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function() {
	var modalBtn = document.getElementById("modalBtn"); // HTML에 modalBtn ID를 가진 요소 추가해야 함
	var modal = document.getElementById("myModal"); // HTML에 myModal ID를 가진 요소 추가해야 함
	var closeBtn = document.getElementsByClassName("close")[0]; // closeBtn을 클래스로 찾는 것으로 수정
	
	modalBtn.onclick = function(){
		modal.style.display = "block";
		video.src = "https://www.youtube.com/embed/f2yvUavQ_ZY?autoplay=1";
	}
	
	closeBtn.onclick = function(){
		modal.style.display = "none";
		video.src = "";
	}
	window.onclick = function(event) {
		if(event.target == modal){
			modal.style.display = "none";
			video.src = "";
		}
	}
});

document.getElementById("modalBtn").addEventListener("click", function(event) {
    event.preventDefault();
});
</script>

</head>
<body>
	<jsp:include page="/include/Header.jsp" flush="false"></jsp:include>
	<!-- END nav -->
	<div id="carouselExampleCaptions" class="carousel slide" style="width: 80%; margin: 0 auto;">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="3" aria-label="Slide 4"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="4" aria-label="Slide 5"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="5" aria-label="Slide 6"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active" data-bs-interval="10000">
				<img alt="" src="${contextPath}/style/images/testroom-1.jpg" width="100%" >
				<div class="carousel-caption d-none d-md-block">
					<h5>우리집에 놀러와</h5>
					<p class="eng">Hotels & Resorts</p>
				</div>
			</div>
			<div class="carousel-item">
				<img alt="" src="${contextPath }/style/images/testroom-2.jpg" width="100%" >
				<div class="carousel-caption d-none d-md-block">
					<h5>나만의 숲 속 아지트, 우리집에서 삶의 쉼표를 찾아 보세요.</h5>
					<p class="eng">Hotels & Resorts</p>
				</div>
			</div>
			<div class="carousel-item" >
				<img alt="" src="${contextPath }/style/images/testroom-3.jpg" width="100%" >
				<div class="carousel-caption d-none d-md-block">
					<h5>감각적 인테리어와 최신의 테크놀로지가 선보이는 <br>새로운 라이프 스타일 트렌드를 경험하세요.</h5>
					<p class="eng">Hotels & Resorts</p>
				</div>
			</div>
				<div class="carousel-item" >
				<img alt="" src="${contextPath }/style/images/testroom-4.jpg" width="100%" >
				<div class="carousel-caption d-none d-md-block">
					<h5>생동감 넘치는 색다른 여행의 시작.</h5>
					<p class="eng">Hotels & Resorts</p>
				</div>
			</div>
				<div class="carousel-item" >
				<img alt="" src="${contextPath }/style/images/testroom-5.jpg" width="100%" >
				<div class="carousel-caption d-none d-md-block">
					<h5>자연의 편안함과 감동적인 서비스가 마음까지 따뜻해지는 행복한 경험을 선사합니다.</h5>
					<p class="eng">Hotels & Resorts</p>
				</div>
			</div>
				<div class="carousel-item" >
				<img alt="" src="${contextPath }/style/images/testroom-6.jpg" width="100%" >
				<div class="carousel-caption d-none d-md-block">
					<h5>최고의 순간을 경험하세요</h5>
					<p class="eng">Hotels & Resorts</p>
				</div>
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
	
	<!-- 메인 검색 폼 -->
	<div class="searchbox">
		<form action="${contextPath}/RoomFilterList?type=main" method="get">
			<div class="checkinbox">
				<label>체크인</label><br>
				<input type="text" name="checkIn" id="checkInDate" placeholder="체크인 날짜" readonly>
			</div>
			<div class="checkoutbox">
				<label>체크아웃</label><br>
				<input type="text" name="checkOut" id="checkOutDate" placeholder="체크아웃 날짜" readonly>
			</div>
			<div class="roombox">
				<label>객실</label><br>
				<select name="roomType">
					<option value="default" selected>선택</option>
					<option value="Superior">슈페리어 룸</option>
					<option value="Deluxe">디럭스 룸</option>
					<option value="GrandDeluxe">그랜드 디럭스 룸</option>
					<option value="JuniorSuite">주니어 스위트 룸</option>
					<option value="CornerSuite">코너스 스위트 룸</option>
					<option value="SuperiorSuite">슈페리어 스위트 룸</option>
					<option value="RoyalSuite">로열 스위트 룸</option>
					<option value="PresidentialSuite">프레지덴셜 스위트 룸</option>
					<option value="Connecting">커넥팅 룸</option>
				</select>
			</div>
			<div class="headCountbox">
				<label>인원 수</label><br>
				<select name="headCount">
					<option value="1">1 명</option>
					<option value="2" selected>2 명</option>
					<option value="3">3 명</option>
					<option value="4">4 명</option>
					<option value="5">5 명</option>
					<option value="6">6 명</option>
					<option value="7">7 명</option>
					<option value="8">8 명</option>
					<option value="9">9 명</option>
					<option value="10">10 명</option>
				</select>
			</div>
			<input type="hidden" name="type" value="main" >
			
			<button type="submit" class="searchbox_button" >객실 검색</button>
		</form>
	</div>
	<!-- 모달창 -->
	<div id="myModal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
			
			<iframe width="100%"  style="aspect-ratio: 16 / 9;" id="video" src="https://www.youtube.com/embed/f2yvUavQ_ZY?autoplay=1" frameborder="0" allowfullscreen ></iframe>
			
		</div>
	</div>
	<!-- 리조트 실행 --> 
	<section class="main_1">
    <div class="leftside">
        <a class="playicon" id="modalBtn" href="#" style="background-image:url('${contextPath}/style/images/some.jpg');">
            <i class="fa-solid fa-play fa-xl" style="color: #ffffff;"></i>
        </a>
    </div>
	
  
	
		<div style=" margin-left: 70px;" class="rightside" >
			<div>
				<span class="eng">Welcome to OurHome Hotel</span>
				<h2>색다른 경험이 될, <br>우리집 리조트</h2>
			</div>
			<div>
				<p>당신에게 쉼표의 시간은 언제인가요? 본디 쉼표란 '쉬어간다'는 의미와 함께, 음악에서는 빽빽한 음표 사이에 위치한 쉼표가 이전과는 다른 리듬을 만들어 내는 역할을 하기도 합니다. 비교할 수 없는 평온함과 여유로움을 통해 잠들어 있던 감각을 깨우는 음악 속 쉼표 같은 휴식을 가질 수 있는 곳, 우리집 리조트로 여러분을 초대합니다.</p>
				<p>누구나 평생 한 번쯤 경험하고 싶어 하는 지상 최고의 낙원. 빌라는 최상급 수준의 럭셔리함을 갖추고 있습니다. 우리집 리조트 내 모든 객실 중 가장 넓은 규모가 특징인 이곳은 비교할 수 없는 풍요로움은 물론, 내집에서 느껴지는 안락함도 동시에 느낄 수 있는 디테일로 구성되어 있습니다. 모든 고객에게 차별화된 경험을 제공하기 위해 세심하게 관리됩니다. 럭셔리한 하루와 함께 최대한의 프라이버시를 보장받고 싶은 개인 여행자부터 가족 또는 연인이 온종일 머무르기에도 완벽한 공간입니다.</p>
				<p>VIP 전용 게이트를 통해 출입하고, 독립된 형태의 발코니에서 친밀한 야외 디너를 즐기며 활력을 되찾아 주는 자쿠지와 스파 시설이 딸린 개인용 야외 수영장에서 한적한 시간을 즐겨보세요. 또한 빌라 투숙객들에게만 제공되는 버틀러 서비스는 고객별 맞춤형으로 제공되어 가장 편안한 휴식을 돕습니다. 머무는 동안 비교할 수 없는 품격과 세련미에 흠뻑 빠져보세요.</p>
			</div>
		</div>
	</section>
	
	<section class="main_2">
		<div>
			<div class="round">
				<span class="flaticon-reception-bell"></span>
			</div>
			<div>
				<h3>24/7 Front Desk</h3>
				<p>언제든 연락가능한 프론트 데스크, 편안함을 누리세요</p>
			</div>
		</div>
		
		<div>
			<div class="round">
				<span class="flaticon-serving-dish"></span>
			</div>
			<div>
				<h3>Restaurant Bar</h3>
				<p>풍성한 맛과 아름다운 분위기, 레스토랑바에서 특별한 순간을 만나보세요!</p>
			</div>
		</div>
		
		<div>
			<div class="round">
				<span class="flaticon-car"></span>
			</div>
			<div>
				<h3>Transfer Services</h3>
				<p>여행의 시작부터 끝까지, 우리집 리조트는 언제나 여러분을 지원합니다.</p>
			</div>
		</div>
		
		<div>
			<div class="round">
				<span class="flaticon-spa"></span>
			</div>
			<div>
				<h3>Spa Suites</h3>
				<p>스파 스위트룸에서 특별한 시간을 보내며 몸과 마음을 풀어보세요.</p>
			</div>
		</div>
	</section>
	
	<!-- 객실 리스트 -->
	<section class="roomList">
		<div >
			<div class="OurRoom">
				<h2>Our Rooms</h2>
			</div>
			<div class="roompack">
				<div class="room">
    				<a href="${contextPath }/RoomFilterList?type=mainImg&roomType=Superior" class="img d-flex justify-content-center align-items-center" style="background-image: url(${contextPath}/data/Superior-1.jpg);"> <!-- 방 이미지 출력 -->
    					<div class="icon d-flex justify-content-center align-items-center">
    						<span><i class="fa-solid fa-magnifying-glass fa-sm"></i></span>
    					</div>
    				</a>
    				<div class="text p-3 text-center">
    					<h3 class="mb-3"><a href="${contextPath }/RoomFilterList?type=mainImg&roomType=Superior"> 슈페리어 </a></h3>
    					<p><span class="price mr-3">200,000원</span> <span class="per"> 1박 </span></p>
    					<hr>
    					<p class="pt-1"><a href="${contextPath }/RoomFilterList?type=mainImg&roomType=Superior" class="btn-custom">방 상세보기<span> <i class="fa-solid fa-arrow-right-long fa-sm"></i></span></a></p>
    				</div>
    			</div>
				<div class="room">
    				<a href="${contextPath }/RoomFilterList?type=mainImg&roomType=Deluxe" class="img d-flex justify-content-center align-items-center" style="background-image: url(${contextPath}/data/Deluxe-1.jpg);"> <!-- 방 이미지 출력 -->
    					<div class="icon d-flex justify-content-center align-items-center">
    						<span><i class="fa-solid fa-magnifying-glass fa-sm"></i></span>
    					</div>
    				</a>
    				<div class="text p-3 text-center">
    					<h3 class="mb-3"><a href="${contextPath }/RoomFilterList?type=mainImg&roomType=Deluxe"> 디럭스 </a></h3>
    					<p><span class="price mr-3">260,000원</span> <span class="per"> 1박</span></p>
    					<hr>
    					<p class="pt-1"><a href="${contextPath }/RoomFilterList?type=mainImg&roomType=Deluxe" class="btn-custom">방 상세보기<span> <i class="fa-solid fa-arrow-right-long fa-sm"></i></span></a></p>
    				</div>
    			</div>
			</div>
			<div class="roompack">
				<div class="room">
    				<a href="${contextPath }/RoomFilterList?type=mainImg&roomType=GrandDeluxe" class="img d-flex justify-content-center align-items-center" style="background-image: url(${contextPath}/data/GrandDeluxe-1.jpg);"> <!-- 방 이미지 출력 -->
    					<div class="icon d-flex justify-content-center align-items-center">
    						<span><i class="fa-solid fa-magnifying-glass fa-sm"></i></span>
    					</div>
    				</a>
    				<div class="text p-3 text-center">
    					<h3 class="mb-3"><a href="${contextPath }/RoomFilterList?type=mainImg&roomType=GrandDeluxe"> 그랜드 디럭스 </a></h3>
    					<p><span class="price mr-3">640,000원</span> <span class="per"> 1박</span></p>
    					<hr>
    					<p class="pt-1"><a href="${contextPath }/RoomFilterList?type=mainImg&roomType=GrandDeluxe" class="btn-custom">방 상세보기<span> <i class="fa-solid fa-arrow-right-long fa-sm"></i></span></a></p>
    				</div>
    			</div>
				<div class="room">
    				<a href="${contextPath }/RoomFilterList?type=mainImg&roomType=JuniorSuite" class="img d-flex justify-content-center align-items-center" style="background-image: url(${contextPath}/data/JuniorSuite-1.jpg);"> <!-- 방 이미지 출력 -->
    					<div class="icon d-flex justify-content-center align-items-center">
    						<span><i class="fa-solid fa-magnifying-glass fa-sm"></i></span>
    					</div>
    				</a>
    				<div class="text p-3 text-center">
    					<h3 class="mb-3"><a href="${contextPath }/RoomFilterList?type=mainImg&roomType=JuniorSuite"> 주니어 스위트 </a></h3>
    					<p><span class="price mr-3">440,000원</span> <span class="per"> 1박</span></p>
    					<hr>
    					<p class="pt-1"><a href="${contextPath }/RoomFilterList?type=mainImg&roomType=JuniorSuite" class="btn-custom">방 상세보기<span> <i class="fa-solid fa-arrow-right-long fa-sm"></i></span></a></p>
    				</div>
    			</div>
			</div>
			<div class="roompack">
				<div class="room">
    				<a href="${contextPath }/RoomFilterList?type=mainImg&roomType=CornerSuite" class="img d-flex justify-content-center align-items-center" style="background-image: url(${contextPath}/data/CornerSuite-1.jpg);"> <!-- 방 이미지 출력 -->
    					<div class="icon d-flex justify-content-center align-items-center">
    						<span><i class="fa-solid fa-magnifying-glass fa-sm"></i></span>
    					</div>
    				</a>
    				<div class="text p-3 text-center">
    					<h3 class="mb-3"><a href="${contextPath }/RoomFilterList?type=mainImg&roomType=CornerSuite"> 코너스 스위트 </a></h3>
    					<p><span class="price mr-3">420,000원</span> <span class="per"> 1박</span></p>
    					<hr>
    					<p class="pt-1"><a href="${contextPath }/RoomFilterList?type=mainImg&roomType=CornerSuite" class="btn-custom">방 상세보기<span> <i class="fa-solid fa-arrow-right-long fa-sm"></i></span></a></p>
    				</div>
    			</div>
				<div class="room">
    				<a href="${contextPath }/RoomFilterList?type=mainImg&roomType=SuperiorSuite" class="img d-flex justify-content-center align-items-center" style="background-image: url(${contextPath}/data/SuperiorSuite-1.jpg);"> <!-- 방 이미지 출력 -->
    					<div class="icon d-flex justify-content-center align-items-center">
    						<span><i class="fa-solid fa-magnifying-glass fa-sm"></i></span>
    					</div>
    				</a>
    				<div class="text p-3 text-center">
    					<h3 class="mb-3"><a href="${contextPath }/RoomFilterList?type=mainImg&roomType=SuperiorSuite"> 슈페리어 스위트 </a></h3>
    					<p><span class="price mr-3">510,000원</span> <span class="per"> 1박</span></p>
    					<hr>
    					<p class="pt-1"><a href="${contextPath }/RoomFilterList?type=mainImg&roomType=SuperiorSuite" class="btn-custom">방 상세보기<span> <i class="fa-solid fa-arrow-right-long fa-sm"></i></span></a></p>
    				</div>
    			</div>
			</div>
		</div>
		
	</section>
	
	<jsp:include page="/include/Footer.jsp" flush="false"></jsp:include>

  </body>
</html>