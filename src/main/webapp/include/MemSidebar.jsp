<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 메뉴</title>
<style>
	.sidebar{
		background-color: #FFFFFF;
	font-size: 16px;
	font-family: "Poppins", sans = serif;
	font-weight: bold;
	padding: 0;
	width: 235px;
	height: 20vh;
	box-shadow: 0 2px 5px rgba(0,0,0,.25); /* 테이블에 그림자 효과 */
	border-radius: 10px;
	
	
	 border-collapse: collapse; /* 테이블의 보더 라인을 하나로 합침 */
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
	margin-bottom: 5px;
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
	 hr {
        border: none;
        border-top: 1px solid #ccc;
        margin-top: 10px ;
    }
</style>
</head>
<body>
<nav class="sidebar" >
	<ul class="nav">
		<li>
			<a href="${contextPath}/MemModify?type=member">
				<span>내 정보</span>
			</a>
		</li>
		<hr>
		<li>
			<a href="${contextPath}/RevList?type=myInfo">
				<span>내 예약 내역</span>
			</a>
		</li>
	</ul>
</nav>
</body>
</html>