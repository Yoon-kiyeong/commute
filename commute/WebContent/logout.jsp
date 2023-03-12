<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    session.invalidate();
%>
<script>
    alert("正常にログアウトされました.");
    location.href="./index.jsp";
</script>