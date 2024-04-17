<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자홈 : 회원목록</title>
<style>
	body {
  padding:1.5em;
  background: #f5f5f5;
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
	#detail {
		cursor: pointer;
	}
</style>
</head>
<body>
	<h3 style="font-weight: bold">전체 회원</h3>
	
	
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
				<c:when test="${empty memList }">
					<tr>
						<td colspan="5">등록된 회원이 없습니다.</td>
					</tr>
				</c:when>
			<c:otherwise>
				<c:forEach var="mem" items="${memList}">
					<tr>
						<td>${mem.memName }</td>
						<td>${mem.memId }</td>
						<td>${mem.memEmail }</td>
						<td>${mem.memCall }</td>
						<td><span id="detail" onclick="location.href='${contextPath}/admin/MemModify?id=${mem.memId }'">상세보기</span></td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</tbody>
	</table>
</body>
</html>