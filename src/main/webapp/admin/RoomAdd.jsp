<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin Room Add</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />

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
		width: calc(100vh - 235px);
	}
	.insert {
	    padding: 20px 30px;
	    display: block;
	    width: 600px;
	    margin: 5vh auto;
	    border: 1px solid #dbdbdb;
	    box-sizing: border-box;
	}
	.insert .file-list {
	    height: 150px;attach_file
	    overflow: auto;
	    border: 1px solid #989898;
	    padding: 10px;
	}
	.insert .file-list .filebox p {
	    font-size: 14px;
	    margin-top: 10px;
	    display: inline-block;
	}
	.insert .file-list .filebox .delete i{
	    color: #ff5353;
	    margin-left: 5px;
	}
</style>
<script src="http://code.jquery.com/jquery-2.2.1.min.js"></script>
<script type="text/javascript" src="${contextPath }/util/fileUpload.js"></script>
<script type="text/javascript">
	$(function(){
		$("#roomAdd").submit(function(event){
			event.preventDefault();
		    // 폼데이터 담기
		    var form = document.querySelector("form");
		    var formData = new FormData(form);
		    for (var i = 0; i < filesArr.length; i++) {
		        // 삭제되지 않은 파일만 폼데이터에 담기
		        if (!filesArr[i].is_delete) {
		            formData.append("attach_file", filesArr[i]);
		        }
		    }
		
		    $.ajax({
		        method: 'POST',
		        url: "<c:url value='/RoomAdd' />",
		        data: formData,
		        async: false,
		        enctype:'multipart/form-data',
		        processData: false,
				contentType: false,
		        success: function () {
		            alert("파일업로드 성공");
		        },
		        error: function (data, desc, err) {
		            alert('에러가 발생 하였습니다.');
		            return;
		        }
			});
		    
	    });
	});
	</script>
</head>
<body>
	<div class="container">
		<jsp:include page="/include/Header.jsp" flush="false"/>
		
		<div class="row justify-content-center">
		
			<div class="col-md-4"> 
				<jsp:include page="/include/adminSidebar.jsp" flush="false"/>
			</div>
		
			<div class="rightside">
				<div>
					<h4>객실 등록</h4>
					<form id="roomAdd">
						<div>
							<label>객실 이름</label>
							<input type="text" name="roomName">
						</div>
						<div>
							<label>객실 타입</label>
							<select name="roomType" required="required">
								<option selected="selected">타입 선택</option>
								<option value="singleRoom">싱글 룸</option>
								<option value="twinRoom">트윈 룸</option>
								<option value="DoubleRoom">더블 룸</option>
								<option value="TripleRoom">트리플 룸</option>
							</select>
						</div>
						<div>
							<label>수용 인원</label>
							<select name="headCount" required="required">
								<option selected="selected">인원 선택</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								
							</select>
						</div>
						<div>
							<label>객실 가격</label>
							<input class="roomCost" type="text" name="roomCost">원
						</div>
						<div>
							<label>객실 설명</label>
							<textarea rows="8" name = "detailText"></textarea>
						</div>
						<div class="insert">
							<label>사진 업로드</label>
							<input type="file" name="file" onchange="addFile(this);" multiple="multiple" />
							<div class="file-list"></div>
						</div>
						<div>
							<label>객실 설명 사진</label>
							<input type="file" name="infoImg">
						</div>
						<button type="submit" >등록</button>
					</form>
				</div>
			</div>
		</div>
	
	</div>
</body>
</html>