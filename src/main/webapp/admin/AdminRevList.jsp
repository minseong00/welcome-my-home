<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 예약 관리 눌렀을 때 나오는 테이블</title>
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
			<jsp:include page="/include/AdminSidebar.jsp" flush="false"/>
		</div>
		<div class="rightside">
		<table>
			<colgroup>
				<col width="">
				<col width="">
				<col width="">
				<col width="">
				<col width="">
				<col width="">
				<col width="">
				<col width="">
				<col width="">
				
			</colgroup>
			<thead>
			<tr>
				<th>예약 번호</th>
				<th>예약 날짜</th>
				<th>예약 회원</th>
				<th>예약된 룸</th>
				<th>체크인</th>
				<th>체크아웃</th>
				<th>인원 수</th>
				<th>예약 가격</th>
				<th>상세보기</th>
				
			</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty revList }">
						<tr>
							<td colspan="5">예약 내역이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="Rev" items="${revList }">
							<tr>
								<td><!-- 예약 번호 --></td>
								<td><!-- 예약 날짜 --></td>
								<td><!-- 예약 회원 --></td>
								<td><!-- 예약된 룸 --></td>
								<td><!-- 체크인 --></td>
								<td><!-- 체크아웃 --></td>
								<td><!-- 인원 수 --></td>
								<td><!-- 예약 가격 --></td>
								<td>
									<span id="detail" onclick="location.href='${contextPath }/RoomModify?roomNo=${Rev.bookNo }' ">상세보기</span>
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