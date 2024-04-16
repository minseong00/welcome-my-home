<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 페이지</title>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
<!-- css 적용 -->
<link rel="stylesheet" href="${contextPath }/style/css/flaticon.css">
<link rel="stylesheet" href="${contextPath }/style/css/style.css">

<style>
    body {
        font-family: 'Roboto', sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f5f5f5;
    }
    .container {
        width: 100%;
        max-width: 1100px;
        margin: 0 auto;
        padding: 20px 15px;
        box-sizing: border-box;
    }
    .row {
        display: flex;
        justify-content: center;
    }
    #leftDiv, #rightDiv {
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        margin: 0 10px;
        padding: 20px;
    }
    .table-container {
        margin-bottom: 20px;
    }
    table {
        width: 100%;
    }
    td {
        padding: 10px;
    }
    hr {
        border: none;
        border-top: 1px solid #ccc;
        margin-top: 20px ;
    }
    input[type="text"], button {
        width: calc(100% - 22px);
        padding: 5px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    input[type="text"] {
        margin-bottom: 4px;
    }
    .return {
        background-color: #00BFFF;
        color: #fff;
        font-weight: bold;
        cursor: pointer;
    }
    .return:hover {
        background-color: #0080FF;
    }
       
    .terms-label {
        display: flex; /* 플렉스 박스 사용 */
        align-items: center; /* 수직 정렬 */
        font-size: 13px; /* 폰트 사이즈 조절 */
    }
    .terms-label > span {
        flex: 1; /* 유동적인 공간을 활용하여 약관 텍스트를 확장 */
        font-size: 11px; /* 원하는 크기로 설정 */
    }
    /* 모달 스타일 */
    .modal {
        display: none; /* 기본적으로 모달을 숨김 */
        position: fixed; /* 위치를 고정 */
        z-index: 1; /* 다른 요소 위에 표시 */
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto; /* 스크롤이 발생할 경우 스크롤 허용 */
        background-color: rgba(0, 0, 0, 0.4); /* 배경을 반투명한 검은색으로 설정 */
    }
    /* 모달 내용 */
    .modal-content {
        background-color: #fefefe; /* 모달 내용 배경색 */
        margin: 7% auto; /* 모달을 화면 중앙에 위치, 기존보다 더 위로 조정 */
        padding: 20px;
        border: 1px solid #888;
        width: 25%; /* 모달의 너비 */    
        border-radius: 10px; /* 모달 내용의 테두리 반경 설정 */
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2); /* 그림자 효과 추가 */
        height: 50%; /* 모달의 높이를 최대로 설정 */
        overflow-y: scroll; /* 항상 스크롤바 표시 */
    }
    /* 닫기 버튼 */
    .close {
        color: #aaa;
        float: right;
        font-size: 20px; /* 크기 조정 */
        font-weight: bold;
    }
    .close:hover,
    .close:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
    }
    
</style>
<script>
    // 모달 열기 함수
    function openModal(filename) {
        // XMLHttpRequest 객체 생성
        var xhttp = new XMLHttpRequest();
        // 요청 완료 후 실행될 함수 지정
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                // 서버로부터 받은 내용을 모달에 표시
                document.getElementById("modalContent").innerHTML = this.responseText;
                // 모달 보이도록 설정
                document.getElementById("myModal").style.display = "block";
            }
        };
        // GET 방식으로 요청을 보냄
        xhttp.open("GET", filename, true);
        xhttp.send();
    }

    // 모달 닫기 함수
    function closeModal() {
        document.getElementById("myModal").style.display = "none";
    }

    // 사용자가 모달 외부를 클릭하면 모달 닫기
    window.onclick = function(event) {
        if (event.target == document.getElementById("myModal")) {
            closeModal();
        }
    }
