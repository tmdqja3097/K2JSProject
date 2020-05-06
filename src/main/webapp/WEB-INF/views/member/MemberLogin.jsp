<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp" />
</head>
<body>
	<c:import url="../template/header.jsp" />
	<div class="container pos">
		<div class="row">
			<form method="post" action="./MemberLogin">
				<div>
					<label>아이디 또는 이메일</label> <br> <input type="text"
						name="id" autofocus maxlength="30" required id="id_userId">
				</div>
				<div>
					<label>비밀번호</label> <br>
					<input type="password" name="pw"
						autocomplete="current-password" required id="id_userPassword">
				</div>
				<input type="submit" value="로그인">
			</form>

			<span><a href="">비밀번호가 생각나지 않나요?</a></span> <br> <span><a
				href="">아이디가 없다면 여기에서 가입하세요</a></span>
		</div>
	</div>
</body>
</html>