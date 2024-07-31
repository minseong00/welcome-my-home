<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>객실타입</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- css 적용 -->
<link rel="stylesheet" href="${contextPath }/style/css/flaticon.css">
<link rel="stylesheet" href="${contextPath }/style/css/style.css">
<!-- 캘린더 import -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script src="${contextPath}/util/RoomListCalendar.js"></script>
<!-- 가격 슬라이드 import -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

<script src="${contextPath}/util/CountHead.js"></script>
<style>
   
   #container {
      width: 100%;
       padding-right: 15px;
       padding-left: 15px;
       margin-right: auto;
       margin-left: auto;
      
       margin-bottom: 100px;
   }
   
   #leftDiv {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
    gap: 60px;
    align-items: start;
    padding: 20px;
    width:65%;
    margin-left : 70px;
}

.lineDiv {
    
    grid-template-columns: repeat(3, 1fr); /* 한 줄에 방 3개씩 표시 */
    gap: 20px; /* 방 사이의 간격 */
}

.room_ {
    display: flex;
    flex-direction: column;
    align-items: center;
    background-color: #fff;
    border: 1px solid #ccc;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    border-radius: 10px;
    overflow: hidden;
    padding: 15px;
    transition: transform 0.3s ease-in-out;
    margin-bottom:20px;
    color: black;
    font-weight: bold;
    font-size: 17px;
}

.room_:hover {
    transform: scale(1.05); /* 호버 시 약간 확대 */
}

.leftTable {
    width: 100%; /* 테이블 너비 전체 사용 */
    text-align: center;
}

.leftTable img {
    width: 100%; /* 이미지 너비를 테이블 너비에 맞춤 */
    height: auto;
    border-radius: 5px; /* 이미지 모서리 둥글게 */
}

