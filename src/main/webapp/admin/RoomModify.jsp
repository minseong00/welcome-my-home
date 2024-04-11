<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin Room Add</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />

<style type="text/css">
.sky-blue-button {
	padding: 7px 15px;
	font-size: 16px;
	background-color: #87CEEB;
	color: #fff; /* 버튼 텍스트 색상 */
	transition: background-color 0.3s ease;
	border: none;
	border-radius: 50px;
}

.sky-blue-button:hover {
	background-color: #00BFFF;
}

body {
	
	line-height: normal;
	display: flex;
}

.nav.sidebar {
	height: 80vh; /* 사이드바의 높이를 뷰포트 높이의 80%로 설정 */
}

.sidebar {
background-color: #FFFFFF;
	font-size: 16px;
	font-family: "Poppins", sans = serif;
	font-weight: bold;
	padding: 0;
	width: 235px;
	height: 40vh;
	z-index: 11;
	box-shadow: 0 5px 10px 0 rgba(230, 230, 243, 0, 0.88);
	margin-left: 0.5rem;
	border-radius: 6px;
	border: 5px solid;
	border-color: goldenrod;
	display: flex;
	justify-content: center;
	align-items: center;
}

.nav li a {
	position: relative;
	text-decoration: none; /* 기존의 텍스트 밑줄 제거 */
}

.nav li a::after {
	content: "";
	position: absolute;
	bottom: 0;
	left: 0;
	width: 100%;
	height: 2px;
	background-color: brown;
	opacity: 1; /* 밑줄이 항상 나타나도록 설정 */
}

.nav {
	display: inline-block;
	flex-wrap: wrap;
	padding-left: 0;
	margin-bottom: 0;
	list-style: none;
	align-items: center;
}

.sidebar .nav {
	flex-wrap: nowrap;
	flex-direction: column;
	margin-bottom: 60px;
}

.sidebar .nav li a {
	display: flex;
	white-space: nowrap;
	padding: 0.87rem 0.875rem 0.87rem 0.6rem;
	color: #001737;
}

.sidebar .nav li {
	margin-bottom: -1px;
}

.sidebar .nav li a {
	text-decoration: none;
}

.sidebar .nav li a:hover {
	color: #0056b3;
	text-decoration: underline;
}

.sidebar .nav li a span {
	text-shadow: none;
}

.rightside {
/* 배경색 설정 */
	
	display: flex;
	flex-direction: column;
	flex-grow: 1;
	margin-left: 0.5rem;
	width: calc(100vh - 235px);
}

.insert {
	width: 100%;
	margin-left: 20%;
}

td {
	padding: 20px;
}

input[type="text"], textarea, select {
	font-family: Arial, sans-serif; /* 깔끔한 폰트 설정 */
	font-size: 14px;
	padding: 10px; /* 내용과 테두리 간격 */
	border-radius: 20px; /* 원형 테두리 */
	border: 1px solid #ccc; /* 회색 테두리 */
	outline: none; /* 포커스시 테두리 제거 */
}

label {
	font-weight: bold;
}

/* 입력 박스 포커스시 테두리 색상 변경 */
input[type="text"]:focus, textarea:focus, select:focus {
	border-color: #87CEEB; /* 하늘색 테두리 */
}
</style>
<script src="http://code.jquery.com/jquery-2.2.1.min.js"></script>
<script type="text/javascript" src="${contextPath }/util/fileUpload.js"></script>
<script type="text/javascript">
	$(function(){
		$("#roomAdd").submit(function(event){
			event.preventDefault();
		    // 폼데이터 담기
		    var form = document.querySelector("form");
		    var formData = new FormData(form);
		    for (var i = 0; i < filesArr.length; i++) {
		        // 삭제되지 않은 파일만 폼데이터에 담기
		        if (!filesArr[i].is_delete) {
		            formData.append("attach_file", filesArr[i]);
		        }
		    }
		
		    $.ajax({
		        method: 'POST',
		        url: "<c:url value='/RoomAdd' />",
		        data: formData,
		        async: false,
		        enctype:'multipart/form-data',
		        processData: false,
				contentType: false,
		        success: function () {
		            alert("파일업로드 성공");
		            window.location.replace("${contextPath}/RoomList");
		        },
		        error: function (data, desc, err) {
		            alert('에러가 발생 하였습니다.');
		            return;
		        }
			});
		    
	    });
	});
