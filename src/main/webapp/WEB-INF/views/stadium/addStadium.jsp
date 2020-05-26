<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/summer.jsp"></c:import>
<style type="text/css">
label{
	margin-right: 20px;
} 
form{
	margin-top: 50px;
}
</style>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>

	
	<div id="map" style="width: 100%; height: 350px;"></div>
	<p>
		<em>지도를 클릭해주세요!</em>
	</p>
	<div id="clickLatlng"></div>


	<form action="./addStadium" id="frm" method="post">


		<div class="form-group">
			<label for="name">구장명 </label> <input type="text"
				class="form-control" id="name" name="name">
		</div>
		<div class="form-group">
			<label for="writer">주소 </label> <input type="text"
				class="form-control" id="address" name="address">
		</div>
		<div class="form-group">
			<label for="writer">위도(위 지도를 참조해서 소수점 아래 6자리까지 입력)</label> <input type="text"
				class="form-control" id="location_w" name="location_w">
		</div>
		<div class="form-group">
			<label for="writer">경도(위 지도를 참조해서 소수점 아래 6자리까지 입력)</label> <input type="text"
				class="form-control" id="location_k" name="location_k">
		</div>
		<div class="form-group">
			<label for="writer">구장 사이즈(가로x세로 형태로 입력) : </label> <input type="text"
				class="form-control" id="stadiumSize" name="stadiumSize">
		</div>
		<div class="form-group">
		<label for="writer">샤워장&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : </label>
			<input type="radio" id="yes_shower" name="shower" value="0" checked="checked"> 
			<label for="yes_shower">없음</label> 
			<input type="radio" id="no_shower" name="shower" value="1">
			<label for="no_shower">있음</label>
		</div>
		<div class="form-group">
		<label for="writer">주차시설 &nbsp;&nbsp;&nbsp;&nbsp; : </label>
			<input type="radio" id="yes_parking" name="parking" value="0" checked="checked"> 
			<label for="yes_parking">무료</label> 
			<input type="radio" id="no_parking" name="parking" value="1">
			<label for="no_parking">유료</label>
		</div>
		<div class="form-group">
		<label for="writer">풋살화 대여 : </label>
			<input type="radio" id="yes_shoes" name="shoes" value="0" checked="checked"> 
			<label for="yes_shoes">없음</label> 
			<input type="radio" id="no_shoes" name="shoes" value="1">
			<label for="no_shoes">있음</label>
		</div>
		<div class="form-group">
		<label for="writer">운동복 대여 : </label>
			<input type="radio" id="yes_cloth" name="cloth" value="0" checked="checked"> 
			<label for="yes_cloth">없음</label> 
			<input type="radio" id="no_cloth" name="cloth" value="1">
			<label for="no_cloth">있음</label>
		</div>
		
		<div class="form-group">
				<label for="info">구장 특이사항</label>
				<textarea rows="20" cols="" class="form-control" id="info"
					name="info"></textarea>
		</div>
	<input type="button" id="btn" class="btn btn-default" value="Write" style="float:right;" > 
	</form>


	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c5126e0fcae8eba0e1ed7a9c58dc7812"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.556518,126.919628), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 지도를 클릭한 위치에 표출할 마커입니다
		var marker = new kakao.maps.Marker({
			// 지도 중심좌표에 마커를 생성합니다 
			position : map.getCenter()
		});
		// 지도에 마커를 표시합니다
		marker.setMap(map);

		// 지도에 클릭 이벤트를 등록합니다
		// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {

			// 클릭한 위도, 경도 정보를 가져옵니다 
			var latlng = mouseEvent.latLng;

			// 마커 위치를 클릭한 위치로 옮깁니다
			marker.setPosition(latlng);

			var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
			message += '경도는 ' + latlng.getLng() + ' 입니다';

			var resultDiv = document.getElementById('clickLatlng');
			resultDiv.innerHTML = message;

		});
		
	</script>
	
	<script type="text/javascript" src="../resources/js/stadiumForm.js">
	
	</script>
</body>
</html>