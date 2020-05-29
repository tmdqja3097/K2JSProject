<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>K2JS 소개</title>
<c:import url="./template/boot.jsp"></c:import>
<style type="text/css">
body {
	padding: 0 0;
	height: 100%;
}

.header {
	height: 80px;
}

.heroNew {
	background-size: cover;
	background-position: bottom;
	background-image: url("./resources/images/plab2.png");
	background-size: cover;
	margin-bottom: 50px;
	height: 700px;
}

.when {
	width: 28%;
	margin: 0 auto;
	overflow: hidden;
	margin-bottom: 10px;
}

element.style {
	width: 100%;
	display: none;
}

.mySlides.aniTop {
	position: relative;
	animation: animatetop 0.4s;
}

img {
	vertical-align: middle;
}

.ourVoice img {
	width: 25%;
}

.ourVoice img {
	width: 30%;
	text-align: center;
	margin: 0 auto;
	display: block;
}

.aboutTitle {
	padding: 0 20px;
}

.aboutTitle .hen {
	font-size: 54px;
	-webkit-text-stroke: 2px black;
}

.aboutTitle .hen {
	font-size: 44px;
}

.aboutTitle h1 {
	font-size: 40px;
	line-height: 46px;
}

.aboutTitle h1 {
	font-size: 32px;
	font-weight: 700;
	text-align: center;
	word-break: keep-all;
	line-height: 44px;
}

.aboutTitle p {
	font-size: 20px;
	color: #666;
	margin-top: 10px;
	font-weight: 300;
}

.subFeature {
	height: 200px;
}

.aboutSec .subFeature ul {
	overflow: auto;
}

ol, ul, li {
	list-style: none;
}

.subFeature ul li {
	float: left;
	width: 33.333%;
	padding: 0 3%;
	text-align: center;
	margin: 30px 0;
	text-align: center;
	display: inline-block;
}

ul {
	display: block;
	list-style-type: disc;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	padding-inline-start: 40px;
	margin-bottom: 100px;
}

.subFeature ul li .feature .featureTxt h3 {
	font-size: 24px;
	margin: 10px 0;
}

.subFeature ul li p {
	font-size: 18px;
	color: #999;
	line-height: 24px;
}

.mainFeature .aboutTitle {
	padding: 0 20px;
}

.aboutSec .mainFeature {
	text-align: center;
	margin-bottom: 30px;
}

h2 {
	display: block;
	font-size: 1.5em;
	margin-block-start: 0.83em;
	margin-block-end: 0.83em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	font-weight: bold;
}

.mainFeature .aboutTitle p {
	font-size: 20px;
	color: #666;
	margin-top: 10px;
	font-weight: 300;
	line-height: 24px;
	word-break: keep-all;
}

.mainFeature .aboutImg {
	margin-bottom: 50px;
}

.btn.survey {
	width: 320px;
}

.btn.survey {
	background-color: #3540A5;
	width: 60%;
	font-size: 14px;
	line-height: 18px;
	margin: 0 auto;
}

