<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="./default.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	
	String ID = request.getParameter("ID");
	String Password = request.getParameter("Password");
	PreparedStatement pstmt = null;
	ResultSet result = null;
	try {
	String query = "select ID, Password FROM Member;";
	pstmt = conn.prepareStatement(query);
	pstmt.setString(1, ID);
	pstmt.setString(2, Password);
	result = pstmt.executeQuery();
	result.last();
	out.println(result.getRow());
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
	
	session.setAttribute("ID", Integer.toString(result.getInt("ID")));
	session.setAttribute("Password", result.getString("Password"));
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
	
	}
%>
<script>
	location.href = "./main.jsp";
</script>
	
	