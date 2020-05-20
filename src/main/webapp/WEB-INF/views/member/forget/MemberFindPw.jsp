<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 비밀번호 찾기</title>
<script src="https://kit.fontawesome.com/1a953cf392.js"
	crossorigin="anonymous"></script>
<style type="text/css">
body {
	padding: 0 6%;
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
		<h1>K2JS 회원 비밀번호 찾기</h1>
	</div>
	<br>
	<div class="container">
		<div class="row">
			<label for="eamil">회원 아이디</label> <input class="input_box"
				type="text" name="id" id="id"> <br> <label for="name">회원
				이름</label> <input class="input_box" type="text" id="name" name="name"
				title="name"> <br> <label for="phone">회원 핸드폰번호</label>
			<input class="input_box" type="tel" name="phone" id="phone"
				title="phone"><br><br> <input class="input_box" type="submit" id="btn">
		</div>
	</div>
	<script type="text/javascript"
		src="http://code.jquery.com/jquery-3.4.1.js"></script>
	<script type="text/javascript">
		$("#btn").click(function() {
			var id = $("#id").val();
			var phone = $("#phone").val();
			var name = $("#name").val();
			$.ajax({
				type : 'post',
				url : './MemberFindPw',
				data : {
					id : id,
					name : name,
					phone : phone
				},
				success : function(result) {
					result = result.trim();
					if (result != "") {
						alert('임시비밀번호는  "' + result + '" 입니다.');
						alert("임시비밀번호 발급 받으신 후 반드시 비밀번호를 변경하십시오.");
					} else if (result == "") {
						alert("회원정보가 잘못입력되었습니다. 다시한번 확인해주세요");
					}
					window.close();
				}
			})
		})
	</script>
</body>
</html>