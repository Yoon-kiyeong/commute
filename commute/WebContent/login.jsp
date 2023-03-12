<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		out.println("<script>");
		out.println("alert(\"DB연결에 문제가 발생하였습니다.\")");
		out.println("<script");
	}

	request.setCharacterEncoding("utf-8");
	
	String ID = request.getParameter("ID");
	String Password = request.getParameter("password");
	PreparedStatement pstmt = null;
	ResultSet result = null;
	try {
		String query = "select User_Id, Role FROM Member WHERE ID = ? AND Password = ?; ";
		pstmt = conn.prepareStatement(query,ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		pstmt.setString(1, ID);
		pstmt.setString(2, Password);
		result = pstmt.executeQuery();
		result.last();
		if (result.getRow() == 0) {
			%>
			<script>
				alert("正しいID/PWではありません。 もう一度ログインしてください ");
				location.href = "./";
			</script>
			<%
			return;
		}
		
		result.beforeFirst();
		result.next();
		
		session.setAttribute("ID", Integer.toString(result.getInt("User_Id")));
		session.setAttribute("ROLE", result.getInt("Role"));
	} catch (SQLException e){
		System.out.println("Code: " + e.getErrorCode());
		System.out.println("SqlState: " + e.getSQLState());
		System.out.println("Error Message: " + e.getMessage());
		%>
		<script>
			alert("データベース処理中にエラーが発生しました。");
			location.href = "./main.jsp";
		</script>
		<%
		return;
	} catch (Exception e) {
		%>
		<script>
			alert("定義されていないエラーが発生しました。");
			location.href = "./main.jsp";
		</script>
		<%
		e.printStackTrace();
		return;
	}
%>
<script>
	<% if(result.getInt("Role") == 0) {%>
	location.href = "./main.jsp";
	<% } else { %>
	location.href = "./manage.jsp";
	<% } %>
</script>

