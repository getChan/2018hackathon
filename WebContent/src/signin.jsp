<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../docs/favicon.ico">

<title>�α���</title>

<!-- Bootstrap core CSS -->
<link href="../docs/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="signin.css" rel="stylesheet">

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

	<div class="container">

		<form class="form-signin" name="signinform" method="post"
			action="signinOk.jsp">
			<h2 class="form-signin-heading">�α���</h2>
			<label for="inputid" class="sr-only">���̵�</label> <input type="text"
				name="id" id="inputid" class="form-control" placeholder="���̵�"
				required autofocus> <label for="inputPassword"
				class="sr-only">��й�ȣ</label> <input type="password" name="pw"
				id="inputPassword" class="form-control" placeholder="��й�ȣ" required>

			<button class="btn btn-lg btn-primary btn-block" type="submit">�α���</button>
			<button class="btn btn-lg btn-primary btn-block" type="button"
				onclick="location.href='signup.jsp'">ȸ������</button>
		</form>

	</div>
	<!-- /container -->


	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="../docs/assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
