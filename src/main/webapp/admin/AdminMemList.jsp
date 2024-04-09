<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminMemList.jsp : 전체회원목록</title>
</head>
<body>
	<div class="">
	
	<form action=""></form>
	<table border="1" style="text-align: center;">
			<colgroup>
				<col width="%">
				<col width="%">
				<col width="%">
				<col width="%">
				<col width="%">
			</colgroup>
	<thead>
		<tr>
			<th>고객명</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이메일</th>
			<th>전화번호</th>
		</tr>
	</thead>
	<tbody></tbody>
	
			<tr>
				<td>
					<c:out value=""/>
				</td>
				<td>
				
				</td>
				<td>
				
				</td>
				<td>
				
				</td>
				<td>
				
				</td>
			</tr>	
		
	</tbody>	
	</table>
	</div>
	
	<tfoot>
		<tr>
			<input type = "submit" value="수정" onclick="alert('성공')">
			<input type = "button" value="삭제" onclick="alert('삭제')">

		</tr>
	
	</tfoot>
	
	
</body>
</html>