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

/* match-filter */
.match-result {
	width: 10%;
	height: 30px;
	float: left;
	text-align: center;
}

.match-wrapper {
	margin-left: 82%;
	position: relative;
}

.match-wrapper p {
	text-align: left;
	display: inline;
}

/* match-filter */

/* modal */
.filterCheck {
	float: left;
	opacity: 0;
	width: 5px;
	height: 5px;
}

.checkLabel {
	background-color: #ffc645;
	width: 50px;
	height: 30px;
	text-align: center;
	border-radius: 30px;
	padding-top: 5px;
	float: left;
	cursor: pointer;
}

/* calendar */
#dDayMatch {
	padding: 0 0 0 0;
}



</style>
<body>
	<c:import url="./template/header.jsp"></c:import>
	<div>
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


	<div>
		<div class="match_filter"></div>

		<ul id="dDayMatch" class="myUL">
		</ul>

		<a href="./match/matchWrite" class="btn btn-default"
			style="margin-left: 93%">글쓰기</a>
	</div>



		<div class="modal fade" id="layerpop1">
			<div class="modal-dialog">
				<div class="modal-content" style="border-radius: 30px;">

					<!-- header -->
					<div class="modal-header" style="margin-top: 10px;">
						<!-- 닫기(x) 버튼 -->
						<button type="button" class="close" data-dismiss="modal">취소</button>
						<!-- header title -->
						<h4 class="modal-title">경기장 또는 지역</h4>
					</div>
					<!-- body -->

					<div class="modal-body" style="height: 150px;">
						<div class="modal-body-filter">
							<h4>지역을 선택하세요</h4>
							<ul class="modal-list"
								style="list-style: none; padding-top: 10px;">
								<li><input type="checkbox" id="ml1" class="filterCheck"
									name="filterAddr" value="seoul"> <label id="mlL1"
									for="ml1" class="checkLabel">서울</label></li>
								<li><input type="checkbox" id="ml2" class="filterCheck"
									name="filterAddr" value="daegu"> <label id="mlL2"
									for="ml2" class="checkLabel">대구</label></li>
								<li><input type="checkbox" id="ml3" class="filterCheck"
									name="filterAddr" value="gyeonggi"> <label id="mlL3"
									for="ml3" class="checkLabel">경기</label></li>
								<li><input type="checkbox" id="ml4" class="filterCheck"
									name="filterAddr" value="gwangju"> <label id="mlL4"
									for="ml4" class="checkLabel">광주</label></li>
								<li><input type="checkbox" id="ml5" class="filterCheck"
									name="filterAddr" value="daejeon"> <label id="mlL5"
									for="ml5" class="checkLabel">대전</label></li>
								<li><input type="checkbox" id="ml6" class="filterCheck"
									name="filterAddr" value="incheon"> <label id="mlL6"
									for="ml6" class="checkLabel">인천</label></li>
								<li><input type="checkbox" id="ml7" class="filterCheck"
									name="filterAddr" value="busan"> <label id="mlL7"
									for="ml7" class="checkLabel">부산</label></li>
								<li><input type="checkbox" id="ml8" class="filterCheck"
									name="filterAddr" value="ulsan"> <label id="mlL8"
									for="ml8" class="checkLabel">울산</label></li>
								<li><input type="checkbox" id="ml9" class="filterCheck"
									name="filterAddr" value="chungbug"> <label id="mlL9"
									for="ml9" class="checkLabel">충북</label></li>
							</ul>

						</div>
					</div>
					<!-- Footer -->
					<div class="modal-footer" 
						data-dismiss="modal" style="background-color: #ffc645; border-bottom-left-radius: 30px; border-bottom-right-radius: 30px; text-align: center; cursor: pointer;">
						<h5>적용하기</h5>

					</div>    

				</div>
			</div>
		</div>

	<div class="modal fade" id="layerpop2">
		<div class="modal-dialog">
			<div class="modal-content" style="border-radius: 30px;">

				<!-- header -->
				<div class="modal-header" style="margin-top: 10px;">
					<!-- 닫기(x) 버튼 -->
					<button type="button" class="close" data-dismiss="modal">취소</button>
					<!-- header title -->
					<h4 class="modal-title">카테고리</h4>
				</div>
				<!-- body -->
				<div class="modal-body" style="height: 400px;">
					<div class="modal-body-filter">
						<ul class="modal-list1" style="list-style: none;">
							<h4>성별</h4>
							<br>
							<li><input type="checkbox" id="gender_m" class="filterCheck"
								value="1"> <label id="mlL-1" for="gender_m"
								class="checkLabel">남성</label></li>
							<li><input type="checkbox" id="gender_w" class="filterCheck"
								value="2"> <label id="mlL-2" for="gender_w"
								class="checkLabel">여성</label></li>
							<li><input type="checkbox" id="gender_u" class="filterCheck"
								value="0"> <label id="mlL-3" for="gender_u"
								class="checkLabel" style="width: 90px;">남녀 모두</label></li>
						</ul>
						<ul class="modal-list1">
							<h4>개인/팀</h4>
							<br>
							<li><input type="checkbox" id="type_match"
								class="filterCheck" value="match"> <label id="mlL-4"
								for="type_match" class="checkLabel">개인</label></li>
							<li><input type="checkbox" id="type_cup" class="filterCheck"
								value="cup"> <label id="mlL-5" for="type_cup"
								class="checkLabel">팀</label></li>
						</ul>
						<ul class="modal-list1">
							<h4>레벨</h4>
							<br>
							<li><input type="checkbox" id="level_begin"
								class="filterCheck" value="begin"> <label id="mlL-6"
								for="level_begin" class="checkLabel">초급</label></li>
							<li><input type="checkbox" id="level_middle"
								class="filterCheck" value="middle"> <label id="mlL-7"
								for="level_middle" class="checkLabel">중급</label></li>
							<li><input type="checkbox" id="level_every"
								class="filterCheck" value="every"> <label id="mlL-8"
								for="level_every" class="checkLabel" style="width: 70px;">누구나</label></li>
						</ul>
					</div>
				</div>
				<!-- Footer -->
				<div class="modal-footer"
					style="background-color: #ffc645; border-bottom-left-radius: 30px; border-bottom-right-radius: 30px; text-align: center; cursor: pointer;">
					<h5>적용하기</h5>

				</div>

			</div>
		</div>
	</div>



	<script type="text/javascript">
		var sysdate = new Date();
		var count = 0;
		var startDay = parseInt((sysdate.getDate() + 100 + "").substr(1, 3));
		var selectDay = startDay;
		var daily = "";

		getList(startDay);
		getMatch(selectDay);

		function getFilter(startDay) {
			$.get("getFilter?day=" + startDay, function(result) {
				$(".match_filter").append(result);
			});
		}

		// 화살표 누르면 시작 날짜 변환
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

		function getMatch(selectDay) {
			$.get("getMatch?matchTime=" + selectDay, function(result) {
				console.log(result);
				$("#dDayMatch").append(result);
			})
		}

		// 날짜 누르면 해당 날짜의 경기 리스트 화면에 출력
		$("#day-list").on("click", ".day-list", function() {

			$("#dDayMatch").empty();
			var days = $(this).text().split('/');
			selectDay = parseInt(days[0]);
			days[1]
			getMatch(selectDay);

		});

		$(function() {
			$("#all-area").click(function() {
				$('div.modal').modal({
					remote : 'layer.html'
				});
			});
		});

		$(document).ready(function() {

			for (var i = 1; i < 10; i++) {
				$("#mlL" + i).toggleClass("unchecked");
				$("#mlL" + i).click(function() {
					var text1 = $(".btn-all-area").text();
					$(this).toggleClass("checked");

					if (!$("#ml" + i).checked) {

						if (text1 == "모든 지역") {
							$(".btn-all-area").text("선택 지역");
						} else {
							$(".btn-all-area").text("모든 지역");
						}

					} else {
						$(".btn-all-area").text("모든 지역");
					}

				});

				$("#mlL-" + i).toggleClass("uncheck");
				$("#mlL-" + i).click(function() {
					var text2 = $(".btn-all-match").text();
					$(this).toggleClass("check");
				});

			}

		});

		$(".modal-footer").click(function() {
			var addressArray = [];

			$("input[name='filterAddr']:checked").each(function() {
				addressArray.push($(this).val());
			});

			$.ajax({
				url : "getMatch",
				type : "post",
				data : {
					addressList : addressArray,
					day : selectDay
				},
				traditional : true,
				success : function(result) {  
					$("#layerpop1").modal('hide');        
					
					$("#dDayMatch").empty();
					$("#dDayMatch").append(result);
				},
				error : function(result) {
					console.log(result);
				}
			});
		});

	</script>



</body>
</html>
