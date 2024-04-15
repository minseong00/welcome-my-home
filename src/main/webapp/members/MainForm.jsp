<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>


<!DOCTYPE html>
<html>
  <head>  
    <title>메인화면</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<!-- css 적용 -->
<link rel="stylesheet" href="${contextPath }/style/css/flaticon.css">
<link rel="stylesheet" href="${contextPath }/style/css/style.css">
<!-- 캐러셀 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" >
<!-- play icon -->
<script src="https://kit.fontawesome.com/4e5b2f86bb.js" ></script>
<!-- 캘린더 import -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script src="${contextPath}/util/MainFormCalendar.js"></script>

<style type="text/css">
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
		margin: 0 auto;
	}
	.roompack > div {
		margin: 10px 20px;
	}
	/*footer*/
	
</style>


</head>
<body>
	<jsp:include page="/include/Header.jsp" flush="false"></jsp:include>
	<!-- END nav -->
	<div id="carouselExampleCaptions" class="carousel slide">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active" data-bs-interval="10000">
				<img alt="" src="${contextPath }/style/images/room-1.jpg" width="100%" height="500px">
				<div class="carousel-caption d-none d-md-block">
					<h5>우리집에 놀러와</h5>
					<p>Hotels & Resorts</p>
				</div>
			</div>
			<div class="carousel-item">
				<img alt="" src="${contextPath }/style/images/room-2.jpg" width="100%" height="500px">
				<div class="carousel-caption d-none d-md-block">
					<h5>최고의 순간을 경험하세요</h5>
					<p>Join With Us</p>
				</div>
			</div>
			<div class="carousel-item">
				<img alt="" src="${contextPath }/style/images/room-3.jpg" width="100%" height="500px">
				<div class="carousel-caption d-none d-md-block">
					<h5>Third slide label</h5>
					<p>Some representative placeholder content for the third slide.</p>
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
		<form action="">
			<div class="checkinbox">
				<label>체크인</label><br>
				<input type="text" name="checkIn" id="checkInDate" placeholder="체크인 날짜">
			</div>
			<div class="checkoutbox">
				<label>체크아웃</label><br>
				<input type="text" name="checkOut" id="checkOutDate" placeholder="체크아웃 날짜">
			</div>
			<div class="roombox">
				<label>객실</label><br>
				<select name="">
					<option value="">싱글 룸</option>
					<option value="">더블 룸</option>
					<option value="">슈페리얼 룸</option>
					<option value="">슈페리얼 더블룸</option>
					<option value="">럭셔리 룸</option>
				</select>
			</div>
			<div class="headCountbox">
				<label>인원 수</label><br>
				<select name="">
					<option value="">1 명</option>
					<option value="">2 명</option>
					<option value="">3 명</option>
					<option value="">4 명</option>
					<option value="">5 명</option>
					<option value="">6 명</option>
				</select>
			</div>
			<button type="submit" class="searchbox_button">Check Availability</button>
		</form>
	</div>
	<!-- 리조트 실행 --> 
	<section class="main_1">
		<div class="leftside">
			<a href="" class="playicon">
				<i class="fa-solid fa-play fa-xl" style="color: #ffffff;"></i>
			</a>
		</div>
		<div class="rightside">
			<div>
				<span>Welcome to Deluxe Hotel</span>
				<h2>Welcome To Our Hotel</h2>
			</div>
			<div>
				<p>On her way she met a copy. The copy warned the Little Blind Text, that where it came from it would have been rewritten a thousand times and everything that was left from its origin would be the word "and" and the Little Blind Text should turn around and return to its own, safe country. But nothing the copy said could convince her and so it didn’t take long until a few insidious Copy Writers ambushed her, made her drunk with Longe and Parole and dragged her into their agency, where they abused her for their.</p>
				<p>When she reached the first hills of the Italic Mountains, she had a last view back on the skyline of her hometown Bookmarksgrove, the headline of Alphabet Village and the subline of her own road, the Line Lane. Pityful a rethoric question ran over her cheek, then she continued her way.</p>
			</div>
		</div>
	</section>
	
	<section class="main_2">
		<div>
			<div class="round">
				<span class="flaticon-reception-bell"></span>
			</div>
			<div>
				<h3>25/7 Front Desk</h3>
				<p>A small river named Duden flows by their place and supplies.</p>
			</div>
		</div>
		
		<div>
			<div class="round">
				<span class="flaticon-serving-dish"></span>
			</div>
			<div>
				<h3>Restaurant Bar</h3>
				<p>A small river named Duden flows by their place and supplies.</p>
			</div>
		</div>
		
		<div>
			<div class="round">
				<span class="flaticon-car"></span>
			</div>
			<div>
				<h3>Transfer Services</h3>
				<p>A small river named Duden flows by their place and supplies.</p>
			</div>
		</div>
		
		<div>
			<div class="round">
				<span class="flaticon-spa"></span>
			</div>
			<div>
				<h3>Spa Suites</h3>
				<p>A small river named Duden flows by their place and supplies.</p>
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
    				<a href="rooms.html" class="img d-flex justify-content-center align-items-center" style="background-image: url(${contextPath}/style/images/room-1.jpg);"> <!-- 방 이미지 출력 -->
    					<div class="icon d-flex justify-content-center align-items-center">
    						<span class="icon-search2"></span>
    					</div>
    				</a>
    				<div class="text p-3 text-center">
    					<h3 class="mb-3"><a href="rooms.html"> 방이름 </a></h3>
    					<p><span class="price mr-3">가격</span> <span class="per"> 가격 단위</span></p>
    					<hr>
    					<p class="pt-1"><a href="room-single.html" class="btn-custom">방 상세 보기 버튼<span class="icon-long-arrow-right"></span></a></p>
    				</div>
    			</div>
				<div class="room">
    				<a href="rooms.html" class="img d-flex justify-content-center align-items-center" style="background-image: url(${contextPath}/style/images/room-1.jpg);"> <!-- 방 이미지 출력 -->
    					<div class="icon d-flex justify-content-center align-items-center">
    						<span class="icon-search2"></span>
    					</div>
    				</a>
    				<div class="text p-3 text-center">
    					<h3 class="mb-3"><a href="rooms.html"> 방이름 </a></h3>
    					<p><span class="price mr-3">가격</span> <span class="per"> 가격 단위</span></p>
    					<hr>
    					<p class="pt-1"><a href="room-single.html" class="btn-custom">방 상세 보기 버튼<span class="icon-long-arrow-right"></span></a></p>
    				</div>
    			</div>
			</div>
			<div class="roompack">
				<div class="room">
    				<a href="rooms.html" class="img d-flex justify-content-center align-items-center" style="background-image: url(${contextPath}/style/images/room-1.jpg);"> <!-- 방 이미지 출력 -->
    					<div class="icon d-flex justify-content-center align-items-center">
    						<span class="icon-search2"></span>
    					</div>
    				</a>
    				<div class="text p-3 text-center">
    					<h3 class="mb-3"><a href="rooms.html"> 방이름 </a></h3>
    					<p><span class="price mr-3">가격</span> <span class="per"> 가격 단위</span></p>
    					<hr>
    					<p class="pt-1"><a href="room-single.html" class="btn-custom">방 상세 보기 버튼<span class="icon-long-arrow-right"></span></a></p>
    				</div>
    			</div>
				<div class="room">
    				<a href="rooms.html" class="img d-flex justify-content-center align-items-center" style="background-image: url(${contextPath}/style/images/room-1.jpg);"> <!-- 방 이미지 출력 -->
    					<div class="icon d-flex justify-content-center align-items-center">
    						<span class="icon-search2"></span>
    					</div>
    				</a>
    				<div class="text p-3 text-center">
    					<h3 class="mb-3"><a href="rooms.html"> 방이름 </a></h3>
    					<p><span class="price mr-3">가격</span> <span class="per"> 가격 단위</span></p>
    					<hr>
    					<p class="pt-1"><a href="room-single.html" class="btn-custom">방 상세 보기 버튼<span class="icon-long-arrow-right"></span></a></p>
    				</div>
    			</div>
			</div>
			<div class="roompack">
				<div class="room">
    				<a href="rooms.html" class="img d-flex justify-content-center align-items-center" style="background-image: url(${contextPath}/style/images/room-1.jpg);"> <!-- 방 이미지 출력 -->
    					<div class="icon d-flex justify-content-center align-items-center">
    						<span class="icon-search2"></span>
    					</div>
    				</a>
    				<div class="text p-3 text-center">
    					<h3 class="mb-3"><a href="rooms.html"> 방이름 </a></h3>
    					<p><span class="price mr-3">가격</span> <span class="per"> 가격 단위</span></p>
    					<hr>
    					<p class="pt-1"><a href="room-single.html" class="btn-custom">방 상세 보기 버튼<span class="icon-long-arrow-right"></span></a></p>
    				</div>
    			</div>
				<div class="room">
    				<a href="rooms.html" class="img d-flex justify-content-center align-items-center" style="background-image: url(${contextPath}/style/images/room-1.jpg);"> <!-- 방 이미지 출력 -->
    					<div class="icon d-flex justify-content-center align-items-center">
    						<span class="icon-search2"></span>
    					</div>
    				</a>
    				<div class="text p-3 text-center">
    					<h3 class="mb-3"><a href="rooms.html"> 방이름 </a></h3>
    					<p><span class="price mr-3">가격</span> <span class="per"> 가격 단위</span></p>
    					<hr>
    					<p class="pt-1"><a href="room-single.html" class="btn-custom">방 상세 보기 버튼<span class="icon-long-arrow-right"></span></a></p>
    				</div>
    			</div>
			</div>
		</div>
		
	</section>
	
	<jsp:include page="/include/Footer.jsp" flush="false"></jsp:include>

  </body>
</html>