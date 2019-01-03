<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판목록</title>

<!-- 1 -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- 2. css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<link href="${pageContext.request.contextPath}/resources/css/fontawesome-all.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/common/summernote/summernote-bs4.css" rel="stylesheet">


<!-- 3. js -->
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>
<script src="<c:url value='/resources/js/popper.js' />"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
<script src="<c:url value='/resources/js/tooltip.js' />"></script>
<script src="<c:url value='/resources/js/common.js' />"></script>
<script src="<c:url value='/resources/js/common-http.js' />"></script>
<script src="<c:url value='/resources/common/summernote/summernote-bs4.js' />"></script>
<script src="<c:url value='/resources/common/summernote/lang/summernote-ko-KR.js' />"></script>

<style type="text/css">
body {
	/* 브라우저가 지원안하면 두번째폰트 적용됨 */
	font-family: '나눔고딕', NanumGothic, '맑은고딕', MalgunGothic, '돋움', Dotum,
		Helvetica, sans-serif;
}

.list_table table thead tr th {
	font-size: 0.7rem;
}

.list_table .seq, .list_table .cnt, .list_table .creaid, .list_table .creadate
	{
	font-size: 0.7rem;
}
</style>
</head>
<body>
<%-- <form action="<c:url value='/board/selectBoardList.do' />"  method="post">
	<input type="submit" value="123"> --%>
</form>
	<div class="container">
		<div class="row bg-light mx-0 py-3">
				<label for="staticName" class="col-4 col-form-label"><h4 class="m-auto">게시글 작성</h4></label>				
		</div>
		<div>
			<input type="text" id="title" class="form-control" placeholder="제목을 입력해 주세요!">
		</div>
		<div>
			<div id="summernote"></div>
		</div>
		
		
		<div class="d-flex m-3">
			<button id="addBtn" class="btn btn-sm btn-primary btn-lg ml-auto"><i class="fas fa-user-edit mr-1"></i>등록</button>
			<button id="cancleBtn" class="btn btn-sm btn-primary btn-lg ml-2"><i class="fas fa-undo mr-1"></i>취소</button>
		</div>	
	</div>


	<!-- Modal -->
	<div class="modal fade" id="searchModal" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-body">
	       	 제목을 입력해주세요
	          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	    </div>
	  </div>
	</div>


<form id="commonForm"></form>

<script type="text/javascript">
	$(document).ready(function() {

		 $('#summernote').summernote({
			 minHeight:300,
			 focus: true,
			 lang: 'ko-KR'		 
		 });
		 
		 $("#addBtn").on("click",function(){
			 insertBoard();
		 });
	});


	
	function insertBoard(){
		var title = $("#title").val();
		var content = $('#summernote').summernote('code');
		
		if(gfn_isNull(title)){
			alert("제목을 입력해주세요");
			return false;
		}
		
	
		var comSubmit = new ComSubmit();
		comSubmit.addParam("TITLE", title);
		comSubmit.addParam("CONTENT", content);
		comSubmit.setUrl("<c:url value='/board/insertBoard.do' />");
		comSubmit.submit();		
	}
	

	
</script>
</body>
</html>