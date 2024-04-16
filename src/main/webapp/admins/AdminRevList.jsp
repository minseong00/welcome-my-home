<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 예약관리</title>
<link rel="stylesheet" href="${contextPath }/style/css/flaticon.css">
<link rel="stylesheet" href="${contextPath }/style/css/style.css">
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
</style>
</head>

<body >

<div class="container">
	<jsp:include page="/include/Header.jsp" flush="false"/>
	<div class="row justify-content-center">
		<div class="col-md-4"> 
			<jsp:include page="/include/AdminSidebar.jsp" flush="false"/>
		</div>
		<div class="rightside">
			 <div class="include-gap" >
		<h3>관리자 예약관리 시스템</h3>
		<table summary="예약 내역" border="1">
			<colgroup>
				<col width="7%">
				<col width="7%">
				<col width="7%">
				<col width="7%">
				<col width="7%">
				<col width="7%">
				<col width="7%">
				<col width="7%">
				<col width="7%">
				
			</colgroup>
			<thead>
			<tr>
				<th>예약 번호</th>
				<th>예약 날짜</th>
				<th>예약 회원</th>
				<th>예약된 룸</th>
				<th>체크인</th>
				<th>체크아웃</th>
				<th>인원 수</th>
				<th>예약 가격</th>
				<th>상세보기</th>
				
			</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty revList }">
						<tr>
							<td colspan="9">예약 내역이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="rev" items="${revList }">
							<tr>
								<td>${rev.revNo }</td>
								<td>${rev.revDate }</td>
								<td>${rev.memId }</td>
								<td>${rev.roomName }</td>
								<td>${rev.checkIn }</td>
								<td>${rev.checkOut }</td>
								<td>${rev.headCount }</td>
								<td>${rev.price }</td>
								<td>
									<span id="detail" onclick="location.href='${contextPath }/admin/RevDetail?revNo=${rev.revNo }' ">상세보기</span>
								</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
			
		</table>
		</div>
		</div>
		</div>
	
	</div>
	</div>
</body>
</html>