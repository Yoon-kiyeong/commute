<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.*"%>
<%@ include file="./mdefault.jsp"%>

<%
	PreparedStatement pstmt = null;
	ResultSet result = null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/main.css?20230307" />
<title>通勤管理</title>
</head>
<body>
	<div style="display: flex; width: 700px;">
		<img src="./img/logo.png" />
		<h2>通勤管理</h2>

		<div class="Modal" id="Modal">
			<div class="editModal" id="editModal">
				<span class="close">&times;</span>
				<p>
				<form action="./edit.jsp" method="POST">
					<input type="hidden" name="editrid" id="editrid" /> <br> 
					出勤 : <input type="datetime" name="editcommute" id="editcommute" /> <br>
					退勤 : <input type="datetime" name="editleave" id="editleave" /> <br>
					<button type="submit" id="editsubmit">はい</button>
					<button id="disagree">いいえ</button>
				</form>
				</p>
			</div>
		</div>

		<div class="Modal1" id="Modal1">
			<div class="deleteModal" id="deleteModal">
				<span class="close">&times;</span>
				<p>
				<form action="./delete.jsp" method="POST">
					<input type="hidden" name="deleterid" id="deleterid" /> <br> 
					出勤	: <input type="datetime" name="deletecommute" id="deletecommute" readonly /> <br> 
					退勤 : <input type="datetime" name="deleteleave" id="deleteleave" readonly /> <br>
					<button type="submit" id="deletesubmit">はい</button>
					<button id="disagree1">いいえ</button>
				</form>
				</p>
			</div>
		</div>

		<img src="./img/exit.png" class="exit"
			onclick="location.href='./logout.jsp';" />
	</div>
	<div class="main">
		<form action="./manage.jsp" method="GET">
			<select name="user" id="user">
				<option value='-1'>All</option>
				<%
					String query = ("select id, user_id FROM Member WHERE ROLE=0;");
					pstmt = conn.prepareStatement(query, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
					result = pstmt.executeQuery();
					int i = 0;
					while (result.next()) {
						out.println("<option value=\"" + Integer.toString(result.getInt(2)) + "\">" + result.getString(1) + "("
						+ Integer.toString(result.getInt(2)) + ")" + "</option>");
						i++;
					}
				%>
				<input type="submit" value="검색">
			</select>
		</form>
		<table class="personal_commuting">
			<tr>
				<th>UID</th>
				<th>出勤</th>
				<th>退勤</th>
				<th>遅刻</th>
				<th>総労働時間</th>
				<th>修正 / 削除</th>
			</tr>
			<%
				query = "select recordid, to_char(commute, 'YYYY-MM-DD HH24:MI:SS') as commute_date, to_char(leave,'YYYY-MM-DD HH24:MI:SS') as leave, (CASE WHEN commute < (DATE(commute)+TIME '09:00') THEN '00:00' ELSE to_char(commute-(DATE(commute)+TIME '09:00'), 'HH24:MI:SS') END) as late, (CASE WHEN leave IS null THEN null ELSE to_char(leave-commute, 'YYYY-MM-DD HH24:MI:SS') END) as working, user_id from commute";
				if (!(request.getParameter("user") == null || ("null".equals(request.getParameter("user")))
						|| ("-1".equals(request.getParameter("user")))))
					query += " where user_id=? ORDER BY commute_date DESC;";
				else
					query += " ORDER BY commute_date DESC;";
	
				System.out.println(query);
				pstmt = conn.prepareStatement(query, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	
				if (!(request.getParameter("user") == null || ("null".equals(request.getParameter("user")))
						|| ("-1".equals(request.getParameter("user")))))
					pstmt.setInt(1, Integer.parseInt(request.getParameter("user")));
	
				result = pstmt.executeQuery();
				i = 0;
				while (result.next()) {
					out.println("<tr>");
					out.println("<td>" + result.getInt(6) + "</td>");
					out.println("<td>" + result.getString(2) + "</td>");
					out.println("<td>" + result.getString(3) + "</td>");
					out.println("<td>" + result.getString(4) + "</td>");
					out.println("<td>" + result.getString(5) + "</td>");
					out.println("<td>" + "<button id='editButton' onclick=\"setRID(" + Integer.toString(result.getInt(1)) + ", \'"
					+ result.getString(2) + "\', \'" + result.getString(3)
					+ "\');document.getElementById(\'Modal\').style.display = \'block\';\">edit</button>"
					+ "<button id='deleteButton' onclick=\"setRID(" + Integer.toString(result.getInt(1)) + ", \'"
					+ result.getString(2) + "\', \'" + result.getString(3)
					+ "\');document.getElementById(\'Modal1\').style.display = \'block\';\">delete</button></td>");
					out.println("</tr>");
					i++;
				}
			%>
		</table>
	</div>
	<script type="text/javascript" src="/commute/js/manage.js?20230307"></script>
</body>
</html>