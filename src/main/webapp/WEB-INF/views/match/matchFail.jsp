<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경기 신청 불가</title>
<c:import url="../template/boot.jsp"></c:import>
<style type="text/css">
.orderTitle {
	padding-top: 30px;
}

.orderTitle h2 {
	font-size: 30px;
	font-weight: 300;
	border-bottom: 3px solid #FFC645;
	display: inline-block;
	margin-bottom: 8px;
	margin-left: 15px;
}

.completeWrap h4 {
	font-weight: bold;
	font-size: 20px;
}

.completeWrap {
	margin: 0 20px;
	padding: 20px 0 20px 0;
	border-bottom: 1px solid #eee;
	margin-bottom: 20px;
	margin-top: 10px;
}

.btnWrap {
	margin-top: 30px;
}

.btnWrap a {
	color: black;
	background: #FAFAFA;
	padding: 14px 16px;
	text-decoration: none;
	font-size: 17px;
}

.please h2 {
	font-size: 20px;
	font-weight: bold; border-bottom : 3px solid #FFC645;
	display: inline-block;
	margin-bottom: 8px;
	border-bottom: 3px solid #FFC645;
	margin-bottom: 50px;
}

img{
 width: 91px; 
 height: 70px;
}

.please ul>li {
	list-style: none;
	display: inline-block;
	width: 230px;
	height: 200px; 
	margin: 0 auto;
	border-radius: 10px;
	text-align: center;
	margin-right: 80px;
}

.descWrap {
    float: initial;
    width: 100%;
    margin-top: 20px;
    float: left;
    word-break: keep-all;
    hi
}

.please ul li p {
    margin: 0;
    padding: 0;
    font-weight: bold;
    word-break: break-all;
    box-sizing: border-box;
}

.please ul li span{
	 box-sizing: border-box;
	 margin-bottom: 100px;
}
</style>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<div style="width: 100%; text-align: center">
		<div class="completeWrap">
			<h4>신청이 완료됐습니다</h4>
			<div class="orderTitle">
				<h2>경기 신청이 마감되었습니다.</h2>
			</div>
		</div>
		<div class="please">
			<h2>K2JS의 경기 규칙!</h2>
			<ul>
			<li><img src="../resources/images/minmax.svg"><div class="descWrap"><p>경기 시간 엄수</p><span>경기 시간 전에 도착해주세요</span></div></li>
			<li><img src="../resources/images/turf.svg"><div class="descWrap"><p>축구화 금지</p><span>부상 방지를 위해 축구화 착용을 금지하고 있습니다. 반드시 풋살화 또는 운동화를 착용해주세요.</span></div></li>
			<li><img src="../resources/images/play.png"><div class="descWrap"><p>페어플레이</p><span>K2JS는 다른 참가자에게 부상이나 불쾌감을 주는 행동을 금지하고 있습니다.</span></div></li>
			</ul>

		</div>
	</div>


	<script type="text/javascript">
	
	</script>
	<c:import url="../template/footer.jsp"></c:import>
</body>
</html>