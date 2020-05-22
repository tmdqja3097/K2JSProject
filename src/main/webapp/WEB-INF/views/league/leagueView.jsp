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
	
	/* 매치, 리그, 고객상담 (헤더 아래) */
	.header_wrapper {
		width: 100%;
		height: 72px;
		border: 1px solid red;
		margin-bottom: 30px;
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
	
	.navbar_header {
		width: 100px;
		height: 50px;
	}
	
	
	#myCarousel>a {
		border-radius: 50px;
		z-index: 0;
		background-image: none;
	}
	
	.card_header {      
		width: 100%;    
		height: 260px;
		border: 1px solid black;
		margin-top: 30px;
		margin-bottom: 30px;
	
	}
	
	.card_body {
		width: 90%;        
		height: 110px;        
		border: 1px solid yellow;
		background-color: #F6F6F6;
		margin: 75px;
		
	}
	
	/* 일정 */
	.card_man>li{ 
		display: inline-block;
		border: 1px solid #FF48C7;
		width: 212px;   
		height: 65px;            
		margin-top: 30px;
		margin-bottom: 30px;
	}
	
	/* 일정 헤더 */
	.card_top {
		width: 100%;
		height: 681px;
		border: 1px solid purple;
		margin-bottom: 30px;
	}
	
	/* 일정: 원데이리그 남성 */
	.onedayteam {
		width: 100%;
		height: 72px;
		border: 1px solid green;
	}

	/* 일정 중간 */
	.card_middle {
		width: 100%;
		height: 509px;
		border: 1px solid gray;
		margin-bottom: 30px;
		
	}
	
		
	.one_man>li {
		display: inline-block;
		border: 1px solid blue;
		width: 100%;
		height: 173px;
		padding: 15px;
		
	}
	
	/* 랭킹 헤더 */
	.card_ranks {
		width: 100%;
		height: 775.3px;
		border: 1px solid black;
		margin-top: 30px;
	}
	
	/* "랭킹" */
	.ranks_header {
		width: 100%;
		height: 72px;
		padding: 30px 20px 10px;
	}
	
	/* 랭킹 순위 */
	.ranks_header {
		width: 100%;
		height: 603.3px;  
		background-color: black;
		position: center;       
		
	}
	

	
	
	/* 리그 헤더 */
	.card_rule {
		width: 100%;
		height: 459px;
		border: 1px solid orange;
		margin-top: 30px;
		margin-bottom: 30px;
	}
	
   /* 리그 규칙 */	 
   .rule_header {
   		display: inline-block;
   		width: 50%;
		padding: 20px 10px;
   		border: 1px solid red;
   		margin: 0px;
    }

   
</style>
</head>
<body>  
	<c:import url="../template/header.jsp"></c:import>
<!-- 	c:import - 불러오기 -->	
<!-- 	<h1> league page </h1>
	<div id = "plabheader">
		<div class = "plabmain">
			<div class = "palbheader-main">
			
			</div>
		</div>
	</div> -->
	
	<div class="header_wrapper"></div>
	
	
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
	  
	   
	  
	</div>
	
	<div class="card_header">
		<div class="body">
			<div class="card_body">
				<ul class="card_man" style="list-style:none; width: 100%; height: 50px; color: blue;">
					<li> 남자 일정
						<a href="./manCar">
							<img alt=""
							src="${pageContext.request.contextPath}/resources/images/manCar.svg"
							style="width: 100%; height: 25px;"> 
						</a>   
					</li>	
					<li> 남자 랭킹 
						<a href="./manRanks">
							<img alt=""
							src="${pageContext.request.contextPath}/resources/images/manGraph.svg"
							style="width: 100%; height: 25px;">  
						</a>  
					</li>
					<li> 여자 일정 
						<a href="./womanCar">
							<img alt=""
							src="${pageContext.request.contextPath}/resources/images/womanCar.svg"
							style="width: 100%; height: 25px;">
						</a>  
					</li>
					<li> 여자 랭킹 
						<a href="./womanRanks">
							<img alt=""
							src="${pageContext.request.contextPath}/resources/images/womanGraph.svg"
							style="width: 100%; height: 25px;">
						</a> 
					</li>
				</ul>
			</div>
		</div>
	</div>
	
	
	<div class="card_top">
		<div class="onedayteam";>
			<div class="oneday";>
				<div class="card_middle">	
					<ul class="one_man">
						<li> 원데이 팀 남성리그 in 용산 7구장 </li>	
						<li> 원데이 팀 남성리그 in 용산 6구장 </li>	
						<li> 원데이 팀 남성리그 in 상암스포츠 C면 </li>
						<li> 원데이 팀 남성리그 in 용산 1구장 </li>	
					</ul>
				</div>
			</div>
		</div>
	</div>


	<div class="card_ranks">
		<div class="ranks_header">
			<div class="ranks_body">
			
			</div>
		</div>
	</div>
	
	
	<div class="card_rule">	
		<div class="rule_header">
			<ul>
				<li>👋🏻
					<h3> 골킥은 무조건 손으로 </h3>
				</li>
				<li>⌛ 
					<h3> 킥인은 4초 안에 </h3>
				</li>
				<li>🔙 
					<h3> 백패스는 1번만 </h3>
				</li>
				<li>😬 
					<h3> 위반시 간접 프리킥 </h3>
				<li>
			</ul>
		</div>
	</div>
	
	

	<%-- <div class="woman">
		<img
			src="${pageContext.request.contextPath}/resources/images/woman.PNG"
			alt="Woman" style="width: 100%;" height="300px">
	</div> --%>
	
	

</body>
</html>