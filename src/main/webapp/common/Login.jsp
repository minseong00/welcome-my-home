<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="http://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		/** 로그인 확인 **/
		$(function() {
			// 로그인 데이터 전송
			 $("#login").submit(function(event){
	                event.preventDefault(); // 기본 이벤트 제거
	                var formData = $(this).serialize(); // 폼 데이터 가져오기
	                $.ajax({
	                    url: "<c:url value='/Login'/>",
	                    type: "post",
	                    data: formData,
	                    dataType: "text",
	                    success: function(data){
	                    	if(data == "adminLogin" || data =="memberLogin")
	                    		window.location.replace("${contextPath}/LoginCheck");
	                    	else if(data =="already"){
	                    		Swal.fire("이미 로그인 중입니다.");
	                    		window.location.replace("${contextPath}/LoginCheck");
	                    	} else {
	                    		Swal.fire("아이디 또는 비밀번호가 일치하지 않습니다.");
	                    	}
	                    },
	                    error: function(xhr, status, error){
	                        console.log("Error: " + error);
	                    }
	                });
	            });
		});
	</script>
	
<style type="text/css">

html,body {
  position: relative;
  align-items: center;
  justify-content: center;
  font-family: "Fira Sans", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

.form-structor {
  background-color: #222;
  border-radius: 15px;
  height: 550px;
  width: 350px;
  position: relative;
  overflow: hidden;
  
  &::after {
    content: '';
    opacity: .8;
    position: absolute;
    top: 0;right:0;bottom:0;left:0;
    background-repeat: no-repeat;
    background-position: center;
    background-size: cover;
    background-image: url('https://www.inspirekorea.com/sites/default/files/2023-10/content-pixie-VIh-B-bNZMc-unsplash%201.jpg');
  }
  
  .login {
    position: absolute;
    top: 50%;
    left: 50%;
    -webkit-transform: translate(-50%, -50%);
    width: 65%;
    z-index: 5;
    -webkit-transition: all .3s ease;
    
    .form-title {
      color: #fff;
      font-size: 1.7em;
      text-align: center;
      
      span {
        color: rgba(0,0,0,0.4);
        opacity: 0;
        visibility: hidden;
        -webkit-transition: all .3s ease;
      }
    }
    
    .form-holder {
      border-radius: 15px;
      background-color: #fff;
      overflow: hidden;
      margin-top: 50px;
      opacity: 1;
      visibility: visible;
      -webkit-transition: all .3s ease;
      
      .input {
        border: 0;
        outline: none;
        box-shadow: none;
        display: block;
        height: 30px;
        line-height: 30px;
        padding: 8px 15px;
        border-bottom: 1px solid #eee;
        width: 100%;
        font-size: 12px;
        
        &:last-child {
          border-bottom: 0;
        }
        &::-webkit-input-placeholder {
          color: rgba(0,0,0,0.4);
        }
      }
    }
    
    .submit-btn {
      background-color: rgba(0,0,0,0.4);
      color: rgba(256,256,256,0.7);
      border:0;
      border-radius: 15px;
      display: block;
      margin: 15px auto; 
      padding: 15px 45px;
      width: 100%;
      font-size: 13px;
      font-weight: bold;
      cursor: pointer;
      opacity: 1;
      visibility: visible;
      -webkit-transition: all .3s ease;
      
      &:hover {
        transition: all .3s ease;
        background-color: rgba(0,0,0,0.8);
      }
    }
  }
  }
}

</style>
</head>

<body>
	<div class="container">
	    <jsp:include page="/include/Header.jsp" flush="false"/>
		<div class="row justify-content-center">
		
	<form id="login">
	<div class="form-structor">
	  <div class="login">
	    <h2 class="form-title" id="login">로그인</h2>
	    <div class="form-holder">
	      <input type="text" class="input" placeholder="Id" name="id" />
	      <input type="password" class="input" placeholder="Password" name="pw" />
	    </div>
	    <input type="submit" value="로그인" class="submit-btn">
	  </div>
	</div>
	</form>
	</div>
	</div>
</body>
</html>