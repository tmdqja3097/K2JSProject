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
<h1>${matchVO.fullTime}</h1>
<h2>${matchVO.stadiumName }</h2>

<h3>신청 정보</h3>
<select>
	<c:forEach end="8" var="i" begin="1">
	<option>${i}명</option>
	</c:forEach>
</select>
</body>
</html>