<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
         <%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.*"%>
<%@ include file="./default.jsp" %>
<%
SimpleDateFormat df = new SimpleDateFormat("hhmmss");
java.util.Date d = new java.util.Date();
String ts = df.format(d);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/main.css?<%=ts%>">
<title>通勤管理</title>
</head>
<body>
<div style="display: flex; width:700px;">
	<img src="./img/logo.png" /><h2>通勤管理</h2>
	<button class="comute">出勤</button>
	<button>退勤</button>
	<img src="./img/exit.png" class="exit" onclick="location.href='./logout.jsp';">
</div>
<div class="main">
<table>
	<tr>
		<th>날짜</th>
		<th>出勤</th>
		<th>退勤</th>
		<th>遅刻</th>
		<th>総労働時間</th>
	</tr>	
</table>
</div>
</body>
</html>