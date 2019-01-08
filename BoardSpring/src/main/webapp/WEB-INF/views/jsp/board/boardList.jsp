<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>�Խ��Ǹ��</title>

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
	/* �������� �������ϸ� �ι�°��Ʈ ����� */
	font-family: '�������', NanumGothic, '�������', MalgunGothic, '����', Dotum,
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
				<label for="staticName" class="col-4 col-form-label"><h4 class="m-auto">�Խ��� ���</h4></label>			
						
	 			<div class="input-group input-group-sm col-4 ml-auto">
					<input type="text" id="searchCondition" class="form-control m-auto" placeholder="search">
					<div class="input-group-append m-auto">
						<button id="searchBtn" class="input-group-text"><i class="fas fa-search"></i></button>
					</div>
				</div> 		
		</div>
		<div class="list_table m-0">
			<table class="table table-hover text-center">
				<colgroup>
					<col width="5%">
					<col width="*%">
					<col width="10%">
					<col width="10%">
					<col width="15%">
				</colgroup>
				<thead class="thead-light">
					<tr>
						<th scope="col">#</th>
						<th scope="col" class="test">����</th>
						<th scope="col">��ȸ��</th>
						<th scope="col">�ۼ���</th>
						<th scope="col">�ۼ���</th>
					</tr>
				</thead>
				<tbody>
					<!-- ���� �̺κ��� ajax�� �����ð��̴�(js����ó��) -->
					<%-- 
					<c:forEach items="${list}" var="board">
						<tr>
							<td class="seq">${board.SEQ}</td>
							<td>${board.TITLE}</td>
							<td class="cnt">${board.HIT_CNT}</td>
							<td class="creaid">${board.CREA_ID}</td>
							<td class="creadate">${board.CREA_DATE}</td>
						<tr>
					</c:forEach>
					  --%>
				</tbody>
			</table>
			<nav aria-label="Page navigation example" id="paging"></nav>
		</div>
		<div class="d-flex m-3">
			<button id="writeBtn" class="btn btn-sm btn-primary btn-lg ml-auto"><i class="fas fa-user-edit mr-1"></i>�۾���</button>
		</div>
	</div>


	<!-- Modal -->
	<div class="modal fade" id="searchModal" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-body">
	       	 �˻�� �־��ּ���!
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
		var hash = parseInt(location.hash.slice(1));
		if(isNaN(hash)){
			selectBoardList(1);			
		}else{
			selectBoardList(hash);
		}
		

		$(window).on('hashchange', function() {
			var hash = parseInt(location.hash.slice(1));

			// ���� selectBoardList ��ȸ
			// selectBoardList �ݹ�� �ؽ������������ selectBoardList��ȸ
			// ���� �ι� selectBoardList �Ǵ°ɸ���
			if (hash != gfv_currPage) {

				selectBoardList(hash);
			}
		});
		
		
		
		$('#searchBtn').on("click",function(){
			search();
		});

		$('#searchCondition').on("keydown",function(){
			if(event.keyCode==13){
				search();
			}
		});
		
		$(document).on('click', '#title', function(e){
			//e.preventDefault();
			var seq = $(this).data("seq");		
			selectBoardDetail(seq);
		});
		
		$('#writeBtn').on("click",function(){
			writeBoard();
		});		
		
	});

	function writeBoard(){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/board/writeBoard.do' />");
		comSubmit.submit();		
	}
	
	function selectBoardDetail(seq){
		//document.location.hash = "#" + parseInt(location.hash.slice(1));
		var comSubmit = new ComSubmit();
		comSubmit.addParam("SEQ", seq);
		comSubmit.setUrl("<c:url value='/board/selectBoardDetail.do' />");
		comSubmit.submit();
	}
	
	function search(){
		var $search = gfn_trim($("#searchCondition").val());

		if( !gfn_isNull( $search)){
			selectBoardList(1, $search);
		}else{
			selectBoardList(1);
			//alert("�˻�� �־��ּ���");
			//$('#searchModal').modal();
		}		
	}
	
	gfv_currPage = "";
	function selectBoardList(page , search) {
		var comAjax = new CommAjax();
		gfv_currPage = page;
		comAjax.addParam("page", page);
		if(!gfn_isNull(search)){
			comAjax.addParam("search", search);		
		}

		comAjax.setUrl("<c:url value='/board/selectBoardList.do' />");
		comAjax.setCallBack("createList");
		comAjax.ajax();
	}

	// ����������Ʈ ����
	function createList(data) {
		// �ؽ�����
		document.location.hash = "#" + data.paging.page;

		var paging = data.paging;
		var list = paging.list;

		var startPage = paging.startPage;
		var endPage = paging.endPage;
		var page = paging.page;
		var prev = paging.prev;
		var next = paging.next;

		// 1. ���̺���
		// 2. ����¡

		var html = "";
		for (var i = 0; i < list.length; i++) {

			html += "<tr>";
			html += "<td class='seq'>";
			html += list[i].SEQ;
			html += "</td>";
			html += "<td id='title' data-seq='"+list[i].SEQ+"'>";
			html += list[i].TITLE;
			html += "</td>";
			html += "<td class='cnt'>";
			html += list[i].HIT_CNT;
			html += "</td>";
			html += "<td class='creaid'>";
			html += list[i].CREA_ID;
			html += "</td>";
			html += "<td class='creadate'>";
			html += list[i].CREA_DATE;
			html += "</td>";
			html += "</tr>";

		}
		$(".list_table tbody").empty();
		$(".list_table tbody").append(html);

		// ����¡
		var params = {
			divId : "paging",
			eventName : "selectBoardList",
			paging : paging

		}
		// ����¡�������Լ�
		renderPaging(params);

	}

	gfv_eventName = "";
	function renderPaging(params) {
		var divId = params.divId;
		gfv_eventName = params.eventName;
		var paging = params.paging;
		var pageHtml = "";
		$("#" + divId).empty();

		pageHtml += '<ul class="pagination justify-content-center pagination-sm">';
		if (paging.prev) {
			pageHtml += '<li class="page-item">'
			pageHtml += '<a class="page-link" href="#" onclick="_movePage('
					+ (paging.startPage - 1) + '); return false;">';
			pageHtml += '<span aria-hidden="true">&laquo;</span>';
			pageHtml += '</a>';
			pageHtml += '</li>';
		} else {
			pageHtml += '<li class="page-item disabled">'
			pageHtml += '<a class="page-link" href="#" tabindex="-1" aria-disabled="true">';
			pageHtml += '<span aria-hidden="true">&laquo;</span>';
			pageHtml += '</a>';
			pageHtml += '</li>';
		}

		for (var i = paging.startPage; i <= paging.endPage; i++) {
			if (i == paging.page) {
				pageHtml += '<li class="page-item active" aria-current="page">';
				pageHtml += '<a class="page-link" href="#">' + i
						+ '<span class="sr-only">(current)</span></a></li>';
			} else {

				pageHtml += '<li class="page-item">';
				pageHtml += '<a class="page-link" href="#" onclick="_movePage('
						+ i + '); return false;">' + i + '</a>';
				pageHtml += '</li>';

			}
		}

		if (paging.next) {
			pageHtml += '<li class="page-item">'
			pageHtml += '<a class="page-link" href="#" onclick="_movePage('
					+ (paging.endPage + 1) + '); return false;">';
			pageHtml += '<span aria-hidden="true">&raquo;</span>';
			pageHtml += '</a>';
			pageHtml += '</li>';
		} else {
			pageHtml += '<li class="page-item disabled">'
			pageHtml += '<a class="page-link" href="#" tabindex="-1" aria-disabled="true">';
			pageHtml += '<span aria-hidden="true">&raquo;</span>';
			pageHtml += '</a>';
			pageHtml += '</li>';
		}

		pageHtml += '</ul>';

		$("#" + divId).append(pageHtml);
	}

	function _movePage(page) {

		eval(gfv_eventName + "(page)");
	}
	

	
</script>
</body>
</html>