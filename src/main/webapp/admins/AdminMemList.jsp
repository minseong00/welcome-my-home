<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>       
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />    
<html>
<head>
<meta  charset="UTF-8">
<title>AdminMemList.jsp : 전체회원목록</title>
<style>
     .cls1 {
       font-size:40px;
       text-align:center;
     }
    
     .cls2 {
       font-size:20px;
       text-align:center;
     }
  </style>
  
</head>
<body>		
 <p class="cls1">회원목록</p>
   <table align="center" border="1" >
      <tr align="center" bgcolor="lightgreen">
         <td width="7%" ><b>고객명</b></td>
         <td width="7%" ><b>아이디</b></td>
         <td width="7%" ><b>비밀번호</b></td>
         <td width="7%"><b>이메일</b></td>
         <td width="7%"><b>전화번호</b></td>
         
   </tr>

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
          <td><c:out value="${mem.memPw }" /></td>
          <td><c:out value="${mem.memCall }" /></td>
          <td><c:out value="${mem.memEmail }" /></td>
       </tr>
     </c:forEach>
</c:otherwise>
</c:choose>
   </table>  
</body>
</html>