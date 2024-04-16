/**
 * RevCalendar 예약 목록 출력 캘린더
 */

$(function() {
	var events = [];
	
		if(revList != null) {
			console.log("예약 데이터 받기 완료");
			for(var rev of revList) {
				var newEvent = {
					title: rev.roomName,
					start: rev.bookCheck,
					end: rev.bookCheckOut,
					backgroundColor: rev.backgroundColor
				}
			events.push(newEvent);
			}
		}else {
			console.log("예약 데이터 없음");
		}
		initializeCalendar();
	
	
	function initializeCalendar() {
	    var calendarEl = document.getElementById('calendar');
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	    	locale: 'ko',
	    	height: '1000px',
	    	headerToolbar: {
	    		left: 'today',
	    		center: 'title',
	    		right: 'prev,next'
	    	},
	      	initialView: 'dayGridMonth',
	      	nowIndicator: true,
	      	dayMaxEvents: true,
	      	editable: false,
	      	events: events
	    });
	    calendar.render();
	}

});

