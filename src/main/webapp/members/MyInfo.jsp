<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>    
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyInfo : 마이페이지</title>
<script type="text/javascript">
	function deleteId(){
		var confirmDelete = confirm("탈퇴하시겠습니까?");
		
		if(confirmDelete){
			window.location.href="${contextPath}/MemDelete?id=${MemOne.memId}";
			
			alert("탈퇴되었습니다.");
		} else{
			
			alert("탈퇴가 취소되었습니다.");
		}
	}



</script>

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
<jsp:include page="/include/Header.jsp" flush="false"/>
 <h1 class="cls1">마이페이지</h1>
<form action="${contextPath}/MemModify" method="post">
 <table align="center" >
    <tr>
     <td ><p align="right" >고객명</td>
     <td ><input type="text" name="name" value="<c:out value="${MemOne.memName}"/>"></td>
   </tr>
   <tr>
     <td><p align="right" >아이디</td>
     <td ><input type="text" name="id" value="<c:out value="${MemOne.memId}"/>"readonly></td>
   </tr>
 <tr>
     <td ><p align="right" >비밀번호</td>
     <td><input type="password" name="pw" value="<c:out value="${MemOne.memPw}"/>"></td>
   </tr>
   <tr>
     <td><p align="right" >이메일</td>
     <td ><input type="email" name="email"  value="<c:out value="${MemOne.memEmail}"/> "></td>
   </tr>
   <tr>
     <td ><p align="right" >전화번호</td>
     <td><input type="text" name="call" value="<c:out value="${MemOne.memCall}"/>"></td>
   </tr>
   <tr  >
   		<td style="text-align: right;" colspan="2" align=center>
       <input type="reset" value="다시입력" >
       <button type="submit" >수정하기</button>
       <button type="button" onclick="deleteId();">탈퇴하기</button> 
      
       
      </td>
   </tr>
 </table>
</form>
</body>
</html>