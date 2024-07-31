<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>객실예약</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- css 적용 -->
<link rel="stylesheet" href="${contextPath }/style/css/flaticon.css">
<link rel="stylesheet" href="${contextPath }/style/css/style.css">
<!-- 캘린더 import -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script>
    const servletUrl = "${contextPath}/RevInsert";
    const roomNo = ${roomVO.roomNo};

    $(function() {
        // 날짜 선택 시 다이나믹 프라이싱 적용
        $('input[name="checkDate"]').daterangepicker({
            locale: {
                format: 'YYYY-MM-DD'
            }
        }, function(start, end, label) {
            updatePrice();
        });

        // 인원 수 변경 시 다이나믹 프라이싱 적용
        $('#headCount').on('change', function() {
            updatePrice();
        });

        function updatePrice() {
            const checkIn = $('input[name="checkDate"]').data('daterangepicker').startDate.format('YYYY-MM-DD');
            const checkOut = $('input[name="checkDate"]').data('daterangepicker').endDate.format('YYYY-MM-DD');
            const headCount = $('#headCount').val();

            $.ajax({
                type: "GET",
                url: servletUrl,
                data: {
                    action: "calculatePrice",
                    roomNo: roomNo,
                    checkIn: checkIn,
                    checkOut: checkOut,
                    headCount: headCount
                },
                success: function(data) {
                    $('#price').val(data);
                },
                error: function(xhr, status, error) {
                    console.error("Error in dynamic pricing calculation: ", error);
                }
            });
        }
    });

    function upValueRoomRev() {
        let count = parseInt($('#headCount').val());
        $('#headCount').val(count + 1).trigger('change');
    }

    function downValueRoomRev() {
        let count = parseInt($('#headCount').val());
        if (count > 1) {
            $('#headCount').val(count - 1).trigger('change');
        }
    }
</script>
<style>
    form {
        display: flex;
        justify-content: space-between;
        width: 100%;
    }

    #container {
        width: 100%;
        padding-right: 15px;
        padding-left: 15px;
        margin-right: auto;
        margin-left: auto;
        max-width: 1100px;
    }

    #rightDiv {
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        margin: 0 10px;
        padding: 20px;
        align-items: flex-start; 
        width: 30%;
    }

    #leftDiv {
        display: flex;
        flex-direction: column;
        padding: 10px;
        margin-right: 10px;
        width: 70%;
    }

    .leftTable {
        width: 100%;
        margin-top: 0 auto;
        float: left;
    }

    .leftTable td {
        font-weight: bold;
        font-size: 15pt;
        color: #333;
    }

    .leftimg {
        float: left;
        width: auto;
        display: block;
        margin-left: auto;
        margin-right: right;
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
        display: flex;
        align-items: center;
    }

    #headTd button {
        margin: 0 5px 0 5px;
    }

    #headCount {
        width: 50px;
    }

    #price {
        width: 150px;
        border: none;
        outline: none;
        text-align: right;
        font-size: 15pt;
    }

    .sliderouter {
        margin: 20px auto;
        width: 700px;
        height: 500px;
    }

    .slider {
        width: 700px;
        overflow: hidden;
        position: relative;
    }

    .slider ul {
        list-style-type: none;
        margin: 0;
        padding: 0;
        display: flex;
    }

    .slider ul li {
        width: 100%;
    }

    .prev, .next {
        cursor: pointer;
        position: absolute;
        top: 50%;
        transform: translateY(-50%);
        transition: width 0.5s ease;
        background-color: rgba(0, 0, 0, 0.5);
        color: white;
        padding: 10px;
        z-index: 1;
    }

    .prev {
        left: 0;
    }

    .next {
        right: 0;
    }

    .visual_img {
        display: flex;
        margin: 0;
        padding: 0;
    }

    .image-container {
        overflow: hidden;
    }

    .image-container img {
        width: 100%;
        height: auto;
        display: block;
    }

    td {
        padding-top: 15px;
        padding-bottom: 15px;
    }

    .rightTable {
        width: 100%;
        border-collapse: collapse;
        border-radius: 10px;
        overflow: hidden;
        margin: 20px 0;
    }

    .rightTable td {
        padding: 15px;
        text-align: left;
        border-bottom: 1px solid #E6E6FA;
    }

    .rightTable tr:last-child td {
        border-bottom: none;
    }

    .btn_css {
        -webkit-border-radius: 13px;
        -moz-border-radius: 13px;
        border-radius: 13px;
        border: 0px;
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

    #downCount, #upCount {
        width: 30px;
        height: 30px;
        font-size: 20px;
        text-align: center;
        vertical-align: middle;
        line-height: 30px;
        margin: 0;
        padding: 0;
        border: 1px solid #ccc;
    }

    button {
        background-color: #decfa6;
        color: #fff;
        border-radius: 5px;
        cursor: pointer;
    }

    button:hover {
        background-color: #FFB6C1;
    }

    input[type="text"] {
        padding: 8px;
        border: 1px solid #FFDAB9;
        border-radius: 5px;
        width: 80%;
    }

    .daterangepicker .drp-calendar .calendar-table .table-condensed tbody tr .disabled {
        background-color: #f2f2f2;
        color: #ccc;
    }

    hr {
        border: none;
        border-top: 1px solid #ccc;
        width: 50%;
        margin: 10px auto;
    }
