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
		String groupname = request.getParameter("groupname");
	%>

	<div id="header">
        	<h1>Mail<span class="off">Sender.com</span></h1> <h2> Hi, <%=un.substring(0,un.indexOf("@"))%> </h2>
        </div>   
      
        <div id="menu">
        	<ul>
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
		<h3>Group Name : <%=groupname%></h3>
		<%
		try
		{
			Connection con = dao.createconnection();
			PreparedStatement ps = con.prepareStatement("select * from MAILSENDER_GROUP where group_name=? and group_logid=?");
			ps.setString(1,groupname);
			ps.setString(2,un);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
			String members[] = rs.getString("group_members").split(",");
			out.print("<table border='1'>");
			out.print("<form action='sendtotrash.jsp' method='get'>");
			out.print("<tr><th>Existing Members</th><th>Delete</th></tr>");
			for(int i=0 ; i<members.length ; i++)
			{
				out.print("<tr><td>"+members[i]+"</td><td><a href='removegroupmember.jsp?groupname="+rs.getString("group_name")+"&membername="+members[i]+"'>remove</a></td></tr>");
			}
			out.print("</form>");
			out.print("</table>");
			}
			con.close();
		}
		catch(Exception e)
		{
		}	
		%>
		
		<br><br>
		<form action="addgroupmember.jsp">
		<b>Add New Member</b> <input type="email" name="t1"></input> &nbsp;&nbsp;<input type="submit" value="Add"></input>
		<input type="hidden" name="groupname" value="<%=groupname%>">
		</form>

		</div>
		<div id="content_bottom"></div>
		<div id="footer"></div>
      	</div>

</div>
</body>
</html>
