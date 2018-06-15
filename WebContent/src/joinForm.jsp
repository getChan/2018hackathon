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

<title>회원가입</title>

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
			<h2 class="form-signin-heading">회원가입</h2>
			<label for="inputid" class="sr-only">아이디</label> <input type="text"
				id="inputid" class="form-control" name="id" placeholder="아이디"
				required autofocus> <label for="inputPassword"
				class="sr-only">비밀번호</label> <input type="password"
				id="inputPassword" class="form-control" name="pw" placeholder="비밀번호"
				required> <br /> <input type="password" id="inputNum"
				class="form-control" name="certificate" placeholder="인증번호" required>
			<br />
			<button class="btn btn-lg btn-primary btn-block" type="submit">회원가입하기</button>

		</form>

	</div>
	<!-- /container -->


	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="../docs/assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
