<%@ page import="career.connection.dao" %>
<%@ page import="java.sql.*" %>


<%
	String un = (String)session.getAttribute("logn");
	
	String delmsg[] = request.getParameterValues("delmsg");
	
	try
	{
		Connection con = dao.createconnection();
		for(int i=0 ; i<delmsg.length ; i++)
		{
			PreparedStatement ps1 = con.prepareStatement("delete from mailsender_inbox where receiver=? and datetime=?");
			ps1.setString(1,un);
			ps1.setString(2,delmsg[i]);
			ps1.executeUpdate();
		}
		con.close();
	}
	catch(Exception e)
	{
		System.out.println("checkuser.jsp "+e);
	}

	response.sendRedirect("trash.jsp");	
%>
