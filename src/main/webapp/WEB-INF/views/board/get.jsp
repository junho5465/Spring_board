<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin 2 - Bootstrap Admin Theme</title>

<!-- Bootstrap Core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="/resources/vendor/metisMenu/metisMenu.min.css"
	rel="stylesheet">

<!-- DataTables CSS -->
<link
	href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css"
	rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link
	href="/resources/vendor/datatables-responsive/dataTables.responsive.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="/resources/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<script src="../resources/js/reply.js"></script>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">게시물 조회</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<!-- /.panel-heading -->
					<form id="operForm" action="/board/modify" method="get">
						<input type='hidden' id='bno' name='bno'
							value='<c:out value="${board.bno }"/>'> <input
							type='hidden' name='pageNum'
							value='<c:out value="${cri.pageNum }"/>'> <input
							type='hidden' name='amount'
							value='<c:out value="${cri.amount }"/>'> <input
							type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
						<input type='hidden' name='keyword'
							value='<c:out value="${cri.keyword }"/>'>
					</form>
					<div class="panel-body">
						<div class="form-group">
							<label>Bno</label><input class="form-control" name="bno"
								value='<c:out value="${board.bno }"/>' readonly="readonly">
						</div>
						<div class="form-group">
							<label>Title</label><input class="form-control" name="title"
								value='<c:out value="${board.title }"/>'>
						</div>
						<div class="form-group">
							<label>Content</label>
							<textarea class="form-control" rows="3" name="content"><c:out
									value="${board.content }" />
							</textarea>
						</div>
						<div class="form-group">
							<label>Writer</label><input class="form-control" name="writer"
								value='<c:out value="${board.writer }"/>' readonly="readonly">
						</div>
						<button data-oper='modify' class="btn btn-outline btn-warning">Modify</button>
						<button data-oper='list' class="btn btn-outline btn-success">List</button>
						<form id="operForm" action="/board/modify" method="get">
							<input type="hidden" id='bno' name='bno'
								value='<c:out value="${board.bno }"/>'>
						</form>
					</div>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
	</div>
	<jsp:include page="../include/footer.jsp" />
	<script type="text/javascript">
		$(document).ready(function() {
			//reply module
			console.log(replyService);
			var operForm = $("#operForm");
			var bnoValue = '<c:out value="${board.bno}"/>';
			//=========add===============
			replyService.add({
				reply : "JS TEST",
				replyer : "js tester",
				bno : bnoValue
			} //댓글 데이터
			, function(result) {
				alert("RESULT : " + result);
			});
			//=========getList===============
			replyService.getList({
				bno : bnoValue,
				page : 1
			}, function(list) {
				for (var i = 0, len = list.length || 0; i < len; i++) {
					console.log(list[i]);
				}
			})
			//=========remove===============
// 			replyService.remove(5, function(count) {
// 				console.log(count);
// 				if (count === "success") {
// 					alert("REMOVED");
// 				}
// 			}, function(err) {
// 				alert('error occurred...');
// 			});
			//=========update===============
			replyService.update({
				rno : 9,
				bno : bnoValue,
				reply : "modified reply...."
			}, function(result) {
				alert("수정 완료");
			})
			//=========get===============
			replyService.get(10, function(data){
				console.log(data);
			})
				
			$('button[data-oper="modify"]').on("click", function(e) {
				operForm.attr("action", "/board/modify").submit();
			})
			$('button[data-oper="list"]').on("click", function(e) {
				operForm.find("#bno").remove();
				operForm.attr("action", "/board/list");
				operForm.submit();
			})
		})
	</script>
</body>
</html>