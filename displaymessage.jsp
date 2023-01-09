<%@ page import="career.connection.dao" %>
<%@ page import="java.sql.*" %>

<!Doctype html>

<html>
<head>
	<link rel="stylesheet" type="text/css" href="style.css" />
	<title>MailSender</title>
</head>

<body>
<div id="container">

	<%
		String un = (String)session.getAttribute("logn");
	%>

	<div id="header">
        	<h1>Mail<span class="off">Sender.com</span></h1> <span> Welcome,<%=un%> </span>
        </div>   
      
        <div id="menu">
        	<ul>
            	<li class="menuitem"><a href="profile.jsp">Home</a></li>
                <li class="menuitem"><a href="settings.jsp">Settings</a></li>
                <li class="menuitem"><a href="editprofile.jsp">Profile</a></li>
                <li class="menuitem"><a href="logout.jsp">Logout</a></li>
                </ul>
        </div>
        
        <div id="leftmenu">

        	<div id="leftmenu_top"></div>
		<div id="leftmenu_main">    
	        	<h3>Links</h3>
             		<ul>
                	    <li><a href="compose.jsp">Compose</a></li>
                	    <li><a href="inbox.jsp">Inbox</a></li>
                	    <li><a href="draft.jsp">Draft</a></li>
                	    <li><a href="sent.jsp">Sent Items</a></li>
                	    <li><a href="important.jsp">Important</a></li>
                	    <li><a href="trash.jsp">Trash</a></li>
                	    <li><a href="groups.jsp">Groups</a></li>
                	    <li><a href="contact.jsp">Contact</a></li>
                	</ul>
		</div>
        	<div id="leftmenu_bottom"></div>
        </div>
        
	<div id="content">
        	<div id="content_top"></div>
        	<div id="content_main">
		<h3>Message from <%= request.getParameter("sender")%></h3>
		<br>
		
		<%
			try
			{
			String datetime = request.getParameter("datetime");
			Connection con = dao.createconnection();
			PreparedStatement ps = con.prepareStatement("select * from MAILSENDER_INBOX where receiver=? and datetime=?");
			ps.setString(1,un);
			ps.setString(2,datetime);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				out.print(rs.getString("message"));		
			}
			out.print("<br><br><a href='inbox.jsp'>Back</a> | <a href='compose.jsp?sender="+rs.getString("sender")+"'>Reply</a> | <a href='compose.jsp?sub="+rs.getString("subject")+"&msg="+rs.getString("message")+"'>Forward</a> | <a href='download.jsp?attachmentid="+rs.getString("attachment_id")+"'>Download Attachment</a>");
			con.close();
			}
			catch(Exception e)
			{
				System.out.println("displaymessage.jsp : "+e);
			}
		%>

			
		</div>
		<div id="content_bottom"></div>
		<div id="footer"></div>
      	</div>

</div>
</body>
</html>
