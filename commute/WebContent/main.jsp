<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.*"%>
<%@ include file="./default.jsp"%>

<%
	PreparedStatement pstmt = null;
	ResultSet result = null;
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="./css/main.css?20230307">
	<title>通勤管理</title>
</head>
<body>
	<div style="display: flex; width: 700px;">
		<img src="./img/logo.png" />
		<h2>通勤管理</h2>
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
				<th>出勤</th>
				<th>退勤</th>
				<th>遅刻</th>
				<th>総労働時間</th>
			</tr>
			<%
				String query = "select recordid, to_char(commute, 'YYYY-MM-DD HH24:MI:SS') as commute_date, to_char(leave,'YYYY-MM-DD HH24:MI:SS') as leave, (CASE WHEN commute < (DATE(commute)+TIME '09:00') THEN '00:00' ELSE to_char(commute-(DATE(commute)+TIME '09:00'), 'HH24:MI:SS') END) as late, (CASE WHEN leave IS null THEN null ELSE to_char(leave-commute, 'YYYY-MM-DD HH24:MI:SS') END) as working, user_id from commute WHERE user_id=? ORDER BY commute_date DESC;";
				pstmt = conn.prepareStatement(query, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				pstmt.setInt(1, Integer.parseInt((String) session.getAttribute("ID")));
				result = pstmt.executeQuery();
				int i = 0;
				while (result.next()) {
					out.println("<tr>");
					out.println("<td>" + result.getString(2) + "</td>");
					out.println("<td>" + result.getString(3) + "</td>");
					out.println("<td>" + result.getString(4) + "</td>");
					out.println("<td>" + result.getString(5) + "</td>");
					out.println("</tr>");
					i++;
				}
			%>
		</table>
	</div>
	
	<script type="text/javascript" src="/commute/js/main.js?20230307"></script>
</body>
</html>