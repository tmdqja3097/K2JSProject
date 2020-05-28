<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bootstrap Example</title>
<meta charset="utf-8">
<c:import url="../template/boot.jsp" />
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
		
		
		
	}
	
	.hearder_wrapper2 {
		width: 80%;
		height: 72px;
		border: 1px solid red;
		margin-bottom: 30px;
		
	}
	
	.match_box {
		width: 25%;
		height: 45px;
		border-bottom: 2px solid #FFC645;       
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

	
	/* 일정 */
	.oneday_header {
		width: 100%;
		height: 681px;
		margin-top: 70px;
		
	}
	
	.oneday_top {      
		width: 100%;
		height: 85px;
	}
	
	.oneday_body {
		width: 100%;
		height: 500px;
		
	}
	
	 .oneday_box1{
		width: 30%;
		height: 130px;
		padding-left: 30px;
		display: inline-block;
		border-radius: 20px;
		background-color: #fafafa;
		
	}

	         
	 .oneday_box2{
		width: 30%;
		height: 130px;
		padding-left: 30px;
		display: inline-block; 
		border-radius: 20px;   
		background-color: #fafafa;
	}

	
	.card_man>li{ 
		display: inline-block;
		width: 20%;  
		height: 65px;            
		margin-top: 20px;    
		text-align: center;
	}

		
	.one_man>li {
		display: inline-block;
		border: 1px solid blue;
		width: 100%;
		height: 173px;
		padding: 15px;
		
	}       
	
	/* 랭킹 헤더 */
	.ranks_card {
		width: 100%;
		height: 775.3px;
		margin-top: 30px;
	}
	  
	/* "랭킹" */
	.ranks_top {
		width: 100%;
		height: 85px;
	
	}
	
	/* "랭킹 순위" */
	.ranks_body {
		width: 100%;
		height: 500px;
	
	}
	       
	

	/* 리그 헤더 */
	.card_rule {
		width: 100%;
		height: 459px;    
		margin-top: 30px;
		margin-bottom: 30px;
		text-align: center;
		
	}
	   
	
	/* 리그 헤더 안에 박스 */
	.rule_box {  
		width: 90%;   
		height: 290px;
		padding: 10px;  
		margin-top: 15px;  
		margin-left: 50px;     
	    
	}
	
	/* 리그 헤더 안에 작은 박스 */
	.rule_he {
		width: 90%;
		height: 72px;
		margin-left: 35px;
		margin-top: 10px;
		text-align: left;
		
	}
	
	
   /* 리그 규칙 */	 
   .rule_header {
   		display: inline-block;
   		width: 50%;
		padding: 20px 10px;
   		margin: 0px; 
  
    }
    
    

   
</style>
</head>
<body>  
	<c:import url="../template/header.jsp"></c:import>
<!-- 	c:import - 불러오기 -->	
	
	<div class="header_wrapper">
		<div class="header_wrapper2">
			<div class="match_box"> 
				<ul>
					<h1 class="match"> 매치 </h1>
				</ul>
			</div>   
		</div>
	</div>
	
	
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
	
	  
	  
	</div>
	
	
	<div class="body">
			<ul class="card_man" style="list-style:none; width: 100%; height: 50px;">
				<li> 
					<a href="./manCar">
						<img alt=""
							src="${pageContext.request.contextPath}/resources/images/manCar.svg"
							style="width: 100%; height: 25px;" >
							남자 일정 
					</a>   
				</li>	
				<li> 
					<a href="./manRanks">
						<img alt=""
							src="${pageContext.request.contextPath}/resources/images/manGraph.svg"
							style="width: 100%; height: 25px;">  
							남자 랭킹 
					</a>  
				</li>
				<li>  
					<a href="./womanCar">
							<img alt=""
							src="${pageContext.request.contextPath}/resources/images/womanCar.svg"
							style="width: 100%; height: 25px;">
							여자 일정
					</a>  
				</li>
				<li>  
					<a href="./womanRanks">
						<img alt=""
							src="${pageContext.request.contextPath}/resources/images/womanGraph.svg"
							style="width: 100%; height: 25px;">
							여자 랭킹
					</a> 
				</li>
			</ul>
		</div>
		
		
	  <div class="oneday_header">
	  	<div class="oneday_top">
	  		<h2> 일정 </h2>
			<a href="./manCar"> 원데이리그 남성 </a> 
			<a href="./womanCar"> 원데이리그 여성 </a>
	  	</div>
		<div class="oneday_body">
			<div class="oneday_box1"></div>
			<div class="oneday_box1"></div>
			<div class="oneday_box2"></div>
			<div class="oneday_box2"></div>      
			<div class="oneday_end"></div>
		</div>
		
	</div>
	   


	<div class="ranks_card">
		<div class="ranks_top">
		<h2> 랭킹 </h2>
			<a href="./manRanks"> 원데이리그 남성 </a> 
			<a href="./womanRanks"> 원데이리그 여성 </a>
			<div class="ranks_body">
			
			</div>
		</div>
	</div>
	
	
	<div class="card_rule">	
		<div class="rule_he">
			<h2> 리그 규칙 </h2>

		</div>    
		<div class="rule_box">
			<ul style="list-style:none;">
				<div class="oneday_box1">
					<li>
						<h4> 👋🏻 
							<p style="margin-top:10px"> 골킥은 무조건 손 </p>
						</h4>
					</li>
	  
				</div>
				<div class="oneday_box1">
					<li>
						<h4> ⌛  
							<p style="margin-top:10px"> 킥인은 4초 안에 </p>
						</h4>
					</li>
				</div>    
				<div class="oneday_box2">
					<li>
						<h4> 🔙 
							<p style="margin-top:10px"> 백패스는 1번만 </p>
						</h4>
					</li>  
				</div>     
				<div class="oneday_box2" style="margin-top:10px;">
					<li>   
						<h4> 😬  
							<p style="margin-top:10px"> 위반시 간접 프리킥 </p>
						</h4>
					<li>
				</div>
			</ul>  
		</div>
	</div>       
	
<%-- <title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>
</head>
<body>

	<h1>leagueView page</h1>
	<a href="./leagueView">리그</a>
	<a href="./leagueGender?gender=1">남자 랭킹</a><a href="./leagueGender?gender=2">여자 랭킹</a>
	
	<div class="container">
		<table class="table">
			<tr>
				<td>순위/팀</td>
				<td>승률</td>
				<td>승</td>
				<td>무</td>
				<td>패</td>
				<td>점수</td>		
			</tr>
			<c:forEach items="${leagues}" var="lea"> 
				
					<tr>
						<td><span>${lea.rank} &nbsp;&nbsp;&nbsp;&nbsp;</span><a
							href="./leagueSelect?teamName=${lea.teamName}">${lea.teamName}</a></td>
						<td><fmt:formatNumber pattern="#.#" value="${lea.winRate}"></fmt:formatNumber>%</td>
						<td>${lea.win}</td>
						<td>${lea.draw}</td>
						<td>${lea.lose}</td>
						<td>${lea.point}</td>
					</tr>
				     
			</c:forEach>
		</table>        
	</div>    
	<a href="./leagueWrite" class="btn btn-default">리그 작성</a>

	<script type="text/javascript">
		
	</script>	 --%>

</body>
</html>