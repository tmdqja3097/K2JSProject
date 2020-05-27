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
	text-align: center;
}

.match-wrapper {
	margin-left: 0px;
}

.match-wrapper p {
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

.preNext {
	background-color: white;
	border: none;
	outline: none;
}

.dateNum {
	font-size: 20px;
	font-family: 'Apple SD Gothic Neo', 'Noto Sans CJK KR', 'Malgun Gothic',
		'dotum', 'gulim', sans-serif;
}

.yoil {
	font-family: 'Apple SD Gothic Neo', 'Noto Sans CJK KR', 'Malgun Gothic',
		'dotum', 'gulim', sans-serif;
	font-size: 13px;
}

.day-list {
	display: inline-block;
	height: 100px;
	margin: 0 0.4%;
	width: 11%;
	float: left;
}

#day-list>li>a:hover {
	color: white;
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
	<!-- <div id="match-box" class="btn" style="width: 100%; height: 100px;">
		<div style="width: 5%; height: 100px; float: left;">
			<button id="next" class="btn daybutton">→</button>
		</div>
			<div id="list"
				style="width: 90%; height: 100px; float: left; overflow: hidden;">
				<ul class="nav nav-tabs" id="day-list">
				</ul>
			</div>
			<div>
			<button id="next" class="preNext">→</button>
		</div>
	</div> -->


	<div id="match-box" style="width: 100%; height: 100px;">
		<div style="width: 5%; height: 100px; float: left;">
			<button id="pre" class="preNext">←</button>
		</div>
		<div id="list"
			style="width: 90%; height: 100px; float: left; overflow: hidden;">
			<ul class="nav nav-tabs" id="day-list">
			</ul>
		</div>
		<div style="width: 5%; height: 100px; float: left;">
			<button id="next" class="preNext" disabled="">→</button>
		</div>
	</div>


	<div>
		<ul id="dDayMatch" class="myUL">
		</ul>

		<a href="./match/matchWrite" class="btn btn-default"
			style="float: right;">매치 추가하기</a> <a href="./stadium/addStadium"
			class="btn btn-default" style="float: right; margin-right: 10px;">구장
			추가하기</a>
	</div>

	<div class="modal fade" id="layerpop">
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
						<ul class="modal-list" style="list-style: none;">
							<li><input type="checkbox" id="ml1" class="filterCheck grey"
								value="1"> <label id="mlL1" for="ml1" class="checkLabel">서울</label></li>
							<li><input type="checkbox" id="ml2" class="filterCheck grey"
								value="2"> <label id="mlL2" for="ml2" class="checkLabel">대구</label></li>
							<li><input type="checkbox" id="ml3" class="filterCheck"
								value="3"> <label id="mlL3" for="ml3" class="checkLabel">경기</label></li>
							<li><input type="checkbox" id="ml4" class="filterCheck"
								value="4"> <label id="mlL4" for="ml4" class="checkLabel">광주</label></li>
							<li><input type="checkbox" id="ml5" class="filterCheck"
								value="5"> <label id="mlL5" for="ml5" class="checkLabel">대전</label></li>
							<li><input type="checkbox" id="ml6" class="filterCheck"
								value="6"> <label id="mlL6" for="ml6" class="checkLabel">인천</label></li>
							<li><input type="checkbox" id="ml7" class="filterCheck"
								value="7"> <label id="mlL7" for="ml7" class="checkLabel">부산</label></li>
							<li><input type="checkbox" id="ml8" class="filterCheck"
								value="8"> <label id="mlL8" for="ml8" class="checkLabel">울산</label></li>
							<li><input type="checkbox" id="ml9" class="filterCheck"
								value="9"> <label id="mlL9" for="ml9" class="checkLabel">충북</label></li>
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


	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">코로나 전염확산 주의 안내</h4>
				</div>
				<div class="modal-body">
					<p>근래 확진자가 다녀간 지역을 방문하셨거나,</p>
					<p>코로나 관련 증상이 있으신 회원님은</p>
					<p>단체참여를 자제하여 주시기 바랍니다.</p>
				</div>
				<div class="modal-footer">
					<input type="checkbox" id="chbox" title="noRepeat"> <label
						for="noRepeat">오늘 하루 동안 그만 보기</label>
					<button type="button" class="btn btn-default" data-dismiss="modal"
						id="modalbtn">Close</button>
				</div>
			</div>

		</div>
	</div>
	<script type="text/javascript">
		$("#modalbtn").on("click", function() {
			closeModal();
		})
		function setCookie(name, value, day) {
			var today = new Date();
			today.setDate(today.getDate() + day);
			document.cookie = name + "=" + value + "; path=/; expires="
					+ today.toGMTString() + ";";
		}
		function closeModal() {
			if ($("#chbox").prop("checked") == true) {
				setCookie("popUpexe", 1, 1);
			}
		}
		cookiedata = document.cookie;
		window.onload = function() {
			if (cookiedata.indexOf("popUpexe=1") < 0) {
				$("#myModal").modal();
			}
		};
		var sysdate = new Date();
		var count = 0;
		var startDay = parseInt((sysdate.getDate() + 100 + "").substr(1, 3));
		if (count == 0) {
			var selectDay = startDay;
		}

		var daily = "";

		getList(startDay);
		getMatch(selectDay);
		getSelectDay(selectDay);
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
				$("#dDayMatch").append(result);
			})
		}

		// 날짜 누르면 해당 날짜의 경기 리스트 화면에 출력
		$("#day-list").on("click", ".day-list", function() {
			$("#dDayMatch").empty();
			var days = $(this).text().split('/');
			selectDay = parseInt(days[0]);
			getMatch(selectDay);
		});

		function getSelectDay(selectDay) {
			$("#day-list").on("click", ".day-list", function() {
				$(".day-list").css("background-color", "white");
				$(this).css("background-color", "#3534A5");
			});
		}

		function getFixDay(selectDay) {

		}

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
					var text = $(".btn-all-area").text();
					$(this).toggleClass("checked");

					if (!$("#ml" + i).checked) {

						if (text == "모든 지역") {
							$(".btn-all-area").text("선택 지역");
						} else {
							$(".btn-all-area").text("모든 지역");
						}

					} else {
						$(".btn-all-area").text("모든 지역");
					}

				});

			}

		});

		var v1 = $("#ml1").val();
		$(".modal-footer").click(function() {
			if ($("#ml1").prop("checked")) {
				//var vv1 = Number(v1); 
				$.get("./match/matchSelect?address=" + v1, function() {
				});
			}
		});
	</script>
</body>
</html>
