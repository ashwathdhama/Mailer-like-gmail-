<%@ page import="career.connection.dao" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

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
        	<h1>Mail<span class="off">Sender.com</span></h1>
        

		<%
	
		File fe = new File(getServletContext().getRealPath("/")+"/photos/");
		String str[] = fe.list();
		for(int i=0 ; i<str.length ; i++)
		{
			String fn = str[i].substring(0,str[i].indexOf("."));
			fn = fn + ".com";
			if(fn.equals(un))
			{
			out.print("<h2>Hi, "+un.substring(0,un.indexOf("@"))+" <img src='photos/"+str[i]+"' width='40' height='40'></img> </h2>");
			break;
			}	
			else
			{
			out.print("<h2>Hi, "+un.substring(0,un.indexOf("@"))+" <img src='photos/default.png' width='40' height='40'></img> </h2>");
			}
		}
		%>

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
			<h3>Trash</h3>

			<%
				Connection con = dao.createconnection();
				PreparedStatement ps = con.prepareStatement("select * from MAILSENDER_INBOX where receiver=? and trash='true'");
				ps.setString(1,un);
				ResultSet rs = ps.executeQuery();
				out.print("<form action='deletemessage.jsp' method='get'>");
				out.print("<table class='tg'>");
				out.print("<th><input type='submit' value='Delete'></input></th><th>Sender</th><th>Subject</th><th>Date</th><th>Restore</th>");
				while(rs.next())
				{
					out.print("<tr>");
					out.print("<td><input type='checkbox' name='delmsg' value='"+rs.getString("datetime")+"'></input> </td><td>"+rs.getString("sender")+"</td><td><a href='displaymessage.jsp?datetime="+rs.getString("datetime")+"&sender="+rs.getString("sender")+"'>"+rs.getString("subject")+"</a></td><td>"+rs.getString("datetime")+"</td><td><a href='restoretoinbox.jsp?datetime="+rs.getString("datetime")+"'>restore</a></td>");
					out.print("</tr>");
				}	
				out.print("</table>");
				out.print("</form>");
			%>

		</div>
		<div id="content_bottom"></div>
		<div id="footer"></div>
      	</div>

</div>
</body>
</html>
