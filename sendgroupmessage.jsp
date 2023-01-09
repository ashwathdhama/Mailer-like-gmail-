<%@ page import="career.connection.dao" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.text.*" %>
<%@ page import="com.oreilly.servlet.multipart.MultipartParser" %>
<%@ page import="com.oreilly.servlet.multipart.Part" %>
<%@ page import="com.oreilly.servlet.multipart.FilePart" %>

<%
	String un = (String)session.getAttribute("logn");
	
	String to = request.getParameter("to");
	String sub = request.getParameter("sub");	
	String msg = request.getParameter("msg");
	String uid = request.getParameter("uid");
	
	DateFormat dateFormat = new SimpleDateFormat("dd-MMM-yyyyHH-mm-ss");
	java.util.Date date = new java.util.Date();
	String dt = dateFormat.format(date).toString();
	String members[] = to.split(",");

	try
	{
		Connection con = dao.createconnection();
		for(int i=0 ; i<members.length ; i++)
		{
			
			if(members[i].endsWith("mailsender.com"))
			{
				PreparedStatement ps1 = con.prepareStatement("select * from mailsender_signup where login_name='"+members[i]+"'");
				ResultSet rs = ps1.executeQuery();
				if(rs.next())
				{
					PreparedStatement ps2 = con.prepareStatement("insert into mailsender_inbox values(?,?,?,?,?,?,?,?,?)");
					PreparedStatement ps3 = con.prepareStatement("insert into mailsender_sentmails values(?,?,?,?,?,?,?,?,?)");
			
					ps2.setString(1,un);
					ps2.setString(2,members[i]);
					ps2.setString(3,sub);
					ps2.setString(4,msg);
					ps2.setString(5,dt);
					ps2.setString(6,"false");
					ps2.setString(7,"false");
					ps2.setString(8,uid);
					ps2.setString(9,"no");
			
					ps3.setString(1,un);
					ps3.setString(2,members[i]);
					ps3.setString(3,sub);
					ps3.setString(4,msg);
					ps3.setString(5,dt);
					ps3.setString(6,"false");
					ps3.setString(7,"false");
					ps3.setString(8,uid);
					ps3.setString(9,"no");
			
					int z1 = ps2.executeUpdate();
					int z2 = ps3.executeUpdate();
					if(z1>0 && z2>0)
					{
						PreparedStatement ps4 = con.prepareStatement("delete from mailsender_draft where uuid=? and draftmaker=?");
						ps4.setString(1,uid);
						ps4.setString(2,un);
						ps4.executeUpdate();
						out.print("<br>message sent successfully to "+members[i]);
					}
					else
					{
						out.print("<br>error in sending message....");
					}
				}
				else
				{
					out.println("<br>"+members[i]+" does not exists");
				}
			}
			else
			{
				//outside server
			}
		}
		con.close();
	}
	catch(Exception e)
	{
		System.out.println("sendgroupmessage.jsp "+e);
	}

%>
