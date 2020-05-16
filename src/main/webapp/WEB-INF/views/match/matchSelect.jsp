<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>

    
    
    #map {
	margin-top: 69px;
}

element.style {
	overflow: hidden;
}

.info {
	padding-left: 0px;
}

.info>li {
	list-style: none;
	display: inline-block;
	width: 141px;
	height: 100px;
	margin: 0 auto;
	border-radius: 10px;
	background-color: #EEEEEE;
	text-align: center;
	margin-right: 4px;
}



.noFeature {
	opacity: 0.2;
}
    
   .c1{
  	 border-bottom: 1px solid #999999;
  	 padding-bottom: 30px;
  	 padding-top: 30px;
   }
    
     
  </style>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<c:import url="../template/matchCarousel.jsp"></c:import>

<div id="map" style="width: 100%; height: 500px; z-index: 0"></div>

    <div  style="margin: auto; width: 750px"> 
    <br><br>
			<div class = "c1"">
			<p style="font-size: 23px; font-weight: normal; margin-bottom: 1px;">${fullTime}</p>
			<p style="font-size: 30px; font-weight: bold; color: #3534A5; cursor: pointer; margin-bottom: 1px;">${stadiumVO.name}</p>
			<p style ="margin-bottom: 3px;">${stadiumVO.address}</p>
			<a class="copy">주소 복사하기&nbsp; </a><a id="map_view">| 지도 보기</a> 
			<br><br>
			<p style="font-size: 10px; font-weight: normal; color: #999999; margin-bottom: 1px">참가비 </p>
			<p style="font-size: 18px; font-weight: bold; color: #3534A5;">10,000원</p>
			</div>
			
			
			<div class="c1">
			<p>진행 방식</p>
			<ul class="info">
				<li><img alt=""
					src="../../${pageContext.request.contextPath}/resources/images/6vs6.svg"
					style="width: 90px; height: 67px;">
					<p>6 vs 6 매치</p></li>
				<c:if test="${matchVO.gender eq 1}">
					<li><img alt=""
						src="../../${pageContext.request.contextPath}/resources/images/male.svg"
						style="width: 90px; height: 67px;">
						<p>남성 매치</p></li>
				</c:if>
				<c:if test="${matchVO.gender eq 2}">
					<li><img alt=""
						src="../../${pageContext.request.contextPath}/resources/images/female.svg"
						style="width: 90px; height: 67px;">
						<p>여자 매치</p></li>
				</c:if>
				<li><img alt=""
					src="../../${pageContext.request.contextPath}/resources/images/every.svg"
					style="width: 90px; height: 67px;">
					<p>일반 매치</p></li>
				<li><img alt=""
					src="../../${pageContext.request.contextPath}/resources/images/turf.svg"
					style="width: 90px; height: 67px;">
					<p>풋살화</p></li>
				<li><img alt=""
					src="../../${pageContext.request.contextPath}/resources/images/minmax.svg"
					style="width: 90px; height: 67px;">
					<p>10~18명</p></li>
			</ul>
			<br><br>
			<p style="font-size: smaller;small; font-weight: bolder; margin-bottom: 2px;">특이사항</p>
			<p style="font-size: smaller;">·일반 매치는 실력에 상관없이 누구나 참여하실 수 있습니다.</p>
			</div>
			
			
			<div class="c1">
			<p>구장 시설</p>
			<ul class="info">
				<li><img alt=""
					src="../../${pageContext.request.contextPath}/resources/images/size.svg"
					style="width: 90px; height: 67px;">
					<p>${stadiumVO.stadiumSize}</p></li>

				<c:if test="${stadiumVO.shower eq 0}">
					<li class="noFeature"><img alt=""
						src="../../${pageContext.request.contextPath}/resources/images/shower.svg"
						style="width: 90px; height: 67px;">
						<p>샤워장</p></li>
				</c:if>
				<c:if test="${stadiumVO.shower eq 1}">
					<li><img alt=""
						src="../../${pageContext.request.contextPath}/resources/images/shower.svg"
						style="width: 90px; height: 67px;">
						<p>샤워장</p></li>
				</c:if>

				<li><img alt=""
					src="../../${pageContext.request.contextPath}/resources/images/parking.svg"
					style="width: 90px; height: 67px;"> <c:if
						test="${stadiumVO.parking eq 1}">
						<p>유료 주차</p>
					</c:if> <c:if test="${stadiumVO.parking eq 0}">
						<p>무료 주차</p>
					</c:if></li>

				<c:if test="${stadiumVO.shoes eq 0}">
					<li class="noFeature"><img alt=""
						src="../../${pageContext.request.contextPath}/resources/images/rental.svg"
						style="width: 90px; height: 67px;">
						<p>풋살화 대여</p></li>
				</c:if>
				<c:if test="${stadiumVO.shoes eq 1 }">
					<li><img alt=""
						src="../../${pageContext.request.contextPath}/resources/images/rental.svg"
						style="width: 90px; height: 67px;">
						<p>풋살화 대여</p></li>
				</c:if>

				<c:if test="${stadiumVO.cloth eq 0 }">
					<li class="noFeature"><img alt=""
						src="../../${pageContext.request.contextPath}/resources/images/rentalwear.svg"
						style="width: 90px; height: 67px;">
						<p>운동복 대여</p></li>
				</c:if>
				<c:if test="${stadiumVO.cloth eq 1 }">
					<li><img alt=""
						src="../../${pageContext.request.contextPath}/resources/images/rentalwear.svg"
						style="width: 90px; height: 67px;">
						<p>운동복 대여</p></li>
				</c:if>
			</ul>
			<br><br>
			${stadiumVO.info }
			</div>
			
			<div class="c1">
			<div style="height: 100px"><h1>매니저</h1></div>
			</div>
			
			<div class="c1">
			<div class="stadSec" id="mnCaution" style="outline: none; margin: 0px 20px; padding: 50px 0px; border-width: 0px 0px 1px; border-top-style: initial; border-right-style: initial; border-bottom-style: solid; border-left-style: initial; border-top-color: initial; border-right-color: initial; border-bottom-color: rgb(221, 221, 221); border-left-color: initial; border-image: initial; vertical-align: baseline; color: rgb(51, 51, 51); font-family: &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans CJK KR&quot;, &quot;Malgun Gothic&quot;, dotum, gulim, sans-serif; font-size: medium;"><div class="titleWrap" style="outline: none; margin: 0px 0px 10px; padding: 0px; border: 0px; vertical-align: baseline;"><h3 style="outline: none; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; font-size: 20px;">주의사항</h3></div><div class="stadInner" style="outline: none; margin: 20px 0px 0px; padding: 0px; border: 0px; vertical-align: baseline; line-height: 28px;"><ul class="matchRule" style="outline: none; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; list-style: none;"><span style="outline: none; margin: 0px 0px 20px; padding: 0px; border: 0px; vertical-align: baseline; line-height: 24px; display: block;">플랩풋볼 매치는 참가자 간의 신뢰를 바탕으로 진행됩니다.</span><h4 style="outline: none; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; font-size: 14px;">클린 플랩풋볼</h4><li style="outline: none; margin: 0px 0px 0px 20px; padding: 3px 0px; border: 0px; vertical-align: baseline; list-style: none; position: relative; line-height: 21px; font-size: 15px;">다른 참가자들을 위해 시간을 준수해 주세요.</li><li style="outline: none; margin: 0px 0px 0px 20px; padding: 3px 0px; border: 0px; vertical-align: baseline; list-style: none; position: relative; line-height: 21px; font-size: 15px;">풋살화 또는 스터드가 없는 운동화를 착용해주세요.</li>
			<li style="outline: none; margin: 0px 0px 0px 20px; padding: 3px 0px; border: 0px; vertical-align: baseline; list-style: none; position: relative; line-height: 21px; font-size: 15px;">불필요한 언행, 지시 등은 삼가해주세요.</li>
			<li style="outline: none; margin: 0px 0px 0px 20px; padding: 3px 0px; border: 0px; vertical-align: baseline; list-style: none; position: relative; line-height: 21px; font-size: 15px;">과도한 경쟁, 승부욕은 나와 상대방의 부상을 야기할 수 있습니다.</li>
			<li style="outline: none; margin: 0px 0px 0px 20px; padding: 3px 0px; border: 0px; vertical-align: baseline; list-style: none; position: relative; line-height: 21px; font-size: 15px;">폭언, 폭행은 이용 정지의 심각한 사유가 될 수 있습니다.</li>
			</ul>
			<ul class="matchRule" style="outline: none; margin: 20px 0px 0px; padding: 0px; border: 0px; vertical-align: baseline; list-style: none;"><h4 style="outline: none; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; font-size: 14px;">이용 제한이 되는 경우</h4><li style="outline: none; margin: 0px 0px 0px 20px; padding: 3px 0px; border: 0px; vertical-align: baseline; list-style: none; position: relative; line-height: 21px; font-size: 15px;">페어 플레이 포인트에 따라 이용이 제한될 수 있습니다.</li><li style="outline: none; margin: 0px 0px 0px 20px; padding: 3px 0px; border: 0px; vertical-align: baseline; list-style: none; position: relative; line-height: 21px; font-size: 15px;">81~90포인트: 2주 서비스 이용 제한</li><li style="outline: none; margin: 0px 0px 0px 20px; padding: 3px 0px; border: 0px; vertical-align: baseline; list-style: none; position: relative; line-height: 21px; font-size: 15px;">71~80포인트: 1개월 서비스 이용 제한</li><li style="outline: none; margin: 0px 0px 0px 20px; padding: 3px 0px; border: 0px; vertical-align: baseline; list-style: none; position: relative; line-height: 21px; font-size: 15px;">70포인트 이하: 3개월 서비스 이용 제한</li><li style="outline: none; margin: 0px 0px 0px 20px; padding: 3px 0px; border: 0px; vertical-align: baseline; list-style: none; position: relative; line-height: 21px; font-size: 15px;">3개월 이용 제한 복귀 후 추가 벌점이(10점 이상) 부여될 경우 서비스 이용이 영구 제한됩니다.</li></ul><ul class="matchRule" style="outline: none; margin: 20px 0px 0px; padding: 0px; border: 0px; vertical-align: baseline; list-style: none;"><h4 style="outline: none; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; font-size: 14px;">포인트 차감 기준</h4><li style="outline: none; margin: 0px 0px 0px 20px; padding: 3px 0px; border: 0px; vertical-align: baseline; list-style: none; position: relative; line-height: 21px; font-size: 15px;">지각: -3포인트</li><li style="outline: none; margin: 0px 0px 0px 20px; padding: 3px 0px; border: 0px; vertical-align: baseline; list-style: none; position: relative; line-height: 21px; font-size: 15px;">성별 불일치: -5포인트</li><li style="outline: none; margin: 0px 0px 0px 20px; padding: 3px 0px; border: 0px; vertical-align: baseline; list-style: none; position: relative; line-height: 21px; font-size: 15px;">축구화 착용: -5포인트</li><li style="outline: none; margin: 0px 0px 0px 20px; padding: 3px 0px; border: 0px; vertical-align: baseline; list-style: none; position: relative; line-height: 21px; font-size: 15px;">금연 구장에서의 흡연: -5포인트</li><li style="outline: none; margin: 0px 0px 0px 20px; padding: 3px 0px; border: 0px; vertical-align: baseline; list-style: none; position: relative; line-height: 21px; font-size: 15px;">무단 불참: -10포인트</li><li style="outline: none; margin: 0px 0px 0px 20px; padding: 3px 0px; border: 0px; vertical-align: baseline; list-style: none; position: relative; line-height: 21px; font-size: 15px;">무단 이탈: -10포인트</li><li style="outline: none; margin: 0px 0px 0px 20px; padding: 3px 0px; border: 0px; vertical-align: baseline; list-style: none; position: relative; line-height: 21px; font-size: 15px;">불필요한 신체 접촉 (보복성 행위, 거친 몸싸움): -10포인트</li><li style="outline: none; margin: 0px 0px 0px 20px; padding: 3px 0px; border: 0px; vertical-align: baseline; list-style: none; position: relative; line-height: 21px; font-size: 15px;">다른 대상에 대한 공격적 언행 (지시, 명령, 짜증, 반말, 욕설): -10포인트</li><li style="outline: none; margin: 0px 0px 0px 20px; padding: 3px 0px; border: 0px; vertical-align: baseline; list-style: none; position: relative; line-height: 21px; font-size: 15px;">경기 분위기 저해 (비협조적 태도): -10포인트</li><li style="outline: none; margin: 0px 0px 0px 20px; padding: 3px 0px; border: 0px; vertical-align: baseline; list-style: none; position: relative; line-height: 21px; font-size: 15px;">폭행: -30포인트</li><li style="outline: none; margin: 0px 0px 0px 20px; padding: 3px 0px; border: 0px; vertical-align: baseline; list-style: none; position: relative; line-height: 21px; font-size: 15px;">모든 점수는 신청자 기준으로 신청자 본인 및 동행인이 벌점에 해당되는 행위를 할 시 신청자에게 벌점이 부여됩니다.</li><li style="outline: none; margin: 0px 0px 0px 20px; padding: 3px 0px; border: 0px; vertical-align: baseline; list-style: none; position: relative; line-height: 21px; font-size: 15px;">이유를 불문하고 상호 간 폭행이 일어나는 경우 벌점이 부여됩니다.</li></ul></div></div><div class="stadSec" id="mnTerm" style="outline: none; margin: 0px 20px; padding: 50px 0px; border-width: 0px 0px 1px; border-top-style: initial; border-right-style: initial; border-bottom-style: solid; border-left-style: initial; border-top-color: initial; border-right-color: initial; border-bottom-color: rgb(221, 221, 221); border-left-color: initial; border-image: initial; vertical-align: baseline; color: rgb(51, 51, 51); font-family: &quot;Apple SD Gothic Neo&quot;, &quot;Noto Sans CJK KR&quot;, &quot;Malgun Gothic&quot;, dotum, gulim, sans-serif; font-size: medium;"><div class="titleWrap" style="outline: none; margin: 0px 0px 10px; padding: 0px; border: 0px; vertical-align: baseline;"><h3 style="outline: none; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; font-size: 20px;">취소/환불</h3></div><div class="stadInner" style="outline: none; margin: 20px 0px 0px; padding: 0px; border: 0px; vertical-align: baseline; line-height: 28px;"><ul class="matchRule" style="outline: none; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; vertical-align: baseline; list-style: none;"><h4 style="outline: none; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; font-size: 14px;">매치가 취소되는 경우</h4><li style="outline: none; margin: 0px 0px 0px 20px; padding: 3px 0px; border: 0px; vertical-align: baseline; list-style: none; position: relative; line-height: 21px; font-size: 15px;">각 구장별 최소 인원 (6 vs 6 구장 10명 / 5 vs 5 구장 8명) 이 되지 않을 경우 경기가 취소 될 수 있으며 진행 여부 안내는 1시간 30분 전까지 카카오톡 알림톡을 통해 안내드리고 있습니다.</li><li style="outline: none; margin: 0px 0px 0px 20px; padding: 3px 0px; border: 0px; vertical-align: baseline; list-style: none; position: relative; line-height: 21px; font-size: 15px;">당일 기상악화의 경우에도 환급율은 동일하며 신청 전 꼭 기상 확인 바랍니다.</li><li style="outline: none; margin: 0px 0px 0px 20px; padding: 3px 0px; border: 0px; vertical-align: baseline; list-style: none; position: relative; line-height: 21px; font-size: 15px;">인원이 모집되는 경우 우천 시에도 진행되며 참석이 어려울 경우 진행 확정 전 사전 취소 부탁드립니다.</li><li style="outline: none; margin: 0px 0px 0px 20px; padding: 3px 0px; border: 0px; vertical-align: baseline; list-style: none; position: relative; line-height: 21px; font-size: 15px;">경기 중 플레이가 어려울 정도로 비가 오는 경우에는 현장에서 판단합니다.</li></ul><ul class="matchRule" style="outline: none; margin: 20px 0px 0px; padding: 0px; border: 0px; vertical-align: baseline; list-style: none;"><h4 style="outline: none; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; font-size: 14px;">신청을 취소할 경우</h4><li style="outline: none; margin: 0px 0px 0px 20px; padding: 3px 0px; border: 0px; vertical-align: baseline; list-style: none; position: relative; line-height: 21px; font-size: 15px;">당일 기상악화의 경우에도 환급율은 동일하며 신청 전 꼭 기상 확인 바랍니다.</li><li style="outline: none; margin: 0px 0px 0px 20px; padding: 3px 0px; border: 0px; vertical-align: baseline; list-style: none; position: relative; line-height: 21px; font-size: 15px;">인원이 모집되는 경우 우천 시에도 진행됩니다.</li><li style="outline: none; margin: 0px 0px 0px 20px; padding: 3px 0px; border: 0px; vertical-align: baseline; list-style: none; position: relative; line-height: 21px; font-size: 15px;">매치시작 1시간 30분 전까지 취소하지 않고 불참하면 향후 이용 제한이 있습니다.</li><li style="outline: none; margin: 0px 0px 0px 20px; padding: 3px 0px; border: 0px; vertical-align: baseline; list-style: none; position: relative; line-height: 21px; font-size: 15px;">신청 취소 시 아래 환불 규정에 따라 환불이 진행됩니다.</li></ul><ul class="matchRule" style="outline: none; margin: 20px 0px 0px; padding: 0px; border: 0px; vertical-align: baseline; list-style: none;"><h4 style="outline: none; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; font-size: 14px;">환불 규정</h4><li style="outline: none; margin: 0px 0px 0px 20px; padding: 3px 0px; border: 0px; vertical-align: baseline; list-style: none; position: relative; line-height: 21px; font-size: 15px;">경기 2일 전 신청 취소시: 전액 환급</li><li style="outline: none; margin: 0px 0px 0px 20px; padding: 3px 0px; border: 0px; vertical-align: baseline; list-style: none; position: relative; line-height: 21px; font-size: 15px;">경기 1일 전 신청 취소시: 참가비의 80% 환금</li><li style="outline: none; margin: 0px 0px 0px 20px; padding: 3px 0px; border: 0px; vertical-align: baseline; list-style: none; position: relative; line-height: 21px; font-size: 15px;">경기 당일 1시간 30분 전까지 취소 시: 참가비의 20% 환급</li><li style="outline: none; margin: 0px 0px 0px 20px; padding: 3px 0px; border: 0px; vertical-align: baseline; list-style: none; position: relative; line-height: 21px; font-size: 15px;">경기 당일 1시간 30분 미만 취소시: 0%</li><li style="outline: none; margin: 0px 0px 0px 20px; padding: 3px 0px; border: 0px; vertical-align: baseline; list-style: none; position: relative; line-height: 21px; font-size: 15px;">원활한 경기 진행을 위해 당일 1시간 30분 전까지 꼭 일정을 확정지어 취소 신청 부탁드립니다.</li><li style="outline: none; margin: 0px 0px 0px 20px; padding: 3px 0px; border: 0px; vertical-align: baseline; list-style: none; position: relative; line-height: 21px; font-size: 15px;">인원 부족으로 경기가 취소될 경우에는 최소 1시간 30분 전에 개별적으로 매치 취소 안내를 드리며 해당 캐시는 당일내로 전액 환급 처리됩니다.</li><li style="outline: none; margin: 0px 0px 0px 20px; padding: 3px 0px; border: 0px; vertical-align: baseline; list-style: none; position: relative; line-height: 21px; font-size: 15px;">경기 중 부상에 대한 책임은 해당 개인에게 귀속됩니다.</li></ul></div></div>
			</div>
      
      		<a href="./matchDelete?num=${matchVO.num}" class="btn btn-default">글 지우기</a>
      		<a href="./matchUpdate?num=${matchVO.num}" class="btn btn-default">글 수정</a>
    </div>
  
	
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c5126e0fcae8eba0e1ed7a9c58dc7812"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(${stadiumVO.location_k},${stadiumVO.location_w}), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 마커가 표시될 위치입니다 
		var markerPosition = new kakao.maps.LatLng(${stadiumVO.location_k},${stadiumVO.location_w});

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
				if (map_view == "| 지도 보기") {
					$("#map_view").text("| 지도 닫기");
					$("#map").css("z-index", "2");
				} else if (map_view == "| 지도 닫기") {
					$("#map_view").text("| 지도 보기");
					$("#map").css("z-index", "0");
				}
			});

		});
	</script>

</body>
</html>