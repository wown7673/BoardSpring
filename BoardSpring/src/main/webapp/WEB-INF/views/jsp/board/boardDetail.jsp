<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세</title>

<!-- 1 -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- 2. css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<link href="${pageContext.request.contextPath}/resources/css/fontawesome-all.css" rel="stylesheet">

<!-- 3. js -->
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
<script src="<c:url value='/resources/js/common.js' />"></script>
<script src="<c:url value='/resources/js/common-http.js' />"></script>

<style type="text/css">
body {
	/* 브라우저가 지원안하면 두번째폰트 적용됨 */
	font-family: '나눔고딕', NanumGothic, '맑은고딕', MalgunGothic, '돋움', Dotum,
		Helvetica, sans-serif;
}

.content-text{
	min-height:180px;
}

board-container
</style>
<script type="text/javascript">
	$(document).ready(function() {

		$("#updateBtn").on("click",function(){
			// 유효성체크후
			updateBoard();
		});

		$("#listBtn").on("click",function(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/openBoardList.do' />");
			comSubmit.submit();			
		});		
		
	});

	function updateBoard(){
		
	}

	
</script>
</head>
<body>
	<div class="container">
		<div class="row mr-0 ml-0 pt-3 pb-3 bg-light">
			<label for="staticName" class="col-4 col-form-label"><h4 class="m-auto">글 상세</h4></label>							 				
		</div>
		<div class="p-2 border">
			<div class="d-flex">	
				<span><i class="far fa-user"></i></span>
				<span class="ml-2">${board.CREA_ID}</span>
				<span class="ml-2">${board.CREA_DATE}</span>
				<span class="ml-auto mr-3"><i class="far fa-eye mr-2"></i>${board.HIT_CNT}</span>
			</div>
		</div>
		<div class="p-2 border border-top-0">
			<span class="text-black-50">#${board.SEQ}</span>						
			<h4>${board.TITLE}</h4>
		</div>
		<div class="content-text border border-top-0 p-2">${board.CONTENT}</div>		
		<div class="d-flex m-3">
			<button id="listBtn" class="btn btn-sm btn-primary btn-lg ml-auto"><i class="fas fa-list-alt mr-1"></i></i>목록으로</button>
			<button id="replyBtn" class="btn btn-sm btn-primary btn-lg ml-1"><i class="fab fa-replyd mr-1"></i></i>답글</button>
			<button id="updateBtn" class="btn btn-sm btn-primary btn-lg ml-1"><i class="far fa-edit mr-1"></i></i>수정</button>
		</div>
	</div>
	
	<form id="commonForm"></form>
</body>
</html>