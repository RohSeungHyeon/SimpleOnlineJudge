<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="com.spring.board.Bbs"%>
<%@ page import="com.spring.board.BbsDAO"%>
<%@ page import="com.spring.board.MemberDto"%>
<%@ page import="com.spring.board.MemberDAO"%>
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

</head>
<body>
	<%
		//로긴한사람이라면	 userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값
		
Object ob = session.getAttribute("member");
	if(ob == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요')");
		script.println("location.href = '/board/sample/login/'");
		script.println("</script>");
	}
	MemberDto md = (MemberDto) ob;
	
		String userID = md.getName();
		int bbsID = 0;
		if (request.getParameter("bbsID") != null) {
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if (bbsID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글 입니다.')");
			script.println("location.href = '/board/sample/post'");
			script.println("</script>");
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);
	%>
		<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="bs-example-navbar-collapse-1"
				aria-expaned="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">JSP 게시판</a>
		</div>
		<div class="collapse navbar-collapse"
			id="#bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li class="active"><a href="/board/sample/post">게시판</a></li>
			</ul>


			<%
				//라긴안된경우
				if (userID == null) {
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
						<li><a href="home.jsp">로그아웃</a></li>
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
								style="background-color: #eeeeee; text-align: center;">글 보기 </th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="width: 20%;"> 글 제목 </td>
							<td colspan="2"><%= bbs.getBbsTitle() %></td>
						</tr>
						<tr>
							<td>작성자</td>	
							<td colspan="2"><%= bbs.getUserID() %></td>
						</tr>
						<tr>
							<td>작성일</td>	
							<td colspan="2"><%= bbs.getBbsDate()%></td>
						</tr>
						<tr>
							<td>내용</td>	
							<td colspan="2" style="min-height: 200px; text-align: left;"><%= bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br/>") %>
							</td>
						</tr>
						
					</tbody>
				</table>	
				<a href = "/board/sample/post" class="btn btn-primary">목록</a>
				
				
				<%
				//글작성자 본인일시 수정 삭제 가능 
					if(userID != null && userID.equals(bbs.getUserID())){
				%>
					<a href="/board/sample/update.jsp/?bbsID=<%= bbsID %>" class="btn btn-primary">글 수정</a>
					<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="/board/sample/deleteAction.jsp/?bbsID=<%= bbsID %>" class="btn btn-primary	">삭제</a>
				<%					
					}
				%>
		</div>
	</div>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/boostrap.js"></script>

</body>
</html>
</body>
</html>