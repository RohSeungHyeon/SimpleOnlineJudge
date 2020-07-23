<%@page import="com.spring.board.MemberDto"%>
<%@page import="com.spring.board.QuestionDto"%>
<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	pageContext.setAttribute("replaceChar", "\n");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>게시판 웹사이트</title>

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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
	function insertComment(f) {
		var qc_body = f.qc_body.value.trim();
		if (qc_body == '') {
			alert('내용을 입력해주세요.');
			f.qc_body.focus();
			return;
		}

		var data = $('#writeComment').serialize();

		var url = "insertComment.do";
		var obj = {
			"url" : url,
			"data" : data,
			"method" : "POST",
			"success" : function(data) {
				$('#commentList').html(data);
				$('#content').val("");
			}
		}
		$.ajax(obj);
	}
	
	function deleteComment(data){
		var comment = eval(data);
		
		var url = "deleteComment.do";
		var obj = {
			"url" : url,
			"data" : comment,
			"method" : "POST",
			"success" : function(data) {
				$('#commentList').html(data);
			}
		}
		$.ajax(obj);
	}
</script>
</head>
<body>
	<%
		if (session.getAttribute("member") == null) {
	%>
	<script>
		alert('로그인 후 사용해주세요.');
		location.href = "login";
	</script>
	<%
		} else {
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="bs-example-navbar-collapse-1"
				aria-expaned="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="home">홈 게시판</a>
		</div>
		<div class="collapse navbar-collapse"
			id="#bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="home">메인</a></li>
				<li class="active"><a href="/board/sample/questionlist">질문
						게시판</a></li>
			</ul>
			<%
				//라긴안된경우
			if (session.getAttribute("member") == null) {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>

					</ul></li>
			</ul>
			<%
				} else {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="home">로그아웃</a></li>
					</ul></li>
			</ul>
			<%
				}
			%>
		</div>
	</nav>
	<!-- 게시판 -->
	<div class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3"
							style="background-color: #eeeeee; text-align: center;">글 보기
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%;">글 제목</td>
						<td colspan="2">${question.getQst_title()}</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2">${question.getM_id()}</td>
					</tr>
					<tr>
						<td>작성일</td>
						<td colspan="2">${question.getQst_date()}</td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2" style="min-height: 200px; text-align: left;">${fn:replace(question.getQst_body(),replaceChar,"<br/>")}</td>
					</tr>
				</tbody>
			</table>
			<%
				QuestionDto qDto = (QuestionDto) request.getAttribute("question");
			MemberDto mDto = (MemberDto) session.getAttribute("member");
			//글작성자 본인일시 수정 삭제 가능 
			if (mDto.getId().equals(qDto.getM_id())) {
			%>
			<a
				href="/board/sample/question_update?m_id=${question.getM_id()}&prob_num=${question.getProb_num()}&qst_date=${question.getQst_date()}"
				class="btn btn-primary">수정</a> <a
				onclick="return confirm('정말로 삭제하시겠습니까?')"
				href="/board/sample/question_delete?m_id=${question.getM_id()}&prob_num=${question.getProb_num()}&qst_date=${question.getQst_date()}"
				class="btn btn-primary	">삭제</a>
			<%
				}
			%>
			<hr>
			<form id="writeComment">
				<div class="container"
					style="padding-top: 10px; padding-bottom: 10px">
					<div class="row">
						<div class="col-sm-10">
							<input type="hidden" name="qc_id"
								value="${sessionScope.member.getId()}" /> <input type="hidden"
								name="q_id" value="${question.getM_id()}" /> <input
								type="hidden" name="prob_num" value="${question.getProb_num()}" />
							<input type="hidden" name="qst_date"
								value="${question.getQst_date()}" />
							<textarea name="qc_body" id="content" class="form-control"
								rows="3" placeholder="댓글을 입력해 주세요"></textarea>
						</div>
						<div class="col-sm-2">
							<input type="button" class="btn btn-sm btn-primary"
								style="width: 100%; margin-top: 10px"
								onclick="insertComment(this.form)" value="저장" />
						</div>
					</div>
				</div>
			</form>

			<div id="commentList">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="4"
								style="background-color: #eeeeee; text-align: center;">댓글</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${comments.size() > 0}">
							<c:forEach var="i" begin="0" end="${comments.size() - 1}">
								<tr>
									<td style="width: 20%;">작성자 :
										${comments.get(i).getQc_id()} <br>${comments.get(i).getQc_date()}
									</td>
									<td id="body_${i}" colspan="2">${comments.get(i).getQc_body()}</td>
									<td><c:if
											test="${comments.get(i).getQc_id().equals(sessionScope.member.getId()) }">
											<input name="delete" type="button" value="삭제하기"
												onclick="deleteComment(${comments.get(i).toJSONString()})" />
										</c:if></td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
			<a href="questionlist" class="btn btn-primary">목록</a>
		</div>
	</div>
	<%
		}
	%>

</body>

</html>
