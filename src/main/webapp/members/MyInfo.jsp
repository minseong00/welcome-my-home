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
       
       text-align:center;
       margin-bottom: 60px; 
      
     }
    
     .cls2 {
       font-size:20px;
       text-align:center;
     }
       body {
    
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
  padding: 8px; /* 각 셀의 안쪽 여백 */
}
.ftco-footer ftco-bg-dark ftco-section{
   height: 50px; /* 원하는 높이로 조절 */
    width: 50%; /* 전체 너비로 조절 */
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
.sidebar-custom {
    position: relative;
    left: -125px; /* 왼쪽으로 20px 이동 */
}
.td-special {
    width: 300px; /* 특정 셀의 너비를 200px로 설정 */
    
}
  </style>
</head>

<body>

<div class="container">
    <jsp:include page="/include/Header.jsp" flush="false"/>
   <div class="row justify-content-center">
   <div class="col-md-4 sidebar-custom"> 
      <jsp:include page="/include/MemSidebar.jsp" flush="false"/>
   </div>
   
   <div class="rightside ">
       <h2 class="cls1">마이페이지</h2>
      <form action="${contextPath}/MemModify?sort=modMyInfo&type=MemUpdate" method="post">
       <table id="join_table" >
       <tbody>
          <tr class="join_td">
           <td style="background-color:#73685d; color: #fff; width:200px; height: 70px; "><span style="text-align: right;">이름</span></td>
           <td class="td-special" ><input type="text" name="name" value="<c:out value="${MemOne.mem_name}"/>"></td>
         </tr>
         <tr class="join_td">
           <td style="background-color:#73685d; color: #fff; height: 70px;"><span style="text-align: right;">아이디</span></td>
           <td class="td-special"><input type="text" name="id" id="id" value="<c:out value="${MemOne.mem_id}"/>" readonly></td>
         </tr>
          <tr class="join_td">
           <td style="background-color:#73685d; color: #fff; height: 70px;" ><span style="text-align: right;">비밀번호</span></td>
           <td class="td-special"><input type="password" name="pw" value="<c:out value="${MemOne.mem_pw}"/>"></td>
         </tr>
         <tr class="join_td">
           <td style="background-color:#73685d; color: #fff; height: 70px;"><span style="text-align: right;" >이메일</span></td>
           <td class="td-special"><input type="email" name="email"  value="<c:out value="${MemOne.mem_email}"/> "></td>
         </tr>
         <tr class="join_td">
           <td style="background-color:#73685d; color: #fff; height: 70px;"><span style="text-align: right;" >전화번호</span></td>
           <td class="td-special"><input type="text" name="call" value="<c:out value="${MemOne.mem_call}"/>"></td>
         </tr>
         <tr class="join_td">
               <td align="right" colspan="2" id="submit_td">
             <input type="reset"class="sky-blue-button" value="다시입력" >
             <input type="hidden" name="type" value="MemUpdate">
             <button type="submit" class="sky-blue-button" >수정하기</button>
             <button type="button" class="sky-blue-button"onclick="location.href='<c:url value="/MemDelete?id=${MemOne.mem_id}&sort=delMyInfo"/>'">탈퇴하기</button> 
            </td>
         </tr>
         </tbody>
       </table>
      </form>
   </div>
   </div>
</div>

</body>
</html>