</style>
<script>
    const roomNo = ${roomVO.roomNo };

    $(function() {
        // 슬라이드 스크립트
        $(".visual_img li:last").prependTo(".visual_img");

        $(".next").click(function() {
            $(".visual_img").animate({
                marginLeft: "-700px"
            }, function() {
                $(".visual_img li:first").appendTo(".visual_img");
                $(".visual_img").css({
                    marginLeft: 0
                });
            });
        });

        $(".prev").click(function() {
            $(".visual_img").animate({
                marginLeft: "+1400px"
            }, function() {
                $(".visual_img li:last").prependTo(".visual_img");
                $(".visual_img").css({
                    marginLeft: 0
                });
            });
        });
        // 슬라이드 스크립트 끝
    });

    function fn_process() {
        $.ajax({
            type: "get",
            async: true,
            url: "<c:url value='/RevPayment' />",
            dataType: "text",
            data: { roomNo: roomNo },
            success: function(data, textStatus) {
                if (data == 'usable') {
                    swal.fire('예약할 수 있는 객실입니다.');
                    checkId = true;
                } else {
                    swal.fire('예약할 수 없는 객실입니다.');
                    checkId = false;
                    $('#submit').prop("disabled", true);
                }
            },
            error: function(data, textStatus) {
                alert("잘못 입력했습니다.");
            }
        });
    }

    window.onload = function() {
        var slider = document.querySelector('.visual_img');
        var liCount = slider.querySelectorAll('li').length;
        var sliderWidth = 700 * liCount;
        slider.style.width = sliderWidth + 'px';
    };
</script>
</head>

<body>
    <div id="container">
        <jsp:include page="/include/Header.jsp" flush="false" />

        <div class="row justify-content-center" style="margin-bottom: 50px;">
            <form action="${contextPath }/RevPayment" method="post">
                <input type="hidden" name="roomNo" value="${roomVO.roomNo }" />

                <div id="leftDiv">
                    <div class="sliderouter">
                        <div class="slider">
                            <div class="prev">&lt;</div>
                            <ul class="visual_img">
                                <c:if test="${not empty imgVO}">
                                    <c:if test="${not empty imgVO.img1}">
                                        <li class="image-container"><img src="${contextPath}/data/${imgVO.img1}" alt="Image 1" /></li>
                                    </c:if>
                                    <c:if test="${not empty imgVO.img2}">
                                        <li class="image-container"><img src="${contextPath}/data/${imgVO.img2}" alt="Image 2" /></li>
                                    </c:if>
                                    <c:if test="${not empty imgVO.img3}">
                                        <li class="image-container"><img src="${contextPath}/data/${imgVO.img3}" alt="Image 3" /></li>
                                    </c:if>
                                    <c:if test="${not empty imgVO.img4}">
                                        <li class="image-container"><img src="${contextPath}/data/${imgVO.img4}" alt="Image 4" /></li>
                                    </c:if>
                                    <c:if test="${not empty imgVO.img5}">
                                        <li class="image-container"><img src="${contextPath}/data/${imgVO.img5}" alt="Image 5" /></li>
                                    </c:if>
                                </c:if>
                            </ul>
                            <div class="next">&gt;</div>
                        </div>
                    </div>
                    <table class="leftTable" style="text-align: center;">
                        <colgroup>
                            <col width="30%">
                            <col width="70%">
                        </colgroup>
                        <tr>
                            <td>
                                <span style="font-size: 18pt">${roomVO.roomName }</span><hr>
                                <span style="font-size: 10pt;">KRW</span>
                                <span>${roomVO.roomCost }~</span><hr>
                            </td>
                            <td rowspan="">
                                <img src="${contextPath}/data/${imgVO.infoImg}" alt="image" style="width:100%;">
                            </td>
                        </tr>
                    </table>
                </div>

                <div id="rightDiv">
                    <table class="rightTable">
                        <tr>
                            <td>
                                <strong>객실</strong><br>
                                <input type="text" name="roomName" id="roomName" value="${roomVO.roomName }" readonly>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>예약 가능한 날짜</strong><br>
                                <input type="text" name="checkDate" id="roomRevDate" value="" required readonly>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>인원수</strong><br>
                                <button type="button" id="downCount" onclick="downValueRoomRev()">-</button>
                                <input type="text" name="headCount" id="headCount" value="1" readonly required>
                                <button type="button" id="upCount" onclick="upValueRoomRev()">+</button>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <strong>총 가격</strong><br>
                                <input type="text" name="price" id="price" value="${roomVO.roomCost }" readonly>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <input class="btn_css" type="submit" value="예약하기">
                            </td>
                        </tr>
                    </table>
                </div>
            </form>
        </div>
    </div>
    <jsp:include page="/include/Footer.jsp" flush="false" />
</body>
</html>
