<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri = "http://www.springframework.org/tags/form" %>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<html>
<head>
<link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="${path}/resources/common/css/common.css">
<script src="https://cdn.ckeditor.com/ckeditor5/23.1.0/classic/ckeditor.js"></script>
<script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>board</title>
</head>
<script type="text/javascript">
	
	$(document).ready(function(){
		
		var mode = '<c:out value="${mode}"/>';
		
		if(mode == 'edit') {
			$("#reg_id").prop("readonly", true);
			$("input:hidden[name='bid']").val(<c:out value="${boardContent.bid}"/>);
			$("input:hidden[name='mode']").val('<c:out value="${mode}"/>');
			$("#reg_id").val('<c:out value="${boardContent.reg_id}"/>');
			$("#title").val('<c:out value="${boardContent.title}"/>');
			$("#content").val('<c:out value="${boardContent.content}"/>');
			$("#tag").val('<c:out value="${boardContent.tag}"/>');
		}
		
		$("#btnSave").on("click", function(){
			$("#form").submit();
		});
		
		$("#btnList").on("click", function(){
			location.href = "${path}/board/getBoardList";
		});
		
	});
	
</script>
<body>
	<article>
		<div class="container" role="main">
			<h2>board Form</h2>
			
			<form:form name="form" id="form" role="form" method="post" action="${path }/board/saveBoard" modelAttribute="boardVO">
				<form:hidden path="bid"/>
				<input type="hidden" name="mode"/>
				
				<div class="mb-3">
					<label for="title">제목</label>
					<form:input path="title" class="form-control" type="text" name="title" id="title" placeholder="제목을 입력해 주세요."/>
				</div>
				
				<div class="mb-3">
					<label for="reg_id">작성자</label>
					<form:input path="reg_id" class="form-control" type="text" name="reg_id" id="reg_id" placeholder="이름을 입력해 주세요."/>
				</div>
				
				<div class="mb-3">
					<label for="content">내용</label>
					<form:textarea path="content" class="form-control" rows="5" name="content" id="content" placeholder="내용을 입력해 주세요."/>
				</div>
				
				<div class="mb-3">
					<label for="tag">TAG</label>
					<form:input path="tag" class="form-control" type="text" name="tag" id="tag" placeholder="태그를 입력해 주세요."/>
				</div>
				
				
			</form:form>
			
			<div>
				<button type="button" class="btn btn-sm btn-primary" id="btnSave">저장</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
			</div>
		</div>
	</article>
</body>
</html>
<script src="${Path}/resources/common/js/ckeditor.js"></script>