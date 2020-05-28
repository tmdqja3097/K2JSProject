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
body {
	padding: 0 0;
	font-family: 'Apple SD Gothic Neo','Noto Sans CJK KR', 'Malgun Gothic', 'dotum', 'gulim',sans-serif;
}


.brandHero .titleWrap{
    width: 100%;
    padding: 200px 0 80px 200px;
}

.brandHero .titleWrap h1 {
    font-size: 72px;
    letter-spacing: -3.5px;
    font-weight: 300;
}

.brandHero .titleWrap p {
    font-size: 27px;
    margin-top: 32px;
    font-weight: 300;
    letter-spacing: -0.3px;
}

.bSection .titleWrap h2 {
    font-size: 54px;
    letter-spacing: -3px;
    font-weight: 300;
}

.bFeature ul li h3 {
    font-size: 18px;
    font-weight: 400;
    margin-bottom: 7px;
}

.bFeature ul li span {
    font-size: 16px;
    color: #999;
    word-break: keep-all;
}

.bSection.sm {
    padding: 40px 0;
}

.bSection .titleWrap.smTitle {
    padding: 50px 30px;
    text-align: center;
    margin: 0 auto;
}

.bSection .bContent {
    text-align: center;
}

.mngFaq, .mngProcess {
    max-width: 1024px;
    margin: 0 auto;
}

.mngProcess ul li.kjd21 {
    padding-top: 20px;
}

.mngProcess ul li {
    width: 21%;
    padding: 0 20px;
    background-color: #F0F6FF;
    border: 1px solid #CAD7EC;
    margin: 0 2%;
    font-size: 16px;
    border-radius: 4px;
    position: relative;
    margin-bottom: 30px;
    float: left;
    height: 80px;
}


ol, ul, li {
    list-style: none;
}

.mngProcess ul {
    overflow: auto;
}
ol, ul, li {
    list-style: none;
}

.mngProcess ul li p {
    line-height: 80px;
}
p {
    margin: 0;
    padding: 0;
    word-break: break-all;
}



.bSection .titleWrap h3 {
    font-size: 28px;
    font-weight: 300;
    letter-spacing: -2px;
    border-bottom: 4px solid #FFC645;
    display: inline-block;
    padding: 0 10px;
}

.bSection .bContent {
    text-align: center;
}

.bSection .titleWrap {
    padding: 200px 50px 150px 50px;
    max-width: 1024px;
    margin: 0 auto;
}

.bSection .bContent {
    text-align: center;
}


.bFeature ul {
    margin: 40px 20px 60px 20px;
    display: flex;
}
ol, ul, li {
    list-style: none;
}

.bSection .bContent {
    text-align: center;
}

.bFeature {
    max-width: 1024px;
    margin: 0 auto;
}

.bFeature ul li {
    text-align: left;
    margin: 30px 30px;
    border-left: 3px solid #FFC645;
    padding: 0 10px;
}

.brandHero .titleWrap h1 strong {
    font-weight: 700;
    border-bottom: 8px solid #FFC645;
}

.mngFaq li h4, .mngFaq li span {
    padding-left: 20px;
    position: relative;
    display: block;
    line-height: 24px;
}
.mngFaq li h4 {
    margin-bottom: 10px;
}

.mngFaq li:first-child {
    margin-top: 0;
    border-bottom: 1px solid #ddd;
    padding-bottom: 20px;
}

.mngFaq li {
    margin: 20px auto;
    display: block;
    max-width: 720px;
}

.btnWrap {
    margin-top: 20px;
}

element.style {
    margin: 0 auto;
}

.btn.action {
    width: 320px;
}
.btn.action {
    width: 70%;
    margin: 0 auto;
    border-radius: 100px;
    line-height: initial;
    width: 320px;
    line-height: 32px;
    font-size: 20px;
    background-color: #3540A5;
    color: white;
    }
 
    
