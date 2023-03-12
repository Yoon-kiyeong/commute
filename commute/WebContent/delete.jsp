<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="./mdefault.jsp"%>

<%
	request.setCharacterEncoding("utf-8");
	String rid = request.getParameter("deleterid");
	PreparedStatement pstmt = null;
	ResultSet result = null;
	try {
		String query = "DELETE FROM commute WHERE recordid=?"; 
		pstmt = conn.prepareStatement(query,ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		pstmt.setInt(1, Integer.parseInt(rid));	
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
	alert("正常に削除されました。");
	location.href = "./manage.jsp";
</script>