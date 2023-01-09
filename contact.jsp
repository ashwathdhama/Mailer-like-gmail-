<%@ page import="career.connection.dao" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<!Doctype html>

<html>
<head>
	<link rel="stylesheet" type="text/css" href="style.css" />
	<title>MailSender</title>
	
	<script>
		function show(x)
		{
			document.getElementById('tab1').style.display='none';
			document.getElementById('tab2').style.display='none';
			document.getElementById('tab'+x).style.display='block';
		}
	</script>

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
			<h3>Contacts</h3>
			<br>
			<a href="#" onclick="show('1')">Add Contact</a> | <a href="#" onclick="show('2')">Existing Contacts</a>
			<br><br>
			<table id="tab1" style="display:none">
			<form action="addcontact.jsp">
			<tr><td>Contact Person</td><td><input type="text" name="contactperson"></input></td></tr>
			<tr><td>Mobile</td><td><input type="text" name="mobile"></input></td></tr>
			<tr><td>Email ID</td><td><input type="email" name="email"></input></td></tr>
			<tr><td></td><td><br></td></tr>
			<tr><td></td><td><input type="submit" value="Add Contact"></input>&nbsp;&nbsp;<input type="reset"></input></td></tr>
			</form>
			</table>
		
			<table id="tab2" class='tg' style="display:block">
			<%
			try
			{
				Connection con = dao.createconnection();
				PreparedStatement ps = con.prepareStatement("select * from mailsender_contact where login_id=?");
				ps.setString(1,un);
				ResultSet rs = ps.executeQuery();
				out.print("<tr><th>Contact Person</th><th>Mobile</th><th>Email ID</th><th>Remove</th></tr>");
				while(rs.next())
				{
					out.print("<tr><td width='30%'>"+rs.getString("contact_person")+"</td><td width='30%'>"+rs.getString("mobile")+"</td><td width='40%'><a href='compose.jsp?sender="+rs.getString("email")+"'>"+rs.getString("email")+"</a></td><td><a href='removecontact.jsp?cid="+rs.getString("contact_id")+"'>remove</a></td></tr>");
				}
				con.close();
			}
			catch(Exception e)
			{
			}
			%>
			</table>
		</div>
		<div id="content_bottom"></div>
		<div id="footer"></div>
      	</div>

</div>
</body>
</html>
