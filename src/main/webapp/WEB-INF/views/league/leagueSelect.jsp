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

	<h1>leagueSelect Page</h1>
	
        
	<h3>포인트</h3>
	<h3>${leagueVO.point}</h3>

	<a href="./leagueUpdate?teamName=${leagueVO.teamName}" class="btn btn-default">팀 수정</a>
	<a href="./leagueDelete?teamName=${leagueVO.teamName}" class="btn btn-default">팀 지우기</a>

</body>
</html>