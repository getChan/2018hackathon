<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%
	String id = "";
	/* if (session.getAttribute("id") == null){
	   out.println("<script>");
	   out.println("location.href='main.jsp'");
	   out.println("</script>");}
	id =(String)session.getAttribute("id"); */
	request.setCharacterEncoding("euc-kr");
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String driver = "oracle.jdbc.driver.OracleDriver"; //드라이버 이름 설정
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	try {
		Class.forName(driver); //드라이버 이름으로 드라이버를 로드
		conn = DriverManager.getConnection(url, "ngc438", "pass123");
		pstmt = conn.prepareStatement("SELECT * FROM bookorder where rownum <= 20 ORDER BY num DESC");
		rs = pstmt.executeQuery();
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<script language="javascript">
	function book_order() {
		var JSPName = "order.jsp";
		browsing_window = window.open(JSPName, "bookorder",
				"width=400, height=300, resizable=yes");
		browsing_window.focus();
		// 실행된 윈도우 창을 맨앞으로 표시 
	}
</script>
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
					<li class="active"><a href="board.jsp">요청게시판</a></li>
				</ul>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h2 class="form-signin-heading">요청게시판</h2>
				<br>
				<button class="btn btn-lg btn-primary" type="button"
					onclick="book_order()">글쓰기</button>
				<br> <br> <br>
				<table class="table table-striped" width=700>
					<tr align=center height=50>
						<td width=50>번 호</td>
						<td width=100>타입</td>
						<td width=350>제목</td>
						<td width=200>글쓴날짜</td>
						<td width=100>글쓴이</td>
					</tr>
					<%
						while (rs.next()) {
					%>
					<tr align=center height=50>
						<td><%=rs.getString("num")%></td>
						<td><%=rs.getString("type")%></td>
						<td align=left><%=rs.getString("content")%></td>
						<td><%=rs.getString("indate").substring(0, 10)%></td>
						<td><%=rs.getString("id")%></td>
						<%
							}
						%>
					</tr>
				</table>
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