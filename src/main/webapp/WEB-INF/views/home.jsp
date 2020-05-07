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
.slide_img {
	width: 70%;
}

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

	<c:import url="./template/header.jsp"></c:import>

	<div>
		<div class="container  slide_img ">
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
	</div>
	<%
		List<String> dat = new ArrayList<String>();

	Date date = new Date();
	Calendar cal = Calendar.getInstance();

	SimpleDateFormat yearSdf = new SimpleDateFormat("yyyy"); //현재 년도 리턴
	int year = Integer.parseInt(yearSdf.format(date));
	SimpleDateFormat monthSdf = new SimpleDateFormat("MM"); //현재 월 리턴
	int month = Integer.parseInt(monthSdf.format(date));
	SimpleDateFormat daySdf = new SimpleDateFormat("dd"); //현재 일자 리턴
	int day = Integer.parseInt(daySdf.format(date));

	cal.set(year, month - 1, day);//month는 0 부터 시작하니 -1을 해줘야 1일때 1월이 나옴
	for (int i = 0; i + day <= cal.getActualMaximum(cal.DATE); i++) {
		if (i < 14) { //	배열의 크기만큼 데이터를 저장
			dat.add(year + "/" + month + "/" + (i + day));
		}
	}
	request.setAttribute("day", dat);
	%>
	<div class="container">
		<div class="row">
			<c:forEach items="${day}" var="date" step="1">
				<a href="#">${date}</a>
			</c:forEach>
		</div>
	</div>
</body>
</html>
