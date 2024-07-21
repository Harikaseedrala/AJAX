<%@page import="dao.DAO"%>
<%
	String email=request.getParameter("email");
	String password=request.getParameter("password");
	String phone=request.getParameter("phone");
	String address=request.getParameter("address");
	DAO dao=new DAO();
	if(dao.register(email, password, phone, address))
	{
		out.print("RegistrationSuccessfull");
	}else
		out.print("RegistrationFailed");
%>