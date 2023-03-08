<%@ page import="java.sql.*"%>

<%!
	static Connection conn = null;
%>

<%
	try {
		String driver = "org.postgresql.Driver";
		String url = "jdbc:postgresql://localhost:5432/commute";
		String User = "postgres";
		String pw = "5212";
		Class.forName(driver);
		conn = DriverManager.getConnection(url,User,pw);
	} catch (Exception e) {
		session.invalidate();
		out.println("<script>");
		out.println("alert(\"DB연결에 문제가 발생하였습니다.\")");
		out.println("<script");
	}
%>