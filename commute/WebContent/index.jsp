<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.*"%>

<%
SimpleDateFormat df = new SimpleDateFormat("hhmmss");
java.util.Date d = new java.util.Date();
String ts = df.format(d);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/index.css?<%=ts%>">
<script type="text/javascript">
	function checkValue() {
		inputForm = eval("document.loginInfo");
		if (!inputForm.ID.value) {
			alert("IDを入力してください");
			inputForm.id.focus();
			return false;
		}
		if (!inputForm.password.value) {
			alert("パスワードを入力してください");
			inputForm.password.focus();
			return false;
		}
	}
</script>
<title>Login</title>
</head>
<body>
	<div class="login-box">
		<h2>
			<img src="./img/logo.png" /><br>Login
		</h2>
		<form name="loginInfo" method="post" action="./login.jsp" onsubmit="return checkValue()">
			<div class="user-box">
				<input type="text" name="ID" required=""> 
				<label>Username</label>
			</div>
			<div class="user-box">
				<input type="password" name="password" required=""> 
				<label>Password</label>
			</div>
			<input type="submit" id="submit" value="login">
		</form>
	</div>
</body>
</html>