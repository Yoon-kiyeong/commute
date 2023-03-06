<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/index.css">
<script type="text/javascript">
	function checkValue()
	{
		inputForm = eval("document.loginInfo");
		if(!inputForm.id.value) {
			alert("IDを入力してください");
			inputForm.id.focus();
			return false;
		}
		if(!inputForm.password.value) {
			alert("パスワードを入力してください");
			inputForm.password.focus();
			return false;
		}
	}
	
</script>
<title>Insert title here</title>
</head>
<body>
<div class="login-box">
	<h2>Login</h2>
	<form name="loginInfo" method="post" action="./login.jsp" onsubmit="return checkValue()">
		<div class="user-box">
			<input type="text" name="id">
			<label>Username</label>
		</div>
		<div class="user-box">
			<input type="password" name="password">
			<label>Password</label>
		</div>
		<input type="submit" id="submit" value="login">
	</form>
	
</div>
</body>
</html>