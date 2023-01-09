<%@ page import="career.connection.dao" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.text.*" %>

<%
	String un = (String)session.getAttribute("logn");
	
	String settime = request.getParameter("settime");
	String msgid = request.getParameter("msgid");
	String msg = request.getParameter("msg");
	
	try
	{
		Connection con = dao.createconnection();
		PreparedStatement ps = con.prepareStatement("update mailsender_inbox set reminder=? , REMINDER_MESSAGE=? where receiver=? and msgid=?");
		ps.setString(1,settime);
		ps.setString(2,msg);
		ps.setString(3,un);
		ps.setString(4,msgid);
		ps.executeUpdate();
		con.close();
	}
	catch(Exception e)
	{
		System.out.println("savereminder.jsp "+e);
	}

	response.sendRedirect("important.jsp");	
%>
