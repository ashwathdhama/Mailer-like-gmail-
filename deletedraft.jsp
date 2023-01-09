<%@ page import="career.connection.dao" %>
<%@ page import="java.sql.*" %>


<%
	String un = (String)session.getAttribute("logn");
	
	String delmsg = request.getParameter("delmsg");
	
	try
	{
		Connection con = dao.createconnection();
		PreparedStatement ps = con.prepareStatement("delete from mailsender_draft where datetime=? and draftmaker=?");
		ps.setString(1,delmsg);
		ps.setString(2,un);
		ps.executeUpdate();
		con.close();
	}
	catch(Exception e)
	{
		System.out.println("deletedraft.jsp "+e);
	}

	response.sendRedirect("draft.jsp");	
%>
