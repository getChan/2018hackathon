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

			<%
					String id = null;
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					int advantage = 0;
					id = (String)session.getAttribute("id");
					String num = (String)request.getParameter("num");
					int number = Integer.parseInt(num);
					String driver = "oracle.jdbc.driver.OracleDriver"; //드라이버 이름 설정
					String url = "jdbc:oracle:thin:@localhost:1521:orcl";

					try {
						Class.forName(driver); //드라이버 이름으로 드라이버를 로드
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
					<h2 class="form-signin-heading">기본입력사항</h2>
					<br>
					<h4 class="form-signin-heading">
						<font color=red>*</font>책분류
					</h4>
					<%
					if (rs.getString("type").equals("교양")){
					%>
					<input type=radio name="inputtype" value="교양" checked=checked>
					교양서적 &nbsp; <input type=radio name="inputtype" value="전공">
					전공서적 &nbsp; <input type=radio name="inputtype" value="기타">
					기타서적 &nbsp; <br>
					<%
					}%>
					<%
					if (rs.getString("type").equals("전공")){
					%>
					<input type=radio name="inputtype" value="교양">
					교양서적 &nbsp; <input type=radio name="inputtype" value="전공" checked=checked>
					전공서적 &nbsp; <input type=radio name="inputtype" value="기타">
					기타서적 &nbsp; <br>
					<%
					}
					%>
					<%
					if (rs.getString("type").equals("기타")){
					%>
					<input type=radio name="inputtype" value="교양">
					교양서적 &nbsp; <input type=radio name="inputtype" value="전공" >
					전공서적 &nbsp; <input type=radio name="inputtype" value="기타" checked=checked>
					기타서적 &nbsp; <br>
					<%
					}
					%>
					<br>
					<h4 class="form-signin-heading">
						<font color=red>*</font>책이름
					</h4>
					<input type="text" name="inputtitle" class="form-control" value = "<%= rs.getString("title")%>"><br>
					<h4 class="form-signin-heading">부제</h4>
					<input type="text" name="inputsubtitle" class="form-control" value = "<%= rs.getString("subtitle")%>"><br>
					<h4 class="form-signin-heading">
						<font color=red>*</font>지은이
					</h4>
					<input type="text" name="inputauthor" class="form-control" value = "<%=rs.getString("author")%>"><br>
					<h4 class="form-signin-heading">
						<font color=red>*</font>출판사
					</h4>
					<input type="text" name="inputpublisher" class="form-control" value = "<%=rs.getString("publisher")%>"><br>
					<h4 class="form-signin-heading">
						<font color=red>*</font>정가
					</h4>
					<input type="text" name="inputprice" class="form-control" value = "<%= rs.getString("price")%>"><br>
					<h4 class="form-signin-heading">
						<font color=red>*</font>판매가
					</h4>
					<input type="text" name="inputsellprice" class="form-control" value = "<%= rs.getString("sellprice")%>"
						required>
					<h4 class="form-signin-heading">
						<font color=red>*</font>상품상태
					</h4>
					<font color=gray>
						<h6>중 : 읽을 수 있을 정도. 찢어진 부분이 있거나 손상된 부분이 있지만 내용적으로 문제가 생기진
							않았음.</h6>
						<h6>상 : 파손이 없고, 약간의 구겨짐이 있거나 필기가 많이 되어있음.</h6>
						<h6>최상 : 거의 새 것.</h6>
					</font> 
					<% 
					if(rs.getString("status").equals("중")){
					%>
					<input type=radio name="inputstatus" value="중" checked=checked> 중 &nbsp; <input
						type=radio name="inputstatus" value="상" > 상
					&nbsp; <input type=radio name="inputstatus" value="최상"> 최상
					&nbsp; <br>
					<%
					} 					
					 if(rs.getString("status").equals("상")){
					%><input type=radio name="inputstatus" value="중"> 중 &nbsp; <input
						type=radio name="inputstatus" value="상" checked=checked> 상
					&nbsp; <input type=radio name="inputstatus" value="최상"> 최상
					&nbsp; <br>
					<%
					} 
					 if(rs.getString("status").equals("최상")){
					%><input type=radio name="inputstatus" value="중"> 중 &nbsp; <input
						type=radio name="inputstatus" value="상" > 상
					&nbsp; <input type=radio name="inputstatus" value="최상" checked=checked> 최상
					&nbsp; <br>
					<%
					} 
					%>
					<h2 class="form-signin-heading">세부입력사항</h2>
					<br>
					<h4 class="form-signin-heading">상품설명 (자세하게 써주실수록 더욱 좋습니다!)</h4>
					<textarea name="inputbookinfo" ROWS=5 COLS=40 class="form-control" >
					<%= rs.getString("moreinfo")%>
         </textarea>
					<br>
					<button class="btn btn-lg btn-primary btn-block" type="submit">수정완료</button>
					<!--<button class="btn btn-lg btn-primary btn-block" type="button" onclick="location.href='signup.jsp'">회원가입</button> -->
					<button class="btn btn-lg btn-primary btn-block" type="button" onclick = "location.href='delete.jsp?num=<%=rs.getString("num")%>'">삭제하기</button>
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