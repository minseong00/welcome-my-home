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
 <h1 class="cls1">마이페이지</h1>
<form action="${contextPath}/MemModify" method="post">
 <table align="center" >
    <tr>
     <td width="200"><p align="right" >고객명</td>
     <td width="400"><input type="text" name="name" value="<c:out value="${MemOne.mem_name}"/>"></td>
   </tr>
   <tr>
     <td width="200"><p align="right" >아이디</td>
     <td width="400"><input type="text" name="id" value="<c:out value="${MemOne.mem_id}"/>"readonly></td>
   </tr>
 <tr>
     <td width="200"><p align="right" >비밀번호</td>
     <td width="400"><input type="password" name="pw" value="<c:out value="${MemOne.mem_pw}"/>"></td>
   </tr>
   <tr>
     <td width="200"><p align="right" >이메일</td>
     <td width="400"><input type="email" name="email"  value="<c:out value="${MemOne.mem_email}"/> "></td>
   </tr>
   <tr>
     <td width="200"><p align="right" >전화번호</td>
     <td width="400"><input type="text" name="call" value="<c:out value="${MemOne.mem_call}"/>"></td>
   </tr>
   <tr align="center" >
   		<td style="text-align: right;" colspan="2" align=center>
       <input type="reset" value="다시입력" >
       <button type="submit" >수정하기</button>
       <button type="button" onclick="location.href='<c:url value="/MemDelete?id=${MemOne.mem_id}&sort=delMyInfo"/>'">탈퇴하기</button> 
      </td>
   </tr>
 </table>
</form>
</body>
</html>