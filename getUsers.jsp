<%@page import="dao.DAO"%>
<%
	out.print(new DAO().getUsers());
%>