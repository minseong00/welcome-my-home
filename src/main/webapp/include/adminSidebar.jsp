<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.sidebar{
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
				<a href="${contextPath }/RoomList?type=admin" class="nav-link">
					<span>객실정보</span>
				</a>
			</li>
			<li>
				<a href="${contextPath }/admin/RoomAdd.jsp" class="nav=link">
					<span>객실등록</span>
				</a>
			</li>
		</ul>
	</nav>
	</div>
</body>
</html>