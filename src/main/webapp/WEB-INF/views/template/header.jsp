<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

  <script>
		function openNav() {
			document.getElementById("mySidenav").style.width = "250px";
		}

		function closeNav() {
			document.getElementById("mySidenav").style.width = "0";
		}
  </script>
  
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 500px;}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: white;
      height: 100%;
    }
    
    .right_sidenav {
	height: 100%;
	width: 0;
	position: fixed;
	z-index: 1;
	top: 0;
	right: 0;
	background-color: #111;
	overflow-x: hidden;
	transition: 0.6s;
	padding-top: 60px;
}

	.right_sidenav a {
		padding: 8px 8px 8px 32px;
		text-decoration: none;
		font-size: 25px;
		color: gray;
		display: block;
		transition: 0.3s;
	}
	
	.right_sidenav a:hover {
		color: #f1f1f1;
	}
	
	.right_sidenav .closebtn {
		position: absolute;
		top: 0;
		right: 25px;
		font-size: 36px;
		margin-left: 50px;
	}

      
    /* Set black background color, white text and some padding */
    footer {
      background-color: #555;
      color: white;
      padding: 15px;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    }

}
  </style>
  
  
  <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="${pageContext.request.contextPath}">Logo</a>
    </div>
    
    <div>
      <ul class="nav navbar-nav navbar-right collapse navbar-collapse">
      	<li><a href="#">
      	<span style="font-size: 30px; color: gray; margin-top: 0px; float: float; cursor: pointer" onclick="openNav()">&#9776;	</span> 
      	</a></li>
      </ul>
    </div>
    
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
      	<li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
    </div>
  </div>
  
 	 <div id="mySidenav" class="right_sidenav">
			<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			<a href="#">K2JS 소개</a> 
			<a href="#">매니저 지원</a> 
			<a href="${pageContext.request.contextPath}/notice/noticeList">공지사항</a>
			<a href="${pageContext.request.contextPath}/qna/qnaList">자주 묻는 질문</a>
	</div>
		
</nav>
  
  
  