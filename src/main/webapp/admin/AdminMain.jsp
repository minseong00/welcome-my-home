<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Main</title>
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
	table {
		text-align: center;
	}
</style>
</head>
<body>
	<nav class="sidebar">
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
	
	<div class="rightside">
		<h2>전체 회원</h2>
		<table summary="전체 회원" border="1">
			<colgroup>
				<col width="">
				<col width="">
				<col width="">
				<col width="">
				<col width="">
			</colgroup>
			<thead>
				<tr>
					<th>고객명</th>
					<th>아이디</th>
					<th>이메일</th>
					<th>전화번호</th>
					<th>상세보기</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="">
						<tr>
							<td colspan="5">등록된 회원이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<td><!-- 고객명 --></td>
							<td><!-- 아이디 --></td>
							<td><!-- 이메일 --></td>
							<td><!-- 전화번호 --></td>
							<td><input type="button" value="상세보기"></td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		
		<h2>예약 내역</h2>
		<table summary="예약 내역" border="1">
			<colgroup>
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
					<th>아이디</th>
					<th>체크인</th>
					<th>체크아웃</th>
					<th>객실이름</th>
					<th>객실타입</th>
					<th>금액</th>
					<th>예약일</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="">
						<tr>
							<td colspan="7">예약이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<td>
								<a><!-- 예약 번호 --></a>
							</td>
							<td><!-- 아이디 --></td>
							<td><!-- 체크인 --></td>
							<td><!-- 체크아웃 --></td>
							<td><!-- 객실이름 --></td>
							<td><!-- 객실타입 --></td>
							<td><!-- 금액 --></td>
							<td><!-- 예약일 --></td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
</body>
</html>