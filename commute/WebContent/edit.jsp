<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="./mdefault.jsp"%>

<%
	request.setCharacterEncoding("utf-8");
	String rid = request.getParameter("editrid");
	String commute = request.getParameter("editcommute");
	String leave = request.getParameter("editleave");

	PreparedStatement pstmt = null;
	ResultSet result = null;
	try {
		String query = "UPDATE commute SET commute=?, leave=? WHERE recordid=?"; 
		pstmt = conn.prepareStatement(query,ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		pstmt.setTimestamp(1, java.sql.Timestamp.valueOf(commute));	
		pstmt.setTimestamp(2, java.sql.Timestamp.valueOf(leave));	
		pstmt.setInt(3, Integer.parseInt(rid));	
		pstmt.executeUpdate();	

	} catch (SQLException e){
		System.out.println("Code: " + e.getErrorCode());
		System.out.println("SqlState: " + e.getSQLState());
		System.out.println("Error Message: " + e.getMessage());
		%>
		<script>
			alert("データベース処理中にエラーが発生しました。");
			location.href = "./manage.jsp";
		</script>
		<%
		return;
	} catch (Exception e) {
		%>
		<script>
			alert("定義されていないエラーが発生しました。");
			location.href = "./manage.jsp";
		</script>
		<%
		e.printStackTrace();
		return;
	}
%>
<script>
	alert("正常に修正されました。");
	location.href = "./manage.jsp";
</script>