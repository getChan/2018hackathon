<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../docs/favicon.ico">
<title>Insert title here</title>
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
<script language="JavaScript">
	
</script>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2" >
				<h2 class="form-signin-heading">책 요청하기</h2>
				<form name="insert" action="insert.jsp" method="post">
					<h4 class="form-signin-heading">책분류</h4>
					<input type=radio name="inputtype" value="교양" checked=checked>
					교양서적 &nbsp; <input type=radio name="inputtype" value="전공">
					전공서적 &nbsp; <input type=radio name="inputtype" value="기타">
					기타서적 &nbsp; <br>
					<br>
					<h4 class="form-signin-heading">내용(책이름/저자/출판사)</h4>
					<input type="text" name="inputcontent" class="form-control"><br>
					<button class="btn btn-lg btn-primary" type="submit">등록</button>
				</form>
			</div>
		</div>
	</div>
</body>
<!-- Bootstrap core JavaScript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="../docs/dist/js/bootstrap.min.js"></script>
<script src="../docs/assets/js/docs.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="../docs/assets/js/ie10-viewport-bug-workaround.js"></script>
</html>