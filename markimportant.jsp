<%@ page import="career.connection.dao" %>
<%@ page import="java.sql.*" %>


<%
	String un = (String)session.getAttribute("logn");
	
	String impmsg = request.getParameter("imp");
	
	try
	{
		Connection con = dao.createconnection();
		PreparedStatement ps1 = con.prepareStatement("update mailsender_inbox set important='true' where receiver=? and datetime=?");
		ps1.setString(1,un);
		ps1.setString(2,impmsg);
		ps1.executeUpdate();
		con.close();
	}
	catch(Exception e)
	{
		System.out.println("checkuser.jsp "+e);
	}

	response.sendRedirect("inbox.jsp");	
%>
