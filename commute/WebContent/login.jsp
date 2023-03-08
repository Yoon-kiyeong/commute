<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="./default.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	
	String ID = request.getParameter("id");
	String Password = request.getParameter("password");
	PreparedStatement pstmt = null;
	ResultSet result = null;
	try {
	String query = "select ID, Password FROM Member WHERE ID = ? AND Password = ?; ";
	pstmt = conn.prepareStatement(query,ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	pstmt.setString(1, ID);
	pstmt.setString(2, Password);
	result = pstmt.executeQuery();
	result.last();
	out.println(result.getRow());
	out.println(ID);
	out.println(Password);
	if (result.getRow() == 0) {
%>
<script>
	alert("正しいID/PWではありません。 もう一度ログインしてください ");
// 	location.href = "./";
</script>
<%
	return;
	}
	
	result.beforeFirst();
	result.next();
	
	session.setAttribute("ID", Integer.toString(result.getInt("ID")));
	session.setAttribute("Password", result.getString("Pass1word"));
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
	
	}
%>
<script>
	location.href = "./main.jsp";
</script>
	
	