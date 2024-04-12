<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>   

<c:set var="contextPath" value="${pageContext.request.contextPath}"  />  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemJoin : 회원가입 페이지</title>
   <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
	
	/* 아이디 중복 체크 함수 */
	 function fn_process(){
		 
	    var _id=$("#t_id").val();
	    
	    const regExp = /[a-zA-Z0-9]/g;
	    if(regExp.test(_id)){
 	    	// alert("가능합니다.");
 	        // return true;
	    }else{
	    	alert("영문 숫자만 가능합니다.");
	        return;
	    }
		
	
	    $.ajax({
	       type:"post",
	       async:true,  
	       url:"<c:url value='/JoinIDCheck' />",
	       dataType:"text",
	       data: {id:_id},
	       
	       success:function (data,textStatus){
	          if(data=='usable'){
	        	  swal.fire('사용할 수 있는 ID입니다.');
	       	   $('#double').prop("disabled", true);
	          }else{
	        	  swal.fire('사용할 수 없는 ID입니다.');
	          }
	       },
	       error:function(data,textStatus){
	          alert("잘못 입력했습니다.");
	       },
	       complete:function(data,textStatus){
	          //alert("작업을완료 했습니다");
	       }
	    });  // ajax() END	 
	    
	 }	// fn_process() END
	 
	
	 /* 비밀번호 확인 함수 */
	  $(document).ready(function() {
		  $('input').focus(function() {
				$(this).css('background-color', 'orange');
		  });
		  
		  $('#name').prop("disabled", true);
          $('#email').prop("disabled", true);

         // 암호 확인 기능 구현
          $('#pw_confirm').keyup(function() {
              if ($('#pw').val() != $('#pw_confirm').val()) {
                  $('#pw_message').text(''); // 클리어
                  $('#pw_message').html("<b>비밀번호가 틀립니다.</b>"); // 레이어에 HTML 출력
                  
              } else {
                  $('#pw_message').text(''); // 클리어
                  $('#pw_message').html("<b>비밀번호가 맞습니다.</b>"); // 레이어에 텍스트 출력
                  $('#name').prop("disabled", false);
                  $('#email').prop("disabled", false);
              }
          });
         
       	  // pw_message 레이어 클리어
		  $('#name').keydown(function() {
              $('#pw_message').text(''); // 클리어
          });

      });
	 
	 </script>
<style>
	
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
 
</style>
</head>

<body>
<jsp:include page="/include/Header.jsp" flush="false" />

<div style="width: 40%;  margin: auto;">
<form   method="post" action="${contextPath}/Join">
<h2 style="text-align:center; margin-bottom: 60px; font-weight: bold;">회원 가입</h2>
<table style="border:1; margin: auto; " >
<tbody >
    <tr>
       <td  style="background-color:#73685d; color: #fff; width:200px; height: 70px; " ><span >아이디</span></td>
       <td >
	       	<input type="text" name="id" id="t_id">
	       	<input type="button" value="중복확인" id="double" onclick="fn_process()">
	       	<br>
	       	<div id="message"></div>
    	</td>
    </tr>
    <tr>
        <td  style="background-color:#73685d; color: #fff; height: 70px;"><span style="text-align: right;">비밀번호</span></td>
        <td ><input type="password"  name="pw" id="pw"></td>
    </tr>
    <tr>
        <td  style="background-color:#73685d; color: #fff; height: 70px;"><span style="text-align: right;">비밀번호확인</span></td>
        <td ><input type="password"  name="pw_confirm" id="pw_confirm">
        				<div id="pw_message"></div>
        </td>
    </tr>
    <tr>
        <td  style="background-color:#73685d; color: #fff; height: 70px;"><span style="text-align: right;">이름</span></td>
        <td ><input type="text"  name="name" id="name"></td>
    </tr>
    <tr>
        <td  style="background-color:#73685d; color: #fff; height: 70px;"><span style="text-align: right;">전화번호</span></td>
        <td ><input type="text"  name="call" id="call"></td>
    </tr>
    <tr>
        <td  style="background-color:#73685d; color: #fff; height: 70px;"><span style="text-align: right;">이메일</span></td>
        <td ><input type="text"  name="email" id="email"></td>
    </tr>
    <tr >
        <td  colspan="2" style="height: 70px; ">
	       <input type="submit" class="sky-blue-button"value="가입하기">
	      
	       <input type="reset" class="sky-blue-button"value="다시입력">
    </td>
    </tr>
    </tbody>
</table>

</form>
</div>
</body>
</html>