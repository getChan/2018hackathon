<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../docs/favicon.ico">

<title>ȸ������</title>

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

		<form class="form-signin" name="joinform" action="joinOk.jsp" method="post">
			<h2 class="form-signin-heading">ȸ������</h2>
			<label for="inputid" class="sr-only">���̵�</label> <input type="text"
				id="inputid" class="form-control" name="id" placeholder="���̵�"
				required autofocus> <label for="inputPassword"
				class="sr-only">��й�ȣ</label> <input type="password"
				id="inputPassword" class="form-control" name="pw" placeholder="��й�ȣ"
				required> <br /> <input type="password" id="inputNum"
				class="form-control" name="certificate" placeholder="������ȣ" required>
			<br />
			<button class="btn btn-lg btn-primary btn-block" type="submit">ȸ�������ϱ�</button>

		</form>

	</div>
	<!-- /container -->


	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="../docs/assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
