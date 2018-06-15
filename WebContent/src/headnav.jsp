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
			<a class="navbar-brand" href="main.jsp">�峻��</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav navbar-right">

				<%
					if (session.getAttribute("id") == null) {
				%>
				<li><a href="signin.jsp">�α���</a></li>
				<li><a href="signup.jsp">ȸ������</a></li>

				<%
					} else {
				%>
				<li><a href="#"><%= (String)session.getAttribute("id")%></a></li>
				<li><a href="sell.jsp">�Ǹ��ϱ�</a></li>
				<li><a href="logout.jsp">�α׾ƿ�</a></li>
				<%
					}
				%>
			</ul>
			<form action=search.jsp class="navbar-form navbar-right"
				method="post">
				<input type="text" name="inputcontext" class="form-control" placeholder="���� �˻�" >
				<button type="submit" class="btn btn-default">�˻�</button>
			</form>
		</div>
	</div>
</nav>
