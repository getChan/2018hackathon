<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<%
	String context = request.getParameter("inputcontext");
	String id = null;
	String SQL = null;
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String driver = "oracle.jdbc.driver.OracleDriver"; //드라이버 이름 설정
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	try {
		Class.forName(driver); //드라이버 이름으로 드라이버를 로드
		conn = DriverManager.getConnection(url, "ngc438", "pass123");
		stmt = conn.createStatement();
		SQL = "select * from selling where title like '%'||'" + context
				+ "'||'%' and rownum <= 5 order by indate desc";
		rs = stmt.executeQuery(SQL);
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../docs/favicon.ico">

<title>헌내기</title>

<!-- Bootstrap core CSS -->
<link href="../docs/dist/css/bootstrap.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="dashboard.css" rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../docs/assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script src="../docs/assets/js/ie-emulation-modes-warning.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

	<%@ include file="headnav.jsp"%>

	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li><a href="list_liberal.jsp">교양서적 <span class="sr-only">(current)</span></a></li>
					<li><a href="list_major.jsp">전공서적</a> <span class="sr-only">(current)</span></li>
					<li><a href="list_etc.jsp">기타서적</a> <span class="sr-only">(current)</span></li>
				</ul>
				<ul class="nav nav-sidebar">
					<li><a href="board.jsp">요청게시판</a></li>
				</ul>
			</div>

			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">
					"<%=context%>" 검색 결과
				</h1>
				<h2 class="sub-header">책 이름으로 검색한 결과</h2>
				<div class="table-responsive">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>저자</th>
								<th>출판사</th>
								<th>가격</th>
								<th>작성자</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody>


							<%
								while (rs.next()) {
							%>
							<tr>
								<td><%=rs.getString("num")%></td>
								<td><a href="content.jsp?num=<%=rs.getString("num")%>"><%=rs.getString("title")%></a></td>
								<td><%=rs.getString("author")%></td>
								<td><%=rs.getString("publisher")%></td>
								<td><%=rs.getString("price")%>원</td>
								<td><%=rs.getString("id")%></td>
								<td><%=rs.getString("indate").substring(0, 10)%></td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
				</div>
				<%
					stmt.close();
					rs.close();
					stmt = conn.createStatement();
					SQL = "select * from selling where author like '%'||'" + context
							+ "'||'%' and rownum <= 5 order by indate desc";
					rs = stmt.executeQuery(SQL);
				%>
				<h2 class="sub-header">저자로 검색한 결과</h2>
				<div class="table-responsive">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>저자</th>
								<th>출판사</th>
								<th>가격</th>
								<th>작성자</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody>
							<%
								while (rs.next()) {
							%>
							<tr>
								<td><%=rs.getString("num")%></td>
								<td><a href="content.jsp?num=<%=rs.getString("num")%>"><%=rs.getString("title")%></a></td>
								<td><%=rs.getString("author")%></td>
								<td><%=rs.getString("publisher")%></td>
								<td><%=rs.getString("price")%>원</td>
								<td><%=rs.getString("id")%></td>
								<td><%=rs.getString("indate").substring(0, 10)%></td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
				</div>
				<%
					stmt.close();
					rs.close();
					stmt = conn.createStatement();
					SQL = "select * from selling where publisher like '%'||'" + context
							+ "'||'%' and rownum <= 5 order by indate desc";
					rs = stmt.executeQuery(SQL);
				%>
				<h2 class="sub-header">출판사로 검색한 결과</h2>
				<div class="table-responsive">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>저자</th>
								<th>출판사</th>
								<th>가격</th>
								<th>작성자</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody>


							<%
								while (rs.next()) {
							%>
							<tr>
								<td><%=rs.getString("num")%></td>
								<td><a href="content.jsp?num=<%=rs.getString("num")%>"><%=rs.getString("title")%></a></td>
								<td><%=rs.getString("author")%></td>
								<td><%=rs.getString("publisher")%></td>
								<td><%=rs.getString("price")%>원</td>
								<td><%=rs.getString("id")%></td>
								<td><%=rs.getString("indate").substring(0, 10)%></td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="../docs/dist/js/bootstrap.min.js"></script>
	<script src="../docs/assets/js/docs.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="../docs/assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>