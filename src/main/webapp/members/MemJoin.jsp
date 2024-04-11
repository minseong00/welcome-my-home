<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemJoin : 회원가입 페이지</title>
	<script src="http://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		/* 아이디 중복확인 */
		function duplicate(){
			var _id = $("#t_id").val();
			
			$.ajax({
				type:"get",
				async:false,
				url:"http://localhost:9000/mini_project/Join",
				dataType:"text",
				data:{id:_id},
				
				success:function(data, textStatus){
					alert(data);	//usable : 사용가능 아이디일 경우
					
					if(data == "usable"){
						$("#message").text("사용 가능한 ID입니다.");
					}else{
						$("#message").text("중복된 ID입니다.");
					}
				},
				
				error:function(data, textStatus){
					alert("에러발생");
				
				},
				
				complete:function(data, textStatus){
					
				}
			});
		}	//duplicate() END
	</script>

<style type="text/css">
	html,body {
	  position: relative;
	  min-height: 100vh;
	  background-color: #E1E8EE;
	  display: flex;
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
	  
	  .join {
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
	      margin-top: 10px;
	      opacity: 1;
	      visibility: visible;
	      -webkit-transition: all .3s ease;
	      
	      .input{
	        border: 0;
	        outline: none;
	        box-shadow: none;
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

	<div class="form-structor">
		<div class="join">
	    	<h2 class="form-title" id="join">Join</h2>
	    <div class="form-holder">
  			<div class="input-with-button" colspan="2">
    		<input type="text" class="input" placeholder="Id" name="Id" style="width:58%;"/>
    		<input type="button" id="duplicate" value="Check" style="border-radius:10px; padding:3px;" onclick="duplicate()">
  		</div>
		</div>
		<div class="form-holder">
  			<input type="password" class="input" placeholder="Password" name="password" />
		</div>
		<div class="form-holder">
 			 <input type="text" class="input" placeholder="Password Check" name="Password Check" />
		</div>
		<div class="form-holder">
  			<input type="text" class="input" placeholder="name" name="name" />
  		</div>
		<div class="form-holder">
	   		 <input type="text" class="input" placeholder="phone" name="phone" />
		</div>
		<div class="form-holder">
  			<input type="text" class="input" placeholder="email" name="email" required="required"/>
		</div>
		<form action="/admin/AdminMain.jsp" method="post">
	    	</a><button class="submit-btn" >회원가입</button>
		</form>	
	  	</div>
	</div>

</body>
</html>