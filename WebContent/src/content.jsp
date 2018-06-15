<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%
	request.setCharacterEncoding("euc-kr");
	String num = request.getParameter("num");
	int number = Integer.parseInt(num);
%>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../docs/favicon.ico">

<title>�峻��</title>

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
					<li><a href="list_liberal.jsp">���缭�� <span class="sr-only">(current)</span></a></li>
					<li><a href="list_major.jsp">��������</a> <span class="sr-only">(current)</span></li>
					<li><a href="list_etc.jsp">��Ÿ����</a> <span class="sr-only">(current)</span></li>
				</ul>
				<ul class="nav nav-sidebar">
					<li><a href="board.jsp">��û�Խ���</a></li>
				</ul>
			</div>

			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

				<%
					String id = "";
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					int advantage = 0;
					if (session.getAttribute("id") != null){
						id = (String)session.getAttribute("id");
					}
					String driver = "oracle.jdbc.driver.OracleDriver"; //����̹� �̸� ����
					String url = "jdbc:oracle:thin:@localhost:1521:orcl";

					try {
						Class.forName(driver); //����̹� �̸����� ����̹��� �ε�
						conn = DriverManager.getConnection(url, "ngc438", "pass123");
						pstmt = conn.prepareStatement("SELECT * FROM selling where num = ?");
						pstmt.setInt(1, number);
						rs = pstmt.executeQuery();
						rs.next();
						String price = rs.getString("price");
						String sellprice = rs.getString("sellprice");
						advantage = Integer.parseInt(price) - Integer.parseInt(sellprice);
					} catch (Exception e) {
						e.printStackTrace();
					}
				%>
				<h2 class="sub-header">�� ����</h2>
				<div class="table-responsive">
					<table class="table table-striped">
						<tr>
							<td colspan=3><h3 class="form-signin-heading"><%=rs.getString("title")%></h3>
								<font color=gray>
								<%
								if (rs.getString("subtitle") != null){
								%>
								<%=rs.getString("subtitle")%>
								<% 
								}
								%>
								</font></td>
						</tr>
						<tr>
							<td colspan=3><font color=gray>���� - <%=rs.getString("author")%> 
									/ ���ǻ� - <%=rs.getString("publisher")%></font></td>
						<tr>
						<tr>
							<td width="220px" height="270px" rowspan=5>
								<%
									if (rs.getString("image") == null) {
								%>
								<center>
									<font color=gray>�̹��� �غ���</font>
								</center>
								 <%
 	} else {
 %> 
 <img alt="���� ����� ����" src="img/<%=rs.getString("image")%>">
							</td>
							<%
								}
							%>
							<td>���� :</td>
							<td><%=rs.getString("price")%>��</td>
						</tr>
						<tr>
							<td>�ǸŰ� :</td>
							<td><%=rs.getString("sellprice")%>�� &nbsp; <font color=red>(<%=advantage%>��
									�̵�!)
							</font></td>
						</tr>
						<tr>
							<td>�Ǹ��� :</td>
							<td><%=rs.getString("id")%></td>
						</tr>
						<tr>
							<td>�Խ��� :</td>
							<td><%=rs.getString("indate").substring(0, 10)%></td>
						</tr>
						<tr>
						<td>å ���� : </td>
						<td> <%= rs.getString("status")%></td>
						</tr>
					</table>
					<h2 class="sub-header">�� ����</h2>
					<br>
					<%=rs.getString("moreinfo")%>
					<br> <br>
				</div>
				<%
			if (id.equals(rs.getString("id"))){
			%>
			<button class="btn btn-lg btn-primary" type="button"
					onclick="location.href = 'modify.jsp?num=<%= rs.getString("num")%>'">�����ϱ�</button>
					<%
			}
					%>
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