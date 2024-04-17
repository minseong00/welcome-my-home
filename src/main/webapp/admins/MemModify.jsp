<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<c:set var="contextPath" value="${pageContext.request.contextPath}"  />  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>관리자 회원정보 수정</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- css 적용 -->
<link rel="stylesheet" href="${contextPath }/style/css/flaticon.css">
<link rel="stylesheet" href="${contextPath }/style/css/style.css">
<script type="text/javascript">
	$(function(){
		$('#MemModify').submit(function(event){
			event.preventDefault();
			var formData = $(this).serialize();
			$.ajax({
				type: "post",
				async: false,
				url: "<c:url value='/admin/MemModify'/>",
				data: formData,
				success:function(){
					alert("수정되었습니다.");
					window.location.replace("${contextPath}/admin/MemList");
				},
				error:function(){
					alert("수정이 취소되었습니다.");
				}
			});
			
		});
		
	});
	
	function deletedata(id){
		var confirmDelete = confirm("삭제 하시겠습니까?");
			   if(confirmDelete) {
					$.ajax({
						type:"post",
						url:"<c:url value='/admin/MemDelete'/>",
						data: {id : id},
						success:function(){
							alert("삭제 되었습니다.");
							window.location.replace("${contextPath}/admin/MemList");
						},
						error:function(data, status, error){
								console.error("회원정보 삭제 중 오류 발생 :", error);
								alert("회원정보 삭제 중 오류가 발생하였습니다.")
						}
					});
			   }
		   }

	
	/*회원정보수정 글자수 제한*/
	function chkword(obj, maxByte) {
	     var strValue = obj.value;
	     var strLen = strValue.length;
	     var totalByte = 0;
	     var len = 0;
	     var oneChar = "";
	     var str2 = "";
	
	     for (var i = 0; i < strLen; i++) {
	         oneChar = strValue.charAt(i);
	         if (escape(oneChar).length > 4) {
	             totalByte += 2; // 한글일 경우 2바이트 추가
	         } else {
	             totalByte++; // 영어 및 숫자는 1바이트 추가
	         }
	
	         // 각 글자에 대한 바이트 수를 확인하여 한글은 6글자, 영어와 숫자는 20글자로 제한
	         if (oneChar.match(/[가-힣]/)) { // 한글인 경우
	             if (totalByte <= 12) { // 6글자 이내인 경우
	                 len = i + 1;
	             }
	         } else { // 영어나 숫자인 경우
	             if (totalByte <= maxByte) { // 20글자 이내인 경우
	                 len = i + 1;
	             }
	         }
	     }
	
	     // 제한된 글자 수를 초과하는 경우 잘라내고 경고 메시지 표시
	     if (totalByte > maxByte) {
	         alert("입력 가능한 글자 수를 초과하였습니다.");
	         str2 = strValue.substr(0, len);
	         obj.value = str2;
	     }
	 }
	
	function updateValue(input, pw) {
        var hiddenInput = document.querySelector('input[name="pw"]');
        hiddenInput.value = input.value;
    }

</script>

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
		<form id ="MemModify">
			<h3 style=" margin-bottom: 60px; font-weight: bold; margin-left:105px;">관리자 회원 정보수정</h3>
		<table summary="관리자 회원 정보수정 " border="1" >
	
			
	<tbody>

		<tr>
			<td style="background-color:#73685d; color: #fff; width:200px; height: 70px; " >고객명</td>
			<td class="td-special"><input type="text"  name="name" value="<c:out value="${MemOne.memName}" />" onkeyup="chkword(this, 20)" required></td>
		</tr>
		<tr>
			<td style="background-color:#73685d; color: #fff; width:200px; height: 70px; " >아이디</td>
			<td><input type="text" name="id" value="<c:out value="${MemOne.memId }"/>" onkeyup="chkword(this, 20)" readonly ></td>
		</tr>
		<tr>
			<td style="background-color:#73685d; color: #fff; width:200px; height: 70px; " >비밀번호</td>
			<td>
				<input type ="password" name="pwview" value="******" onkeyup="chkword(this, 20)" onchange="updateValue(this, pw)" required>
				<input type ="hidden" name="pw" value="${MemOne.memPw}" >
			</td>
		</tr>
		<tr>
			<td style="background-color:#73685d; color: #fff; width:200px; height: 70px; " >이메일</td>
			<td><input type ="email" name="email" value="<c:out value="${MemOne.memEmail}"/>" onkeyup="chkword(this, 20)" required></td>
		</tr>
		<tr>
			<td style="background-color:#73685d; color: #fff; width:200px; height: 70px; " >전화번호</td>
			<td><input type ="text" name= "call" value="<c:out value="${MemOne.memCall}"/>" onkeyup="chkword(this, 20)" required></td>
		</tr>
		
		<tr>
		<td  style="height: 70px;"align="right"  colspan="2">
  		<button type="submit" class="sky-blue-button">수정 </button>
 		<button type="button" class="sky-blue-button" onclick="deletedata('${MemOne.memId}')">삭제</button>
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