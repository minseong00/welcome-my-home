/**
 * 
 */
$(function() {
	var startDate = moment().add(1, 'day');
    var endDate = moment().add(2, 'days');
	$('#demo').daterangepicker({
	    "locale": {
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
	    },
        "startDate": startDate,
        "endDate": endDate,
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
	
	$('.filter').daterangepicker({
	    "locale": {
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
	    },
		"singleDatePicker": true,
        "startDate": startDate,
        "endDate": endDate,
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