.btn {
	width: 100%;
	background-color: #3540A5;
	color: white;
	border-radius: 6px;
	border: none;
	box-shadow: none;
	padding: 15px 10px;
	transition: background-color 0.3s ease-out;
	display: block;
	text-align: center;
	cursor: pointer;
}
</style>
</head>
<body>
	<c:import url="./template/header.jsp"></c:import>
	<section>
		<div class="heroNew">
			<div class="ourVoice">
				<div style="height: 320px;"></div>
				<div class="when">
					<img class="mySlides aniTop"
						src="https://plab-football.s3.amazonaws.com/static/img/img_when0.png"
						style="width: 100%; display: none;"> <img
						class="mySlides aniTop"
						src="https://plab-football.s3.amazonaws.com/static/img/img_when1.png"
						style="width: 100%; display: none;"> <img
						class="mySlides aniTop"
						src="https://plab-football.s3.amazonaws.com/static/img/img_when2.png"
						style="width: 100%; display: none;"> <img
						class="mySlides aniTop"
						src="https://plab-football.s3.amazonaws.com/static/img/img_when3.png"
						style="width: 100%; display: none;"> <img
						class="mySlides aniTop"
						src="https://plab-football.s3.amazonaws.com/static/img/img_when4.png"
						style="width: 100%; display: none;"> <img
						class="mySlides aniTop"
						src="https://plab-football.s3.amazonaws.com/static/img/img_when5.png"
						style="width: 100%; display: block;"> <img
						class="mySlides aniTop"
						src="https://plab-football.s3.amazonaws.com/static/img/img_when6.png"
						style="width: 100%; display: none;"> <img
						class="mySlides aniTop"
						src="https://plab-football.s3.amazonaws.com/static/img/img_when7.png"
						style="width: 100%; display: none;"> <img
						class="mySlides aniTop"
						src="https://plab-football.s3.amazonaws.com/static/img/img_when8.png"
						style="width: 100%; display: none;"> <img
						class="mySlides aniTop"
						src="https://plab-football.s3.amazonaws.com/static/img/img_when9.png"
						style="width: 100%; display: none;"> <img
						class="mySlides aniTop"
						src="https://plab-football.s3.amazonaws.com/static/img/img_when10.png"
						style="width: 100%; display: none;">
				</div>
				<img
					src="https://plab-football.s3.amazonaws.com/static/img/img_slogan.png"
					id="startFeature" alt="풋살하고 싶을 땐 플랩풋볼">
			</div>
		</div>

		<div class="aboutTitle" style="text-align: center;">
			<h1 class="hen">LET'S PLAY</h1>
			<p>풋살하고 싶을 땐 주저하지 말고 렛츠 PLAY!</p>
		</div>

		<div class="subFeature">
			<ul>
				<li>
					<div class="feature">
						<div class="featureTxt">
							<h3>내가 하고 싶을 때</h3>
							<p>아침부터 심야, 평일부터 주말까지</p>
						</div>
					</div>
				</li>
				<li>
					<div class="feature">
						<div class="featureTxt">
							<h3>내가 하고 싶은 곳에서</h3>
							<p>집, 회사, 학교 등 나와 가까운 구장에서!</p>
						</div>
					</div>
				</li>
				<li>
					<div class="feature">
						<div class="featureTxt">
							<h3>내가 하고 싶은 사람들과</h3>
							<p>여성 매치, 혼성 매치, 중급 매치, 초급 매치 그리고 레슨까지</p>
						</div>
					</div>
				</li>
			</ul>
		</div>

		<div class="aboutSec">
			<div class="mainFeature">
				<div class="aboutImg">
					<img src="./resources/images/plabbb.png" alt="매니저가 여러분의 풋살을 도와드려요">
				</div>
				<div class="aboutTitle">
					<h2>혼자 와도 즐겁게!</h2>
					<p>혼자 와도 어색하지 않도록 현장에서 매니저가 시작부터 끝까지 매끄러운 진행을 이어갑니다.</p>
				</div>
			</div>
		</div>

		<div class="subFeature">
			<ul>
				<li>
					<div class="feature">
						<div class="featureTxt">
							<h3>친절한 매니저</h3>
							<p>각 경기에 배정된 매니저가 매끄러운 경기 진행과 장비 등을 세심하게 챙겨드립니다.</p>
						</div>
					</div>
				</li>
				<li>
					<div class="feature">
						<div class="featureTxt">
							<h3>서로 배려하는 풋볼 문화</h3>
							<p>참가자들끼리 서로 존중하고 배려하기 때문에 부담없이 즐겁게 운동할 수 있어요</p>
						</div>
					</div>
				</li>
				<li>
					<div class="feature">
						<div class="featureTxt">
							<h3>친구랑 와도 꿀잼!</h3>
							<p>어렵게 친구들을 모을 필요 없어요. 친구 두세 명과 함께 와도 즐겁게 운동할 수 있습니다.</p>
						</div>
						<div class="btnWrap" style="text-align: center;">
							<button id="btnSurvey" class="btn survey copy"
								style="display: inline-block;">친구 초대 하기</button>
						</div>
					</div>
				</li>
			</ul>
		</div>
		<script type="text/javascript">
			var myIndex = 0;
			carousel();

			function carousel() {
				var i;
				var x = document.getElementsByClassName("mySlides");
				for (i = 0; i < x.length; i++) {
					x[i].style.display = "none";
				}
				myIndex++;
				if (myIndex > x.length) {
					myIndex = 1
				}
				x[myIndex - 1].style.display = "block";
				setTimeout(carousel, 1200);
			}

			$(document).ready(function() {
				// Add smooth scrolling to all links
				$("a").on('click', function(event) {

					// Make sure this.hash has a value before overriding default behavior
					if (this.hash !== "") {
						// Prevent default anchor click behavior
						event.preventDefault();

						// Store hash
						var hash = this.hash;

						// Using jQuery's animate() method to add smooth page scroll
						// The optional number (800) specifies the number of milliseconds it takes to scroll to the specified area
						$('html, body').animate({
							scrollTop : $(hash).offset().top
						}, 800, function() {

							// Add hash (#) to URL when done scrolling (default click behavior)
							window.location.hash = hash;
						});
					} // End if
				});
			});

			document
					.querySelector(".copy")
					.addEventListener(
							"click",
							function() {
								var tempElem = document
										.createElement('textarea');
								tempElem.value = "http://localhost:8080${pageContext.request.contextPath}"
								document.body.appendChild(tempElem);

								tempElem.select();
								document.execCommand("copy");
								document.body.removeChild(tempElem);

								alert("주소가 클립보드에 복사되었습니다");
							});
		</script>
	</section>
	<c:import url="./template/footer.jsp" />
</body>
</html>