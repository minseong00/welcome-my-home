<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Main</title>
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
        
	        <div class="rightside">
	            <div class="table-container">
	                <div>
	                    <jsp:include page="/admin/MemTable.jsp" flush="false"/>
	                </div>
	                <div>
	                    <jsp:include page="/admin/RevTable.jsp" flush="false"/>
	                </div>
	            </div>
	        </div>
   		</div>
	</div>
</body>
</html>
