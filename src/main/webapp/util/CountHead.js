/**
 * 인원수의 - + 버튼으로 값을 상승, 하락 시키는 함수
 */
function downValue() {
    updateHeadCount(-1); // 값 감소
}

function upValue() {
	updateHeadCount(1); // 값 증가
}
	
function updateHeadCount(val) {
    // input 요소 가져오기
    var inputElement = document.getElementById("headCount");
    
    // 현재 값 가져오기
    var currentValue = parseInt(inputElement.value);

	if(currentValue + val >= 1) {
		inputElement.value = currentValue + val;
		
		// 방의 인원을 초과할 경우 id = price 의 값을 인원 추가 가격에 맞게 더하기
	}
}