<%@ page import="career.connection.dao" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.text.*" %>

<%
	String un = (String)session.getAttribute("logn");
	String to = request.getParameter("to");
	String sub = request.getParameter("sub");	
	String msg = request.getParameter("msg");	
	String uid = request.getParameter("uid");	
	
	if(!(to.trim().length()==0 && sub.trim().length()==0 && msg.trim().length()==0))
	{	

	DateFormat dateFormat = new SimpleDateFormat("dd-MMM-yyyy HH-mm-ss");
	java.util.Date date = new java.util.Date();
	String dt = dateFormat.format(date).toString();
	
	try
	{
		Connection con = dao.createconnection();
		
		PreparedStatement ps1 = con.prepareStatement("select * from mailsender_draft where uuid=?");
		ps1.setString(1,uid);
		ResultSet rs = ps1.executeQuery();
		if(rs.next())
		{
			PreparedStatement ps2 = con.prepareStatement("update mailsender_draft set draftmaker=?,receiver=?,subject=?,message=?,datetime=? where uuid=?");
			ps2.setString(1,un);
			ps2.setString(2,to);
			ps2.setString(3,sub);
			ps2.setString(4,msg);
			ps2.setString(5,dt);
			ps2.setString(6,uid);
			ps2.executeUpdate();
		}
		else
		{
			PreparedStatement ps3 = con.prepareStatement("insert into mailsender_draft values(?,?,?,?,?,?)");
			ps3.setString(1,un);
			ps3.setString(2,to);
			ps3.setString(3,sub);
			ps3.setString(4,msg);
			ps3.setString(5,dt);
			ps3.setString(6,uid);
			ps3.executeUpdate();
		}
		con.close();
	}
	catch(Exception e)
	{
		System.out.println("checkuser.jsp "+e);
	}
	}
%>
