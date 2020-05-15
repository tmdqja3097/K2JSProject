<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style type="text/css">
body {
	padding: 0 0;
}

.slide_img {
	width: 100%;
	padding: 0;
	height: 0px;
	margin-bottom: -69px;
}

.slide_edge {
	
}

.carousel-inner>.item>a>img, .carousel-inner>.item>img, .img-responsive,
	.thumbnail a>img, .thumbnail>img {
	height: 500px;
}

#myCarousel>a {
	z-index: 0;
	background-image: none;
}
</style>

<div class="container  slide_img ">
	<div id="myCarousel" class="carousel slide" data-ride="carousel"
		style="z-index: 1">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner slide_edge">
			<div class="item active">
				<img
					src="../../${pageContext.request.contextPath}/resources/images/foot1.png"
					alt="Los Angeles" style="width: 100%;" height="50px">
			</div>

			<div class="item">
				<img
					src="../../${pageContext.request.contextPath}/resources/images/foot2.png"
					alt="Chicago" style="width: 100%;" height="50px">
			</div>

			<div class="item">
				<img
					src="../../${pageContext.request.contextPath}/resources/images/foot3.png"
					alt="New york" style="width: 100%;" height="50px">
			</div>
		</div>

		<!-- Left and right controls -->
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#myCarousel"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
</div>
