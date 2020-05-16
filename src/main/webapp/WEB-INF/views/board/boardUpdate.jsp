<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/summer.jsp"></c:import>
<style>
body {
	font-family: "Lato", sans-serif;
}

.sidenav {
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

.sidenav a {
	padding: 8px 8px 8px 32px;
	text-decoration: none;
	font-size: 25px;
	color: gray;
	display: block;
	transition: 0.3s;
}

.sidenav a:hover {
	color: #f1f1f1;
}

.sidenav .closebtn {
	position: absolute;
	top: 0;
	right: 25px;
	font-size: 36px;
	margin-left: 50px;
}

@media screen and (max-height: 450px) {
	.sidenav {
		padding-top: 15px;
	}
	.sidenav a {
		font-size: 18px;
	}
}

* {
	box-sizing: border-box;
}

#myInput {
	background-image: url("");
	background-position: 10px 12px;
	background-repeat: no-repeat;
	width: 100%;
	font-size: 16px;
	padding: 12px 20px 12px 40px;
	border: 1px solid #ddd;
	margin-bottom: 12px;
}

#myUL {
	list-style-type: none;
	padding: 0;
	margin: 0;
}

#myUL li a {
	border: 1px solid #ddd;
	margin-top: -1px; /* Prevent double borders */
	background-color: #f6f6f6;
	padding: 12px;
	text-decoration: none;
	font-size: 18px;
	color: black;
	display: block
}

#myUL
 
li
 
a
:hover
:not
 
(
.header
 
)
{
background-color
:
 
#eee
;


}
#date {
	font-size: x-small;
}
</style>
</head>
<body style="padding: 0;">
	<c:import url="../template/header.jsp"></c:import>
	<div class="container">
		<h3>${fn:toUpperCase(board)} Update</h3>


		<form action="./${board}Update" id="frm" method="post" enctype="multipart/form-data">
			<input type="hidden" name="num" value="${vo.num}">
			<div class="form-group">
				<label for="title">Title:</label> <input type="text"
					value="${vo.title}" class="form-control" id="title" name="title">
			</div>
			<div class="form-group">
				<label for="writer">Writer:</label> <input type="text"
					disabled="disabled" value="${vo.writer}" class="form-control"
					id="writer" name="writer">
			</div>
			<div class="form-group">
				<label for="contents">Contents:</label>
				<textarea rows="5" cols="" class="form-control" id="contents"
					name="contents"></textarea>
			</div>

			<input type="button" id="add" class="btn btn-info" value="AddFile">
			<div id="file">
			<div class="form-group">
				<label for="files">Files:</label>
				<c:forEach items="${vo.boardFileVOs}" var="fileVO">
					<p>${fileVO.oriName}<i id="${fileVO.fileNum}"
							title="${fileVO.board}"
							class="glyphicon glyphicon-remove remove fileDelete"></i>
					</p>
				</c:forEach>
			</div>
			</div>
			<input type="button" id="btn" class="btn btn-default" value="Write">
		</form>

	</div>
	<footer></footer>

	<script type="text/javascript" src="../resources/js/boardForm.js"></script>
	<script type="text/javascript">
		$("#contents").summernote('code', '${vo.contents}');
		
		var size = 0;
		
		size = ${fn:length(vo.boardFileVOs)};
		
		
		
		count = count+size;
		
		$(".fileDelete").click(function() {
			
			var check = confirm("정말 지울 거냐??");
			
			if(check){
				var s = $(this);
				
				$.post("../boardFile/fileDelete", {fileNum:$(this).attr("id")}, function(data) {
					if(data.trim()>0){
						s.parent().remove();
					}else {
						alert("File Delete Fail");
					}
				} );
			}
		});
		
	
		function openNav() {
			document.getElementById("mySidenav").style.width = "250px";
		}

		function closeNav() {
			document.getElementById("mySidenav").style.width = "0";
		}

		function myFunction() {
			var input, filter, ul, li, a, i, txtValue;
			input = document.getElementById("myInput");
			filter = input.value.toUpperCase();
			ul = document.getElementById("myUL");
			li = ul.getElementsByTagName("li");
			for (i = 0; i < li.length; i++) {
				a = li[i].getElementsByTagName("a")[0];
				txtValue = a.textContent || a.innerText;
				if (txtValue.toUpperCase().indexOf(filter) > -1) {
					li[i].style.display = "";
				} else {
					li[i].style.display = "none";
				}
			}
		}
	</script>

</body>
</html>