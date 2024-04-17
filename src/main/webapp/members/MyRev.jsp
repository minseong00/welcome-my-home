<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의예약</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
<!-- css 적용 -->
<link rel="stylesheet" href="${contextPath }/style/css/flaticon.css">
<link rel="stylesheet" href="${contextPath }/style/css/style.css">
<style>
<style type="text/css">

    
  		body{
		line-height: normal;
		display: flex;
		 padding:1.5em;
  		background: #f5f5f5;
	}
	.rightside{
		display: flex;
		flex-direction: column;
		flex-grow: 1;
		margin-left: 0.5rem;
	}
	.include-gap {
    margin-bottom: 100px; /* 원하는 만큼의 간격을 설정합니다. */
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
  
  
 @media all and (max-width: 900px) {
    
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
	  .container {
	  	margin-bottom: 100px;
	  }
</style>
</head>

<body >
<div class="container">
	<jsp:include page="/include/Header.jsp" flush="false"/>
	<div class="row justify-content-center">
		<div class="col-md-4"> 
			<jsp:include page="/include/MemSidebar.jsp" flush="false"/>
		</div>
	<div class="rightside">
				<h3 style="font-weight: bold">예약 내역</h3>
				
	<b>예약 수정은 고객센터로 문의 바랍니다.</b>
	<table summary="예약 내역" border="1">
		
		<thead>
			<tr>
				<th>예약일</th>
				<th>체크인</th>
				<th>체크아웃</th>
				<th>룸이름</th>
				<th>인원 수</th>
				<th>금액</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>	
			<c:choose>
				<c:when test="${empty revList }">
					<tr>
						<td colspan="9">예약이 없습니다.</td>
					</tr>
				</c:when>
			<c:otherwise>
				<c:forEach var="rev" items="${revList}">
				<fmt:formatDate value="${rev.revDate}" pattern="yyyy-MM-dd HH:mm:ss" var="formattedDate" />
					<tr>
						<td>${formattedDate }</td>
						<td>${rev.checkIn }</td>
						<td>${rev.checkOut }</td>
						<td>${rev.roomName }</td>
						<td>${rev.headCount }</td>
						<td>${rev.price}</td>
						<td><span id="detail" onclick="location.href='${contextPath }/admin/RevDelete?id=${rev.revNo}'" >삭제</span>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</tbody>
	</table>
</div>
		
	</div>
</div>
 <jsp:include page="/include/Footer.jsp" flush="false"/>
</body>
</html>