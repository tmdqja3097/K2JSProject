<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인 정보 수정 화면</title>
<c:import url="../template/boot.jsp"></c:import>
<style type="text/css">
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
</style>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<div class="container">
		<form action="./MemberUpdate" method="post">
			<c:if test="${member.loginmt ne 1 }">
				<div class="row">
					<span>이름 </span><input class="input_box" type="text" name="name"
						value="${member.name}" maxlength="20" required autofocus>
				</div>
				<br>
				<div class="row">
					<span>비밀번호 </span><input class="input_box" type="password"
						name="pw" value="${member.pw}" required>
				</div>
			</c:if>
			<br>
			<div class="row">
				<span>이메일 </span><input class="input_box" type="email" name="email"
					value="${member.email}" required>
			</div>
			<br>
			<div class="row">
				<span>핸드폰 </span><input class="input_box" type="text" name="phone"
					value="${member.phone}" required>
			</div>
			<br>
			<div class="row">
				<input id="update" type="submit" class="btn btn-primary input_box"
					value="수정완료" disabled="disabled">
			</div>
		</form>
	</div>
	<script type="text/javascript">
		var name = '${member.name}';
		var pw = '${member.pw}';
		var email = '${member.email}';
		var phone = '${member.phone}';

		$(".input_box")
				.keyup(
						function() {
							if ($(this).val() == name || $(this).val() == pw
									|| $(this).val() == email
									|| $(this).val() == phone) {
								$("#update").prop("disabled", "disabled");
							} else {
								$("#update").prop("disabled", "");
							}
						})
	</script>
</body>
</html>