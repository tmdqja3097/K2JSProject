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
<style type="text/css">
.form-group {
	margin-top: 30px;
}
</style>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>

	<form action="./matchUpdate" id="frm" method="post">
		
		
		<input type="text" id="title" name="num" hidden="hidden"
				value="${matchVO.num}" >
		
		
		<div class="form-group">
			<label for="title">제목:</label> <input type="text"
				class="form-control" id="title" name="title"
				value="${matchVO.title}">
		</div>
		<div class="form-group">
			<label for="writer">경기 날짜:</label> <input type="date"
				class="form-control" id="date" name="day">
		</div>
		<div class="form-group">

			<label for="writer">경기 시간:</label> <input type="time"
				class="form-control" id="time" name="time">
		</div>
		<div class="form-group">
			<label for="writer">구장:</label> <input type="text"
				class="form-control" id="writer" name="stadiumName"
				value="${matchVO.stadiumName}">
		</div>
		<div class="form-group">
			<label for="writer">성별:</label> <select name="gender" id="gender">
				<option class="option" value="none">선택</option>
				<option class="option" value="1">남성</option>
				<option class="option" value="2">여성</option>
				<option class="option" value="3">혼성</option>
			</select>
		</div>
		<div class="form-group">
			<label for="contents">특이 사항 공지:</label>
			<textarea rows="20" cols="" class="form-control" id="contents"
				name="contents"></textarea>
		</div>
		
		<input type="button" id="btn" class="btn btn-default" value="Write" style="float: right;">
		<input type="button" id="add" class="btn btn-default" value="AddFile" style="float: right;">
			<div id="file">
			<div class="form-group">
				<label for="files">Files:</label>
				<c:forEach items="${matchVO.stadiumFileVOs}" var="fileVO">
					<p>${fileVO.oriName}<i id="${fileVO.fileNum}"
							class="glyphicon glyphicon-remove remove fileDelete"></i>
					</p>
				</c:forEach>
			</div>
			</div>

	</form>

	<script type="text/javascript" src="../resources/js/matchForm.js">
	</script>
	<script type="text/javascript">
	
	var size = 0;
	size = ${fn:length(matchVO.stadiumFileVOs)};
	count = count + size;
	
	$(".option").each(function() {
		if($(this).val() == ${matchVO.gender}){ 
			$(this).prop("selected", "selected"); 
		}
	})
	
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
	</script>


</body>
</html>