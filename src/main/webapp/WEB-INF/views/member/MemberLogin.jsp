<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
<script src="../resources/js/kakao.js"></script>
<c:import url="../template/boot.jsp" />
<style>
body {
	padding: 0 38%;
	box-sizing: border-box;
}

.container {
	width: 420px;
	margin-top: 10px;
}

.input_box {
	border-radius: 10px;
	width: 420px;
	height: 50px;
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

.chbox {
	display: inline-block;
}

.kabtn {
	vertical-align: center;
}

#kakao-login-btn {
	width: 420px;
	height: 50px;
}

#logo {
	position: relative;
	box-sizing: border-box;
	width: 240px;
	height: 60px;
	margin-top: 20px;
	vertical-align: middle;
	text-align: center;
}

#logo>a>img {
	position: absolute;
	width: 100%;
	height: 100%;
	text-align: center;
}
</style>
</head>
<body>
	<div id="logo">
		<a href="${pageContext.request.contextPath}"><img
			src="../resources/images/k2js_logo2.png" style="width:200px; height: 200px;"></a>
	</div>
	<div style="height: 200px;"></div>
	<div class="container">
		<div class="row">
			<form method="post" action="./MemberLogin">
				<input type="text" hidden="hidden" name="Referer" value="${Referer}">
				<div>
					<label>아이디 또는 이메일</label> <br> <input type="text" name="id"
						autofocus maxlength="30" required id="id_userId" class="input_box"
						value="${cookie.cId.value}">
				</div>

				<div>
					<label>비밀번호</label> <br> <input type="password" name="pw"
						class="input_box" autocomplete="current-password" required
						id="id_userPassword">
				</div>
				<label>아이디 기억하기 </label>
				<c:if test="${empty cookie.cId.value}">
					<input type="checkbox" name="chbox" class="chbox">
					<br>
				</c:if>
				<c:if test="${not empty cookie.cId.value}">
					<input type="checkbox" name="chbox" checked="checked" class="chbox">
					<br>
				</c:if>
				<input type="submit" value="일반 로그인" id="loginbtn"
					class="btn btn-primary input_box">
			</form>

			<br>
			<div class="input_box kabtn">
				<a id="kakao-login-btn"></a>
			</div>
			<br>
			<div class="row"
				style="text-align: center; padding-top: 10px; border-top: 0.2px solid gray;">
				<a href="" id="findId">아이디가 생각나지 않나요?</a> <br> <br> <a
					href="" id="findPw">비밀번호가 생각나지 않나요?</a> <br> <br> <span><a
					href="./MemberNew">아이디가 없다면 여기에서 가입하세요</a></span>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		var Referer = '${Referer}';
		$("#findId").click(
				function() {
					open("./forget/MemberFindId", "_blank",
							"width=500, height=600", true);
				})
		$("#findPw").click(
				function() {
					open("./forget/MemberFindPw", "_blank",
							"width=500, height=600", true);
				})
		Kakao.init('c5126e0fcae8eba0e1ed7a9c58dc7812');
		Kakao.Auth.createLoginButton({
			container : '#kakao-login-btn',
			success : function(authObj) {
				Kakao.API.request({
					url : '/v2/user/me',
					success : function(res) {
						var gender = 2;
						if (res.kakao_account['gender'] == 'male') {
							gender = 1;
						}
						$.ajax({
							type : "post",
							url : "./MemberKakaoLogin",
							data : {
								id : res.kakao_account['email'],
								name : res.kakao_account.profile['nickname'],
								gender : gender
							},
							success : function(result) {
								result = result.trim();
								if (result != null && result != 'newMember') {
									location.href = Referer;
								} else if (result == 'newMember') {
									location.href = "./MemberNewKakao";
								}
							}
						});
					}
				});
			},
			fail : function(err) {
			}
		});
	</script>
</body>
</html>