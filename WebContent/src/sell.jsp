<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
				<form name="bookInfo" action="registerOK.jsp" class="form-signin"
					enctype="multipart/form-data" method="post">
					<h2 class="form-signin-heading">기본입력사항</h2>
					<br>
					<h4 class="form-signin-heading">
						<font color=red>*</font>책분류
					</h4>
					<input type=radio name="inputtype" value="교양" checked=checked>
					교양서적 &nbsp; <input type=radio name="inputtype" value="전공">
					전공서적 &nbsp; <input type=radio name="inputtype" value="기타">
					기타서적 &nbsp; <br>
					<br>
					<h4 class="form-signin-heading">
						<font color=red>*</font>책이름
					</h4>
					<input type="text" name="inputtitle" class="form-control" required><br>
					<h4 class="form-signin-heading">부제</h4>
					<input type="text" name="inputsubtitle" class="form-control"><br>
					<h4 class="form-signin-heading">
						<font color=red>*</font>지은이
					</h4>
					<input type="text" name="inputauthor" class="form-control" required><br>
					<h4 class="form-signin-heading">
						<font color=red>*</font>출판사
					</h4>
					<input type="text" name="inputpublisher" class="form-control"
						required><br>
					<h4 class="form-signin-heading">
						<font color=red>*</font>정가
					</h4>
					<input type="text" name="inputprice" class="form-control" required><br>
					<h4 class="form-signin-heading">
						<font color=red>*</font>판매가
					</h4>
					<input type="text" name="inputsellprice" class="form-control"
						required>
					<h4 class="form-signin-heading">
						<font color=red>*</font>상품상태
					</h4>
					<font color=gray>
						<h6>중 : 읽을 수 있을 정도. 찢어진 부분이 있거나 손상된 부분이 있지만 내용적으로 문제가 생기진
							않았음.</h6>
						<h6>상 : 파손이 없고, 약간의 구겨짐이 있거나 필기가 많이 되어있음.</h6>
						<h6>최상 : 거의 새 것.</h6>
					</font> <input type=radio name="inputstatus" value="중"> 중 &nbsp; <input
						type=radio name="inputstatus" value="상" checked=checked> 상
					&nbsp; <input type=radio name="inputstatus" value="최상"> 최상
					&nbsp; <br>

					<h2 class="form-signin-heading">세부입력사항</h2>
					<br>
					<h4 class="form-signin-heading">이미지 파일 첨부</h4>
					<input type=file name=inputimage><br>
					<br>
					<h4 class="form-signin-heading">상품설명 (연락 방법등을 자세하게 써주실수록 더욱 좋습니다!)</h4>
					<textarea name="inputbookinfo" ROWS=5 COLS=40 class="form-control">
         </textarea>
					<br>
					<button class="btn btn-lg btn-primary btn-block" type="submit">등록</button>
					<!--<button class="btn btn-lg btn-primary btn-block" type="button" onclick="location.href='signup.jsp'">회원가입</button> -->
					

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