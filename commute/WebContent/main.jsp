<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
         <%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.*"%>
<%@ include file="./default.jsp" %>
<%

SimpleDateFormat df = new SimpleDateFormat("hhmmss");
java.util.Date d = new java.util.Date();
String ts = df.format(d);
PreparedStatement pstmt = null;
ResultSet result = null;
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
	<img src="./img/logo.png"/><h2>通勤管理</h2>
	<button class="commute" id="commuteModal">出勤</button>
	<div class="Modal" id="Modal">
	<div class="commuteModal">
		<span class="close">&times;</span>
		<p>出勤処理しますか</p>
		<button id="agree">はい</button>
		<button id="disagree">いいえ</button>		
	</div>
	</div>
	<button class="leave" id="leaveModal">退勤</button>
	<div class="Modal1" id="Modal1">
	<div class="leaveModal">
		<span class="close">&times;</span>
		<p>退勤処理しますか</p>
		<button id="agree1">はい</button>
		<button id="disagree1">いいえ</button>		
	</div>
	</div>
	<img src="./img/exit.png" class="exit" onclick="location.href='./logout.jsp';">
</div>
<div class="main">
<table class="personal_commuting">
	<tr>
		<th>日付</th>
		<th>出勤</th>
		<th>退勤</th>
		<th>遅刻</th>
		<th>総労働時間</th>
	</tr>
	<%
		String query = ("select to_char(commute, 'YYYY-MM-DD')as commute_date, to_char(commute, 'HH24:MI:SS') as commute_time, to_char(leave,'YYYY-MM-DD HH24:MI:SS') as leave,User_Id from commute where User_id = ?;");
		pstmt = conn.prepareStatement(query,ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		pstmt.setInt(1, Integer.parseInt((String)session.getAttribute("ID")));	
		result = pstmt.executeQuery();
		int i = 0;
		while(result.next()) {
			out.println("<tr>");
			out.println("<td>" + result.getDate(1) + "</td>");
			out.println("<td>" + result.getTime(2) + "</td>");
			out.println("<td>" + result.getTime(3) + "</td>");
			out.println("<td>" + "</td>");
			out.println("<td>" + "</td>");
			out.println("</tr>");
			i++;
		}
	%>	
</table>
</div>
<script>

var modal = document.getElementById("Modal");
var modal1 = document.getElementById("Modal1");
var btn = document.getElementById("commuteModal");
var btn1 = document.getElementById("leaveModal");
var span = document.getElementsByClassName("close")[0];
var span1 = document.getElementsByClassName("close")[1];
var disagree = document.getElementById("disagree");
var disagree1 = document.getElementById("disagree1");
var agree = document.getElementById("agree");
var agree1 = document.getElementById("agree1");
btn.onclick = function() {
	modal.style.display = "block";
}

btn1.onclick = function() {
	modal1.style.display = "block";
}

span.onclick = function() {
	modal.style.display = "none";
}

span1.onclick = function() {
	modal1.style.display = "none";
}

disagree.onclick = function() {
	modal.style.display = "none";
}

disagree1.onclick = function() {
	modal1.style.display = "none";
}

agree.onclick = function() {
	alert("出勤処理されました。");
	modal.style.display = "none";
	location.href = "./commuteRecord.jsp";
}

agree1.onclick = function() {
	alert("退勤処理しました");
	modal1.style.display = "none";	
	location.href = "./leaveRecord.jsp";
}

window.onclick = function(event) {
	if (event.target == modal) {
		modal.style.display = "none";
	}
}

window.onclick = function(event) {
	if (event.target == modal1) {
		modal.style.display = "none";
	}
}
</script>
</body>
</html>