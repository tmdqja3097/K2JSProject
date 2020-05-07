<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
	<c:import url="./template/boot.jsp"> </c:import>

<style type="text/css">
	.slide_img{
		width : 70%;
		height: 100px;
	}
	.slide_edge{
		border-radius: 50px;
	}
	
	#myCarousel >a {
	border-radius : 50px;
	z-index: 0;
	background-image : none;
	}
	
	/* calendar */
	
	@import url(https://fonts.googleapis.com/css?family=Muli:400, 300);
body { margin-top: 3%; }

.calendar, .calendar_weekdays, .calendar_content {
    max-width: 300px;
}
.calendar {
    margin: auto;
    font-family:'Muli', sans-serif;
    font-weight: 400;
}
.calendar_content, .calendar_weekdays, .calendar_header {
    position: relative;
    overflow: hidden;
}
.calendar_weekdays div {
    display:inline-block;
    vertical-align:top;
}
.calendar_weekdays div, .calendar_content div {
    width: 14.28571%;
    overflow: hidden;
    text-align: center;
    background-color: transparent;
    color: #6f6f6f;
    font-size: 14px;
}
.calendar_content div {
    border: 1px solid transparent;
    float: left;
}
.calendar_content div:hover {
    border: 1px solid #dcdcdc;
    cursor: default;
}
.calendar_content div.blank:hover {
    cursor: default;
    border: 1px solid transparent;
}
.calendar_content div.past-date {
    color: #d5d5d5;
}
.calendar_content div.today {
    font-weight: bold;
    font-size: 14px;
    color: #87b633;
    border: 1px solid #dcdcdc;
}
.calendar_content div.selected {
    background-color: #f0f0f0;
}
.calendar_header {
    width: 100%;
    text-align: center;
}
.calendar_header h2 {
    padding: 0 10px;
    font-family:'Muli', sans-serif;
    font-weight: 300;
    font-size: 18px;
    color: #87b633;
    float:left;
    width:70%;
    margin: 0 0 10px;
}

button.switch-month {
    background-color: transparent;
    padding: 0;
    outline: none;
    border: none;
    color: #dcdcdc;
    float: left;
    width:15%;
    transition: color .2s;
}

button.switch-month:hover {
    color: #87b633;
}
	
	
/* calendar2 */

#date{
	display: inline-block;
}
	

 .b{color:blue;
	display: inline-block;
}
 .r{color:red;
 	display: inline-block;
 }
 .g{color:gray;
 	display: inline-block;
 }	
	
	
	
	
	
</style>	
</head>


<body>

	<c:import url="./template/header.jsp"></c:import>

	<div>
		<div class="container  slide_img ">
			<div id="myCarousel" class="carousel slide" data-ride="carousel" >
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
				</ol>

				<!-- Wrapper for slides -->
				<div class="carousel-inner slide_edge">
					<div class="item active">

						<img src="${pageContext.request.contextPath}/resources/images/foot1.png" alt="Los Angeles" style="width: 100%;"height="50px">
					</div>

					<div class="item">
						<img src="${pageContext.request.contextPath}/resources/images/foot2.png" alt="Chicago" style="width: 100%;" height="50px">
					</div>

					<div class="item">
						<img src="${pageContext.request.contextPath}/resources/images/foot3.png" alt="New york" style="width: 100%;"height="50px">
					</div>
				</div>

				<!-- Left and right controls -->
				<a class="left carousel-control" href="#myCarousel"
					data-slide="prev"> <span
					class="glyphicon glyphicon-chevron-left"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#myCarousel"
					data-slide="next"> <span
					class="glyphicon glyphicon-chevron-right"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
			
			
			<div class="container">
			
		

<!-- 				<div class="calendar calendar-first" id="calendar_first">
					<div class="calendar_header">
						<button class="switch-month switch-left">prev</button>
						<h2></h2>
						<button class="switch-month switch-right">next</button>
					</div>
					<div class="calendar_weekdays"></div>
					<div class="calendar_content"></div>
				</div> -->


			<div class="cal_top">
			        <a href="#" id="movePrevMonth"><span id="prevMonth" class="cal_tit">&lt;</span></a>
			        <span id="cal_top_year"></span>
			        <span id="cal_top_month"></span>
			        <a href="#" id="moveNextMonth"><span id="nextMonth" class="cal_tit">&gt;</span></a>
			</div>
			<div id="cal_tab" class="cal">
			
			</div>
			
			
			
			<p id="calandar"></p>
		<input type="button" value="<" onclick="week_calandar(-1)" />
		<input type="button" value="today" onclick="set_day()" />
		<input type="button" value=">" onclick="week_calandar(1)" />
			
			
		<form name=frm>
			 <input type=text name=yy size=4 value=2020>
			 <input type=text name=mm size=2 value=5> 
			 <input type=button onclick=chCal() value=' 달 력 '>
			 <input type=text name=st size=2 value=1>에서
			 <input type=text name=ed size=2 value=7>까지
			</form>
			<div id=d></div>	
			
			
			


			</div>
		
		</div>
		
	</div>
	
	
	
	

