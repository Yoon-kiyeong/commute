<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="./default.jsp"%>

<%
	request.setCharacterEncoding("utf-8");
	
	PreparedStatement pstmt = null;
	ResultSet result = null;
	try {
		//1. 전날 퇴근이 안되어 있으면 출근이 되면 안됨
		//2. 퇴근이 처리가 안되어 있으면 퇴근시간을 저녁 6시로 퇴근처리 ()
		//3. 출근처리

		String query = "UPDATE commute SET leave = DATE(commute)+TIME '18:00' WHERE leave IS NULL AND User_Id=?"; // 퇴근 안한 기록은 출근날 기준 오후 6시로 설정
		pstmt = conn.prepareStatement(query,ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		pstmt.setInt(1, Integer.parseInt((String)session.getAttribute("ID")));	
		pstmt.executeUpdate();
		
		query = "insert into commute (commute, leave, User_Id) values (now(), null,?)"; //출근
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
	alert("出勤処理されました。");
	location.href = "./main.jsp";
</script>