<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
	#myInput {
		background-position: 10px 12px;
		background-repeat: no-repeat;
		width: 30%;
		font-size: 16px;
		padding: 12px 20px 12px 40px;
		border: 1px solid #ddd;
		margin-bottom: 10px; 
		border-radius: 10px;
	}
	.w3-border-bottom{
		margin-top: 40px;
		margin-left: 130px;
		
	}
</style>
	<form action="./${board}List">
	<div class="w3-border-bottom"><h4>자주 묻는 질문 &nbsp;&nbsp;
	<input type="text" id="myInput" onkeypress="JavaScript:press(this.form)" placeholder="키워드로 질문하기" title="Type in a name" name="search"></h4></div>
	</form>
<script>
	function press(f){
		if(f.keyCode == 13){ 
			formname.submit();
		}
	}	
</script>
   