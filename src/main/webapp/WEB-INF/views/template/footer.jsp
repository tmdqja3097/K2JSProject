<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">


	.footer {
		width: 100%;
		height: 448px;
		color: white;
		background-color: black;

	}
	
	.footerWrap {
		width: 50%;
		height: 448px;
	}

	
	.fo1>li>a {
		color: #999;
		border-top: 0;
	
	}
	
	.fo2>li>a {
		color: #999;
	}
	
	.fo3>li>a {
		color: #999;
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
</style>
</head>
<body>

	<div class="footer">
		<div>
			<p class="p"> 풋살하고 싶을 땐, 플랩풋볼</p>
			<span class="p"> 서울특별시 마포구 마포대로 10길 12 트레퍼빌딩 4층 405호 </span>
		</div>
		
		<div class="footerWrap">	
		<ul class="fo1 fo" style="list-style:none;">
			<h3> 매치 </h3>
			<li>
				<a href=""> 전체 매치 </a>
			</li>
			<li> 
				<a href=""> 탐색 </a>
			</li>
		</ul>
		<ul class="fo2 fo" style="list-style:none;">   
			<h3> 서비스 지역 </h3>
			<li>
				<a href=""> 서울 </a>
			</li>
			<li>
				<a href=""> 인천 </a>
			</li>
			<li>
				<a href=""> 경기 </a>
			</li>
			<li>
				<a href=""> 대전 </a>
			</li>
			<li>
				<a href=""> 충북 </a>
			</li>
			<li>
				<a href=""> 광주 </a>
			</li>
			<li>
				<a href=""> 대구 </a>
			</li>
			<li>
				<a href=""> 울산 </a>
			</li>
			<li>
				<a href=""> 부산 </a>
			</li>
		</ul>
		<ul class="fo3 fo" style="list-style:none;">
			<h3> 플랩풋볼 </h3>
				<li>
					<a href=""> 플랩풋볼 소개 </a>
				</li>
				<li>
					<a href=""> 매니저 지원 </a>
				</li>
				<li>
					<a href=""> 공지사항 </a>
				</li>
				<li>
					<a href=""> 자주 묻는 질문 </a>
				</li>
		</ul>
		<ul class="fo4 fo" style="list-style:none;">
			<h3> 소셜 미디어 </h3>
			<li>
				<a href=""> 인스타그램 </a>
			</li>
			<li>
				<a href=""> 페이스북 </a>
			</li>
			<li>
				<a href=""> 페이스북 그룹 </a>
			</li>
		</ul>
		</div>
	</div>
</body>
</html>