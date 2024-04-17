<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>

    <footer class="ftco-footer ftco-bg-dark ftco-section " style="padding: 2em 0;" >
      <div class="container">
        <div class="row mb-5">
          <div class="col">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">우리집에 놀러와</h2>
              <p>화곡역 2번출구 앞, 대한상공회의소 서울교육기술센터 뒤편에 있는 초호화 리조트. 모두가 오고싶지만 아무나 오지 못하는 특별한 장소!
              </p>
            </div>
          </div>
          <div class="col">
            <div class="ftco-footer-widget mb-4 ml-md-5">
              <h2 class="ftco-heading-2">사용자 링크</h2>
              <ul class="list-unstyled">
                <li><a href="${contextPath}/members/Conven.jsp" class="py-2 d-block">주변정보</a></li>
                <li><a href="${contextPath}/RoomList?type=member" class="py-2 d-block">객실목록</a></li>
                <li><a href="${contextPath}/RevList?type=calendar" class="py-2 d-block">예약</a></li>
                <li><a href="${contextPath}/members/MemJoin.jsp" class="py-2 d-block">회원가입</a></li>
              </ul>
            </div>
          </div>
         
          <div class="col">
             <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">&nbsp;접속</h2>
              <ul class="list-unstyled">
                <li><a href="" onclick="window.open('${contextPath}/clauses/Utilization.jsp', '이용약관', 'width=600, height= 400'); return false;"  class="py-2 d-block">이용약관</a></li>
                <li><a href="" onclick="window.open('${contextPath}/clauses/InfoProtection.jsp', '개인정보 보호정책', 'width=600, height= 400'); return false;" class="py-2 d-block">개인정보 보호 정책</a></li>
                <li><a href="" onclick="window.open('${contextPath}/clauses/RevCancellation.jsp', '예약 취소 정책', 'width=600, height= 400'); return false;" class="py-2 d-block">예약 취소 정책</a></li>
                <li><a href="" onclick="window.open('${contextPath}/clauses/Refund.jsp', '환불정책', 'width=600, height= 400'); return false;" class="py-2 d-block">환불 정책</a></li>
              </ul>
            </div>
          </div>
          <div class="col">
            <div class="ftco-footer-widget mb-4">
            	<h2 class="ftco-heading-2">리조트 정보</h2>
            	<div class="block-23 mb-3">
	              <ul>
	                <li><span class="icon icon-map-marker"></span><span class="text">서울특별시 강서구 화곡로 179 대한상공회의소서울기술교육센터, 서울특별시 강서구 화곡동 1063-12</span></li>
	                <li><a href="#"><span class="icon icon-phone"></span><span class="text">010-9591-4388</span></a></li>
	                <li><a href="#"><span class="icon icon-envelope"></span><span class="text">tuesvonita@naver.com</span></a></li>
	              </ul>
	            </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div >

            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This project is made with <i class="icon-heart color-danger" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
          </div>
        </div>
      </div>
    </footer>
