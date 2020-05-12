
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

.navbar-inverse .navbar-nav>li>a:hover {
	color: black;
}
/* 경기 리스트 */
#match-box {
	height: 100px;
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

#day-list {
	width: 1260px;
	height: 100px;
	z-index: -1;
}

#day-list>li>a {
	padding: 0;
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
</style>