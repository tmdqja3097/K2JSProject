$("#btn").click(function() {

	// title, contents 데이터 유무 검증

	var name = $("#name").val();
	var address = $("#address").val();
	var location_k = $("#location_k").val();
	var location_w = $("#location_w").val();
	var stadiumSize = $("#stadiumSize").val();

	var ch1 = name != "";
	var ch2 = address != "";
	var ch3 = location_k != "";
	var ch4 = location_w != "";
	var ch5 = stadiumSize != "";
	

	if (ch1 && ch2 && ch3 && ch4 && ch5 ) {

		$("#frm").submit();

	} else {
		alert("필수 요소는 다 입력하세요");

	}

});

$("#info").summernote({

	height : 300

});
