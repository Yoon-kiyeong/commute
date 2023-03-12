<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="./default.jsp"%>

<%
	request.setCharacterEncoding("utf-8");
	
	String ID = request.getParameter("ID");
	String Password = request.getParameter("password");
	PreparedStatement pstmt = null;
	ResultSet result = null;
	try {
		String query = "SELECT * FROM commute WHERE leave IS NULL and User_Id=?;"; // 출근 안찍힌거 있는지
		pstmt = conn.prepareStatement(query,ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		pstmt.setInt(1, Integer.parseInt((String)session.getAttribute("ID")));	
		System.out.println(session.getAttribute("ID"));
		result = pstmt.executeQuery();
		result.last();
		if(result.getRow() == 0) { // 퇴근 남은 기록 없음
			%>
			<script>
				alert("出勤記録がありません.");
				location.href="./main.jsp"; 
			</script>
			<%
			return;
		}

		query = "update commute set leave = now() where User_Id = ? and leave IS NULL;"; //출근
		pstmt = conn.prepareStatement(query,ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		pstmt.setInt(1, Integer.parseInt((String)session.getAttribute("ID")));	
		pstmt.executeUpdate();

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
	alert("退勤処理しました");
	location.href = "./main.jsp";
</script>
