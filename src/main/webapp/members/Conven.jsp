<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>
    
<!DOCTYPE html>
<html>
<head>
  <title>주변정보</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
     <script src="http://code.jquery.com/jquery-latest.min.js"></script>
     <link rel="stylesheet" href="../style/css/animate.css">
    <link rel="stylesheet" href="../style/css/icomoon.css">
    <link rel="stylesheet" href="../style/css/style.css">
</head>
<body>
<jsp:include page="/include/Header.jsp" flush="false"/>

 <div class="hero-wrap" style="background-image: url('${contextPath}/style/images/bg.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text d-flex align-itemd-end justify-content-center">
          <div class="col-md-9 ftco-animate text-center d-flex align-items-end justify-content-center">
          	<div class="text">
	            <p class="breadcrumbs mb-2"><span class="mr-2">Nearby</span> <span>Information</span></p>
	            <h1 class="mb-4 bread">주변정보</h1>
            </div>
          </div>
        </div>
      </div>
    </div>
	<br><br>
    <section class="ftco-section">
      <div class="container-fluid">
        <div class="row d-flex">
          <div class="col-3  ftco-animate">
            <div class="blog-entry align-self-stretch">
              <p class="block-20" style="background-image: url('${contextPath}/style/images/burgerking.jpg');">
              </p>
              <div class="text mt-3 d-block">
               <h3 class="heading mt-3">Burgerking is king~ 이름이 버거'킹' 이라고 불리는 이유가 있는 유명 햄버거 프랜차이즈 버거킹.</h3>               
                <div class="meta mb-3">
                  <div>April 9, 2024</div>
                  <div>관리자</div>
                  <div><span class="icon-chat"></span> 3</div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-3 ftco-animate">
            <div class="blog-entry align-self-stretch">
              <p  class="block-20" style="background-image: url('${contextPath}/style/images/youktang.jpg');">
              </p>
              <div class="text mt-3">
                <h3 class="heading mt-3">해장이 필요하거나 진한 국물이 먹고 싶을 때! 화곡역 인근 맛집 육탕상점.</h3>
                <div class="meta mb-3">
                  <div>April 9, 2024</div>
                  <div>관리자</div>
                  <div><span class="icon-chat"></span> 3</div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-3  ftco-animate">
            <div class="blog-entry align-self-stretch">
              <p class="block-20" style="background-image: url('${contextPath}/style/images/seoul_center.jpg');">
              </p>
              <div class="text mt-3">
                <h3 class="heading mt-3">실무 SW교육을 듣고 싶을 때? 대한민국 최고의 강사가 교육하는 대한상공회의소 403호.</h3>
                <div class="meta mb-3">
                  <div>April 9, 2024</div>
                  <div>관리자</div>
                  <div><span class="icon-chat"></span> 3</div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-3  ftco-animate">
            <div class="blog-entry align-self-stretch">
              <p class="block-20" style="background-image: url('${contextPath}/style/images/market.jpg');">
              </p>
              <div class="text mt-3">
                <h3 class="heading mt-3">여행지에서 필요한 물품이 없어서 곤란하셨죠? GS25, CU 입점! </h3>
                <div class="meta mb-3">
                  <div>April 9, 2024</div>
                  <div>관리자</div>
                  <div><span class="icon-chat"></span> 3</div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-3  ftco-animate">
            <div class="blog-entry align-self-stretch">
              <p class="block-20" style="background-image: url('${contextPath}/style/images/hotspring.jpg');">
              </p>
              <div class="text mt-3 d-block">
                <h3 class="heading mt-3">피곤을 날려줄 까치산 지하암반수 온천. 1000평 크기의 대형 편의시설 구비. </h3>
                <div class="meta mb-3">
                  <div>April 9, 2024</div>
                  <div>관리자</div>
                  <div><span class="icon-chat"></span> 3</div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-3  ftco-animate">
            <div class="blog-entry align-self-stretch">
              <p class="block-20" style="background-image: url('${contextPath}/style/images/airport.jpg');">
              </p>
              <div class="text mt-3">
                <h3 class="heading mt-3">접근성이 좋은 대중교통의 중심지. 우리집에 놀러와 Hotel~ 화곡역, 김포공항으로 쉬운 접근성.</h3>
                <div class="meta mb-3">
                  <div>April 9, 2024</div>
                  <div>관리자</div>
                  <div><span class="icon-chat"></span> 3</div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-3 ftco-animate">
            <div class="blog-entry align-self-stretch">
              <p class="block-20" style="background-image: url('${contextPath}/style/images/hospital.jpg');">
              </p>
              <div class="text mt-3">
                <h3 class="heading mt-3">위급상항시 상시 이용 가능한 권역응급으료센터 화곡병원. 우리집에 놀러와 Hotel 맞은편.</h3>
                <div class="meta mb-3">
                  <div>April 9, 2024</div>
                  <div>관리자</div>
                  <div><span class="icon-chat"></span> 3</div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-3  ftco-animate">
            <div class="blog-entry align-self-stretch">
              <p class="block-20" style="background-image: url('${contextPath}/style/images/grandcanyon.jpg');">
              </p>
              <div class="text mt-3">
                <h3 class="heading mt-3">멋진 풍경을 자랑하는 세계적인 관광지 Grand Canyon! 도보 20분, 자차 5분 거리 위치</h3>
                <div class="meta mb-3">
                  <div>April 9, 2024</div>
                  <div>관리자</div>
                  <div><span class="icon-chat"></span> 3</div>
                </div>
              </div>
            </div>
          </div>
        </div>
      
      </div>
    </section>
  <script src="../style/js/jquery.waypoints.min.js"></script>
  <script src="../style/js/jquery.stellar.min.js"></script>
  <script src="../style/js/owl.carousel.min.js"></script>
  <script src="../style/js/aos.js"></script>
  <script src="../style/js/scrollax.min.js"></script>


  <script src="../style/js/main.js"></script>
    
<jsp:include page="/include/Footer.jsp" flush="false"/>
</body>
</html>