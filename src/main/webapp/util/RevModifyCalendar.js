/**
 * 관리자 RevModify 전용 캘린더
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
		"autoUpdateInput": false,
		"linkedCalendars": true,
		"drops": "down",
		"minYear": 2024, 
        "maxYear": 2024 
	}, function (start, end, label) {
	    console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
	});
	
	$('#checkInDate').on('apply.daterangepicker', function(ev, picker) {
        $(this).val(picker.startDate.format(picker.startDate.format('YYYY-MM-DD')));
		var checkInDate = picker.startDate; // 체크인 날짜 가져오기
        var nextDay = moment(checkInDate).add(1, 'days'); // 다음 날짜 계산

		$('#checkOutDate').daterangepicker({
	        "locale": locale,
	        "singleDatePicker": true,
	        "startDate": nextDay, // minDate를 다음 날짜로 설정
	        "minDate": nextDay,
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
	
	$('#checkInDate').on('cancel.daterangepicker', function(ev, picker) {
        $(this).val('');
    });
	
	// 체크아웃 날짜 선택 달력
	$('#checkOutDate').daterangepicker({
	    "locale": locale,
	    "endDate": startDate,
		"singleDatePicker": true,
        "startDate": startDate,
		"minDate": startDate,
    	"maxDate": "2024-12-31",
		"opens": "center",
		"showDropdowns": true,
		"autoUpdateInput": false,
		"linkedCalendars": true,
		"drops": "down",
		"minYear": 2024, 
        "maxYear": 2024 
	}, function (start, end, label) {
	    console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
	});
	
    $('#checkOutDate').on('apply.daterangepicker', function(ev, picker) {
		$(this).val(picker.startDate.format(picker.startDate.format('YYYY-MM-DD')));
	});

	$('#checkOutDate').on('cancel.daterangepicker', function(ev, picker) {
        $(this).val('');
    });
});
