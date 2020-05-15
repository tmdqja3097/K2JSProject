<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../resources/js/kakao.js"></script>
<c:import url="../template/boot.jsp" />
</head>
<body>
	<c:import url="../template/header.jsp" />
	<div class="container pos">
		<div class="row">
			<form method="post" action="./MemberLogin">
				<div>
					<label>아이디 또는 이메일</label> <br> <input type="text" name="id"
						autofocus maxlength="30" required id="id_userId">
				</div>

				<div>
					<label>비밀번호</label> <br> <input type="password" name="pw"
						autocomplete="current-password" required id="id_userPassword">
				</div>

				<input type="submit" value="로그인">
			</form>
			<a id="kakao-login-btn"></a> <a
				href="http://developers.kakao.com/logout"></a> <br> <span><a
				href="">비밀번호가 생각나지 않나요?</a></span> <br> <span><a href="">아이디가
					없다면 여기에서 가입하세요</a></span>
		</div>
	</div>

	<script type="text/javascript">
		Kakao.init('c5126e0fcae8eba0e1ed7a9c58dc7812');
		Kakao.Auth.createLoginButton({
			container : '#kakao-login-btn',
			success : function(authObj) {
				Kakao.API.request({
					url : '/v2/user/me',
					success : function(res) {
						var gender = 1;
						if (res.kakao_account['gender'] == 'male') {
							gender = 0;
						}
						$.ajax({
							type : "post",
							url : "./MemberKakaoLogin",
							data : {
								id : res.kakao_account['email'],
								name : res.kakao_account.profile['nickname'],
								birth1 : res.kakao_account['birthday'],
								gender : gender
							},
							success : function(result) {
								if(result != null) {
									location.href="../";
								} else {
									alert("로그인 실패");
									location.href="./MemberLogin";
								}
							}
						});
					}
				});
			},
			fail : function(err) {
				alert(JSON.stringify(err));
			}
		});
	</script>
</body>
</html>