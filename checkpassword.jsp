<%@ page import="career.connection.dao" %>
<%@ page import="java.sql.*" %>

<%
	String pass = request.getParameter("pass");
	String un = request.getParameter("un");
	
	try
	{
		Connection con = dao.createconnection();
		PreparedStatement ps = con.prepareStatement("select * from mailsender_signup where login_name=? and password=?");
		ps.setString(1,un);
		ps.setString(2,pass);
		ResultSet rs = ps.executeQuery();
		if(rs.next())
		{
			String mobile = rs.getString("mobile");
			session.setAttribute("logn",un);
			session.setAttribute("status",false);
			response.sendRedirect("profile.jsp?mobile="+mobile);
		}
		else
		{
			application.setAttribute("msg","Sorry! password is incorrect...");
	%>
			<%@ include file="password.jsp" %>
	<%						
		}
		con.close();
	}
	catch(Exception e)
	{
		System.out.println("checkuser.jsp "+e);
	}

%>