</script>
</head>
<body>
    <div id="myModal" class="modal" >
      <div class="modal-content" >   
        <span class="close" onclick="closeModal()">&times;</span>
        <div id="modalContent"  ></div>
      	<div class="button-container">
            <button class="confirm-button" onclick="closeModal()">확인</button>         
        </div>
        
      </div>
    </div>

    <div class="container">
        <jsp:include page="/include/Header.jsp" flush="false"/>
        <div class="row" style="margin-top: 50px;">
            <div id="leftDiv">
                <div class="table-container">
                    <table>
                        <tr>
                            <td>주문자 아이디</td>
                            <td><input type="text" name="memId" readonly></td>
                        </tr>
                        <tr>
                            <td>주문자 이름</td>
                            <td><input type="text" name="memName"></td>
                        </tr>
                        <tr>
                            <td colspan="2"><hr></td>
                        </tr>
                        <tr>
                            <td>주문자 이메일</td>
                            <td><input type="text" name="memEmail"></td>
                        </tr>
                        <tr>
                            <td>주문자 전화번호</td>
                            <td><input type="text" name="memCall"></td>
                        </tr>
                        <tr>
                            <td colspan="2" >
                                <label class="terms-label" onclick="event.preventDefault();">
                                    <span >개인정보 보호 정책 약관.</span><button style="width:26%;" onclick="openModal('${contextPath}/clauses/InfoProtection.jsp')" >약관 보기</button><br>
                                    <input type="checkbox" name="agree1" value="yes" style="margin-left: 30px"  onclick="document.querySelector('[name=disagree1]').checked = false;"> 동의합니다.
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="checkbox" name="disagree1" value="no"  onclick="document.querySelector('[name=agree1]').checked = false;"> 동의하지 않습니다.
                                </label >
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <label class="terms-label" onclick="event.preventDefault();">
                                    <span>우리집에 놀러와 이용 약관.</span>
                                    <button style="width:26%;"onclick="openModal('${contextPath}/clauses/Utilization.jsp')">약관 보기</button><br>
                                    <input type="checkbox" name="agree2" value="yes" style="margin-left: 30px"  onclick="document.querySelector('[name=disagree2]').checked = false;"> 동의합니다.
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="checkbox" name="disagree2" value="no"  onclick="document.querySelector('[name=agree2]').checked = false;"> 동의하지 않습니다.
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <label class="terms-label" onclick="event.preventDefault();">
                                    <span>예약 취소 정책.</span><button style="width:26%;"onclick="openModal('${contextPath}/clauses/RevCancellation.jsp')">약관 보기</button><br>
                                    <input type="checkbox" name="agree3" value="yes" style="margin-left: 30px"  onclick="document.querySelector('[name=disagree3]').checked = false;"> 동의합니다.
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="checkbox" name="disagree3" value="no"  onclick="document.querySelector('[name=agree3]').checked = false;"> 동의하지 않습니다.
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <label class="terms-label" onclick="event.preventDefault();">
                                    <span>환불 정책.</span><button style="width:26%;"onclick="openModal('${contextPath}/clauses/Refund.jsp')">약관 보기</button><br>
                                    <input type="checkbox" name="agree4" value="yes" style="margin-left: 30px"  onclick="document.querySelector('[name=disagree4]').checked = false;"> 동의합니다.
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="checkbox" name="disagree4" value="no"  onclick="document.querySelector('[name=agree4]').checked = false;"> 동의하지 않습니다.
                                </label>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div id="rightDiv">
                <form>
                    <div class="table-container">
                        <table>
                            <tr>
                                <td>객실</td>
                                <td><input type="text" name="checkIn" class="filter"></td>
                            </tr>
                            <tr>
                                <td colspan="2"><hr></td>
                            </tr>
                            <tr>
                                <td>이용 날짜</td>
                                <td><input type="text" name="checkOut" class="filter"></td>
                            </tr>
                            <tr>
                                <td colspan="2"><hr></td>
                            </tr>
                            <tr>
                                <td>인원수</td>
                                <td><input type="text" name="headCount" value="" id="headCount" readonly></td>
                            </tr>
                            <tr>
                                <td colspan="2"><hr></td>
                            </tr>
                            <tr>
                                <td>총 요금</td>
                                <td><input type="text" name="priceMax" class="price" value="총요금" readonly></td>
                            </tr>
                            <tr>
                                <td colspan="2"><hr></td>
                            </tr>
                            <tr>
                                <td align="right" colspan="2">
                                    <button class="return">돌아가기</button>
                                    <input type="submit" value="결제">
                                </td>
                            </tr>
                        </table>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <jsp:include page="/include/Footer.jsp" flush="false"/>
</body>
</html>