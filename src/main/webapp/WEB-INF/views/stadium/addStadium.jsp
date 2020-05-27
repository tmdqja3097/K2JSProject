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
label {
	margin-right: 20px;
}

form {
	margin-top: 50px;
}
</style>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>


	<div id="map" style="width: 100%; height: 350px;"></div>
	<div class="hAddr">
		<span class="title">지도중심기준 행정동 주소정보</span> <span id="centerAddr"></span>
	</div>
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
			<label for="writer">위도(위 지도를 참조해서 소수점 아래 6자리까지 입력)</label> <input
				type="text" class="form-control" id="location_w" name="location_w">
		</div>
		<div class="form-group">
			<label for="writer">경도(위 지도를 참조해서 소수점 아래 6자리까지 입력)</label> <input
				type="text" class="form-control" id="location_k" name="location_k">
		</div>
		<div class="form-group">
			<label for="writer">구장 사이즈(가로x세로 형태로 입력) : </label> <input
				type="text" class="form-control" id="stadiumSize" name="stadiumSize">
		</div>
		<div class="form-group">
			<label for="writer">샤워장&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				: </label> <input type="radio" id="yes_shower" name="shower" value="0"
				checked="checked"> <label for="yes_shower">없음</label> <input
				type="radio" id="no_shower" name="shower" value="1"> <label
				for="no_shower">있음</label>
		</div>
		<div class="form-group">
			<label for="writer">주차시설 &nbsp;&nbsp;&nbsp;&nbsp; : </label> <input
				type="radio" id="yes_parking" name="parking" value="0"
				checked="checked"> <label for="yes_parking">무료</label> <input
				type="radio" id="no_parking" name="parking" value="1"> <label
				for="no_parking">유료</label>
		</div>
		<div class="form-group">
			<label for="writer">풋살화 대여 : </label> <input type="radio"
				id="yes_shoes" name="shoes" value="0" checked="checked"> <label
				for="yes_shoes">없음</label> <input type="radio" id="no_shoes"
				name="shoes" value="1"> <label for="no_shoes">있음</label>
		</div>
		<div class="form-group">
			<label for="writer">운동복 대여 : </label> <input type="radio"
				id="yes_cloth" name="cloth" value="0" checked="checked"> <label
				for="yes_cloth">없음</label> <input type="radio" id="no_cloth"
				name="cloth" value="1"> <label for="no_cloth">있음</label>
		</div>

		<div class="form-group">
			<label for="info">구장 특이사항</label>
			<textarea rows="20" cols="" class="form-control" id="info"
				name="info"></textarea>
		</div>
		<input type="button" id="btn" class="btn btn-default" value="Write"
			style="float: right;">
	</form>


	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c5126e0fcae8eba0e1ed7a9c58dc7812&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.556518, 126.919628), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		//주소-좌표 변환 객체를 생성합니다.
		var geocoder = new kakao.maps.services.Geocoder();

		// 지도를 클릭한 위치에 표출할 마커입니다
		var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커
		infowindow = new kakao.maps.InfoWindow({
			zindex : 1
		}); // 클릭한 위치에 대한 주소를 표시할 인포 윈도우

		//현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시
		searchAddrFromCoords(map.getCenter(), displayCenterInfo);

		// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
			searchDetailAddrFromCoords(mouseEvent.latLng, function(result,
					status) {
				if (status === kakao.maps.services.Status.OK) {
					var detailAddr = !!result[0].road_address ? '<div>도로명주소 : '
							+ result[0].road_address.address_name + '</div>'
							: '';
					detailAddr += '<div>지번 주소 : '
							+ result[0].address.address_name + '</div>';

					var content = '<div class="bAddr">'
							+ '<span class="title">법정동 주소정보</span>'
							+ detailAddr + '</div>';

					// 마커를 클릭한 위치에 표시합니다 
					marker.setPosition(mouseEvent.latLng);
					marker.setMap(map);

					// 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
					infowindow.setContent(content);
					infowindow.open(map, marker);
					// 도로주소를 저장합니다.
					$("#address").val(result[0].address.address_name);
				}
			});

			// 클릭한 위도, 경도 정보를 가져옵니다 
			var latlng = mouseEvent.latLng;

			// 마커 위치를 클릭한 위치로 옮깁니다
			marker.setPosition(latlng);

			var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
			message += '경도는 ' + latlng.getLng() + ' 입니다';

			var resultDiv = document.getElementById('clickLatlng');
			resultDiv.innerHTML = message;

			var wido = latlng.getLat();
			var kyungdo = latlng.getLng();
			$("#location_w").val(wido);
			$("#location_k").val(kyungdo);
		});
		// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'idle', function() {
			searchAddrFromCoords(map.getCenter(), displayCenterInfo);
		});

		function searchAddrFromCoords(coords, callback) {
			// 좌표로 행정동 주소 정보를 요청합니다
			geocoder.coord2RegionCode(coords.getLng(), coords.getLat(),
					callback);
		}

		function searchDetailAddrFromCoords(coords, callback) {
			// 좌표로 법정동 상세 주소 정보를 요청합니다
			geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
		}

		// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
		function displayCenterInfo(result, status) {
			if (status === kakao.maps.services.Status.OK) {
				var infoDiv = document.getElementById('centerAddr');

				for (var i = 0; i < result.length; i++) {
					// 행정동의 region_type 값은 'H' 이므로
					if (result[i].region_type === 'H') {
						infoDiv.innerHTML = result[i].address_name;
						break;
					}
				}
			}
		}
	</script>

	<script type="text/javascript" src="../resources/js/stadiumForm.js">
		
	</script>
</body>
</html>