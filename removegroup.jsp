<%@ page import="career.connection.dao" %>
<%@ page import="java.sql.*" %>


<%
	String un = (String)session.getAttribute("logn");
	
	String groupname = request.getParameter("groupname");
	
	try
	{
		Connection con = dao.createconnection();
		PreparedStatement ps = con.prepareStatement("delete from mailsender_group where group_name=? and group_logid=?");
		ps.setString(1,groupname);
		ps.setString(2,un);
		ps.executeUpdate();
		con.close();
	}
	catch(Exception e)
	{
		System.out.println("removegroup.jsp "+e);
	}

	response.sendRedirect("groups.jsp");	
%>
