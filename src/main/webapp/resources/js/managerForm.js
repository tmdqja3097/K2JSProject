

$("#btn").click(function() {

		//title, contents 데이터 유무 검증

		var name = $("#name").val();
		var age = $("#age").val();
		var gender = $("#gender").val();
		var phone = $("#phone").val();
		var home = $("#home").val();
		var file = $("#file").val();
		
		var ch1 = name !="";
		var ch2 = age  !="";
		var ch3 = gender !="none";	
		var ch4 = phone !="";
		var ch5 = home !="";
		var ch6 = file !="";
		
		
		if(ch1 && ch2 && ch4 && ch5 && ch6 ){
			$("#managerForm").submit();
		}else {
			alert("필수 요소는 다 입력하세요");
		}
});


