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

	<form action="./addManager" id="managerForm" method="post" enctype="multipart/form-data">
		
		<div class="form-group">
			<label for="name">이름:</label> <input type="text"
				class="form-control" id="name" name="name">
		</div>
		<div class="form-group">
			<label for="gender">성별:</label> 
			 <select name="gender" id="gender">
			 	<option value="none">선택</option>
				<option value="1">남성</option>
				<option value="2">여성</option>
			</select>		
		</div>
		<div class="form-group">
			<label for="age">나이:</label> <input type="text"
				class="form-control" id="age" name="age">
		</div>
		<div class="form-group">
			<label for="home">거주지:</label> <input type="text"
				class="form-control" id="home" name="home">
		</div>
		<div class="form-group">
			<label for="phone">전화 번호:</label> <input type="text"
				class="form-control" id="phone" name="phone">
		</div>
		<div class="form-group">
			<label for="account">계좌 번호:</label> <input type="text"
				class="form-control" id="account" name="account">
		</div>
		
		<input type="button" id="btn" class="btn btn-default" value="Write" style="float:right; margin-right: 20px;" > 
		
		<c:catch>
			<input type="button" id="add" class="btn btn-default" value="AddFile" style="float:right;" name="files">
			<div id="file"></div> 
		</c:catch>
		
	</form>
	
	<script type="text/javascript" src="../resources/js/managerForm.js">
	
	</script>
</body>
</html>