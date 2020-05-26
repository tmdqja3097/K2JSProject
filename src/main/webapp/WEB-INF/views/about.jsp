<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="./template/boot.jsp"></c:import>
<style type="text/css">
body{
	padding: 0 0;
}
.header{
	padding: 0 20%;
}

.heroNew {
    background-size: cover;
    background-position: bottom;
    background-image:url("./resources/images/plab2.png");
    background-size: cover;
    margin-bottom: 50px;
    height: 700px;
}

.when {
    width: 28%;
    margin: 0 auto;
    overflow: hidden;
    margin-bottom: 10px;
}

element.style {
    width: 100%;
    display: none;
}
.mySlides.aniTop {
    position: relative;
    animation: animatetop 0.4s;
}
img {
    vertical-align: middle;
}
.ourVoice img {
    width: 25%;
}
.ourVoice img {
    width: 30%;
    text-align: center;
    margin: 0 auto;
    display: block;
}

</style>
</head>
<body>
<div class="header"><c:import url="./template/header.jsp"></c:import></div>

		<div class="heroNew">
			<div class="ourVoice">
			<div style="height: 320px;"></div>
				<div class="when">
				  <img class="mySlides aniTop" src="https://plab-football.s3.amazonaws.com/static/img/img_when0.png" style="width: 100%; display: none;">
				  <img class="mySlides aniTop" src="https://plab-football.s3.amazonaws.com/static/img/img_when1.png" style="width: 100%; display: none;">
				  <img class="mySlides aniTop" src="https://plab-football.s3.amazonaws.com/static/img/img_when2.png" style="width: 100%; display: none;">
				  <img class="mySlides aniTop" src="https://plab-football.s3.amazonaws.com/static/img/img_when3.png" style="width: 100%; display: none;">
				  <img class="mySlides aniTop" src="https://plab-football.s3.amazonaws.com/static/img/img_when4.png" style="width: 100%; display: none;">
				  <img class="mySlides aniTop" src="https://plab-football.s3.amazonaws.com/static/img/img_when5.png" style="width: 100%; display: block;">
				  <img class="mySlides aniTop" src="https://plab-football.s3.amazonaws.com/static/img/img_when6.png" style="width: 100%; display: none;">
				  <img class="mySlides aniTop" src="https://plab-football.s3.amazonaws.com/static/img/img_when7.png" style="width: 100%; display: none;">
				  <img class="mySlides aniTop" src="https://plab-football.s3.amazonaws.com/static/img/img_when8.png" style="width: 100%; display: none;">
				  <img class="mySlides aniTop" src="https://plab-football.s3.amazonaws.com/static/img/img_when9.png" style="width: 100%; display: none;">
				  <img class="mySlides aniTop" src="https://plab-football.s3.amazonaws.com/static/img/img_when10.png" style="width: 100%; display: none;">
				</div>
				<img src="https://plab-football.s3.amazonaws.com/static/img/img_slogan.png" id="startFeature" alt="풋살하고 싶을 땐 플랩풋볼">
				
		
			</div>
		</div>

<script>
	var myIndex = 0;
	carousel();

	function carousel() {
	  var i;
	  var x = document.getElementsByClassName("mySlides");
	  for (i = 0; i < x.length; i++) {
	    x[i].style.display = "none";  
	  }
	  myIndex++;
	  if (myIndex > x.length) {myIndex = 1}    
	  x[myIndex-1].style.display = "block";  
	  setTimeout(carousel, 1200);    
	}

	</script>
	
	<script type="text/javascript">
	var slideIndex = 1;
	showSlides(slideIndex);

	// Next/previous controls
	function plusSlides(n) {
	  showSlides(slideIndex += n);
	}

	// Thumbnail image controls
	function currentSlide(n) {
	  showSlides(slideIndex = n);
	}

	function showSlides(n) {
	  var i;
	  var slides = document.getElementsByClassName("myQuote");
	  var dots = document.getElementsByClassName("dot");
	  if (n > slides.length) {slideIndex = 1} 
	  if (n < 1) {slideIndex = slides.length}
	  for (i = 0; i < slides.length; i++) {
	      slides[i].style.display = "none"; 
	  }
	  for (i = 0; i < dots.length; i++) {
	      dots[i].className = dots[i].className.replace(" activedot", "");
	  }
	  slides[slideIndex-1].style.display = "block"; 
	  dots[slideIndex-1].className += " activedot";
	}
	document.getElementById("footer").style.display = "none";
</script>

<script>
$(document).ready(function(){
  // Add smooth scrolling to all links
  $("a").on('click', function(event) {

    // Make sure this.hash has a value before overriding default behavior
    if (this.hash !== "") {
      // Prevent default anchor click behavior
      event.preventDefault();

      // Store hash
      var hash = this.hash;

      // Using jQuery's animate() method to add smooth page scroll
      // The optional number (800) specifies the number of milliseconds it takes to scroll to the specified area
      $('html, body').animate({
        scrollTop: $(hash).offset().top
      }, 800, function(){
   
        // Add hash (#) to URL when done scrolling (default click behavior)
        window.location.hash = hash;
      });
    } // End if
  });
});
</script>
</body>
</html>