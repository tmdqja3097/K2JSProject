<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 아이디 찾기</title>
<script src="https://kit.fontawesome.com/1a953cf392.js"
	crossorigin="anonymous"></script>
<style type="text/css">
body {
	padding : 0 6%;
	font-family: "나눔바른고딕", nanumbarungothic, se_NanumBarunGothic,
		AppleSDGothicNeo, sans-serif, simhei;
}

.input_box {
	border-radius: 10px;
	width: 420px;
	height: 30px;
}

.input_box:focus {
	border-color: #66b3ff;
	outline: none;
}

.input_box_sub {
	width: 140px;
	height: 50px;
	border-radius: 10px;
	vertical-align: middle;
}

.input_box_sub:focus {
	border-color: #66b3ff;
	outline: none;
}
#btn {
background-color: #337ab7;
}
</style>
</head>
<body>
	<div style="border-bottom: solid 0.3px gray;">
		<h1>K2JS 회원 아이디 찾기</h1>
	</div>
	<br>
	<div class="container">
		<label for="eamil">회원 이메일</label> 
			<div class="row">
			<input class="input_box" id="em" type="email" name="email"> <br> <label for="name">회원
				이름</label> <input class="input_box" id="nm" type="text" name="name"
				title="name"> <br>
			<br> <input type="submit" id="btn" class="input_box"
				value="아이디 찾기">
		</div>
	</div>
	<script type="text/javascript"
		src="http://code.jquery.com/jquery-3.4.1.js"></script>
	<script type="text/javascript">
		$("#btn").click(function() {
			var email = $("#em").val();
			var name = $("#nm").val();
			$.ajax({
				type : 'post',
				url : './MemberFindId',
				data : {
					email : email,
					name : name
				},
				success : function(result) {
					result = result.trim();
					if (result != "") {
						alert('회원님의 아이디는 "' + result + '" 입니다.');
					} else {
						alert("해당 정보의 회원이 없습니다.");
					}
					window.close();
					
				}
			})
		})
	</script>
</body>
</html>