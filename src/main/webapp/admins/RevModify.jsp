<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 예약목록 수정</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />

<style type="text/css">
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
	body{
	  padding: 1.5em; /* 전체 바디에 패딩 추가 */
		line-height: normal;
		display: flex;
		
	}
	.rightside{
		display: flex;
		flex-direction: column;
		flex-grow: 1;
		margin-left: 0.5rem;
		width: calc(100vh - 235px);
		table {
  border: 1px #a39485 solid; /* 테이블의 외곽선 스타일 */
  font-size: .9em; /* 테이블 내의 폰트 크기 */
  box-shadow: 0 2px 5px rgba(0,0,0,.25); /* 테이블에 그림자 효과 */
  width: 100%; /* 테이블 너비를 전체로 설정 */
  border-collapse: collapse; /* 테이블의 보더 라인을 하나로 합침 */
  border-radius: 5px; /* 테이블 모서리를 둥글게 처리 */
  overflow: hidden; /* 내용이 넘칠 경우 숨김 처리 */
}

/* 테이블 헤더 스타일 */
th {
  text-align: left; /* 테이블 헤더의 텍스트 정렬을 왼쪽으로 설정 */
}

/* 테이블 헤드 영역 스타일 */
thead {
 
  color: #fff; /* 텍스트 색상을 흰색으로 설정 */
  background: #73685d; /* 배경색 설정 */
}

/* 테이블 셀 스타일 */
td, th {
  padding: 1em .5em; /* 셀 패딩 설정 */
  vertical-align: middle; /* 셀의 수직 정렬을 중앙으로 설정 */
}

/* 테이블 데이터 셀 스타일 */
td {
  border-bottom: 1px solid rgba(0,0,0,.1); /* 셀 하단에 가는 선 추가 */
  background: #fff; /* 배경색 흰색 설정 */
}



/* 반응형 디자인 설정: 화면 크기 768px 이하일 때 적용 */
@media all and (max-width: 768px) {
  /* 테이블과 테이블 요소들을 블록 요소로 변경하여 각 요소를 독립적으로 스크롤 가능하게 설정 */
  table, thead, tbody, th, td, tr {
    display: block;
  }
  
  /* 헤더 텍스트 정렬 변경 */
  th {
    text-align: right;
  }
  
  /* 테이블 스타일 재정의 */
  table {
    position: relative;
    padding-bottom: 0;
    border: none;
    box-shadow: 0 0 10px rgba(0,0,0,.2);
  }
  
  /* 헤드 부분을 왼쪽에 고정하여 스크롤 시 보이게 함 */
  thead {
    float: left;
    white-space: nowrap;
  }
  
  /* 바디 부분을 수평 스크롤 가능하게 설정 */
  tbody {
    overflow-x: auto;
    overflow-y: hidden;
    position: relative;
    white-space: nowrap;
  }
  
  /* 행들을 인라인 블록으로 표시 */
  tr {
    display: inline-block;
    vertical-align: top;
  }
  
  /* 헤더 섹션의 보더 설정 */
  th {
    border-bottom: 1px solid #a39485;
  }
  
  /* 데이터 셀의 보더 설정 */
  td {
    border-bottom: 1px solid #e5
    }
	}
	
</style>
<script src="http://code.jquery.com/jquery-2.2.1.min.js"></script>
</head>
<body style="background-color: #f5f5f5;">
	<div class="container">
		<jsp:include page="/include/Header.jsp" flush="false"/>
		
		<div class="row justify-content-center">
		
			<div class="col-md-4"> 
				<jsp:include page="/include/AdminSidebar.jsp" flush="false"/>
			</div>
		<form>
			<div class="rightside">
				<!-- 예약 수정 화면 -->
				<h3 style="font-weight: bold">관리자 예약 수정</h3>
				<table summary="관리자 예약 수정" border="1">
				
			<thead>
				<tr>
				<th>예약 번호</th>
				<th>아이디</th>
				<th>체크인</th>
				<th>체크아웃</th>
				<th>인원 수</th>
				<th>객실이름</th>
				<th>객실타입</th>
				<th>금액</th>
				<th>예약일</th>
				</tr>
			</thead>
			<tbody>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			</tbody>
				</table>		
			</div>
			<div align="right">
								<button type="submit" class="sky-blue-button">수정</button>
								<button class="sky-blue-button"
									onclick="location.href='<c:url value="/abmin/RoomDelete?roomNo=${RevVO.RevNo }" /> '">삭제</button>
							</div>
			</form>
		</div>
	
	</div>
</body>
</html>