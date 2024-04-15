<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div {
		border: 1px solid;
	}
	#container {
		width: 100%;
	    padding-right: 15px;
	    padding-left: 15px;
	    margin-right: auto;
	    margin-left: auto;
	    max-width: 1100px;
	}
	
	#leftDiv {
	    display: flex;
	    flex-direction: column; /* 내부 요소를 세로로 정렬합니다. */
	    flex: 0 0 calc(50% - 10px); /* 부모 컨테이너 너비의 60%에서 10px를 뺀 값으로 설정합니다. */
	    padding: 20px;
	    margin-right: 10px;
	}
	
	#rightDiv {
	    display: flex;
	    flex-direction: column; /* 내부 요소를 세로로 정렬합니다. */
	    flex: 1; /* rightDiv가 부모 컨테이너 내에서 적절한 공간을 차지할 수 있도록 설정합니다. */
	    padding: 20px;
	    box-sizing: border-box; /* 패딩을 요소의 크기에 포함시킵니다. */
	}
	.room_ {
		width: 200px;
		margin-left: 20px;
		align-items: right;
	}
	.lineDiv {
		flex: 1;
	    display: flex;
	    justify-content: flex-end; /* 내부 요소들 사이의 간격을 조절합니다. */
	    margin-bottom: 20px; /* 각 lineDiv 사이의 여백을 조절합니다. */
	    width: 100%;
	    height: 300px;
	}
	.leftTable {
		width:100%;
		text-align: center;
	}
	.rightTable {
		width: 100%;
		border-collapse: separate;
		border-spacing: 10px;
		padding: 10px; 
	}
	#price-range-slider {
		width: 140px;
		margin-left: 5px;
	}
	.filter {
		width: 150px;
	}
	.filter_select {
		width: 155px;
	}
	.headCount {
		width: 60px;
	}
	#headTd {
		display: flex; /* 요소들을 가로로 나열 */
	  	align-items: center; /* 요소들을 세로 중앙 정렬 */
	}
	#headTd button {
		margin: 0 5px 0 5px; 
	}
	#headCount {
		width: 50px;
	}
	.rev_hr {
    display: block;
    height: 1px;
    border: 0;
    border-top: 1px solid #ccc;
    margin: 1em 0;
    padding: 0;
  }
</style>
<script>

</script>
</head>
<body>
	<div id="container"> <!-- 메인 컨테이너 -->
		<jsp:include page="/include/Header.jsp" flush="false"/>
		
		<div class="row justify-content-center">
		<div id="leftDiv"> <!-- 왼쪽 컨테이너 -->
			<table class="leftTable">
				<tr>
					<td>
						주문자 아이디 <br>
						<input type="text" name="memId" readonly>
					</td>
					<td>
						주문자 이름 <br>
						<input type="text" name="memName">
					</td>
				</tr>
				<tr><td><hr></td></tr>
				<tr>
					<td>
						주문자 이메일 <br>
						<input type="text" name="memEmail">
					</td>
					<td>
						주문자 전화번호 <br>
						<input type="text" name="memCall">
					</td>
				</tr>
				
			</table>
		</div>
			
		<div id="rightDiv"> <!-- 오른쪽 컨테이너 -->
			<form>
				<table class="rightTable">
						<tr>
							<td>
								객실 : 
								<input type="text" name="checkIn" class="filter">
								<hr class="rev_hr">
							</td>
						</tr>
						<tr>
							<td>
								이용 날짜 : 
								<input type="text" name="checkOut" class="filter">
								<hr class="rev_hr">
							</td>
						</tr>
						<tr>
							<td>
								인원수 : 
								<input type="text" name="headCount" value="" id="headCount" readonly>
								<hr class="rev_hr">
							</td>
						</tr>
						<tr>
							<td>
								총 요금 : 
								<input type="text" name="priceMax" class="price" value="총요금" readonly>
								<hr class="rev_hr">
							</td>
						</tr>
						<tr>
							<td align="right">
								<button>돌아가기</button>
								<input type="submit" value="결제" />
							</td>
						</tr>
				</table>
			</form>
			
			</div>
		</div>
	</div>
</body>
</html>