<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
footer {
	clear : both;
	bottom: 0px; 
	height: 250px;
	color: white;
	background-color: black;
	margin-top: 200px;
}

.footerWrap {
	font-size: 12px;
	color: #999;
	margin-right: 5px;
	margin-bottom: 20px;
	float: right;
	margin-left: 50px;
	text-align: left;
}

.fo1 {
	font-size: 12px;
	width: 13%;
	float: left;
}

.fo1>li>a {
	color: #999;
	border-top: 0;
}

.fo2 {
	width: 13%;
	font-size: 12px;
	float: left;
}

.fo2>li>a {
	color: #999;
}

.fo3 {
	width: 13%;
	font-size: 12px;
	float: left;
}

.fo3>li>a {
	color: #999;
}

.fo4 {
	width: 15%;
	font-size: 12px;
	float: left;
}

.fo4>li>a {
	color: #999;
}

.fo {
	display: inline-block;
}

.p {
	text-align: right;
}

.company {
	color: white;
	font-style: italic;
	border-bottom: 2px solid #FFC645;
}
</style>

<footer>
	<ul class="fo1 fo" style="list-style: none;">
		<h3 style="font-size: 15px;">매치</h3>
		<li><a href=""> 전체 매치 </a></li>
		<li><a href=""> 탐색 </a></li>
	</ul>
	<ul class="fo2 fo" style="list-style: none;">
		<h3 style="font-size: 15px">서비스 지역</h3>
		<li><a href=""> 서울 </a></li>
		<li><a href=""> 인천 </a></li>
		<li><a href=""> 경기 </a></li>
		<li><a href=""> 대전 </a></li>
		<li><a href=""> 충북 </a></li>
		<li><a href=""> 광주 </a></li>
		<li><a href=""> 대구 </a></li>
		<li><a href=""> 울산 </a></li>
		<li><a href=""> 부산 </a></li>
	</ul>


	<ul class="fo3 fo" style="list-style: none;">
		<h3 style="font-size: 15px">K2JS</h3>
		<li><a href="${pageContext.request.contextPath}/about"> K2JS
				소개 </a></li>
		<li><a
			href="${pageContext.request.contextPath}/manager/managerOffer">
				매니저 지원 </a></li>
		<li><a
			href="${pageContext.request.contextPath}/notice/noticeList"> 공지사항
		</a></li>
		<li><a href="${pageContext.request.contextPath}/qna/qnaList">
				자주 묻는 질문 </a></li>
	</ul>


	<ul class="fo4 fo" style="list-style: none;">
		<h3 style="font-size: 15px;">소셜 미디어</h3>
		<li><a href="https://www.instagram.com/?hl=ko"> 인스타그램 </a></li>
		<li><a href="https://ko-kr.facebook.com/"> 페이스북 </a></li>
		<li><a href="https://ko-kr.facebook.com/groups/"> 페이스북 그룹 </a></li>
	</ul>


	<div class="footerWrap" style="list-style: none;">
		<h2 class="company fo">
			<a href="" style="color: white;"> http://localhost:8080/p1/ </a>
		</h2>

		<p>풋볼하고 싶을 땐, K2JS</p>
		<li>서울 마포구 월드컵북로 21 4층 풍성빌딩 지번서울 마포구 서교동 447-5</li>
		<li>주식회사 마이플레이컴퍼니 | 사업자번호 000-00-00000</li>
		<li>전화 <a href="000-0000-0000"> </a>
		</li>
		<li>"Copyright" <b> K2JS </b> "ALL rights reserved"
		</li>

	</div>
</footer>






