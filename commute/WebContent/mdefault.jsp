<%@ page import="java.sql.*"%>

<%!static Connection conn = null;%>

<%
	try {
		String driver = "org.postgresql.Driver";
		String url = "jdbc:postgresql://localhost:5432/commute";
		String User = "postgres";
		String pw = "5212";
		Class.forName(driver);
		conn = DriverManager.getConnection(url, User, pw);
	} catch (Exception e) {
		session.invalidate();
		%>
		<script>
			alert("データベース処理中にエラーが発生しました.");
			location.href="index.jsp";
		</script>
		<%
	}
	
	if (session.getAttribute("ID") == null || ("null".equals(request.getParameter("user")))
			|| (int) session.getAttribute("ROLE") == 0) {
		response.sendRedirect("index.jsp");
	}
%>