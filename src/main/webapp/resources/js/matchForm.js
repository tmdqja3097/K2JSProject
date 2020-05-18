
$("#btn").click(function() {

		//title, contents 데이터 유무 검증

		var title = $("#title").val();
		var date = $("#date").val();
		var time = $("#time").val();
		var gender=$("#gender").val();
		console.log(gender);
		var ch1 = title !="";
		var ch2 = date  !="";
		var ch3 = time  !="";
		var ch4 = gender!="none";
		
		if(ch1 && ch2 && ch3 && ch4){
			$("#frm").submit();
		}else {
			alert("필수 요소는 다 입력하세요");
		}
});

$("#contents").summernote({

	height: 300

});
