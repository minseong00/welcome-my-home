<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
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
	.sidebar{
		background: #ffffff;
		font-family: "Poppins", sans=serif;
		font-weight: normal;
		padding: 0;
		width: 236px;
		height: 95vh;
		z-index: 11;
		box-shadow: 0 5px 10px 0 rgba(230, 230, 243, 0, 0.88);
		margin-left: 0.5rem;
		margin-bottom: 2.062rem;
		border-radius: 6px;
		border: 1px solid #e4e4f4;
		display: inline-block;
	}
	.nav{
		display: flex;
		flex-wrap: wrap;
		padding-left: 0;
		margin-bottom: 0;
		list-style: none;
		align-items: center;
	}
	
	.sidebar .nav {
		overflow: hidden;
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
	
	.sidebar .nav li a:hover{
		color: #0056b3;
		text-decoration: underline;
	}
	.sidebar .nav li a span {
		text-shadow: none;
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
<%@ include file="../include/Header.jsp" %>
<div class="row justify-content-center">
<div class="col-md-4"> 
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
								<input type="hidden" value="${room.roomNo}">
								<td><!-- 룸이름 --><c:out value="${room.roomName }"></c:out></td>
								<td><!-- 룸타입 --><c:out value="${room.roomType }"></c:out></td>
								<td><!-- 최대 인원 --><c:out value="${room.headCount }"></c:out></td>
								<td><!-- 가격 --><c:out value="${room.roomCost }"></c:out></td>
								<td>
									<span id="detail" onclick="location.href='<c:url value="/RoomDetail?num=${room.roomNo }" />' ">상세보기</span>
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