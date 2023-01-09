<%@page import="career.connection.dao" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.UUID" %>


<%
	String un = (String)session.getAttribute("logn");
	String cp = request.getParameter("contactperson");
	String mob = request.getParameter("mobile");
	String em = request.getParameter("email");
	String uid = UUID.randomUUID().toString();
	uid = uid.substring(0,6);
		
	try
	{
		Connection con = dao.createconnection();
		PreparedStatement ps = con.prepareStatement("INSERT into mailsender_contact values(?,?,?,?,?)");
		ps.setString(1,uid);
		ps.setString(2,cp);
		ps.setString(3,mob);
		ps.setString(4,em);
		ps.setString(5,un);
		int z = ps.executeUpdate();
		if(z>0)
		{
			con.close();
			response.sendRedirect("contact.jsp");
		}
		con.close();
	}
	catch(Exception e)
	{
		System.out.println("addcontact.jsp "+e);	
	}
%>