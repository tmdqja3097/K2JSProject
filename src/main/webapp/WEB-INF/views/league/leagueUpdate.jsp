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

	<h1>leagueUpdate page</h1>
	
	<form action="./leagueUpdate" id="frm" method="post">
		<input type="hidden" name="teamName" value="${leaVO.teamName}">
		<div class="form-group">
				<label for="win">승:</label> <input type="text"
					class="form-control" id="win" name="win" value="${leaVO.win}">
		</div>
		<div class="form-group">
				<label for="draw">무:</label> <input type="text"
					class="form-control" id="draw" name="draw" value="${leaVO.draw}">
		</div>
		<div class="form-group">
				<label for="lose">패:</label> <input type="text"
					class="form-control" id="lose" name="lose" value="${leaVO.lose}">
		</div>   
		<input type="hidden" name="point" value="${leaVO.point}">
		
		<input type="submit" id="btn" class="btn btn-default" value="Update">
	</form>

</body>
</html>