<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 예약목록 수정</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
<script src="http://code.jquery.com/jquery-2.2.1.min.js"></script>
<!-- css 적용 -->
<link rel="stylesheet" href="${contextPath }/style/css/flaticon.css">
<link rel="stylesheet" href="${contextPath }/style/css/style.css">
<!-- 캘린더 import -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script src="${contextPath}/util/RevModifyCalendar.js"></script>
<script src="${contextPath}/util/CountHead.js"></script>
<script type="text/javascript">
	$(function(){
		$('#RevModify').submit(function(event){
			event.preventDefault();
			var formData = $(this).serialize();
			$.ajax({
				type: "post",
				async: false,
				url: "<c:url value='/RevModify'/>",
				data: formData,
				success:function(){
					alert("수정되었습니다.");
					window.location.replace("${contextPath}/admin/RevList");
				},
				error:function(){
					alert("수정이 취소되었습니다.");
				}
			});
			
		});
		
	});
	
	function RevDelete(revNo){
		var confirmDelete = confirm("삭제 하시겠습니까?");
			   if(confirmDelete) {
					$.ajax({
						type:"post",
						url:"<c:url value='/admin/RevDelete'/>",
						data: {revNo : revNo},
						success:function(){
							alert("삭제 되었습니다.");
							window.location.replace("${contextPath}/admin/RevList");
						},
						error:function(data, status, error){
								console.error("예약정보 삭제 중 오류 발생 :", error);
								alert("예약정보 삭제 중 오류가 발생하였습니다.")
						}
					});
			   }
		   }
</script>


<style>
  
       body {
    padding:1.5em;
  background: #f5f5f5; /* 배경색 설정 */
   font-weight: bold; /* 헤더 폰트를 굵게 */
}
table {
  border: 1px #a39485 solid; /* 테이블의 외곽선 스타일 */
  font-size: .9em; /* 테이블 내의 폰트 크기 */
  box-shadow: 0 2px 5px rgba(0,0,0,.25); /* 테이블에 그림자 효과 */
  
  border-collapse: collapse; /* 테이블의 보더 라인을 하나로 합침 */
  border-radius: 10px; /* 테이블 모서리를 둥글게 처리 */
  overflow: hidden; /* 내용이 넘칠 경우 숨김 처리 */
  
}
td, th {
  border: 1px solid #a39485; /* 각 셀의 테두리 스타일 */
  padding: 7px; /* 각 셀의 안쪽 여백 */
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


.rightside{
			display: flex;
			flex-direction: column;
			flex-grow: 1;
			
		}
	.include-gap {
	/*     margin-left: 100px; /* 원하는 만큼의 간격을 설정합니다. */ */
	}
	.td-special {
	    width: 300px; /* 특정 셀의 너비를 200px로 설정 */
	    
	}


#headCount {
	width: 50px;
}
  </style>
</head>
<body style="background-color: #f5f5f5;">
<div class="container">
<jsp:include page="/include/Header.jsp" flush="false"/>
	<div class="row justify-content-center">
		<div class="col-md-4"> 
			<jsp:include page="/include/AdminSidebar.jsp" flush="false"/>
		</div>
		<div class="rightside">
		<div class="include-gap">
		<form id ="RevModify">
			<h3 style=" margin-bottom: 60px; font-weight: bold; margin-left:105px;">관리자 예약 수정</h3>
		<table summary="관리자 예약 수정 " border="1" >
		
				<tbody>
					<tr>
						<td style="background-color:#73685d; color: #fff; width:200px; height: 70px; " >예약 번호</td>
						<td class="td-special"><input type="text"  name="revNo" value="<c:out value="${revVO.revNo}" />" readonly></td>
					</tr>
					<tr>
						<td style="background-color:#73685d; color: #fff; width:200px; height: 70px; " >아이디</td>
						<td><input type="text" name="memId" value="<c:out value="${revVO.memId }"/>" readonly ></td>
					</tr>
					<tr>
						<td style="background-color:#73685d; color: #fff; width:200px; height: 70px; " >예약일</td>
						<td><input id="revDate" type ="text" name="revDate" value="<c:out value="${revVO.revDate}"/>" readonly></td>
					</tr>
					<tr>
						<td style="background-color:#73685d; color: #fff; width:200px; height: 70px; " >체크인</td>
						<td>
							<input id="checkInDate" type ="text" name="checkIn" value="${revVO.checkIn}"  readonly>
						</td>
					</tr>
					<tr>
						<td style="background-color:#73685d; color: #fff; width:200px; height: 70px; " >체크아웃</td>
						<td><input id="checkOutDate" type ="text" name="checkOut" value="<c:out value="${revVO.checkOut}"/>" readonly></td>
					</tr>
					<tr>
						<td style="background-color:#73685d; color: #fff; width:200px; height: 70px; " >인원 수</td>
						<td>
							<button type="button" id="downCount" onclick="downValueFilter()" ><b>-</b></button>
							<input id="headCount" type ="text" name= "headCount" value="<c:out value="${revVO.headCount}"/>" required>
							<button type="button" id="upCount" onclick="upValueFilter()"><b>+</b></button>
						</td>
					</tr>
					<tr>
						<td style="background-color:#73685d; color: #fff; width:200px; height: 70px; " >객실이름</td>
						<td><input type ="text" name= "roomName" value="<c:out value="${roomVO.roomName}"/>" readonly></td>
					</tr>
					<tr>
						<td style="background-color:#73685d; color: #fff; width:200px; height: 70px; " >객실타입</td>
						<td><input type ="text" name= "roomType" value="<c:out value="${roomVO.roomType}"/>" required></td>
					</tr>
					<tr>
						<td style="background-color:#73685d; color: #fff; width:200px; height: 70px; " >금액</td>
						<td><input type ="text" name= "price" value="<c:out value="${revVO.price}"/>" readonly></td>
					</tr>

					<tr>
						<td  style="height: 70px;"align="right"  colspan="2">
					  		 <button type="submit" class="btn_css">수정 </button>
                       <button type="button" class="btn_css" onclick="location.href='<c:url value="/admin/RevDelete?id=${revVO.revNo}" />'" >삭제</button>

						</td>
					</tr>
				</tbody>
			</table>
		</form>
		</div>
	</div>
	</div>
	</div>
</body>
</html>