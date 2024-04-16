<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자홈 메뉴</title>
<style>
	.sidebar{
		background-color: #FFFFFF;
		font-size: 16px;
		font-family: "Poppins", sans = serif;
		font-weight: bold;
		padding: 0;
		width: 235px;
		height: 320px;
		z-index: 11;
		box-shadow: 0 5px 10px 0 rgba(230, 230, 243, 0, 0.88);
		border-radius: 6px;
		border: 5px solid;
		border-color: goldenrod;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	.nav{
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
	
	.sidebar .nav li a:hover{
		color: #0056b3;
		text-decoration: underline;
	}
	.sidebar .nav li a span {
		text-shadow: none;
	}
</style>
</head>
<body>
	<div class="col-md-4">
		<nav class="sidebar" >
			<ul class="nav">
				<li>
					<a href="${contextPath }/admin/adminMain">
						<span style="margin-top: 45px;">관리자 홈</span>
					</a>
				</li>
				<li>
					<a href="${contextPath }/admin/MemList" class="nav-link">
						<span>회원 정보</span>
					</a>
				</li>
				<li>
					<a href="${contextPath }/admin/RevList?type=admin" class="nav-link">
						<span>예약 목록</span>
					</a>
				</li>
				<li>
					<a href="${contextPath }/admin/RoomList?type=admin" class="nav-link">
						<span>객실 목록</span>
					</a>
				</li>
				<li>
					<a href="${contextPath }/admins/RoomAdd.jsp" class="nav=link">
						<span>객실 등록</span>
					</a>
				</li>
			</ul>
		</nav>
	</div>
</body>
</html>