</script>
</head>
<body >
<div class="container-fluid">
<jsp:include page="/include/Header.jsp" flush="false"/>
<div class="row" >


	<nav class="sidebar" >
	
		<ul class="nav">
			<li>
				<a href="#">
					<span>관리자 홈</span>
				</a>
			</li>
			<li>
				<a href="#">
					<span>회원 예약</span>
				</a>
			</li>
			<li>
				<a href="#">
					<span>객실정보</span>
				</a>
			</li>
			<li>
				<a href="#">
					<span>객실등록</span>
				</a>
			</li>
		</ul>
	</nav>
	
	<div class="rightside"  >
		<div style="width: 75%;" >
		
			<h4  style="margin-left: 260px; font-size: px;font-weight: bold; font-family: arial, verdana, "Helvetica Neue", serif;">객실 수정</h4>
			<form >
			<div style="margin-left: 290px;" >
			<div align="right">
			<button type="submit" class="sky-blue-button" >수정</button>
				<button class="sky-blue-button" onclick="location.href='<c:url value="/RoomDelete?roomNo=${roomVO.roomNo }" /> '">삭제</button>
				</div>
				<div>
					<label >객실 이름 &nbsp;&nbsp;</label>
					<input type="hidden" value="${roomVO.roomNo }"/>
					<input type="text" name="roomName">	
				</div>
				
				<div>
					<label>객실 타입 &nbsp;&nbsp;</label>
					<select name="roomType" required="required">
						<option>타입 선택</option>
						<option value="singleRoom">싱글 룸</option>
						<option value="twinRoom">트윈 룸</option>
						<option value="DoubleRoom">더블 룸</option>
						<option value="TripleRoom">트리플 룸</option>
					</select>
				</div>
				<div>
					<label>수용 인원 &nbsp;&nbsp;</label>
					<select name="headCount" required="required">
						<option>인원 선택</option>
						<option value="1"
							<c:if test="${ roomVO.roomType eq 1 }"> selected = "selected"</c:if>>1</option>
						<option value="2"
							<c:if test="${ roomVO.roomType eq 2 }"> selected = "selected"</c:if>>2</option>
						<option value="3"
							<c:if test="${ roomVO.roomType eq 3 }"> selected = "selected"</c:if>>3</option>
						<option value="4"
							<c:if test="${ roomVO.roomType eq 4 }"> selected = "selected"</c:if>>4</option>
						
					</select>
				</div>
				<div>
					<label>객실 가격 &nbsp;&nbsp;</label>
					<input class="roomCost" type="text" width ="30%" name="roomCost" value="${roomVO.roomCost }">원
				</div>
				<div   >
					<label style="vertical-align: top;">객실 설명 &nbsp;&nbsp;</label>
					<textarea rows="5" name = "detailText"  style="width: 38%"><c:out value="${roomVO.detailText }"></c:out></textarea>
				</div>
				<div>
					<label>객실 설명 사진 &nbsp;&nbsp;</label>
					<input type="file" name="infoImg">
				</div>
				</div>
			
		<table>
    <tr>
        <td>
            <div class="insert">
                <label>사진 업로드 &nbsp;&nbsp;</label>
                <input type="file" name="file" onchange="addFile(this);" multiple="multiple" />  
                <div class="file-list"></div>
                <img src="" width="400" height="400">
            </div>
        </td>
        <td>
            <div class="insert">
                <label>사진 업로드 &nbsp;&nbsp;</label>
                <input type="file" name="file" onchange="addFile(this);" multiple="multiple" />  
                <div class="file-list"></div>
                <img src="" width="400" height="400">
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <div class="insert">
                <label>사진 업로드</label>
                <input type="file" name="file" onchange="addFile(this);" multiple="multiple" />  
                <div class="file-list"></div>
                <img src="" width="400" height="400">
            </div>
        </td>
        <td>
            <div class="insert">
                <label>사진 업로드</label>
                <input type="file" name="file" onchange="addFile(this);" multiple="multiple" />  
                <div class="file-list"></div>
                <img src="" width="400" height="400">
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <div class="insert">
                <label>사진 업로드</label>
                <input type="file" name="file" onchange="addFile(this);" multiple="multiple" />  
                <div class="file-list"></div>
                <img src="" width="400" height="400">
            </div>
        </td>
        <td>
            <div class="insert">
                <label>사진 업로드</label>
                <input type="file" name="file" onchange="addFile(this);" multiple="multiple" />  
                <div class="file-list"></div>
                <img src="" width="400" height="400">
            </div>
        </td>
    </tr>
    
</table>
</form>

</div>
</div>
</div>
</div>

</body>

</html>