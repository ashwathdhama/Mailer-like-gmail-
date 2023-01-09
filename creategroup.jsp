<%@page import="career.connection.dao" %>
<%@page import="java.sql.*" %>

<%
	String un = (String)session.getAttribute("logn");
	String groupname = request.getParameter("groupname");
	String addcon[] = request.getParameterValues("addcon");
	String members="";

	for(int i=0 ; i<addcon.length ; i++)
	{
		members = members + addcon[i];
		if(i<addcon.length-1)
		{
			members = members + ",";
		}
	}	

	try
	{
		Connection con = dao.createconnection();
		PreparedStatement ps = con.prepareStatement("INSERT into mailsender_group values(?,?,?)");
		ps.setString(1,un);
		ps.setString(2,groupname);
		ps.setString(3,members);
		int z = ps.executeUpdate();
		if(z>0)
		{
			con.close();
			response.sendRedirect("groups.jsp");
		}
		con.close();
	}
	catch(Exception e)
	{
		System.out.println("groups.jsp "+e);	
	}
%>