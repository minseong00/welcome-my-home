<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>       

<c:set var="contextPath" value="${pageContext.request.contextPath}"  />  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>MemModify.jsp : 상세페이지, 수정, 삭제</title>

</head>
<body>
	<div class="">
	
	<form action="${contextPath}/MemModify" method="post">
	<table border="1" style="text-align: center;">
			<colgroup>
				<col width="%">
				<col width="%">
				<col width="%">
				<col width="%">
				<col width="%">
			</colgroup>

	<tbody>
		<tr>	
			<td colspan="4" align=center>회원 정보 수정</td>
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
		<td style="text-align: right;">
  		<button type="submit" >수정</button>
 		 <button type="button" onclick="location.href='<c:url value="/MemDelete?id=${MemOne.mem_id}" />'" >삭제</button>
		</td>
	</tfoot>
	</table>
	</div>
	</form>
</body>
</html>