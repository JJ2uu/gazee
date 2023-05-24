<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../../resources/css/style2.css" rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {

		$('.pages').click(function() {
			//$('#result').empty()
			$.ajax({
				url : "csCategory",
				data : {
					page : $(this).text(),
					mode : 2,
					category1 : '${categoryValue}'
				},
				success : function(result) { //결과가 담겨진 table부분코드
					$('#result').html(result)
				},
				error : function() {
					alert('실패.@@@')
				}
			}) //qna 페이징
		})

		$('#csCategoryList')
				.click(
						function() {
							var category1 = $('#category').val();
							location.href = "../../customerService/cs/csCategory?page=1&mode=1&category1="
									+ category1;

						})//qna 카테고리 버튼(목록)

		$('#csSearchBtn')
				.click(
						function() {
							var search1 = $('#csSearch').val();
							location.href = "../../customerService/cs/csSearch?page=1&mode=1&search1="
									+ search1;

						})//qna 검색 버튼

		$('#csWrite').click(function() {
			location.href = "../../customerService/cs/goToCsWrite"
		}) //qna 글쓰기 버튼

	})
</script>

</head>
<body>
	<div id="wrap">
		<div id="header">
			<jsp:include page="/home/Header.jsp" flush="true" />
		</div>
		<div id="content_wrap" style="text-align: left">
			<div id="content">
				<div id="customerServiceMain">
					<div id="customerHead">
						<h1 style="color: #693FAA">고객센터</h1>
					</div>
					<div id="customerMenu1" style="margin-top: 30px">

						<div class="FAQ">
							<div style="display: flex; justify-content: space-between;">

								<h3 style="color: #693FAA">
									<a href="csList?page=1&mode=1"
										style="color: #693FAA !important;">1:1 질문 게시판(QnA)</a>
								</h3>
								<div
									style="display: flex; justify-content: space-between; align-items: center; gap: 10px">
									<form method="get">
										<label for="category">카테고리</label> <select id="category"
											name="category" size="1">
											<option value="">선택하세요.</option>
											<option value="페이 관련">페이 관련</option>
											<option value="배송 관련">배송 관련</option>
											<option value="계정 관련">계정 관련</option>
											<option value="거래 관련">거래 관련</option>
										</select>
									</form>
									<button id="csCategoryList">목록</button>
									<button id="csWrite">글쓰기</button>
								</div>
							</div>
						</div>
					</div>
					<div style="display: flex; justify-content: space-between;">
						<div id="customerServiceSideBar">
							<table>
								<tr>
									<td><a href="../faq/faqlist?page=1&mode=1">FAQ게시판 목록</a></td>
								</tr>
								<tr>
									<td><a href="../cs/csList?page=1&mode=1">질문게시판 목록</a></td>
								</tr>
								<tr>
									<td><a href="../report/reportList?page=1&mode=1">신고게시판
											목록</a></td>
								</tr>
							</table>
						</div>
						<div style="width: 80%;">

							<div id=result>
								<table class="table table-striped"
									style="margin: 0 auto;">
									<tr>
										<td class="top">번호</td>
										<td class="top">제목</td>
										<td class="top">작성자</td>
										<td class="top">작성날짜</td>
										<td class="top">조회수</td>
									</tr>
									<c:forEach items="${category}" var="bag">
										<tr>
											<td class="down">${bag.csNo}</td>
											<td class="down"><a href="csOne?no=${bag.csId}">${bag.csTitle}</a></td>
											<td class="down">${bag.csWriter}</td>
											<td class="down">${bag.csDate}</td>
											<td class="down">${bag.csView}</td>
										</tr>
									</c:forEach>
								</table>

							</div>
							<div id="paging" style="margin-top: 10px; text-align: center">
								<%
									int pages1 = (int) request.getAttribute("pages1");
								for (int p = 1; p <= pages1; p++) {
								%>
								<button class="pages"
									style="background: lime; color: red; width: 50px;"><%=p%></button>
								<%
									}
								%>
							</div>
							<div id="csButtom" style="margin-top: 10px; text-align: center">

								<div id="search" style="margin-top: 10px">
									<input id="csSearch" type="text" size=40;>
									<button id="csSearchBtn">검색</button>
								</div>
							</div>
						</div>
					</div></div></div></div>
					<jsp:include page="/home/Footer.jsp" flush="true" />
				</div>
</body>
</html>