</style>
</head>
<body>
	<div style="padding: 0 20%;">
		<c:import url="../template/header.jsp"></c:import>
	</div>
	<div class="brandHero">
		<div class="titleWrap">
			<h1>
				공도 차고<br>돈도 버는<br>
				<strong>K2JS 매니저</strong>
			</h1>
			<p>경기당(2시간) 25,000원의 활동비가 지급됩니다.</p>
		</div>
		<img src="../resources/images/k2js_manager.png" alt="" width="100%" style="padding-left: 2%">
	</div>
	
	<div class="bSection">
		<div class="titleWrap smBottom">
			<h2>K2JS<br><strong>매니저란?</strong></h2>
			<p>K2JS의 매치 매니저로서 참가자들이 즐겁게 운동할 수 있도록 매치 운영을 담당하고 좋아하는 스포츠 활동을 하며 돈도 벌 수 있는 취미형 일자리입니다.</p>
		</div>
		<div class="bContent">
			<div class="bFeature">
				<ul>
					<li>
						<h3>내가 원하는 시간에<br>원하는 구장에서</h3>
						<span>나의 라이프 스타일에 맞게 자유롭게 근무 시간과 장소를 선택할 수 있습니다.</span>
					</li>
					<li>
						<h3>경기당 25,000원 지급</h3>
						<span>경기당 25,000원이 지급됩니다. (시급 12,500원)</span>
						<p>* 매달 우수 매니저에게는 10만원의 인센티브가 추가 지급됩니다.</p>
					</li>
				</ul>
			</div>
			<img src="https://plab-football.s3.amazonaws.com/static/img/img_apmanager_2.jpg" style="width: 100%;" alt="내가 원할 떄 원하는 풋살장에서">
		</div>
	</div>
	
	<div class="bSection sm">
		<div class="titleWrap smTitle">
			<h3>매니저 연계 과정</h3>
		</div>
		<div class="bContent">
			<div class="mngProcess">
				<ul>
					<li class="kjd21">
						<p style="line-height: inherit;">온라인 지원서 작성</p>
						<a href="https://docs.google.com/forms/d/e/1FAIpQLSfVXs2UygE8Awnev-U2_6OuFqvC6eF4rcNXc8FxPw0iztpBVA/viewform?usp=sf_link">지원서 작성하기</a>
					</li>
					<li><p>현장 교육</p></li>
					<li><p>단독 실습</p></li>
					<li><p>최종 연계</p></li>
				</ul>
			</div>
		</div>
	</div>
	
	<div class="bSection sm" style="background-color: #fafafa;">
		<div class="titleWrap smTitle">
			<h3>자주 묻는 질문</h3>
		</div>
		<div class="bContent">
			<ul class="mngFaq">
				<li>
					<h4><strong>축구, 풋살을 잘 해야 하나요? 혹은 관련 자격증이 필요한가요?</strong></h4>
					<span>자격증이나 실력과는 상관없이 스포츠 활동을 통해 사람들과 소통하며 가치 있는 스포츠 문화를 만들어가는 일에 함께할 분을 찾고있습니다.</span>
				</li>
				<li>
					<h4><strong>매치 담당 방식이 어떻게 되나요?</strong></h4>
					<span>원하는 지역/구장, 원하는 시간대 매치를 자유롭게 선택하여 담당하게 됩니다.</span>
				</li>
			</ul>
		</div>
	</div>
	
	<div class="bSection">
		<div class="titleWrap" style="text-align: center;">
			<h2><strong>지금 바로</strong><br>지원하세요</h2>
			<div class="btnWrap">
				<a href="https://docs.google.com/forms/d/e/1FAIpQLSfVXs2UygE8Awnev-U2_6OuFqvC6eF4rcNXc8FxPw0iztpBVA/viewform?usp=sf_link" target="_blank" class="btn action" style="margin: 0 auto;" id="submitApplicationButton">지원서 작성하기</a>
			</div>
		</div>
		<c:if test="${member.id eq 'admin'}"> 
		<div class="titleWrap" style="text-align: center;">
			<div class="btnWrap">
				<a href="./addManager" class="btn btn-default" style="float: right; ">매니저 추가하기</a>
				<a href="./managerList" class="btn btn-default" style="float: right; margin-right: 20px;">매니저 리스트 보기</a>
			</div>
		</div>
		</c:if>
	</div>

</body>
</html>