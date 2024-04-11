<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin RoomList</title>
<style type="text/css">
	body{
		line-height: normal;
		display: flex;
	}
	.rightside{
		display: flex;
		flex-direction: column;
		flex-grow: 1;
		margin-left: 0.5rem;
	}
	
</style>
</head>

<body >
<div class="container">
	<jsp:include page="/include/Header.jsp" flush="false"/>
	<div class="row justify-content-center">
		<div class="col-md-4"> 
			<jsp:include page="/include/adminSidebar.jsp" flush="false"/>
		</div>
		<div class="rightside">
		<table>
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
					<c:when test="${totalCount == 0 }">
						<tr>
							<td colspan="5">등록된 방이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="room" items="${roomVO }">
							<tr>
								<input type="hidden" name ="roomNo" value="${room.roomNo}">
								<td><!-- 룸이름 --><c:out value="${room.roomName }"></c:out></td>
								<td><!-- 룸타입 --><c:out value="${room.roomType }"></c:out></td>
								<td><!-- 최대 인원 --><c:out value="${room.headCount }"></c:out></td>
								<td><!-- 가격 --><c:out value="${room.roomCost }"></c:out></td>
								<td>
									<span id="detail" onclick="location.href='<c:url value="/RoomModify?roomNo=${room.roomNo }" />' ">상세보기</span>
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