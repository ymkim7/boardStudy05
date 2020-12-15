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
<title>userList</title>
</head>
<script type="text/javascript">

	$(document).ready(function(){
		
		$("#btnSearch").on("click", function(){
			
			var searchType = $("#searchType").val();
			var keyword = $("#keyword").val();
			var url = "${path}/board/getBoardList" + "?searchType=" + searchType + "&keyword=" + keyword;
			
			location.href = url;
			
		});
		
	});
	
	//이전 버튼 이벤트
	function fn_prev(page, range, rangeSize) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		var url = "${path}/board/getBoardList" + "?page=" + page + "&range=" + range;
		
		location.href = url;
	}
	
	//페이저 번호 클릭
	function fn_pagination(page, range, rangeSize, searchType, keyword) {
		var url = "${path}/board/getBoardList" + "?page=" + page + "&range=" + range;
		
		location.href = url;
	}
	
	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "${path}/board/getBoardList" + "?page=" + page + "&range=" + range;
		
		location.href = url;
	}
	
</script>
<body>
	<article>
		<div class="container">
			<h2>User List</h2>
			<div class="table-responsive">
				<table class="table table-striped table-sm">
					<colgroup>
						<col style="width:auto;"/>
						<col style="width:25%;"/>
						<col style="width:25%;"/>
						<col style="width:15%;"/>
						<col style="width:15%;"/>
					</colgroup>
					
					<thead>
						<tr>
							<th>User ID</th>
							<th>User Name</th>
							<th>email</th>
							<th>grade</th>
							<th>가입일</th>
						</tr>
					</thead>
					
					<tbody>
						<c:choose>
							<c:when test="${emptyuserList }">
								<tr><td colspan="5" align="center">데이터가 없습니다.</td></tr>
							</c:when>
							
							<c:when test="${!emptyuserList }">
								<c:forEach var="list" items="${userList }">
									<tr>
										<td><c:out value="${list.uid }"></c:out></td>
										<td><c:out value="${list.name }"></c:out></td>
										<td><c:out value="${list.email }"></c:out></td>
										<td><c:out value="${list.grade }"></c:out></td>
										<td><c:out value="${list.reg_dt }"></c:out></td>
									</tr>
								</c:forEach>
							</c:when>
						</c:choose>
					</tbody>
				</table>
			</div>
			
			<!-- pagination{s} -->
			<div id="paginationBox">
				<ul class="pagination">
					<c:if test="${pagination.prev }">
						<li class="page-item">
							<a class="page-link" href="#" onclick="fn_prev('${pagination.page}','${pagination.range }','${pagination.rangeSize }')">이전</a>
						</li>
					</c:if>
					
					<c:forEach begin="${pagination.startPage }" end="${pagination.endPage }" var="idx">
						<li class="page-item">
							<c:out value="${pagination.page == idx ? '' : '' }"/>
							<a class="page-link" href="#" onclick="fn_pagination('${idx}','${pagination.range }','${pagination.rangeSize }')">${idx }</a>
						</li>							
					</c:forEach>
					
					<c:if test="${pagination.next }">
						<li class="page-item">
							<a class="page-link" href="#" onclick="fn_next('${pagination.range}', '${pagination.range }', '${pagination.rangeSize }')">다음</a>
						</li>
					</c:if>
				</ul>
			</div>
			<!-- //pagination{e} -->
			
			<!-- search{s} -->
			<div class="form-group row justify-content-center">
				<div class="w100" style="padding-right:10px;">
					<select class="form-control form-control-sm" name="searchType" id="searchType">
						<option value="title">제목</option>
						<option value="content">본문</option>
						<option value="reg_id">작성자</option>
					</select>
				</div>	
				
				<div class="w300" style="padding-right:10px;">
					<input type="text" class="form-control form-control-sm" name="keyword" id="keyword"/>
				</div>
				
				<div>
					<button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch">검색</button>
				</div>
			</div>
			<!-- //search{e} -->
		</div>
	</article>
</body>
</html>