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
			<c:forEach items="${matchVO.stadiumFileVOs}" varStatus="i">
				<c:if test="${i.index eq 0}">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				</c:if>
				<c:if test="${i.index gt 0}"><li data-target="#myCarousel" data-slide-to="${i.index}"></li>
				</c:if>
			</c:forEach>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner slide_edge">
			<c:forEach items="${matchVO.stadiumFileVOs}" var="file" varStatus="i">
				<c:if test="${i.index eq 0}">
					<div class="item active">
						<img
							src="../../${pageContext.request.contextPath}/resources/uploadstadium/${file.fileName}"
							alt="Los Angeles" style="width: 100%;" height="50px">
					</div>
				</c:if>
				<c:if test="${i.index gt 0 }">
					<div class="item">
						<img
							src="../../${pageContext.request.contextPath}/resources/uploadstadium/${file.fileName}"
							alt="Los Angeles" style="width: 100%;" height="50px">
					</div>
				</c:if>
			</c:forEach>

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
