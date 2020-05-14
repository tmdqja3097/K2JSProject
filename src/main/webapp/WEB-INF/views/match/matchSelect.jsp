<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>
<style type="text/css">
#map {     
	margin-top: 69px;
}
       
element.style {       
	overflow: hidden;
}
#info1{
	margin-left: 19%;
	
}     
#info1 > li {         
	list-style: none;
	display: inline-block;
	width:170px;
	height:120px;
	border: 1px solid black;
	margin: 0 auto;

	background-color: #EEEEEE;
	text-align: center;

}
</style>
</head>
<body>
	<h1>MatchSelect Page</h1>
	<c:import url="../template/matchCarousel.jsp"></c:import>

	<div id="map" style="width: 100%; height: 500px; z-index: 0"></div>

	<div>
		<h1>${fullTime}</h1>
	</div>
	<a href="#"><h1>${stadiumVO.name}</h1></a>

	<a><p id="map_view">지도보기</p></a>
	<a class="copy">주소 복사하기</a>
	
	<h1>진행방식</h1>
	<ul id ="info1">
	<li><img alt="" src="../../${pageContext.request.contextPath}/resources/images/6vs6.svg" style="width: 120px; height: 90px;">
		<p>6 vs 6 매치</p>
	</li>
	<c:if test="${matchVO.gender eq 1}">
	<li><img alt="" src="../../${pageContext.request.contextPath}/resources/images/male.svg" style="width: 120px; height: 90px;">
		<p>남성 매치</p>
	</li>
	</c:if>
	<c:if test="${matchVO.gender eq 2}">
	<li><img alt="" src="../../${pageContext.request.contextPath}/resources/images/female.svg" style="width: 120px; height: 90px;">
		<p>여자 매치</p>
	</li>
	</c:if>
	<li><img alt="" src="../../${pageContext.request.contextPath}/resources/images/every.svg" style="width: 120px; height: 90px;">
		<p>일반 매치</p>
	</li>
	<li><img alt="" src="../../${pageContext.request.contextPath}/resources/images/turf.svg" style="width: 120px; height: 90px;">
		<p>풋살화</p>
	</li>
	<li><img alt="" src="../../${pageContext.request.contextPath}/resources/images/minmax.svg" style="width: 120px; height: 90px;">
		<p>10~18명</p>
	</li>
	</ul>

	${stadiumVO.info}
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c5126e0fcae8eba0e1ed7a9c58dc7812"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.5562642, 126.9204713), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 마커가 표시될 위치입니다 
		var markerPosition = new kakao.maps.LatLng(37.5562642, 126.9204713);

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			position : markerPosition
		});

		/* var ptext = document.getElementById("map_view") */

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		var address = "<c:out value='${stadiumVO.address}'/>";

		document.querySelector(".copy").addEventListener("click", function() {
			var tempElem = document.createElement('textarea');
			tempElem.value = address;
			document.body.appendChild(tempElem);

			tempElem.select();
			document.execCommand("copy");
			document.body.removeChild(tempElem);

			alert("주소가 클립보드에 복사되었습니다");
		});

		
		$(document).ready(function() {
			$("#map_view").click(function() {
				var map_view = $("#map_view").text();
				if (map_view == "지도보기") {
					$("#map_view").text("지도닫기");
					$("#map").css("z-index", "2");
				}else if (map_view =="지도닫기") {
					$("#map_view").text("지도보기");
					$("#map").css("z-index", "0");
				}
			});

		});
	</script>

</body>
</html>