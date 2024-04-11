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
          $('#pwd_confirm').keyup(function() {
              if ($('#pwd').val() != $('#pwd_confirm').val()) {
                  $('#pwd_message').text(''); // 클리어
                  $('#pwd_message').html("<b>비밀번호가 틀립니다.</b>"); // 레이어에 HTML 출력
                  
              } else {
                  $('#pwd_message').text(''); // 클리어
                  $('#pwd_message').html("<b>비밀번호가 맞습니다.</b>"); // 레이어에 텍스트 출력
                  $('#name').prop("disabled", false);
                  $('#email').prop("disabled", false);
              }
          });
         
       	  // pwd_message 레이어 클리어
		  $('#name').keydown(function() {
              $('#pwd_message').text(''); // 클리어
          });

      });
	 
	 </script>
		
</head>

<body>
<form method="post" action="${contextPath}/Join">
<h1 style="text-align:center">회원 가입창</h1>
<table align="center" border="1" cellspacing="0" celpadding="0">
    <tr>
       <td width="100"><span align="right">아이디</span></td>
       <td width="400">
	       	<input type="text" name="id" id="t_id">
	       	<input type="button" value="중복확인" id="double" onclick="fn_process()">
	       	<br>
	       	<div id="message"></div>
    	</td>
    </tr>
    <tr>
        <td width="100"><span align="right">비밀번호</span></td>
        <td width="400"><input type="password"  name="pwd" id="pwd"></td>
    </tr>
    <tr>
        <td width="100"><span align="right">비밀번호확인</span></td>
        <td width="400"><input type="password"  name="pwd_confirm" id="pwd_confirm">
        				<div id="pwd_message"></div>
        </td>
    </tr>
    <tr>
        <td width="100"><span align="right">이름</span></td>
        <td width="400"><input type="text"  name="name" id="name"></td>
    </tr>
    <tr>
        <td width="100"><span align="right">이메일</span></td>
        <td width="400"><input type="text"  name="email" id="email"></td>
    </tr>
    <tr>
        <td width="400" colspan="2">
	       <input type="submit" value="가입하기">
	       <input type="reset" value="다시입력">
       </td>
    </tr>
</table>
</form>
</body>
</html>