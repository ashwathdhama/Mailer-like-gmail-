<%@ page import="career.connection.dao" %>
<%@ page import="java.sql.*" %>


<%
	String un = (String)session.getAttribute("logn");
	
	String groupname = request.getParameter("groupname");
	String membername = request.getParameter("membername");
	
	try
	{
		Connection con = dao.createconnection();
		PreparedStatement ps1 = con.prepareStatement("select * from mailsender_group where group_name=? and group_logid=?");
		ps1.setString(1,groupname);
		ps1.setString(2,un);
		ResultSet rs = ps1.executeQuery();
		if(rs.next())
		{
			String members = rs.getString("group_members");
			members = members.replaceFirst(membername,"");
			members = members.replace(",,",",");
			PreparedStatement ps2 = con.prepareStatement("update mailsender_group set group_members=? where group_name=? and group_logid=?");
			ps2.setString(1,members);
			ps2.setString(2,groupname);
			ps2.setString(3,un);
			ps2.executeUpdate();
		}	
		
		con.close();
	}
	catch(Exception e)
	{
		System.out.println("removegroupmember.jsp "+e);
	}

	response.sendRedirect("editgroup.jsp?groupname="+groupname);	
%>
