/**
 * 인원수의 - + 버튼으로 값을 상승, 하락 시키는 함수
 */
function downValueRoomRev() {
    updateHeadCount(-1); // 값 감소
}

function upValueRoomRev() {
	updateHeadCount(1); // 값 증가
}
	
function updateHeadCount(val) {
    // input 요소 가져오기
    var inputHeadCount = document.getElementById("headCount");
    var inputPrice = document.getElementById("price");
	
    // 현재 값 가져오기
    var currentHeadCount = parseInt(inputHeadCount.value);
	var currentPrice = parseInt(inputPrice.value);
	
	if(currentHeadCount + val >= 1 && (headCount + 2) > currentHeadCount) {
		inputHeadCount.value = currentHeadCount + val;
		if(headCount < currentPrice ) 
			inputPrice.value = currentPrice + 15000;
	}else {
		alert("더 이상 인원 추가가 불가능합니다.");
	}
}

function downValueFilter() {
    updateCountFilter(-1); // 값 감소
}

function upValueFilter() {
	updateCountFilter(1); // 값 증가
}
	
function updateCountFilter(val) {
    // input 요소 가져오기
    var inputHeadCount = document.getElementById("headCount");
    
    // 현재 값 가져오기
    var currentValue = parseInt(inputHeadCount.value);

	if(currentValue + val >= 1 && currentValue + val <= 10)
		inputHeadCount.value = currentValue + val;
		
}