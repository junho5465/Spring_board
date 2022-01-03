<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<script src="/resources/vendor/jquery/jquery.min.js"></script>

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
</head>
<script type="text/javascript">
	$(document).ready(
			function() {
				var result = '<c:out value="${result}"/>';
				//모달 보여주기 추가
				checkModal(result);
				history.replaceState({}, null, null); //현재의 history entity 변경 함수
				function checkModal(result) {
					if (result === '' || history.state) {
						return;
					}
					if (parseInt(result) > 0) {
						$(".modal-body").html(
								"게시글" + parseInt(result) + " 번이 등록되었습니다.");
					}
					$("#myModal").modal("show");
				}

				$("#regBtn").on("click", function() {
					console.log("clicked");
					self.location = "/board/register";
				});//버튼 클릭 시 등록창으로 이동
			}); //document ready
</script>
<body>
	<jsp:include page="../include/header.jsp" />
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">리스트</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						게시글 목록
						<button id="regBtn" type="button"
							class="btn btn-outline btn-success btn-xs pull-right">글쓰기</button>
					</div>
					<!-- /.panel-heading -->

					<div class="panel-body">
						<table width="100%"
							class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th>#번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>수정일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${list }">
									<tr class="odd gradeX">
										<td>${item.bno }</td>
										<td><a class='move' href='<c:out value="${item.bno }"/>'>
												<c:out value="${item.title }" />
										</a></td>
										<td>${item.writer }</td>
										<td><fmt:formatDate value="${item.regDate}"
												pattern="yyyy/MM/dd" /></td>
										<td><fmt:formatDate value="${item.updateDate}"
												pattern="yyyy/MM/dd" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class='row'>
							<div class="col-lg-12">
								<form id='searchForm' action='/board/list' method='get'>
									<select name='type'>
										<option value=""
											<c:out value="${pageMaker.cri.type==null?'selected':'' } "/>>----
										</option>
										<option value="T"
											<c:out value="${pageMaker.cri.type eq 'T'?'selected':'' }"/>>제목</option>
										<option value="C"
											<c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }"/>>내용</option>
										<option value="W"
											<c:out value="${pageMaker.cri.type eq 'W'?'selected':'' }"/>>작성자</option>
										<option value="TC"
											<c:out value="${pageMaker.cri.type eq 'TC'?'selected':'' }"/>>제목
											or 내용</option>
										<option value="TW"
											<c:out value="${pageMaker.cri.type eq 'TW'?'selected':'' }"/>>제목
											or 작성자</option>
										<option value="TCW"
											<c:out value="${pageMaker.cri.type eq 'TCW'?'selected':'' }"/>>제목
											or 내용 or 작성자</option>
									</select> <input type='text' name='keyword'
										value='<c:out value="${pageMaker.cri.keyword }"/>' /> <input
										type='hidden' name='pageNum'
										value='<c:out value="${pageMaker.cri.pageNum }"/> ' /> <input
										type='hidden' name='amount'
										value='<c:out value="${pageMaker.cri.amount }"/> ' />
									<button class='btn btn-info'>Search</button>
								</form>
							</div>
						</div>

						<div class='pull-right'>
							<ul class="pagination">
								<c:if test="${pageMaker.prev }">
									<li class="paginate_button previous"><a
										href="${pageMaker.startPage-1 }">Previous</a></li>
								</c:if>
								<c:forEach var="num" begin="${pageMaker.startPage }"
									end="${pageMaker.endPage }">
									<li class="paginate_button ${pageMaker.cri.pageNum==num?"active":"" }"><a
										href="${num }">${num }</a></li>
								</c:forEach>
								<c:if test="${pageMaker.next }">
									<li class="paginate_button next"><a
										href="${pageMaker.endPage+1 }">Next</a></li>
								</c:if>
							</ul>
						</div>
						<form id='actionForm' action="/board/list" method='get'>
							<input type='hidden' name='pageNum'
								value='${pageMaker.cri.pageNum }'> <input type='hidden'
								name='amount' value='${pageMaker.cri.amount }'>
								 <input type='hidden'
								name='type' value='${pageMaker.cri.type }'>
								 <input type='hidden'
								name='keyword' value='${pageMaker.cri.keyword }'>
						</form>
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
							aria-labelledby="myMoalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">&times;</button>
										<h4 class="modal-title" is="myModalLabel">Modal title</h4>
									</div>
									<div class="modal-body">처리가 완료되었습니다.</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">Close</button>
										<button type="button" class="btn btn-default">Save
											Changes</button>
									</div>
								</div>
							</div>
						</div>
						<!-- /.modal fade -->
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
		</div>
	</div>
	<jsp:include page="../include/footer.jsp" />
	<script>
		var actionForm = $("#actionForm");
		$(".paginate_button a").on("click", function(e) {
			e.preventDefault();
			console.log('click');
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		})

		$(".move").on(
				"click",
				function(e) {
					e.preventDefault();
					//console.lig('click');
					actionForm.append("<input type='hidden' name='bno' value='"
							+ $(this).attr("href") + "'>");
					actionForm.attr("action", "/board/get");
					actionForm.submit();
				})

		var searchForm = $("#searchForm");
		$("#searchForm button").on("click", function(e) {
			if (!searchForm.find("option:selected").val()) {
				alert("검색 종류를 선택하삼;;");
				return false;
			}
			if (!searchForm.find("input[name='keyword']").val()) {
				alert("키워드 입력하삼 ㅡㅡ");
				return false;
			}
			searchForm.find("input[name='pageNum']").val("1");
			e.preventDefault();
			searchForm.submit();
		})
	</script>
</body>
</html>