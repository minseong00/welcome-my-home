<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemModify.jsp : 상세페이지, 수정, 삭제</title>
<style>
    
     body {
 	padding:1.5em;
  background: #f5f5f5; /* 배경색 설정 */
   font-weight: bold; /* 헤더 폰트를 굵게 */
}
table {
  border: 1px #a39485 solid; /* 테이블의 외곽선 스타일 */
  font-size: .9em; /* 테이블 내의 폰트 크기 */
  box-shadow: 0 2px 5px rgba(0,0,0,.25); /* 테이블에 그림자 효과 */
  
  border-collapse: collapse; /* 테이블의 보더 라인을 하나로 합침 */
  border-radius: 10px; /* 테이블 모서리를 둥글게 처리 */
  overflow: hidden; /* 내용이 넘칠 경우 숨김 처리 */
  
}
td, th {
  border: 1px solid #a39485; /* 각 셀의 테두리 스타일 */
  padding: 7px; /* 각 셀의 안쪽 여백 */
}

.sky-blue-button {
	padding: 7px 15px;
	font-size: 16px;
	background-color: #87CEEB;
	color: #fff; /* 버튼 텍스트 색상 */
	transition: background-color 0.3s ease;
	border: none;
	border-radius: 50px;
	
}

.sky-blue-button:hover {
	background-color: #00BFFF;
}

.rightside{
		display: flex;
		flex-direction: column;
		flex-grow: 1;
		
	}
	.include-gap {
/*     margin-left: 100px; /* 원하는 만큼의 간격을 설정합니다. */ */
}
.td-special {
    width: 300px; /* 특정 셀의 너비를 200px로 설정 */
    
}
  </style>
  
</head>
<body>

	<div class="container">
		<jsp:include page="/include/Header.jsp" flush="false"/>
		<div class="row justify-content-center" >
		<div class="col-md-4"> 
			<jsp:include page="/include/AdminSidebar.jsp" flush="false"/>
		</div>
		<div class="rightside">
		<div class="include-gap">
	<form action="${contextPath}/admin/MemModify" method="post">
		<h3 style=" margin-bottom: 60px; font-weight: bold; margin-left:105px;">관리자 회원 정보수정</h3>
	<table summary="관리자 회원 정보수정 " border="1" >
	
			
	<tbody>
		
		<tr>
			<td style="background-color:#73685d; color: #fff; width:200px; height: 70px; " >고객명</td>
			<td class="td-special"><input type="text"  name="name" value="<c:out value="${MemOne.memName}" />" ></td>
		</tr>
		<tr>
			<td style="background-color:#73685d; color: #fff; width:200px; height: 70px; " >아이디</td>
			<td><input type="text" name="id" value="<c:out value="${MemOne.memId }"/>" readonly></td>
		</tr>
		<tr>
			<td style="background-color:#73685d; color: #fff; width:200px; height: 70px; " >비밀번호</td>
			<td><input type ="password" name="pw" value="<c:out value="${MemOne.memPw}"/>"></td>
		</tr>
		<tr>
			<td style="background-color:#73685d; color: #fff; width:200px; height: 70px; " >이메일</td>
			<td><input type ="email" name="email" value="<c:out value="${MemOne.memEmail}"/>"></td>
		</tr>
		<tr>
			<td style="background-color:#73685d; color: #fff; width:200px; height: 70px; " >전화번호</td>
			<td><input type ="text" name= "call" value="<c:out value="${MemOne.memCall}"/>"></td>
		</tr>
		
		<tr>
		<td  style="height: 70px;"align="right"  colspan="2">
  		<button type="submit" class="sky-blue-button">수정 </button>
 		 <button type="button" class="sky-blue-button" onclick="location.href='<c:url value="/admin/MemDelete?id=${MemOne.memId}" />'" >삭제</button>
		</td>
		</tr>
	</tbody>
	</table>
	</form>
	</div>
	</div>
	</div>
	</div>
</body>
</html>