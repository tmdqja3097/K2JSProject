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
	<h1>MatchUpdate form</h1>

	<form action="./matchUpdate" id="frm" method="post">
		
		<div class="form-group">
			<label for="title">제목:</label> <input type="text"
				class="form-control" id="title" name="title">
		</div>
		<div class="form-group">
			<label for="writer">경기 날짜:</label> <input type="date"
				class="form-control" id="writer" name="day">
		</div>
		<div class="form-group">
			<label for="writer">경기 시간:</label> <input type="time"
				class="form-control" id="writer" name="time">
		</div>
		<div class="form-group">
			<label for="writer">구장:</label> <input type="text"
				class="form-control" id="writer" name="stadiumName">
		</div>
		<div class="form-group">
			<label for="writer">성별:</label> <input type="text"
				class="form-control" id="writer" name="gender">
		</div>
		<div class="form-group">
			<label for="contents">내용:</label> <input type="text"
				class="form-control" id="title" name="contents">
		</div>
		
		<input type="submit" id="btn" class="btn btn-default" value="Write">
	</form>


</body>
</html>