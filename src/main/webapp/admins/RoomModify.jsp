<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin Room Add</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
<!-- css 적용 -->
<link rel="stylesheet" href="${contextPath }/style/css/flaticon.css">
<link rel="stylesheet" href="${contextPath }/style/css/style.css">
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



.nav li a {
	position: relative;
	text-decoration: none; /* 기존의 텍스트 밑줄 제거 */
}


.nav {
	display: inline-block;
	flex-wrap: wrap;
	padding-left: 0;
	margin-bottom: 0;
	list-style: none;
	align-items: center;
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
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
	$(function(){
		$('#modify').submit(function(event){
			event.preventDefault();
			let formData = new FormData(this);
			$.ajax({
				type: "post",
				async: false,
				url: "<c:url value='/admin/RoomModify' />",
				data : formData,
				enctype:'multipart/form-data',
				processData: false,
				contentType: false,
				success:function() {
					alert("등록하였습니다.");
					window.location.replace("${contextPath}/admin/RoomList?type=admin");
				},
				error:function() {
					alert("등록을 실패하였습니다");
				}
			});
		});
		
	});
	
	function deleteRoom(roomNo) {
		$.ajax({
			type: "get",
			async: false,
			url: "<c:url value='/admin/RoomDelete' />",
			data: {roomNo: roomNo},
			dataType: "text",
			success:function(data) {
				if(data == "success") {
					alert("삭제되었습니다.");
					window.location.replace("${contextPath}/admin/RoomList?type=admin");
				} else {
					alert("삭제 되지 않았습니다.");
					window.location.replace("${contextPath}/admin/RoomList?type=admin");
					
				}
			},
			error:function() {
				alert("에러가 발생하였습니다.");
				window.location.replace("${contextPath}/admin/RoomList?type=admin");
			}
		});
	}

    function updateHiddenValue(input, fileName) {
        var filename = input.value.split('\\').pop(); // 파일 경로에서 파일명만 추출
        var hiddenInput = document.querySelector('input[name="' + fileName + '"]');
        hiddenInput.value = filename;
    }
</script>
</head>
<body style="background-color: #f5f5f5;">
	<div class="container">
		<jsp:include page="/include/Header.jsp" flush="false" />
		<div class="row">


			<div class="col-md-4"> 
			<jsp:include page="/include/AdminSidebar.jsp" flush="false"/>
		</div>
			<div class="rightside">
				<div style="width: 75%;">

					<h4
						style="margin-left: 260px; font-size: px; font-weight: bold; font-family: arial, verdana,
						HelveticaNeue, serif;">객실 수정</h4>
					<form id="modify">
						<div style="margin-left: 290px;">
							<div align="right">
								<button type="submit" class="sky-blue-button">수정</button>
								<button class="sky-blue-button" type="button" onclick="deleteRoom(${roomVO.roomNo})">삭제</button>
							</div>
							<div>
								<label>객실 이름 &nbsp;&nbsp;</label> 
								<input type="hidden" name = "roomNo" value="${roomVO.roomNo }" /> 
								<input type="text" name="roomName" value="${roomVO.roomName }">
							</div>

							<div>
								<label>객실 타입 &nbsp;&nbsp;</label> 
								<select name="roomType" required="required">
									<option value="Superior" <c:if test="${ roomVO.roomType eq 'Superior' }"> selected = "selected"</c:if>>슈페리어 룸</option>
									<option value="Deluxe" <c:if test="${ roomVO.roomType eq 'Deluxe' }"> selected = "selected"</c:if>>디럭스 룸</option>
									<option value="GrandDeluxe" <c:if test="${ roomVO.roomType eq 'GrandDeluxe' }"> selected = "selected"</c:if>>그랜드 디럭스 룸</option>
									<option value="JuniorSuite" <c:if test="${ roomVO.roomType eq 'JuniorSuite' }"> selected = "selected"</c:if>>주니어 스위트 룸</option>
									<option value="CornerSuite" <c:if test="${ roomVO.roomType eq 'CornerSuite' }"> selected = "selected"</c:if>>코너스 스위트 룸</option>
									<option value="SuperiorSuite" <c:if test="${ roomVO.roomType eq 'SuperiorSuite' }"> selected = "selected"</c:if>>슈페리어 스위트 룸</option>
									<option value="RoyalSuite" <c:if test="${ roomVO.roomType eq 'RoyalSuite' }"> selected = "selected"</c:if>>로열 스위트 룸</option>
									<option value="PresidentialSuite" <c:if test="${ roomVO.roomType eq 'PresidentialSuite' }"> selected = "selected"</c:if>>프레지덴셜 스위트 룸</option>
									<option value="Connecting" <c:if test="${ roomVO.roomType eq 'Connecting' }"> selected = "selected"</c:if>>커넥팅 룸</option>
								</select>
							</div>
							<div>
								<label>수용 인원 &nbsp;&nbsp;</label> <select name="headCount"
									required="required">
									<option>인원 선택</option>
									<option value="1"
										<c:if test="${ roomVO.headCount eq 1 }"> selected = "selected"</c:if>>1 명</option>
									<option value="2"
										<c:if test="${ roomVO.headCount eq 2 }"> selected = "selected"</c:if>>2 명</option>
									<option value="3"
										<c:if test="${ roomVO.headCount eq 3 }"> selected = "selected"</c:if>>3 명</option>
									<option value="4"
										<c:if test="${ roomVO.headCount eq 4 }"> selected = "selected"</c:if>>4 명</option>
									<option value="5"
										<c:if test="${ roomVO.headCount eq 5 }"> selected = "selected"</c:if>>5 명</option>
									<option value="6"
										<c:if test="${ roomVO.headCount eq 6 }"> selected = "selected"</c:if>>6 명</option>
									<option value="7"
										<c:if test="${ roomVO.headCount eq 7 }"> selected = "selected"</c:if>>7 명</option>
									<option value="8"
										<c:if test="${ roomVO.headCount eq 8 }"> selected = "selected"</c:if>>8 명</option>
									<option value="9"
										<c:if test="${ roomVO.headCount eq 9 }"> selected = "selected"</c:if>>9 명</option>
									<option value="10"
										<c:if test="${ roomVO.headCount eq 10 }"> selected = "selected"</c:if>>10 명</option>

								</select>
							</div>
							<div>
								<label>객실 가격 &nbsp;&nbsp;</label> <input class="roomCost"
									type="text" width="30%" name="roomCost"
									value="${roomVO.roomCost }">원
							</div>
							<div>
								<label style="vertical-align: top;">객실 설명 &nbsp;&nbsp;</label>
								<textarea rows="5" name="detailText" style="width: 38%">${roomVO.roomDetail }</textarea>
							</div>
						
						</div>

						<table>
							<tr>
								<td>
									<div class="insert">
										<label>사진 업로드 &nbsp;&nbsp;</label>
										<input type="file" name="infoImg" onchange="updateHiddenValue(this, 'infoImg_name')" />
										<input type="hidden" name = "infoImg_name" value="${imgVO.infoImg }">
										<div class="file-list"></div>
										<img src="${contextPath }/data/${imgVO.infoImg }" width="400" height="400">
									</div>
								</td>
								<td>
									<div class="insert">
										<label>사진 업로드 &nbsp;&nbsp;</label> 
										<input type="file" name="file1" onchange="updateHiddenValue(this, 'file1_name')"/>
										<input type="hidden" name = "file1_name" value="${imgVO.img1 }">
										<div class="file-list"></div>
										<img src="${contextPath }/data/${imgVO.img1 }" width="400" height="400">
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div class="insert">
										<label>사진 업로드</label>
										<input type="file" name="file2" onchange="updateHiddenValue(this, 'file2_name')" />
										<input type="hidden" name = "file2_name" value="${imgVO.img2 }">
										<div class="file-list"></div>
										<img src="${contextPath }/data/${imgVO.img2 }" width="400" height="400">
									</div>
								</td>
								<td>
									<div class="insert">
										<label>사진 업로드</label> 
										<input type="file" name="file3" onchange="updateHiddenValue(this, 'file3_name')" />
										<input type="hidden" name = "file3_name" value="${imgVO.img3 }">
										<div class="file-list"></div>
										<img src="${contextPath }/data/${imgVO.img3 }" width="400" height="400">
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div class="insert">
										<label>사진 업로드</label> 
										<input type="file" name="file4" onchange="updateHiddenValue(this, 'file4_name')" />
										<input type="hidden" name = "file4_name" value="${imgVO.img4 }">
										<div class="file-list"></div>
										<img src="${contextPath }/data/${imgVO.img4 }" width="400" height="400">
									</div>
								</td>
								<td>
									<div class="insert">
										<label>사진 업로드</label> 
										<input type="file" name="file5" onchange="updateHiddenValue(this, 'file5_name')" />
										<input type="hidden" name = "file5_name" value="${imgVO.img5 }">
										<div class="file-list"></div>
										<img src="${contextPath }/data/${imgVO.img5 }" width="400" height="400">
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