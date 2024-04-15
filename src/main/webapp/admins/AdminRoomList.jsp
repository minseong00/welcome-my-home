<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin RoomList</title>
<style type="text/css">
body {
	line-height: normal;
	display: flex;
	padding: 1.5em;

}

.rightside {
	display: flex;
	flex-direction: column;
	flex-grow: 1;
	margin-left: 0.5rem;
}

table {
	border: 1px #a39485 solid;
	font-size: .9em;
	box-shadow: 0 2px 5px rgba(0, 0, 0, .25);
	width: 100%;
	border-collapse: collapse;
	border-radius: 5px;
	overflow: hidden;
}

th {
	text-align: left;
}

thead {
	font-weight: bold;
	color: #fff;
	background: #73685d;
}

td, th {
	padding: 1em .5em;
	vertical-align: middle;
}

td {
	border-bottom: 1px solid rgba(0, 0, 0, .1);
	background: #fff;
}

a {
	color: #73685d;
}

@media all and (max-width: 768px) {
	table, thead, tbody, th, td, tr {
		display: block;
	}
	th {
		text-align: right;
	}
	table {
		position: relative;
		padding-bottom: 0;
		border: none;
		box-shadow: 0 0 10px rgba(0, 0, 0, .2);
	}
	thead {
		float: left;
		white-space: nowrap;
	}
	tbody {
		overflow-x: auto;
		overflow-y: hidden;
		position: relative;
		white-space: nowrap;
	}
	tr {
		display: inline-block;
		vertical-align: top;
	}
	th {
		border-bottom: 1px solid #a39485;
	}
	td {
		border-bottom: 1px solid #e5e5e5;
	}
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
		<h3 style="font-weight: bold">전체 객실 리스트</h3>
		<table summary="전체 객실 리스트" border="1">
			<colgroup>
				<col width="20%;">
				<col width="20%;">
				<col width="20%;">
				<col width="20%;">
				<col width="20%;">
				
			</colgroup>
			<thead>
			<tr>
				<th>룸 이름</th>
				<th>룸 타입</th>
				<th>최대 인원 수</th>
				<th>가격</th>
				<th>상세보기</th>
				
			</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty roomVO }">
						<tr>
							<td colspan="5">등록된 방이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="room" items="${roomVO }">
							<tr>
								<td><!-- 룸이름 --><c:out value="${room.roomName }"></c:out></td>
								<td><!-- 룸타입 --><c:out value="${room.roomType }"></c:out></td>
								<td><!-- 최대 인원 --><c:out value="${room.headCount }"></c:out></td>
								<td><!-- 가격 --><c:out value="${room.roomCost }"></c:out></td>
								<td>
									<span id="detail" onclick="location.href='${contextPath }/admin/RoomModify?roomNo=${room.roomNo }'">상세보기</span>
								</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
			
		</table>
		</div>
		</div>
	
	</div>
	
</body>
</html>