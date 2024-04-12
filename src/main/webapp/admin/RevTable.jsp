<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인화면에 나오는 예약 목록</title>
<style>
	body {
  padding:1.5em;
  background: #f5f5f5
}

table {
  border: 1px #a39485 solid;
  font-size: .9em;
  box-shadow: 0 2px 5px rgba(0,0,0,.25);
  width: 100%;
  border-collapse: collapse;
  border-radius: 5px;
  overflow: hidden;
}

th {
  text-align: left;
}
  
thead {
  font-weight: bold;
  color: #fff;
  background: #73685d;
}
  
 td, th {
  padding: 1em .5em;
  vertical-align: middle;
}
  
 td {
  border-bottom: 1px solid rgba(0,0,0,.1);
  background: #fff;
}

a {
  color: #73685d;
}
  
 @media all and (max-width: 768px) {
    
  table, thead, tbody, th, td, tr {
    display: block;
  }
  
  th {
    text-align: right;
  }
  
  table {
    position: relative; 
    padding-bottom: 0;
    border: none;
    box-shadow: 0 0 10px rgba(0,0,0,.2);
  }
  
  thead {
    float: left;
    white-space: nowrap;
  }
  
  tbody {
    overflow-x: auto;
    overflow-y: hidden;
    position: relative;
    white-space: nowrap;
  }
  
  tr {
    display: inline-block;
    vertical-align: top;
  }
  
  th {
    border-bottom: 1px solid #a39485;
  }
  
  td {
    border-bottom: 1px solid #e5e5e5;
  }
  
  
  }
</style>
</head>
<body>
	
	<h3>예약 내역</h3>
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
				<c:when test="${empty memVO }">
					<tr>
						<td colspan="9">예약이 없습니다.</td>
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
					<td><!-- 인원수 --></td>
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