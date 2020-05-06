<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<nav class="navbar navbar-inverse back">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand"  href="${pageContext.request.contextPath}"><img id="logo" alt="logo" src="${pageContext.request.contextPath}/resources/images/k2.jpg" ></a>
    </div>
    <c:if test="${ empty member}">
    <ul class="nav navbar-nav navbar-right ">
      <li><a href="${pageContext.request.contextPath}/member/MemberNew"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li>
      <li><a href="${pageContext.request.contextPath}/member/MemberLogin"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
    </ul>
    </c:if>
        <c:if test="${ not empty member}">
    <ul class="nav navbar-nav navbar-right ">
      <li><a href="${pageContext.request.contextPath}/member/MemberPage"><span class="glyphicon glyphicon-user"></span> 회원정보</a></li>
      <li><a href="${pageContext.request.contextPath}/member/MemberLogout"><span class="glyphicon glyphicon-log-out"></span> 로그아웃</a></li>
    </ul>
    </c:if>
  </div>
</nav>