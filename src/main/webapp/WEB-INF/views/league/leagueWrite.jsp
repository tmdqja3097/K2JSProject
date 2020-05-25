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
				<label for="teamName">팀 이름:</label> <input type="text"
					class="form-control" id="teamName" name="teamName">
		</div>
		<div class="form-group">
				<label for="gender">성별:</label> <input type="text"
					class="form-control" id="gender" name="gender">
		</div>
		<div class="form-group">
				<label for="matchName">경기 제목:</label> <input type="text"
					class="form-control" id="matchName" name="matchName">
		</div>
		<div class="form-group">
				<label for="matchDate">경기 날짜:</label> <input type="date"
					class="form-control" id="matchDate" name="matchDate">
		</div>
		<div class="form-group">
			<label for="matchTime">경기 시간:</label> <input type="time"
				class="form-control" id="matchTime" name="matchTime">
		</div>
		<div class="form-group">
				<label for="matchLocation">경기 장소:</label> <input type="text"
					class="form-control" id="matchLocation" name="matchLocation">
		</div>
		<div class="form-group">
				<label for="ranking">랭킹:</label> <input type="text"
					class="form-control" id="ranking" name="ranking">
		</div>
		
		<input type="submit" id="btn" class="btn btn-default" value="Write">
	</form>

</body>
</html>