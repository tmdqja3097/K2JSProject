<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
	<c:import url="./template/boot.jsp"> </c:import>

<style type="text/css">
	.slide_img{
		width : 70%;
		height: 100px;
		border-radius: 150px;
	}
</style>	
</head>

<body>

	<c:import url="./template/header.jsp"></c:import>

	<div>
		<div class="container slide_img">
			<div id="myCarousel" class="carousel slide" data-ride="carousel" >
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
				</ol>

				<!-- Wrapper for slides -->
				<div class="carousel-inner">
					<div class="item active">

						<img src="${pageContext.request.contextPath}/resources/images/foot1.png" alt="Los Angeles" style="width: 100%;"height="50px">
					</div>

					<div class="item">
						<img src="${pageContext.request.contextPath}/resources/images/foot2.png" alt="Chicago" style="width: 100%;" height="50px">
					</div>

					<div class="item">
						<img src="${pageContext.request.contextPath}/resources/images/foot3.png" alt="New york" style="width: 100%;"height="50px">

						<a href="#"><img src="la.jpg" alt="Los Angeles" style="width: 100%; height: 50px;"></a>
					</div>

					<div class="item">
						<a href="#"><img src="chicago.jpg" alt="Chicago" style="width: 100%; height: 50px;"></a>
					</div>

					<div class="item">
						<a href="#"><img src="ny.jpg" alt="New york" style="width: 100%; height: 50px;"></a>

					</div>
				</div>

				<!-- Left and right controls -->
				<a class="left carousel-control" href="#myCarousel"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#myCarousel"
					data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
		</div>
		<div class="container"></div>
	</div>
</body>
</html>
