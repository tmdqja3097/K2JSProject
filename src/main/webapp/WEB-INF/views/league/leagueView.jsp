<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>K2JS 리그 정보현황</title>
<c:import url="../template/boot.jsp" />
<style type="text/css">
body {
	padding: 0 20%;
	box-sizing: border-box;
}

.slide_edge {
	border-radius: 50px;
}

/* 매치, 리그, 고객상담 (헤더 아래) */
.header_wrapper {
	width: 100%;
	height: 72px;
}

.hearder_wrapper2 {
	width: 80%;
	height: 72px;
	border: 1px solid red;
	margin-bottom: 30px;
}

.match_box {
	width: 25%;
	height: 45px;
}

.match_box>a {
	font-size: 24px;
	text-decoration: none;
	color: #333;
	margin: 0 20px;
}

/* 헤더-상단바 */
.top-bar {
	background-color: black;
	border: none;
	border-color: red;
	background-color: black;
}

.navbar {
	margin-bottom: 0;
	border-radius: 0;
	background-color: white;
	border-color: red;
}

.navbar_header {
	width: 100px;
	height: 50px;
}

#myCarousel>a {
	border-radius: 50px;
	z-index: 0;
	background-image: none;
}

/* 일정 */
.oneday_header {
	width: 100%;
	height: 681px;
	margin-top: 70px;
}

.oneday_top {
	width: 100%;
	height: 85px;
}

.oneday_body {
	width: 100%;
	height: 500px;
}

.card_man {
	margin-top: 40px;
	margin-left: 30%;
}

.card_sub {
	display: inline-block;
	width: 35%;
	height: 65px;
	text-align: center;
	cursor: pointer;
	background-color: #fafafa;
	border-radius: 10px;
	padding-top: 10px;
}

.one_man>li {
	display: inline-block;
	border: 1px solid blue;
	width: 100%;
	height: 173px;
	padding: 15px;
}

/* 랭킹 헤더 */
.ranks_card {
	width: 100%;
	height: 500px;
	margin-bottom: 60px;
}

/* "랭킹" */
.ranks_top {
	width: 100%;
	height: 85px;
}

/* "랭킹 순위" */
.ranks_body {
	width: 100%;
	height: 500px;
}

/* 리그 헤더 */
.card_rule {
	width: 100%;
	height: 459px;
	margin-top: 30px;
	margin-bottom: 30px;
	text-align: center;
}

/* 리그 헤더 안에 박스 */
.rule_box {
	width: 100%;
	height: 300px;
}

/* 리그 헤더 안에 작은 박스 */
.rule_he {
	width: 100%;
	height: 72px;
	margin-top: 10px;
	text-align: left;
}

.rule_ul {
	width: 100%;
	height: 300px;
}

.rule_ul>li {
	/* border: 1px solid blue; */
	width: 50%;
	height: 150px;
}

#rl1 {
	border-bottom: 1px solid #ddd;
	border-right: 1px solid #ddd;
}

#rl2 {
	border-left: 1px solid #ddd;
	border-bottom: 1px solid #ddd;
}

#rl3 {
	border-left: 1px solid #ddd;
	border-top: 1px solid #ddd;
}

