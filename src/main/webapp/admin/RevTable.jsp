<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인화면에 나오는 예약 목록</title>
</head>
<body>
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
				<th>인원 수</th>
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
</body>
</html>