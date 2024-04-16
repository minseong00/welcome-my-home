/**
 * RoomRev 예약 가능 날짜 선택 달력
 */
function checkDate(date, revList) {
	if(revList != null) {
		for(var revDate of revList) {
		var startDate = moment(revDate.checkIn);
		var endDate = moment(revDate.checkOut);
		var currentDate = moment(date);
		
		if(currentDate >= startDate && current <= endDate)
			return true;
		}
		return false;
	} else {
		console.log("예약 데이터 없음");
		return false;
	}
}

$(function() {
	var revList;
	const startDate = moment().add(1, 'day');
    const endDate = moment().add(2, 'days');
	
	if(servletUrl != null) {
		$.get(servletUrl, function(data) {
		revList = data.revList;
		
		initializeDateRangePicker(revList);
		});
	}
	// 범위 날짜 선택 달력
	function initializeDateRangePicker(revList) {
		$('#roomRevDate').daterangepicker({
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
			"opens": "cetner",
			"showDropdowns": true,
			"autoUpdateInput": false,
			"isInvalidDate": function(date) {
				return checkDate(date, revList);
			},
			"drops": "down",
			"minYear": 2024, 
	        "maxYear": 2024
		}, function (start, end, label) {
		    console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
		});
	}
	
	$('#roomRevDate').on('apply.daterangepicker', function(ev, picker) {
        $(this).val(picker.startDate.format(picker.startDate.format('YYYY-MM-DD') + ' ~ ' + picker.endDate.format('YYYY-MM-DD')));
    });
	
	$('#roomRevDate').on('cancel.daterangepicker', function(ev, picker) {
        $(this).val('');
    });
	
	
});