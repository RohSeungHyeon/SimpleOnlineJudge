<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>질문 작성</title>

<link rel="apple-touch-icon" sizes="180x180"
	href="/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="/favicon-16x16.png">
<link rel="manifest" href="/site.webmanifest">
<link rel="mask-icon" href="/safari-pinned-tab.svg" color="#0076c0">
<meta name="msapplication-TileColor" content="#00aba9">
<meta name="theme-color" content="#ffffff">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://ddo7jzca0m2vt.cloudfront.net/unify/css/style.css?version=20200429">
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,700|Open+Sans:400,400i,700,700i|Source+Code+Pro&amp;subset=korean"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://ddo7jzca0m2vt.cloudfront.net/css/connect.css?version=20200429">
<link rel="stylesheet"
	href="https://ddo7jzca0m2vt.cloudfront.net/css/result.css?version=20200429">
<link rel="stylesheet"
	href="https://ddo7jzca0m2vt.cloudfront.net/unify/css/custom.css?version=20200429">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css">
<link rel="stylesheet"
	href="https://ddo7jzca0m2vt.cloudfront.net/unify/css/theme-colors/blue.css?version=20200429">
<link rel="stylesheet"
	href="https://ddo7jzca0m2vt.cloudfront.net/css/pace.css">
<script async
	src="https://www.googletagmanager.com/gtag/js?id=UA-10874097-3"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/noty/3.1.4/noty.min.css" />

</head>
<body>
	<%
		if (session.getAttribute("member") == null) {
	%>
	<script>
		alert('로그인 후 사용해주세요.');
		location.href = "login";
	</script>
	<c:if test="${problemList.size() <= 0 || problemList == null }">
		<script>
			alert('문제가 없습니다.');
			location.href = "home";
		</script>
	</c:if>

	<%
		} else {
	%>
	<nav class="navbar navbar-default">

		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>

			</button>
			<a class="navbar-brand" href="home"> 질문 게시판</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="/board/sample/questionlist">뒤로가기</a></li>

			</ul>
		</div>
	</nav>


	<div class="container">
		<div class="row">
			<form method="post" action="insertQuestion.do">
				<input type="hidden" name="m_id" value="${sessionScope.member.getId()}" />
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #eeeeee; text-align: center;">게시판
								글쓰기 양식</th>


						</tr>
					</thead>

					<tbody>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="글 제목" name="qst_title" maxlength="50"></td>
						</tr>
						<tr style="text-align: left; border: 1px solid #dddddd">
							<td>문제 선택 : <select id="prob_num_select" name="prob_num">
									<c:if test="${problemList.size() > 0 }">
										<c:forEach var="problem" items="${problemList}">
											<option value="${problem.getP_num()}">${problem.getP_num()}</option>
										</c:forEach>
									</c:if>
							</select></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용"
									name="qst_body" maxlength="2048" style="height: 350px;"></textarea></td>

						</tr>
					</tbody>


				</table>
				<input type="submit" class="btn btn-primary pull-right"
					value="글 작성하기">
			</form>

		</div>
	</div>
	<%
		}
	%>

	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>

</body>
</html>
</body>
</html>