<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%request.setCharacterEncoding("euc-kr");%>
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

			<%
					String id = null;
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					int advantage = 0;
					id = (String)session.getAttribute("id");
					String num = (String)request.getParameter("num");
					int number = Integer.parseInt(num);
					String driver = "oracle.jdbc.driver.OracleDriver"; //����̹� �̸� ����
					String url = "jdbc:oracle:thin:@localhost:1521:orcl";

					try {
						Class.forName(driver); //����̹� �̸����� ����̹��� �ε�
						conn = DriverManager.getConnection(url, "ngc438", "pass123");
						pstmt = conn.prepareStatement("SELECT * FROM selling where num = ?");
						pstmt.setInt(1, number);
						rs = pstmt.executeQuery();
						rs.next();
					} catch (Exception e) {
						e.printStackTrace();
					}
				%>

			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<form name="bookInfo" action="modifyOK.jsp?" class="form-signin" method="post">
				<input type = hidden name="inputnum" value ="<%=rs.getString("num")%>">
					<h2 class="form-signin-heading">�⺻�Է»���</h2>
					<br>
					<h4 class="form-signin-heading">
						<font color=red>*</font>å�з�
					</h4>
					<%
					if (rs.getString("type").equals("����")){
					%>
					<input type=radio name="inputtype" value="����" checked=checked>
					���缭�� &nbsp; <input type=radio name="inputtype" value="����">
					�������� &nbsp; <input type=radio name="inputtype" value="��Ÿ">
					��Ÿ���� &nbsp; <br>
					<%
					}%>
					<%
					if (rs.getString("type").equals("����")){
					%>
					<input type=radio name="inputtype" value="����">
					���缭�� &nbsp; <input type=radio name="inputtype" value="����" checked=checked>
					�������� &nbsp; <input type=radio name="inputtype" value="��Ÿ">
					��Ÿ���� &nbsp; <br>
					<%
					}
					%>
					<%
					if (rs.getString("type").equals("��Ÿ")){
					%>
					<input type=radio name="inputtype" value="����">
					���缭�� &nbsp; <input type=radio name="inputtype" value="����" >
					�������� &nbsp; <input type=radio name="inputtype" value="��Ÿ" checked=checked>
					��Ÿ���� &nbsp; <br>
					<%
					}
					%>
					<br>
					<h4 class="form-signin-heading">
						<font color=red>*</font>å�̸�
					</h4>
					<input type="text" name="inputtitle" class="form-control" value = "<%= rs.getString("title")%>"><br>
					<h4 class="form-signin-heading">����</h4>
					<input type="text" name="inputsubtitle" class="form-control" value = "<%= rs.getString("subtitle")%>"><br>
					<h4 class="form-signin-heading">
						<font color=red>*</font>������
					</h4>
					<input type="text" name="inputauthor" class="form-control" value = "<%=rs.getString("author")%>"><br>
					<h4 class="form-signin-heading">
						<font color=red>*</font>���ǻ�
					</h4>
					<input type="text" name="inputpublisher" class="form-control" value = "<%=rs.getString("publisher")%>"><br>
					<h4 class="form-signin-heading">
						<font color=red>*</font>����
					</h4>
					<input type="text" name="inputprice" class="form-control" value = "<%= rs.getString("price")%>"><br>
					<h4 class="form-signin-heading">
						<font color=red>*</font>�ǸŰ�
					</h4>
					<input type="text" name="inputsellprice" class="form-control" value = "<%= rs.getString("sellprice")%>"
						required>
					<h4 class="form-signin-heading">
						<font color=red>*</font>��ǰ����
					</h4>
					<font color=gray>
						<h6>�� : ���� �� ���� ����. ������ �κ��� �ְų� �ջ�� �κ��� ������ ���������� ������ ������
							�ʾ���.</h6>
						<h6>�� : �ļ��� ����, �ణ�� �������� �ְų� �ʱⰡ ���� �Ǿ�����.</h6>
						<h6>�ֻ� : ���� �� ��.</h6>
					</font> 
					<% 
					if(rs.getString("status").equals("��")){
					%>
					<input type=radio name="inputstatus" value="��" checked=checked> �� &nbsp; <input
						type=radio name="inputstatus" value="��" > ��
					&nbsp; <input type=radio name="inputstatus" value="�ֻ�"> �ֻ�
					&nbsp; <br>
					<%
					} 					
					 if(rs.getString("status").equals("��")){
					%><input type=radio name="inputstatus" value="��"> �� &nbsp; <input
						type=radio name="inputstatus" value="��" checked=checked> ��
					&nbsp; <input type=radio name="inputstatus" value="�ֻ�"> �ֻ�
					&nbsp; <br>
					<%
					} 
					 if(rs.getString("status").equals("�ֻ�")){
					%><input type=radio name="inputstatus" value="��"> �� &nbsp; <input
						type=radio name="inputstatus" value="��" > ��
					&nbsp; <input type=radio name="inputstatus" value="�ֻ�" checked=checked> �ֻ�
					&nbsp; <br>
					<%
					} 
					%>
					<h2 class="form-signin-heading">�����Է»���</h2>
					<br>
					<h4 class="form-signin-heading">��ǰ���� (�ڼ��ϰ� ���ֽǼ��� ���� �����ϴ�!)</h4>
					<textarea name="inputbookinfo" ROWS=5 COLS=40 class="form-control" >
					<%= rs.getString("moreinfo")%>
         </textarea>
					<br>
					<button class="btn btn-lg btn-primary btn-block" type="submit">�����Ϸ�</button>
					<!--<button class="btn btn-lg btn-primary btn-block" type="button" onclick="location.href='signup.jsp'">ȸ������</button> -->
					<button class="btn btn-lg btn-primary btn-block" type="button" onclick = "location.href='delete.jsp?num=<%=rs.getString("num")%>'">�����ϱ�</button>
				</form>
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