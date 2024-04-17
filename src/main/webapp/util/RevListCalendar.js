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
		    	start: rev.checkIn,
				end: rev.checkOut,
				backgroundColor: rev.backgroundColor,
				subTitle: rev.roomType // fullCalendar 엔 없는 확장된 속성
		        }
		        events.push(newEvent);
			}
			initializeCalendar(events);
		}else {
			console.log("예약 데이터 없음");
		}
	
	
	function initializeCalendar(events) {
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
	      	events: events,
			eventContent: function(info) {
				var content = '<b>' + info.event.title + '</b>';
				if (info.event.extendedProps.subTitle) {
			    	content += '<br>' + info.event.extendedProps.subTitle; // 서브 타이틀 추가 정보
			    }
				return { html: content }; 
			}
	    });
	    calendar.render();
	}
});

