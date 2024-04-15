/**
 * RoomList Filter 전용 달력
 */

const locale = {
	        "format": "YYYY-MM-DD",
	        "separator": " ~ ",
	        "applyLabel": "확인",
	        "cancelLabel": "취소",
	        "fromLabel": "From",
	        "toLabel": "To",
			"currentText": "오늘",
	        "customRangeLabel": "Custom",
	        "weekLabel": "W",
	        "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
	        "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
	        "firstDay": 1,
	    }
$(function() {
	const startDate = moment().add(1, 'day');
	// 체크인 날짜 선택 달력
	$('#checkInDate').daterangepicker({
	    "locale": locale,
		"singleDatePicker": true,
        "startDate": startDate,
		"minDate": startDate,
    	"maxDate": "2024-12-31",
		"opens": "center",
		"showDropdowns": true,
		"drops": "down",
		"minYear": 2024, 
        "maxYear": 2024 
	}, function (start, end, label) {
	    console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
	});
	
	// 체크아웃 날짜 선택 달력
	$('#checkOutDate').daterangepicker({
	    "locale": locale,
		"singleDatePicker": true,
        "startDate": startDate,
		"minDate": startDate,
    	"maxDate": "2024-12-31",
		"opens": "center",
		"showDropdowns": true,
		"drops": "down",
		"minYear": 2024, 
        "maxYear": 2024 
	}, function (start, end, label) {
	    console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
	});
	

});
