<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <title>Insert title here</title> -->

<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<style type="text/css">

	body {
		padding: 0 20%;
		box-sizing: border-box;
		border: 1px solid green;
	}
	
	
	/* 헤더-상단바 */
	.top-bar {
		background-color: black;
		border: none;
		border-color: red;
		background-color: black;
	}	
	
	.navbar {
		margin-bottom: 0;
		border-radius: 0;
		background-color: white;
		border-color: red;
	}
	

	
	
	#myCarousel>a {
		border-radius: 50px;
		z-index: 0;
		background-image: none;
	}
	
	
	 
</style>
</head>
<body>  
	<c:import url="../template/header.jsp"></c:import>
<!-- 	<h1> league page </h1>
	<div id = "plabheader">
		<div class = "plabmain">
			<div class = "palbheader-main">
			
			</div>
		</div>
	</div> -->
	
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
	  <!-- Indicators -->
	  <ol class="carousel-indicators">
	    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
	    <li data-target="#myCarousel" data-slide-to="1"></li>
	  </ol>
	
	  <!-- Wrapper for slides -->
	  <div class="carousel-inner">
	    <div class="item active">
	      <img src="${pageContext.request.contextPath}/resources/images/woman.PNG"
	      	   alt="Los Angeles" style="width:100%;" height="50px">
		    <div class="carousel-caption"></div>	    
	    </div>
	
	
	    <div class="item">
	      <img src="${pageContext.request.contextPath}/resources/images/man.PNG"
	      	   alt="Chicago" style="width:100%;" height="50px">
	    	   <div class="carousel-caption"></div>
	    </div>
	
	  </div>
	
	  <!-- Left and right controls -->
	  
	   
	  
	  
	  <a class="right carousel-control" href="./leagueA">
	  	<h1> league </h1> 
	  
	  </a>
	</div>
	
	<div class="body">
		<div class="top-bar">
			<div class="navbar">
			
			</div>
		</div>
	</div>


	<%-- <div class="woman">
		<img
			src="${pageContext.request.contextPath}/resources/images/woman.PNG"
			alt="Woman" style="width: 100%;" height="300px">
	</div> --%>
	
	

</body>
</html>