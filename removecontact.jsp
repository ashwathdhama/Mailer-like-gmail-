<%@ page import="career.connection.dao" %>
<%@ page import="java.sql.*" %>


<%
	String un = (String)session.getAttribute("logn");
	
	String cid = request.getParameter("cid");
	
	try
	{
		Connection con = dao.createconnection();
		PreparedStatement ps = con.prepareStatement("delete from mailsender_contact where contact_id=? and login_id=?");
		ps.setString(1,cid);
		ps.setString(2,un);
		ps.executeUpdate();
		con.close();
	}
	catch(Exception e)
	{
		System.out.println("checkuser.jsp "+e);
	}

	response.sendRedirect("contact.jsp");	
%>
