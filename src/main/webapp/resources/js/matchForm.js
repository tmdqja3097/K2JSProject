	
var count=1;

	

	$("#file").on("click", ".remove", function() {

		$(this).parent().remove();

		count--;

	});

 

	$("#add").click(function() {

		if(count<6){

			$("#file").append('<div class="form-group"> <label for="file"> File :</label> <input type="file" class="form-control files" name="files"> <i class="glyphicon glyphicon-remove remove"></i> </div> ');

			count++;

		}else {

			alert("파일은 최대 5개 만 가능");

		}

	});



$("#btn").click(function() {

		//title, contents 데이터 유무 검증

		var title = $("#title").val();
		var date = $("#date").val();
		var time = $("#time").val();
		var gender=$("#gender").val();
		var stadiumName =$("#stadiumName").val();
		
		var ch1 = title !="";
		var ch2 = date  !="";
		var ch3 = time  !="";
		var ch4 = gender!="none";	
		var ch5 = true;
		var ch6 = stadiumName !="none";

		$(".files").each(function() {
			if($(this).val()==""){
				ch5 = false;
			}
		});
		
		
		if(ch1 && ch2 && ch3 && ch4 && ch5 && ch6){
			$("#frm").submit();
		}else {
			alert("필수 요소는 다 입력하세요");
		}
});

$("#contents").summernote({

	height: 300

});
