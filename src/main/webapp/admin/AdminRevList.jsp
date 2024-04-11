<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 예약 관리 눌렀을 때 나오는 테이블</title>
<style type="text/css">
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
	
</style>
</head>
<body>
<div class="container">
	<jsp:include page="/include/Header.jsp" flush="false"/>
	<div class="row justify-content-center">
		<div class="col-md-4"> 
			<jsp:include page="/include/adminSidebar.jsp" flush="false"/>
		</div>
		
		
	</div>

</div>
</body>
</html>