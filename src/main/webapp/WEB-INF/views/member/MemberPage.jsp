<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"/>
</head>
<body>
<c:import url="../template/header.jsp"/>
<div class="container">
	<div class="row">
	<label>회원 아이디 :
	<span>${member.id}</span>
	</label>
	</div>
	<div class="row">
	<label>회원 이름 :
	<span>${member.name}</span>
	</label>
	</div>
	<div class="row">
	<label>회원 이메일 :
	<span>${member.email}</span>
	</label>
	</div>
	<div class="row">
	<label>회원 핸드폰번호 :
	<span>${member.phone}</span>
	</label>
	</div>
</div>
</body>
</html>