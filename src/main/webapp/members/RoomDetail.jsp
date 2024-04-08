<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css">
</head>
<body>

<div id="price-range-slider"></div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script>
    $(document).ready(function() {
        $("#price-range-slider").slider({
            range: true,
            min: 0,
            max: 1000,
            values: [100, 800], // 초기값 설정
            slide: function(event, ui) {
                $("#price-range").text("$" + ui.values[0] + " - $" + ui.values[1]); // 가격 범위 업데이트
            }
        });
        $("#price-range").text("$" + $("#price-range-slider").slider("values", 0) +
            " - $" + $("#price-range-slider").slider("values", 1)); // 초기 가격 범위 표시
    });
</script>

<p>선택된 가격 범위: <span id="price-range"></span></p>

</body>
</html>