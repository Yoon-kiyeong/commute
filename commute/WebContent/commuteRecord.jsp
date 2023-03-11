<%@ page import="java.sql.*"%>
<%@ include file="./default.jsp" %>

<%
	request.setCharacterEncoding("utf-8");
	
	String ID = request.getParameter("ID");
	String Password = request.getParameter("password");
	PreparedStatement pstmt = null;
	ResultSet result = null;
	try {
	//1. 전날 퇴근이 안되어 있으면 출근이 되면 안됨
	//2. 퇴근이 처리가 안되어 있으면 퇴근시간을 저녁 6시로 퇴근처리 ()
	//3. 출근처리
	
	String query = "insert into commute values (now(), null,?)"; //출근
	pstmt = conn.prepareStatement(query,ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	pstmt.setInt(1, Integer.parseInt((String)session.getAttribute("ID")));	
 	pstmt.executeUpdate();
	
%>
<% }catch (SQLException e){
		int count = 1;
		while (e != null) {
	       System.out.println("SQLException " + count);
	       System.out.println("Code: " + e.getErrorCode());
	       System.out.println("SqlState: " + e.getSQLState());
	       System.out.println("Error Message: " + e.getMessage());
	       e = e.getNextException();
	       count++;
	     }
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<script>
	location.href = "./main.jsp";
</script>