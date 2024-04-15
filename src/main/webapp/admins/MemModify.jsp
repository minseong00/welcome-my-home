<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemModify.jsp : 상세페이지, 수정, 삭제</title>
<script type="text/javascript">
	function deleteMemID() {
		var confirmDelete = confirm("삭제하시겠습니까?");
	
		if(confirmDelete){
			window.location.href="${contextPath}/MemDelete?id=${MemOne.memId}";
			
			alert("삭제되었습니다.");
		} else{
			
			alert("삭제가 취소되었습니다.");
		}
	}	//deleteMemID() END
	
	function modMem(){
		var confirmModify = confirm("수정하시겠습니까?");
		
		if(confirmModify){
			window.location.href="${contextPath}/MemModify?id=${MemOne.memId}";
			
			alert("수정되었습니다.");
		}else{
			
			alert("수정이 취소되었습니다.");
		}
	}	// modMem() END


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
	<div>
	
	<form action="${contextPath}/admin/MemModify" method="post">
	<table border="1" style="text-align: center;">

	<tbody>
		<tr>	
			<td colspan="2" align=center>관리자 회원 정보 수정</td>
		</tr>
		<tr>
			<td>고객명</td>
			<td><input type="text"  name="name" value="<c:out value="${MemOne.memName}" />"required></td>
		</tr>
		<tr>
			<td>아이디</td>
			<td><input type="text" name="id" value="<c:out value="${MemOne.memId }"/>" readonly></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type ="password" name="pw" value="<c:out value="${MemOne.memPw}"/>"required></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input type ="email" name="email" value="<c:out value="${MemOne.memEmail}"/>"required></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><input type ="text" name= "call" value="<c:out value="${MemOne.memCall}"/>"required></td>
		</tr>
	</tbody>	
		
	<tfoot>
		<td style="text-align: right;" colspan="2" align=center>
  		<button type="submit" onclick="modMem();">수정</button>
 		 <button type="button" onclick="deleteMemID();" >삭제</button>
		</td>
	</tfoot>
	</table>
	</form>
	</div>
</body>
</html>