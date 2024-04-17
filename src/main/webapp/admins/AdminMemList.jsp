<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>       
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />    
<html>
<head>
<meta  charset="UTF-8">
<title>관리자 회원관리</title>
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
<!-- css 적용 -->
<link rel="stylesheet" href="${contextPath }/style/css/flaticon.css">
<link rel="stylesheet" href="${contextPath }/style/css/style.css">
<style type="text/css">
    
  		body{
		padding:1.5em;
  		background: #f5f5f5;
  		
	}
	.rightside {
   /* 배경색 설정 */
   display: flex;
   flex-direction: column;
   flex-grow: 1;
  margin-left: 0.5rem;
   width: calc(70vh - 235px); 
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
<div class="container">
	    <jsp:include page="/include/Header.jsp" flush="false"/>
	    <div class="row justify-content-center">
		<div class="col-md-4"> 
			<jsp:include page="/include/AdminSidebar.jsp" flush="false"/>
		</div>
		<div class="rightside">
	            <div class="include-gap" >
 <h3 style="font-weight: bold">회원목록</h3>
   <table  summary="전체 회원" border="1"  >
   	<colgroup  >
			<col width="7%">
			<col width="7%">
			<col width="7%">
			<col width="7%">
			<col width="7%">
		</colgroup>
		<thead  >
      <tr>
         <th>고객명</th>
         <th>아이디</th>
         <th>비밀번호</th>
         <th>이메일</th>
         <th>전화번호</th>
         
   </tr>
</thead>
<tbody>
<c:choose>
    <c:when test="${empty  MemModel}" >
      <tr>
        <td colspan=7>
          <b>등록된 회원이 없습니다.</b>
       </td>  
      </tr>
   </c:when>  
   <c:otherwise>
      <c:forEach  var="mem" items="${MemModel }" >
        <tr align="center">
          <td><a href="<c:url value='/admin/MemModify?id=${mem.memId}' /> "><c:out value="${mem.memName}"/></a></td>     
          <td><c:out value="${mem.memId }" /></td>
          <td>*****<input type="hidden" value="${mem.memPw }"></td>
          <td><c:out value="${mem.memEmail }" /></td>
          <td><c:out value="${mem.memCall }" /></td>
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
</body>
</html>