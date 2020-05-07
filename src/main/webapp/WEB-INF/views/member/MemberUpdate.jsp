<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<div class="container">
		<form action="./MemberUpdate" method="post">
			<div class="row">
				<span>성함 :</span><input type="text" name="name" value="${member.name}"
					maxlength="20" required autofocus>
			</div>
			<div class="row">
				<span>비밀번호 :</span><input type="password" name="pw"
					value="${member.pw}" required>
			</div>
			<div class="row">
				<span>이메일 : </span><input type="email" name="email"
					value="${member.email}" required>
			</div>
			<div class="row">
				<span>핸드폰 : </span><input type="text" name="phone"
					value="${member.phone}" required>
			</div>
			<div class="row">
				<input type="submit" class="btn btn-normal" value="수정완료">
			</div>
		</form>
	</div>
	<script type="text/javascript">
	</script>
</body>
</html>