<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- BootStrap API -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- BootStrap API   -->  
<style>
#match-box {
	height: 100px;
}

.nav-tabs {
border : none;}

#match-box-sub {
	width: 100%;
	height: 100px;
	position: absolute;
}

#pre {
	width: 100%;
	height: 100px;
}

#next {
	width: 100%;
	height: 100px;
	z-index : 999;
}

#day-list {
	width : 1260px;
	height: 100px;
	z-index : -1;
}

.day-list {
	display: inline-block;
	height: 100px;
	margin: 0 0.4%;
	width: 137px;
	float : left;
}

.nav-tabs>li>a {
	margin: 0 auto;
	text-align: center;
	line-height: 100px;
	border: none;
	border-radius: 0px;
}

#list {
 transform:translateX(0px);
 z-index : -1;
 }
</style>  