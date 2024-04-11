<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>       
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemModify.jsp : 상세페이지, 수정, 삭제</title>
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
	<div>
	
	<form action="${contextPath}/MemModify" method="post">
	<table border="1" style="text-align: center;">

	<tbody>
		<tr>	
			<td colspan="2" align=center>회원 정보 수정</td>
		</tr>
		<tr>
			<td>고객명</td>
			<td><input type="text"  name="name" value="<c:out value="${MemOne.mem_name}" />" ></td>
		</tr>
		<tr>
			<td>아이디</td>
			<td><input type="text" name="id" value="<c:out value="${MemOne.mem_id }"/>" readonly></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type ="password" name="pw" value="<c:out value="${MemOne.mem_pw}"/>"></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input type ="email" name="email" value="<c:out value="${MemOne.mem_email}"/>"></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><input type ="text" name= "call" value="<c:out value="${MemOne.mem_call}"/>"></td>
		</tr>
	</tbody>	
		
	<tfoot>
		<td style="text-align: right;" colspan="2" align=center>
  		<button type="submit" >수정</button>
 		 <button type="button" onclick="location.href='<c:url value="/MemDelete?id=${MemOne.mem_id}" />'" >삭제</button>
		</td>
	</tfoot>
	</table>
	</form>
	</div>
</body>
</html>