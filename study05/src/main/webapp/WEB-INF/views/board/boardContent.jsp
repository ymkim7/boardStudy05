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
<script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>board</title>
</head>
<script type="text/javascript">

	$(document).ready(function(){
		
		$("#btnList").on("click", function(){
			location.href = "${path}/board/getBoardList";
		});
		
		$("#btnUpdate").on("click", function(){
			
			var url = "${path}/board/editForm";
			
			url = url + "?bid=" + ${boardContent.bid} + "&mode=edit";
			location.href = url;
		});
		
		$("#btnDelete").on("click", function(){
			
			var url = "${path}/board/deleteBoard";
			
			url = url + "?bid=" + ${boardContent.bid};
			location.href = url;
		});
		
		$("#btnReplySave").on("click", function(){
			
			var replyContent = $("#content").val();
			var replyReg_id = $("#reg_id").val();
			var bid = '${boardContent.bid}';
			var paramData = JSON.stringify({
				"content" : replyContent
				, "reg_id" : replyReg_id
				, "bid" : bid
			});
			var headers = {
					"Content-Type" : "application/json"
					, "X-HTTP-Method-Override" : "POST"
			};
			
			$.ajax({
				url : "${path}/restBoard/saveReply"
				, headers : headers
				, data : paramData
				, type : 'POST'
				, dataType : 'text'
				, success : function(result) {
					showReplyList();
					
					$("#content").val('');
					$("#reg_id").val('');
				}
			});
			
		});
		
		showReplyList();
		
	});
	
	function showReplyList() {
		
		var url = "${path}/restBoard/getReplyList";
		var paramData = {"bid" : "${boardContent.bid}"};
		
		$.ajax({
			type : 'post'
			, url : url
			, data : paramData
			, dataType : 'json'
			, success : function(result) {
				
				var htmls = "";
				
				if(result.length < 1) {
					htmls = "등록된 댓글이 없습니다.";
				} else {
					$(result).each(function(){
						htmls += '<div class="media text-muted pt-3" id="rid' + this.rid + '">';
						htmls += '	<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';
						htmls += '		<title>Placeholder</title>';
						htmls += '		<rect width="100%" height="100%" fill="#007bff"></rect>';
						htmls += '		<text x="50%" fill="#007bff" dy=".3em">32x32</text>';
						htmls += '	</svg>';
						htmls += '	<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
						htmls += '		<span class="d-block">';
						htmls += '			<strong class="text-gray-dark">' + this.reg_id + '</strong>';
						htmls += '			<span style="padding-left: 7px; font-size: 9pt">';
						htmls += '				<a href="javascript:void(0)" onclick="fn_editReply(' + this.rid + ', \'' + this.reg_id + '\', \'' + this.content + '\' )" style="padding-right:5px">수정</a>';
						htmls += '				<a href="javascript:void(0)" onclick="fn_deleteReply(' + this.rid + ')" >삭제</a>';
						htmls += '			</span>';
						htmls += '		</span>';
						htmls += this.content;
						htmls += '	</p>';
						htmls += '</div>';
					});
				}
				$("#replyList").html(htmls);
			}
		});
		
	}
	
</script>
<body>
	<article>
		<div class="container" role="main">
			<h2>board Content</h2>
			
			<div class="bg-white rounded shadow-sm">
				<div class="board_title">
					<span class="board_author"><c:out value="${boardContent.reg_id }"></c:out>,</span>
					<span class="board_date"><c:out value="${boardContent.reg_dt }"></c:out></span>
				</div>
				<div class="board_content">${boardContent.content }</div>
				<div class="board_tag">TAG:<c:out value="${boardContent.tag }"></c:out></div>
			</div>
			
			<div style="margin-top:20px;">
				<button type="button" class="btn btn-sm btn-primary" id="btnUpdate">수정</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnDelete">삭제</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnList">목록</button>
			</div>
			
			<!-- Reply Form{s} -->
			<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top:10px;">
				<form:form name="form" id="form" role="form" modelAttribute="replyVO" method="post">
					<form:hidden path="bid" id="bid"/>
					<div class="row">
						<div class="col-sm-10">
							<form:textarea path="content" id="content" class="form-control" rows="3" placeholder="댓글을 달아주세요."></form:textarea>
						</div>
						
						<div class="col-sm-2">
							<form:input path="reg_id" class="form-control" id="reg_id" placeholder="댓글 작성자"></form:input>
							<button type="button" class="btn btn-sm btn=primary" id="btnReplySave" style="width:100%; margin-top:10px;">저장</button>
						</div>
					</div>
				</form:form>
			</div>
			<!-- //Reply Form{e} -->
			
			<!-- Reply List{s} -->
			<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top:10px;">
				<h6 class="border-bottom pb-2 mb-0">Reply List</h6>
				<div id="replyList"></div>
			</div>
			<!-- //Reply List{e} -->
		</div>
	</article>
</body>
</html>