<script type="text/javascript">
		
		
function chCal(){
	  var f=document.frm; //폼객체
	  var y=Number(f.yy.value); //년도
	  var m=Number(f.mm.value); //월
	  var str=''; //출력할 스트링

	  
	  var d=new Date(y,m,0); //의뢰한 년월의 마지막날의 데이트객체를 구한다
	  var d0=new Date(y,m-1,1); //의뢰한 년월의 첫날의 데이트객체

	  var ds=d.getDate(); //마지막일자
		
	  var e=d0.getDay(); //첫날의 요일

	  var s0=Number(f.st.value); //출력 시작일
	  var s1=Number(f.ed.value); //출력 마감일

	  var yoil = [];
	  var week = new Array('일', '월', '화', '수', '목', '금', '토');
	  var today = new Date().getDay();
	  //var todayLabel = week[today];
	  
	  if(e==1){
		yoil[0] = "월";
	  }else if(e==2){
		yoil[1] = "화";
	  }else if(e==3){
		yoil[2] = "수";
	  }else if(e==4){
		yoil[3] = "목";
	  }else if(e==5){	
		yoil[4] = "금";
	  }
	  
	  for(var j=0; j<7; j++){
 		 var yoilDay = week[today]
 	 }       
	 console.log(yoilDay);
	  
	  (e<6)?sat=7-e:null; //토요일이 몇번째인지 구한다 
	  
	  for(var i=1;i<=ds;i++){ //날짜수만큼 루프를 돈다
	   if(i>=s0 && i<=s1){
	    switch(i%7){ //요일에 따라 스트링의 색을 달리하여 출력
	     case sat:
	      str+="<a href='#'><li class=b><p>"+i+"</p><span class=b>토</span></li></a>"; //토요일은 파랑
	      break;
	     case sat+1: 
	      str+="<li class=r><p>"+i+"</p><span class=r>일</span></li>"; //일요일은 빨강
	      break;
	     default: 
	      str+="<li class=g><p>"+i+"</p><span class=g>"+week[today]+"</span></li> "; //평일은 회색
	      break;
	    }
	   }
	  }
	  
	  
	  document.getElementById('d').innerHTML=str; //스트링을 레이어에 출력
	 }
	 window.onload=function(){ //페이지가 로딩되면
	  var f=document.frm; //폼객체
	  var qr=window.location.search; //쿼리

	  if(qr){ //주소창에 쿼리가 있으면
	   qr=qr.substr(1,qr.length).split("&"); //쿼리스트링의 첫 ? 는 자르고, &를 구분자로 나누어 배열로 저장
	   for(var i in qr){ //배열의 개수만큼 루프를 돈다(파라메터의 개수만큼)
	    var tmp=qr[i].split("="); //키와 값을 분리
	    f.elements[tmp[0]].value=tmp[1]; //폼의 네임과 값을 지정
	   }
	   chCal(); //달력출력
	  }
	 }	
		
		
		
		
		
		
		
		
		
		
		
	/* var day = new Date();
	day.setDate(day.getDate()-day.getDay());

	function week_calandar(week) {
	day.setDate(day.getDate()+week*7);
	var title = day.getFullYear() + "/" + (day.getMonth()+1);
	var data = ""
	
	var week = new Array('일', '월', '화', '수', '목', '금', '토');
	var today = new Date().getDay();
	var todayLabel = week[today];
	
	for(var i=0; i<7; i++){
		
	}
	
	for(var i=0 ; i<7 ; i++) {              
	data += day.getDate() + "|"+"<p id=date>"+todayLabel+"</p>";
	
	if(day.getDate() == 1)
	title += " ~ " + day.getFullYear() + "/" + (day.getMonth()+1);
	day.setDate(day.getDate()+1);
	}
	
	day.setDate(day.getDate()-7);
	document.getElementById("calandar").innerHTML = title + "<br />" + data;
	}

	function set_day() {
	day = new Date();
	day.setDate(day.getDate()-day.getDay());

	week_calandar(0);
	} */
	
</script>
	
	 	
	
	

  
	
	
</body>
</html>
