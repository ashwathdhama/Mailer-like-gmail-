<%@ page import="career.connection.dao" %>
<%@ page import="java.sql.*" %>


<%
	String un = (String)session.getAttribute("logn");
	
	String delmsg[] = request.getParameterValues("delmsg");
	String rec = request.getParameter("rec");
	
	try
	{
		Connection con = dao.createconnection();
		for(int i=0 ; i<delmsg.length ; i++)
		{
			PreparedStatement ps1 = con.prepareStatement("delete from mailsender_sentmails where sender=? and receiver=? and datetime=?");
			ps1.setString(1,un);
			ps1.setString(2,rec);
			ps1.setString(3,delmsg[i]);
			ps1.executeUpdate();
		}
		con.close();
	}
	catch(Exception e)
	{
		System.out.println("checkuser.jsp "+e);
	}

	response.sendRedirect("sent.jsp");	
%>
