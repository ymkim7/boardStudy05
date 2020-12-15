<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri = "http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<html>
<head>
<link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="${path}/resources/common/css/common.css">
<script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>login</title>
</head>
<script type="text/javascript">
	
	function fn_btnSignupClick() {
		location.href = "${path}/user/signupForm";
	}
	
</script>
<body>
	<!-- login form{s} -->
	<form:form class="form-signin" name="form" id="form" role="form" modelAttribute="userVO" method="post" action="${path }/board/saveBoard">
		<div class="text-center mb-4">
			<h1 class="h3 mb-3 forn-weight-normal">study05</h1>
		</div>
		
		<div class="form-label-group">
			<form:input path="uid" id="uid" class="form-control" placeholder="User ID" required="" autofocus=""/>
			<label for="uid" class="sr-only">User ID</label>
		</div>
		
		<div class="form-label-group">
			<form:input path="pwd" id="pwd" class="form-control" placeholder="User Password" required=""/>
			<label for="pwd" class="sr-only">User Password</label>
		</div>
		
		<button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
		<span style="font-size:11pt;">
			<a href="#" onclick="fn_btnSignupClick();">회원가입</a>
		</span>
	</form:form>
	<!-- //login form{e} -->
</body>
</html>