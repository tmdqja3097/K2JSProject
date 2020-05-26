var count=1;

	

	$("#file").on("click", ".remove", function() {

		$(this).parent().remove();

		count--;

	});

 

	$("#add").click(function() {

		if(count<2){

			$("#file").append('<div class="form-group"> <label for="file"> File :</label> <input type="file" class="form-control files" name="files"> <i class="glyphicon glyphicon-remove remove"></i> </div> ');

			count++;

		}else {

			alert("파일은 1개만 가능");

		}

	});
	

$("#btn").click(function() {

		//title, contents 데이터 유무 검증

		var name = $("#name").val();
		var age = $("#age").val();
		var gender = $("#gender").val();
		var account=$("#account").val();
		var phone = $("#phone").val();
		var home = $("#home").val();
		var files = $("#files").val();
		
		var ch1 = name !="";
		var ch2 = age  !="";
		var ch3 = account  !="";
		var ch4 = gender !="none";	
		var ch5 = phone !="";
		var ch6 = home !="";
		var ch7 = files !="";
		
		
		if(ch1 && ch2 && ch3 && ch4 && ch5 && ch6 && ch7){
			$("#managerForm").submit();
		}else {
			alert("필수 요소는 다 입력하세요");
		}
});


