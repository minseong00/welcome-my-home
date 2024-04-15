/**
 * RevCalendar 예약 목록 캘린더
 */
var events = [];

$(function() {
	var revList;
	var roomNames;
	
	$.get(servletUrl, function(data) {
		revList = data.revList;
		roomNames = data.roomNames;
		if(revList != null) {
			console.log("예약 데이터 받기 완료");
			for(var rev of revList) {
			var checkIn;
			var checkOut;
			var roomName;
			roomName = searchRoomName(roomNames, rev);
			var newEvent = {
				title: roomName,
				start: rev.bookCheck,
				end: rev.bookCheckOut
			}
			
			events.push(newEvent);
		}
		}else {
			console.log("예약 데이터 없음");
		}

	});
	
});


function searchRoomName(roomNames, rev) {
	var name;
	for(var room of roomNames) {
		if(rev.roomNo == room.roomNo) {
			name = room.roomName;
			return name;
		}
	}
}