#rl4 {
	border-right: 1px solid #ddd;
	border-top: 1px solid #ddd;
}
</style>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<!-- 	c:import - 불러오기 -->
	<%-- <input type="hidden" value="${gender}" id="selectGender"> --%>
	<div id="box_mat"
		style="width: 100%; display: inline-block; margin-bottom: 10px;">
		<a id="match_btn" class="match"
			href="${pageContext.request.contextPath}">매치</a> <a id="league_btn"
			class="match selected"
			href="${pageContext.request.contextPath}/league/leagueView">리그</a>
	</div>


	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
		</ol>

		<!-- Wrapper for slides -->

		<div class="carousel-inner slide_edge">
			<div class="item active" id="manItem">
				<img
					src="${pageContext.request.contextPath}/resources/images/man.PNG"
					alt="Chicago" style="width: 100%;" height="50px" id="manImg">
				<div class="carousel-caption"></div>
			</div>
			<div class="item" id="womanItem">
				<img
					src="${pageContext.request.contextPath}/resources/images/woman.PNG"
					alt="Los Angeles" style="width: 100%;" height="50px" id="womanImg">
				<div class="carousel-caption"></div>
			</div>
		</div>
	</div>


	<div class="card" style="width: 100%; height: 150px;">
		<div class="card_car" style="width: 100%; height: 65px;">
			<ul class="card_man" style="width: 35%; height: 65px;">
				<a href="./leagueGender?gender=1"
					style="text-decoration: none; color: black;">
					<li class="card_sub" id="cs1" style="float: left;"><img alt=""
						src="${pageContext.request.contextPath}/resources/images/manGraph.svg"
						style="width: 100%; height: 25px;"> 남자 랭킹</li>
				</a>
				<a href="./leagueGender?gender=2"
					style="text-decoration: none; color: black;">
					<li class="card_sub" id="cs2" style="float: right;"><img
						alt=""
						src="${pageContext.request.contextPath}/resources/images/womanGraph.svg"
						style="width: 100%; height: 25px;"> 여자 랭킹</li>
				</a>
			</ul>
		</div>
	</div>



	<div class="ranks_card">
		<div class="ranks_top">
			<h2>랭킹</h2>
			<!-- <a href="./manRanks"> 원데이리그 남성 </a> 
			<a href="./womanRanks"> 원데이리그 여성 </a> -->
			<div class="ranks_body">

				<table class="table">
					<tr style="font-weight: bolder;">
						<td>순위/팀</td>
						<td>승률</td>
						<td>승</td>
						<td>무</td>
						<td>패</td>
						<td>점수</td>
					</tr>
					<c:forEach items="${leagues}" var="lea">
						<c:if test="${lea.rank le 10}">
							<tr>
								<td><span>${lea.rank} &nbsp;&nbsp;&nbsp;&nbsp;</span><a
									href="./leagueSelect?teamName=${lea.teamName}"
									style="text-decoration: none;">${lea.teamName}</a></td>
								<td><fmt:formatNumber pattern="#.#" value="${lea.winRate}"></fmt:formatNumber>%</td>
								<td>${lea.win}</td>
								<td>${lea.draw}</td>
								<td>${lea.lose}</td>
								<td style="color: #FF5D5D;">${lea.point}</td>
							</tr>
						</c:if>
					</c:forEach>
				</table>
				<c:if test="${member.id eq 'admin'}">
					<a href="./leagueWrite" class="btn btn-default">리그 작성</a>
				</c:if>
				<a href="./leagueTotal"
					style="float: right; text-decoration: none; color: #333;">전체 순위
					보기</a>

			</div>
		</div>
	</div>


	<div class="card_rule">
		<div class="rule_he">
			<h2>리그 규칙</h2>
		</div>

		<div class="rule_box">
			<ul class="rule_ul" style="list-style: none;">
				<li id="rl1" style="display: inline-block;">
					<h3 style="padding-top: 25px;">👋🏻</h3>
					<p style="margin-top: 10px">골킥은 무조건 손으로</p>
				</li>

				<li id="rl2" style="display: inline-block; float: right;">
					<h3 style="padding-top: 25px;">⌛</h3>
					<p style="margin-top: 10px">킥인은 4초 안에</p>
				</li>

				<li id="rl3" style="display: inline-block;">
					<h3 style="padding-top: 25px;">🔙</h3>
					<p style="margin-top: 10px">백패스는 1번만</p>
				</li>

				<li id="rl4" style="display: inline-block; float: left;">
					<h3 style="padding-top: 25px;">😬</h3>
					<p style="margin-top: 10px">위반시 간접 프리킥</p>
				<li>
			</ul>
		</div>
	</div>

	<c:import url="../template/footer.jsp"></c:import>

	<script type="text/javascript">
		$("#cs1").mouseover(function() {
			$("#cs1").css("background-color", "#4A00FF");
			$("#cs1").css("color", "white");
		});
		$("#cs1").mouseout(function() {
			$("#cs1").css("background-color", "#fafafa");
			$("#cs1").css("color", "black");
		});
		$("#cs2").mouseover(function() {
			$("#cs2").css("background-color", "#4A00FF");
			$("#cs2").css("color", "white");
		});
		$("#cs2").mouseout(function() {
			$("#cs2").css("background-color", "#fafafa");
			$("#cs2").css("color", "black");
		});

		$("#mb1").click(function() {
			$("#mb1").css("border-bottom", "2px solid #FFC645");
			$("#mb1").css("color", "#FFC645");
		});

		$("#mb2").click(function() {
			$("#mb2").css("border-bottom", "2px solid #FFC645");
			$("#mb2").css("color", "#FFC645")
		});

		$("#womanImg")
				.click(
						function() {
							location.href = "${pageContext.request.contextPath}/league/leagueGender?gender=2";
							/* selectGender(); */
						});

		$("#manImg")
				.click(
						function() {
							location.href = "${pageContext.request.contextPath}/league/leagueGender?gender=1";
							/* selectGender(); */
						});
/* 		function selectGender() {
			var selectGender = $("#selectGender").val();
			if(selectGender== 2){
				$("#womanItem").addClass("active");
				$("#manItem").removeClass("active")
			}
		} */
	</script>

</body>
</html>