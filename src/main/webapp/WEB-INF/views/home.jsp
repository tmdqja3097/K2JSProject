<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>
<c:import url="./template/boot.jsp">
</c:import>

<style type="text/css">
.slide_edge {
	border-radius: 50px;
}

#myCarousel>a {
	border-radius: 50px;
	z-index: 0;
	background-image: none;
}
</style>
</head>
<body>
	<div class="All">
		<c:import url="./template/header.jsp"></c:import>
		<div class="slide_img ">
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
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
							src="${pageContext.request.contextPath}/resources/images/foot1.png"
							alt="Los Angeles" style="width: 100%;" height="50px">
					</div>

					<div class="item">
						<img
							src="${pageContext.request.contextPath}/resources/images/foot2.png"
							alt="Chicago" style="width: 100%;" height="50px">
					</div>

					<div class="item">
						<img
							src="${pageContext.request.contextPath}/resources/images/foot3.png"
							alt="New york" style="width: 100%;" height="50px">
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
		<div id="match-box" style="width: 100%; height: 100px;">
			<div style="width: 5%; height: 100px; float: left;">
				<button id="pre">←</button>
			</div>
			<div id="list"
				style="width: 90%; height: 100px; float: left; overflow: hidden;">
				<ul class="nav nav-tabs" id="day-list">
				</ul>
			</div>
			<div style="width: 5%; height: 100px; float: left;">
				<button id="next">→</button>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		var sysdate = new Date();
		var count = 0;
		var startDay = parseInt((sysdate.getDate() + 100 + "").substr(1, 3));

		$("#next").click(function() {
			$("#day-list").empty();	
			startDay = startDay + 1;
			count++;
			getList(startDay);
		})

		$("#pre").click(function() {
			$("#day-list").empty();
			startDay = startDay - 1;
			count--;
			getList(startDay);
		})

		getList(startDay);
		
		
		function getList(startDay) {
			$.get("getList?startDay=" + startDay, function(result) {
				$("#day-list").append(result);
			});
			
			console.log(count);
			if (count == 0) {
				$("#pre").prop("disabled", "disabled");
				$("#next").removeAttr("disabled");
			} else if (count > 0 && count < 7) {
				$("#pre").removeAttr("disabled");
				$("#next").removeAttr("disabled");
			} else if (count == 7) {
				$("#pre").removeAttr("disabled");
				$("#next").prop("disabled", "disabled");
			}
		}
	</script>
</body>
</html>
