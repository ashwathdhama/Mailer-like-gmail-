<%@ page import="career.connection.dao" %>
<%@ page import="java.sql.*" %>

<%
	String un = request.getParameter("un");
	String mob = request.getParameter("un");
	if(un.indexOf("@")==-1)
	{
		un = un + "@mailsender.com";
	}
	try
	{
		Connection con = dao.createconnection();
		PreparedStatement ps = con.prepareStatement("select * from mailsender_signup where login_name=? or mobile=?");
		ps.setString(1,un);
		ps.setString(2,mob);
		ResultSet rs = ps.executeQuery();
		if(rs.next())
		{
			out.print("1");	
			application.setAttribute("un",rs.getString("login_name"));
		}
		else
		{
			out.print("Could not find your MailSender Account");
		}
		con.close();
	}
	catch(Exception e)
	{
		System.out.println("checkuser.jsp "+e);
	}

%>
