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
	body{
		line-height: normal;
		display: flex;
	}
	.rightside{
		display: flex;
		flex-direction: column;
		flex-grow: 1;
		margin-left: 0.5rem;
	}

     .cls1 {
       font-size:40px;
       text-align:center;
     }
    
     .cls2 {
       font-size:20px;
       text-align:center;
     }
     
     .join_tr td { 
     	padding: 10px;
     }
     
     #join_table {
        border-collapse: separate; /* 테이블 테두리를 겹치지 않도록 설정 */
        border-spacing: 10px; /* 셀 사이의 간격 설정 */
    }
     
     #id { 
        background-color: #f0f0f0; /* 비활성화된 입력창과 유사한 배경색 */
        color: #666; /* 텍스트 색상 */
        border: 1px solid #CCC; /* 테두리 스타일 */
        font-size: 16px; /* 폰트 크기 */
        width: 190px;
        pointer-events: none; /* 마우스 이벤트 비활성화 */
     }
     
     #submit_td {
     	text-align: center;
     }
     
     #submit_td > *	{
     	margin-right: 10px;
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
<div class="container">
    <jsp:include page="/include/Header.jsp" flush="false"/>
	<div class="row justify-content-center">
	<div class="col-md-4"> 
		<jsp:include page="/include/MemSidebar.jsp" flush="false"/>
	</div>
	
	<div class="rightside">
		 <h1 class="cls1">마이페이지</h1>
		<form action="${contextPath}/MemModify?sort=modMyInfo&type=MemUpdate" method="post">
		 <table align="center" id="join_table">
		    <tr class="join_td">
		     <td ><p align="right" >고객명</td>
		     <td ><input type="text" name="name" value="<c:out value="${MemOne.mem_name}"/>"></td>
		   </tr>
		   <tr class="join_td">
		     <td><p align="right" >아이디</td>
		     <td ><input type="text" name="id" id="id" value="<c:out value="${MemOne.mem_id}"/>" readonly></td>
		   </tr>
		 	<tr class="join_td">
		     <td ><p align="right" >비밀번호</td>
		     <td><input type="password" name="pw" value="<c:out value="${MemOne.mem_pw}"/>"></td>
		   </tr>
		   <tr class="join_td">
		     <td><p align="right" >이메일</td>
		     <td ><input type="email" name="email"  value="<c:out value="${MemOne.mem_email}"/> "></td>
		   </tr>
		   <tr class="join_td">
		     <td ><p align="right" >전화번호</td>
		     <td><input type="text" name="call" value="<c:out value="${MemOne.mem_call}"/>"></td>
		   </tr>
		   <tr class="join_td">
		   		<td colspan="2" id="submit_td">
		       <input type="reset" value="다시입력" >
		       <input type="hidden" name="type" value="MemUpdate">
		       <button type="submit" >수정하기</button>
		       <button type="button" onclick="location.href='<c:url value="/MemDelete?id=${MemOne.mem_id}&sort=delMyInfo"/>'">탈퇴하기</button> 
		      </td>
		   </tr>
		 </table>
		</form>
	</div>
	</div>
</div>
</body>
</html>