.leftTable td {
    padding: 8px;
}
   #rightDiv {
       display: flex;
       flex-direction: column; /* 내부 요소를 세로로 정렬합니다. */
       flex: none; /* rightDiv가 부모 컨테이너 내에서 적절한 공간을 차지할 수 있도록 설정합니다. */
       width:18%;
       height: 20%;
       background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        margin-left : 30px;
        margin-top: 52px;
        padding: 20px;
   }

   
   .rightTable {
      font-weight: bold;
      width: 200px;
      border-collapse: separate;
      border-spacing: 10px;
      padding: 10px; 
   }
   #price-range-slider {
      width: 75%;
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
   .price {
      width: 70px;
   }
    p {
    text-align: center; /* 가로축에서 텍스트를 중앙 정렬 */
     
    font-size: 24px;
     }
   .center-content {
       display: flex;
       justify-content: center;
       align-items: center;
       height: 100%; /* 필요하다면 높이 조정 */
       width: 100%; /* 너비를 전체로 설정 */
   }
   .rightTable {
       width: 100%; /* 테이블의 너비를 전체로 설정 */
       border-collapse: collapse; /* 셀 사이 공간 없애기 */
    
       overflow: hidden; /* 둥근 모서리에 컨텐츠가 넘치는 것을 숨김 */
       margin: 20px 0; /* 상하 여백 설정 */
   }
   
   /* 테이블 헤더 및 셀 스타일 */
   .rightTable td {
       padding: 15px; /* 셀 내부 패딩 */
       text-align: left; /* 텍스트 왼쪽 정렬 */
       border-bottom: 1px solid #E6E6FA; /* 셀 하단 테두리, 연한 라벤더색 사용 */
   }
   
   /* 마지막 셀의 테두리 제거 */
   .rightTable tr:last-child td {
       border-bottom: none;
   }
   #downCount, #upCount {
    width: 30px; /* 버튼의 너비 */
    height: 30px; /* 버튼의 높이 */
    font-size: 20px; /* 버튼 내 텍스트 크기 */
    text-align: center; /* 텍스트 중앙 정렬 */
    vertical-align: middle; /* 세로 방향 중앙 정렬 */
    line-height: 30px; /* 버튼 내 줄 높이를 버튼의 높이와 일치시킴 */
    margin: 0; /* 마진 제거 */
    padding: 0; /* 패딩 제거 */
    border: 1px solid #ccc; /* 테두리 스타일 */
 
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
   /* 버튼 스타일 */
   button {
       padding: 10px 15px;
       background-color:#decfa6; /* 연한 복숭아색 */
       color: #fff;
       border: none;
       border-radius: 5px;
       cursor: pointer;
       transition: background-color 0.3s ease;
   }
   
   button:hover {
       background-color: #FFB6C1; /* 더 밝은 살색으로 호버 효과 */
   }
   
   /* 입력 필드 스타일 */
   input[type="text"] {
       padding: 8px;
       border: 1px solid #FFDAB9; /* 테두리 색상 */
       border-radius: 5px;
       width: 80%; /* 입력 필드 
   }
   #hr-line {
      margin-left: 10px;
      width: 80px;
   }
</style>
<script>
   const servletUrl = "${contextPath}/";
</script>
<c:choose>
   <c:when test="${empty headCount }">
      <c:set var="head" value="1" />
   </c:when>
   <c:otherwise>
      <c:set var="head" value="${headCount }" />
   </c:otherwise>
</c:choose>
</head>
<body>
      <jsp:include page="/include/Header.jsp" flush="false"/>
   <div id="container"> <!-- 메인 컨테이너 -->
      
      <div class="row size-container">
      <div id="leftDiv"> <!-- 왼쪽 컨테이너 -->
         <c:choose>
            <c:when test="${empty roomVO }">
             <div class="center-content">
               <p>현재 선택 가능한 객실이 존재하지 않습니다.</p>
               </div>
            </c:when>
            <c:otherwise>
                <c:forEach var="line" begin="0" end="${roomVO.size() / 3}">
                    <div class="lineDiv"><!-- 첫번째 라인 -->
                    
                        <c:set var="endIndex" value="${roomVO.size()}"/>
                        
                        <c:if test="${endIndex > (line + 1) * 3}">
                            <c:set var="endIndex" value="${(line + 1) * 3}" />
                        </c:if>
                        
                        <c:forEach var="room" items="${roomVO }" begin="${line*3 }" end="${endIndex-1}" varStatus="loop">
                        <div class="room_"> <!-- 첫번째 요소 -->
                           <table class="leftTable">
                              <tr>
                                 <td>
                                    <img alt="" src="${contextPath }/data/${room.img1}" style="width: 350px;">
                                 </td>
                              </tr>
                              <tr>
                                 <td>
                                    ${room.roomName }
                                    <hr id="hr-line">
                                 </td>
                              </tr>
                              <tr>
                                 <td>
                                    KRW - ${room.roomCost }
                                 </td>
                              </tr>
                              <tr>
                                 <td>
                                    최대 ${room.headCount } 명
                                 </td>
                              </tr>
                              <tr>
                                 <td align="center">
                                    <input type="button" value="상세보기" class="btn_css" onclick="location.href='${contextPath }/RoomDetail?roomNo=${room.roomNo }'" />
                                 </td>
                              </tr>
                              
                           </table>
                        </div>
                     </c:forEach>
                     
                  </div>
               </c:forEach>
            </c:otherwise>
            
         </c:choose>
      </div>
         
      <div id="rightDiv"> <!-- 사이드바 컨테이너 -->
      
         <form action="${contextPath }/RoomFilterList" method="post">
            <table class="rightTable">
                  <tr>
                     <td>
                        체크인<br>
                        <input type="text" name="checkIn" id="checkInDate" readonly value="<c:out value='${checkInDate}' />">
                     </td>
                  </tr>
                  <tr>
                     <td>
                        체크아웃<br>
                        <input type="text" name="checkOut" id="checkOutDate" readonly value="<c:out value='${checkOutDate}' />">
                     </td>
                  </tr>
                  <tr>
                     <td>
                        종류<br>
                          <select class="filter_select" name="roomType" >
                             <option value="default" <c:if test="${roomType eq 'default'}">selected</c:if>>선택</option>
                               <option value ="Superior" <c:if test="${roomType eq 'Superior'}">selected</c:if>>슈페리어 룸</option>
                               <option value ="Deluxe" <c:if test="${roomType eq 'Deluxe'}">selected</c:if>>디럭스 룸</option>
                               <option value ="GrandDeluxe" <c:if test="${roomType eq 'GrandDeluxe'}">selected</c:if>>그랜드 디럭스 룸</option>
                               <option value ="JuniorSuite" <c:if test="${roomType eq 'JuniorSuite'}">selected</c:if>>주니어 스위트 룸</option>
                               <option value ="CornerSuite" <c:if test="${roomType eq 'CornerSuite'}">selected</c:if>>코너스 스위트 룸</option>
                               <option value ="SuperiorSuite" <c:if test="${roomType eq 'SuperiorSuite'}">selected</c:if>>슈페리어 스위트 룸</option>
                               <option value ="RoyalSuite" <c:if test="${roomType eq 'RoyalSuite'}">selected</c:if>>로열 스위트 룸</option>
                               <option value ="PresidentialSuite" <c:if test="${roomType eq 'PresidentialSuite'}">selected</c:if>>프레지덴셜 스위트 룸</option>
                               <option value ="Connecting" <c:if test="${roomType eq 'Connecting'}">selected</c:if>>커넥팅 룸</option>
                          </select>
                     </td>
                  </tr>
                  <tr>
                     <td>
                        인원수<br>
                        <button type="button" id="downCount" onclick="downValueFilter()" ><b>-</b></button>
                        <input type="text" name="headCount"  id="headCount" readonly value="${head }" >
                        <button type="button" id="upCount" onclick="upValueFilter()"><b>+</b></button>
                        
                     </td>
                  </tr>
                  <tr>
                     <td>
                        가격<br><br> 
                        <div id="price-range-slider"></div>
                        <script>
                            $(document).ready(function() {
                                $("#price-range-slider").slider({
                                    range: true,
                                    min: 0,
                                    max: 1600,
                                    values: [0, 1600], // 초기값 설정
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
                        <input type="text" id="price-min" name="priceMin" class="price" readonly>  
                        <input type="text" id="price-max" name="priceMax" class="price" readonly>
                     </td>
                  </tr>
                  <tr>
                     <td align="center">
                        <input class="btn_css" type="submit" value="조건 검색" />
                     </td>
                  </tr>
            </table>
         </form>
         
         </div>
      </div>
   </div>
    <jsp:include page="/include/Footer.jsp" flush="false"/>
</body>
</html>