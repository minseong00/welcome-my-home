<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 객실등록</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
<!-- css 적용 -->
<link rel="stylesheet" href="${contextPath }/style/css/flaticon.css">
<link rel="stylesheet" href="${contextPath }/style/css/style.css">

<style type="text/css">
   body {
        font-family: 'Roboto', sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f5f5f5;
    }
    .container {
        display: flex;
        flex-direction: column;
        align-items: center;
        width: 100%;
        max-width: 1100px;
        margin: 0 auto;
        padding: 20px 15px;
        box-sizing: border-box;
    }
    .row {
        display: flex;
            flex-wrap: nowrap;
    flex-direction: row;
    justify-content: center;
    }
    #leftDiv, #rightDiv {
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        margin: 0 10px;
        padding: 20px;
    }
    #leftDiv {
        width: 35%;
    }
    #rightDiv {
        width: 35%;
       
    }
    .table-container {
        margin-bottom: 20px;
    }
    table {
        width: 100%;
    }
    td {
        padding: 10px;
    }
    hr {
        border: none;
        border-top: 1px solid #ccc;
        margin-top: 20px ;
    }
    input[type="text"], button {
        width: calc(100% - 22px);
        padding: 5px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    input[type="text"] {
        margin-bottom: 4px;
    }
    .payment-btn {
        background-color: #00BFFF;
        color: #fff;
        font-weight: bold;
        cursor: pointer;
    }
    .return:hover {
        background-color: #0080FF;
    }
       
    .terms-label {
        display: flex; /* 플렉스 박스 사용 */
        align-items: center; /* 수직 정렬 */
        font-size: 13px; /* 폰트 사이즈 조절 */
    
    }
    .terms-label > span {
        flex: 1; /* 유동적인 공간을 활용하여 약관 텍스트를 확장 */
        font-size: 15px; /* 원하는 크기로 설정 */
    }
    
.btn_css {
-webkit-border-radius: 13px;
-moz-border-radius: 13px;
border-radius: 13px;

border : 0px;
color: #FFFFFF;
font-family: Arial;
font-size: 15px;
font-weight: 100;
padding: 10px;
background-color: #8D703B;
text-decoration: none;
display: inline-block;
cursor: pointer;
text-align: center;
}

.btn_css:hover {
background-color: #73685d;
}

.rightside{
            display: flex;
            flex-direction: column;
            flex-grow: 1;
            
        }
    
    .td-special {
        width: 300px; /* 특정 셀의 너비를 200px로 설정 */
        
    }


#headCount {
    width: 50px;
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
                    window.location.replace("${contextPath}/admin/RoomList?type=admin");
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
        <div class="row">   
            <div class="col-md-3"  style="margin-left: 100px;">  
                <jsp:include page="/include/AdminSidebar.jsp" flush="false"/>
            </div>
            <div id="leftDiv">
                <div class="table-container">
                    <h3 style="font-weight: bold; margin-bottom: 30px;margin-top: 30px; margin-left:80px;">객실 등록</h3>
                    <form id="roomAdd">
                        <table id="payment-table">
                            <!-- 객실 정보 입력 -->
                            <tr>
                                <td>
                                    <label>객실 이름</label>
                                    <input type="text" name="roomName">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>객실 타입</label>
                                    <select name="roomType" required>
                                        <option selected="selected">타입 선택</option>
                                        <option value="Superior">슈페리어 룸</option>
                                        <option value="Deluxe">디럭스 룸</option>
                                        <option value="GrandDeluxe">그랜드 디럭스 룸</option>
                                        <option value="JuniorSuite">주니어 스위트 룸</option>
                                        <option value="CornerSuite">코너스 스위트 룸</option>
                                        <option value="SuperiorSuite">슈페리어 스위트 룸</option>
                                        <option value="RoyalSuite">로열 스위트 룸</option>
                                        <option value="PresidentialSuite">프레지덴셜 스위트 룸</option>
                                        <option value="Connecting">커넥팅 룸</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>수용 인원</label>
                                    <select name="headCount" required="required">
                                        <option selected="selected">인원 선택</option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                        <option value="6">6</option>
                                        <option value="7">7</option>
                                        <option value="8">8</option>
                                        <option value="9">9</option>
                                        <option value="10">10</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>객실 가격</label>
                                    <input class="roomCost" type="text" name="roomCost">원
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label  style="display: block;">객실 설명</label>
                                    <textarea  name="detailText" style="width:264px; height:180px; "></textarea>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
            <div id="rightDiv" >
                <div class="table-container">
                    <!-- 사진 업로드 입력 -->
                    <form id="roomAdd">
                        <table id="payment-table">
                            <tr>
                                <td>
                                    <label>사진 업로드</label>
                                    <input type="file" name="file" onchange="addFile(this);" multiple="multiple" />
                                    <div class="file-list"></div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>객실 설명 사진</label>
                                    <input type="file" name="infoImg">
                                </td>
                            </tr>
                        </table>
                        <div style="text-align:center;">
                        <button class="btn_css" type="submit" style="width:50%;">등록</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>