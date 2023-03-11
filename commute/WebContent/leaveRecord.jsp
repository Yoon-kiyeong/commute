<%@ page import="java.sql.*"%>
<%@ include file="./default.jsp" %>

<%
	request.setCharacterEncoding("utf-8");
	
	String ID = request.getParameter("ID");
	String Password = request.getParameter("password");
	PreparedStatement pstmt = null;
	ResultSet result = null;
	try {
	String query = "update commute set leave = now() where User_Id = ? and leave IS NULL;"; //출근
	pstmt = conn.prepareStatement(query,ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	pstmt.setInt(1, Integer.parseInt((String)session.getAttribute("ID")));	
 	pstmt.executeUpdate();
%>
<%
	} catch (Exception e){
		e.printStackTrace();
	} finally {
		
	}
%>
<script>
	location.href = "./main.jsp";
</script>