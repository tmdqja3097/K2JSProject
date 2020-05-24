<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8">
<c:import url="../template/boot.jsp" />

<style type="text/css">
	
	body {
		padding: 0 20%;
		box-sizing: border-box;
	}
	
	.card_man>li{ 
		display: inline-block;
		width: 20%;  
		height: 65px;            
		margin-top: 20px;    
		text-align: center;
	}
	
	/* 랭킹 전체 박스 */
	.rank_home {
		width: 100%;
		height: 3711.42px;
		border: 1px solid gray;
		margin-top: 50px;
	}
	
	/* 전체 박스 안에 또 박스 */
	
	.home_body {
		width: 80%;
		height: 3571.42px;
		border: 1px solid red; 
		margin-left: 110px;   
		margin-top: 65px;  
	}
	
	.body_box {
		width: 30%;
		height: 241px;
		border: 1px solid yellow;
	}
	

</style>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>


		<div class="woman_wrapper">
			<img src="${pageContext.request.contextPath}/resources/images/onedayWoman.PNG"
		 	style="width: 100%; height: 300px;">   
		
		</div>
		
		
	<div class="body">
			<ul class="card_man" style="list-style:none; width: 100%; height: 50px;">
				<li> 
					<a href="./manCar">
						<img alt=""
							src="${pageContext.request.contextPath}/resources/images/manCar.svg"
							style="width: 100%; height: 25px;">
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
		
		<div class="rank_home">
			<div class="home_body">
				<div class="body_box"></div>
				<div class="body_box"></div>
				<div class="body_box"></div>
				  
			</div>
		</div>


</body>
</html>