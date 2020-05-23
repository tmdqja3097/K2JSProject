<%@ page language="java" contentType="text/html; charset =UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
/* 전체  바디 */
body {
	padding: 0 20%;
	box-sizing: border-box;
}
/* 헤더 */
#logo {
	width: 100%;
	height: 100%;
}

.navbar-header>a {
	width: 100px;
}

.back {
	background-color: white;
	border: none;
}

.navbar-inverse {
	background-color: white;
	border: none;
}

.navbar-inverse .navbar-nav>li>a:hover {
	color: black;
}
/* 경기 리스트 */
#match-box {
	height: 100px;
}

.nav-tabs {
	border: none;
}

#match-box-sub {
	width: 100%;
	height: 100px;
	position: absolute;
}

#list {
	transform: translateX(0px);
	z-index: -1;
}

#birth_year {
	width: 15%;
	display: inline-block;
}

#birth_month {
	width: 15%;
	display: inline-block;
}

#birth_day {
	width: 15%;
	display: inline-block;
}

#pre {
	width: 100%;
	height: 100px;
}

#next {
	width: 100%;
	height: 100px;
	z-index: 999;
}

#day-list>li>a {
	padding: 0;
	z-index: 999;
}

#day-list {
	width: 1260px;
	height: 100px;
	z-index: -1;
}

.nav-tabs>li>a {
	margin: 0 auto;
	text-align: center;
	line-height: 100px;
	border: none;
	border-radius: 0px;
}

.day-list {
	display: inline-block;
	height: 100px;
	margin: 0 0.4%;
	width: 11%;
	float: left;
}

#list {
	transform: translateX(0px);
	z-index: -1;
}

/* match-filter */
.match-filter {
	width: 100%;
	height: 30px;
}

.match-result {
	width: 10%;
	height: 30px;
	float: left;
	text-align: center;
}

.match-wrapper {
	width: 20%;
	height: 50px;
	margin-left: 80%;
	text-align: center;
}

.mofo {
	height:50px; 
	background-color: #ffc645; 
	border-bottom-left-radius: 30px; 
	border-bottom-right-radius: 30px; 
	text-align:center; 
	padding-top:7px; 
	cursor: pointer;
}
/* match-filter */

/* modal */
.modal-list1{
	height: 100px;   
}

.modal-list1 > li{
	display: inline-block;
	margin-right: 5px;
	margin-top: 5px; 
	padding-top: 5px;
	padding-right: 5px;
}

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

.unchecked {
	background-color: #EEEEEE;
	color: #999999;
}

.checked {
	background-color: #FFC645;
	color: #2A2A2A;
}

.uncheck {
	background-color: #EEEEEE;
	color: #999999; 
}

.check {
	background-color: #FFC645;
	color: #2A2A2A;
}
/* modal */
</style>

