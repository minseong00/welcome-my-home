/**
 * RevCalendar 예약 목록 출력 캘린더
 */
function searchRoomName(roomNames, rev) {
	var name;
	for(var room of roomNames) {
		if(rev.roomNo == room.roomNo) {
			name = room.roomName;
			return name;
		}
	}
}

$(function() {
	var events = [];
	var revList;
	var roomNames;	
	
	$.get(servletUrl, function(data) {
		revList = data.revList;
		roomNames = data.roomNames;
		if(revList != null) {
			console.log("예약 데이터 받기 완료");
			for(var rev of revList) {
			var roomName;
			roomName = searchRoomName(roomNames, rev);
			var newEvent = {
				title: roomName,
				start: rev.checkIn,
				end: rev.checkOut,
				backgroundColor: rev.backgroundColor
			}
			
			events.push(newEvent);
		}
		}else {
			console.log("예약 데이터 없음");
		}
		initializeCalendar();
	});
	
	
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

