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
<title>Menu List</title>
</head>
<script type="text/javascript">
	
	$(document).ready(function(){
		
		$("#btnSave").on("click", function(e){
			
			
			var paramData = {
					"code" : $("#code").val()
					, "codename" : $("#codename").val()
					, "sort_num" : $("#sort_num").val()
					, "comment" : $("#comment").val()
			};
			
			if($("#mid").val() != 0) {
				var url = "${path}/restMenu/updateMenu";
			} else {
				var url = "${path}/restMenu/saveMenu";
			}
			
			$.ajax({
				url : url
				, type : "post"
				, dataType : "json"
				, data : paramData
				, success : function(result){
					fn_showList();
					$("#btnInit").trigger("click");
				}
			});
			
			$("#btnDelete").on("click", function(){
				
				var url = "${path}/restMenu/deleteMenu";
				var paramData = {"code" : $("#code").val()};
				
				if($("#code").val() == "") {
					alert("삭제할 코드를 선택해 주세요.")
				}
				
				$.ajax({
					url : url
					, type : "post"
					, dataType : "json"
					, data : paramData
					, success : function(result){
						fn_showList();
						$("#btnInit").trigger("click");
					}
				});
				
			});
			
			//초기화 버튼 이벤트 부분추가
			$("#btnInit").on("click", function(e){
				$("#mid").val('');
				$("#code").val('');
				$("#codename").val('');
				$("#sort_num").val('');
				$("#comment").val('');
			});
			
		});
		
		fn_showList();
		
	});
	
	function fn_showList() {
		
		var paramData = {};
		
		$.ajax({
			url : "${path}/restMenu/getMenuList"
			, type : "post"
			, dataType : "json"
			, data : paramData
			, success : function(result) {
				
				if(result.status == "OK") {
					if(result.menuList.length > 0) {
						
						var list = result.menuList;
						var htmls = "";
						
						result.menuList.forEach(function(e){
							htmls += '<tr>';
							htmls += '	<td>' + e.mid + '</td>';
							htmls += '	<td>';
							htmls += '		<a href="#" onclick="fn_menuInfo(' + e.mid + ',\'' + e.code +'\',\'' + e.codename + '\', ' + e.sort_num + ', \'' + e.comment + '\')" >';
							htmls += e.code;
							htmls += '		</a>';
							htmls += '	</td>';
							htmls += '	<td>' + e.codename + '</td>';
							htmls += '	<td>' + e.sort_num + '</td>';
							htmls += '	<td>' + e.comment + '</td>';
							htmls += '</tr>';
						});
						
					}
				}
				$("#menuList").html(htmls);
			}
		});
		
	}
	
	function fn_menuInfo(mid, code, codename, sort_num, comment) {
		$("#mid").val(mid);
		$("#code").val(code);
		$("#codename").val(codename);
		$("#sort_num").val(sort_num);
		$("#comment").val(comment);
		
		//코드 부분 읽기 모드로 전환
		$("#code").attr("readonly", true);
	}
	
</script>
<body>
	<article>
		<div class="container">
			<!-- Menu form{s} -->
			<h4 class="mb-3">Menu Info</h4>
			<div>
				<form:form name="form" id="form" role="form" modelAttribute="menuVO" method="post" action="${path }/menu/saveMenu">
					<form:hidden path="mid" id="mid"/>
					<div class="row">
						<div class="col-md-4 mb-3">
							<label for="code">Code</label>
							<form:input path="code" id="code" class="form-control" placeholder="" value="" required=""/>
							<div class="invalid-feedback">Valid Code is required.</div>
						</div>
						
						<div class="col-md-5 mb-3">
							<label for="codename">Code name</label>
							<form:input path="codename" class="form-control" id="codename" placeholder="" value="" required=""/>
							<div class="invalid-feedback">Valid Code name is required.</div>
						</div>
							
						<div class="col-md-3 mb-3">
							<label for="sort_num">Sort</label>
							<form:input path="sort_num" class="form-control" id="sort_num" placeholder="" value="" required=""/>
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-12 mb-3">
							<label for="comment">Comment</label>
							<form:input path="comment" class="form-control" id="comment" placeholder="" value="" required=""/>
						</div>
					</div>
				</form:form>
			</div>
			<!-- //Menu form{e} -->
			
			<div>
				<button type="button" class="btn btn-sm btn-primary" id="btnSave">저장</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnDelete">삭제</button>
				<button type="button" class="btn btn-sm btn-primary" id="btnInit">초기화</button>
			</div>
			
			<h4 class="mb-3" style="padding-top:15px;">Menu List</h4>
			
			<!-- List{s} -->
			<div class="table-responsive">
				<table class="table table-striped table-sm">
					<colgroup>
						<col style="width:10%;"/>
						<col style="width:15%;"/>
						<col style="width:15%;"/>
						<col style="width:10%;"/>
						<col style="width:auto%;"/>
					</colgroup>
					
					<thead>
						<tr>
							<th>menu id</th>
							<th>code</th>
							<th>codename</th>
							<th>sort</th>
							<th>comment</th>
						</tr>
					</thead>
					
					<tbody id="menuList"></tbody>
				</table>
			</div>
			<!-- //List{e} -->
		</div>
	</article>
</body>
</html>