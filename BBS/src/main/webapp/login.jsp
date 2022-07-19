<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="navbar-header">   <!-- header:로고 담는 부분 -->
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="icon-bar"></span>	<!-- 목록표시 세줄 같은 선 -->
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="main.jsp">JSP 게시판 웹사이트</a>
		</div>
		
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a>
				<li><a href="bbs.jsp">게시판</a>
			</ul>
			<ul class="nav navbar-nav navbar-right">  <!-- 네비바 오른쪽에 넣어줌 -->
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="turue"
							aria-expannded="false">접속하기<span class="caret"></span></a>   <!-- caret은 ▼ 요런 아이콘 -->
					<ul class="dropdown-menu">
						<li class="active"><a href="login.jsp">로그인</a>			<!-- active는 현재 선택이 되어있다 라는 뜻  홈페이지를 보면 login에 파란색으로 표시되어있음 즉, 현재가 로그인 페이지라는 걸 뜻함-->
						<li><a href="join.jsp">회원가입</a></li>
					</ul>	
				</li>		
			</ul>
		</div>
	</nav>
	
	<!-- 로그인 양식 -->
	<div class="container">   <!-- 하나의 컨테이너처럼 감싸줄 수 있도록 -->
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top:20px;">
				<form method="post" action="loginAction.jsp">   <!--post를 이용해 전송 데이터를 숨기면서 보여줌, loginAction페이지로 로그인 정보를 보내주겠다 -->
					<h3 style="text-align:center;">로그인화면</h3>
					
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
					</div>
					
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
					</div>
					<input type="submit" class="btn btn-primary form-control" value="로그인">
									
				</form>
			</div>
	</div>
</div>	
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>