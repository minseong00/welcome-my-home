<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
</body>
</html>