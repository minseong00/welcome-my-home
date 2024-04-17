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
<script type="text/javascript">

	function MyRevDelete(revNo){
		var confirmDelete = confirm("삭제 하시겠습니까?");
			   if(confirmDelete) {
					$.ajax({
						type:"post",
						url:"<c:url value='/RevDelete' />",
						data: {revNo : revNo},
						dataType: "text",
						success:function(data){
							if(data == "success") {
								alert("삭제 되었습니다.");
								window.location.replace("${contextPath}/RevDelete");
							} else {
								alert("삭제 중 오류 발생하였습니다. 다시 시도해주세요.");
								window.history.back();
							}
						},
						error:function(data, status, error){
								console.error("삭제 중 오류 발생 :", error);
								alert("삭제 중 오류가 발생하였습니다.");
								window.history.back();
						}
					});
			   }
		   }

</script>
<style type="text/css">

    
  		body{
  		font-family: 'Roboto', sans-serif;
        margin: 0;
        padding: 0;
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
<div class="container"  style="margin-bottom: 300px;" >
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
						<td><span id="detail" onclick="MyRevDelete('${rev.revNo}')">삭제</span>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</tbody>
	</table>
</div>
		
	</div>
</div>

</body>
 <jsp:include page="/include/Footer.jsp" flush="false"/>
</html>