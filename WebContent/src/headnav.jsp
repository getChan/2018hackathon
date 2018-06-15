<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">헌내기</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav navbar-right">

				<%
					if (session.getAttribute("id") == null) {
				%>
				<li><a href="signin.jsp">로그인</a></li>
				<li><a href="signup.jsp">회원가입</a></li>

				<%
					} else {
				%>
				<li><a href="#"><%= (String)session.getAttribute("id")%></a></li>
				<li><a href="sell.jsp">판매하기</a></li>
				<li><a href="logout.jsp">로그아웃</a></li>
				<%
					}
				%>
			</ul>
			<form action=search.jsp class="navbar-form navbar-right"
				method="post">
				<input type="text" name="inputcontext" class="form-control" placeholder="서적 검색" >
				<button type="submit" class="btn btn-default">검색</button>
			</form>
		</div>
	</div>
</nav>
