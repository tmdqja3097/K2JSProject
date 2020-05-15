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
 
 
 
 /* match-filter */
.match-filter{
	width:100%; 
	height:30px;
}
 
 
.match-result {
	width: 10%;
	height: 30px;
	float: left;
	text-align: center;
}

.match-wrapper {
	width: 20%;
	height: 30px;
	margin-left: 80%;
	text-align: center;
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
/* modal */
 
 
 .unchecked{
	background-color:#FFC645;
	color:#2A2A2A;
}

.checked{      
	background-color:#EEEEEE;
	color:#999999;
}
 
 
</style>  