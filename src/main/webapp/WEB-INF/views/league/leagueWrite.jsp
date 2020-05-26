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

	<h1>leagueWrite page</h1>
	
	<form action="./leagueWrite" id="frm" method="post">
	
		<div class="form-group">
				<label for="teamName">팀 명:</label> <input type="text"
					class="form-control" id="teamName" name="teamName">
		</div>
		<div class="form-group">
				<label for="win">승:</label> <input type="text"
					class="form-control" id="win" name="win">
		</div>
		<div class="form-group">
				<label for="draw">무:</label> <input type="text"
					class="form-control" id="draw" name="draw">
		</div>
		<div class="form-group">
				<label for="lose">패:</label> <input type="text"
					class="form-control" id="lose" name="lose">
		</div>
		<div class="form-group">
				<label for="gender">성별:</label> <input type="text"
					class="form-control" id="gender" name="gender" placeholder="남성리그는 1 / 여성리그는 2">
		</div>
		<div class="form-group">
				<label for="point">점수:</label>
				<input type="text" 
					class="form-control" id="point" name="point" readonly="readonly" hidden="point" value="0">
		</div>
		
		<input type="submit" id="btn" class="btn btn-default" value="Write">
	</form>

</body>
</html>