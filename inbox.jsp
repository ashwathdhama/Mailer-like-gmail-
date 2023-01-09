<%@ page import="career.connection.dao" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*"%>
<!Doctype html>

<html>
<head>
	<script type="text/javascript">	
		setTimeout(function()
		{
    			location = ''
  		},60*1000)
	</script>

	<link rel="stylesheet" type="text/css" href="style.css" />
	<title>MailSender</title>

	<style type="text/css">
	.tg  {border-collapse:collapse;border-spacing:0;border-color:#aabcfe;}
	.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#aabcfe;color:#669;background-color:#e8edff;}
	.tg th{font-family:Arial, sans-serif;font-size:16px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#aabcfe;color:#039;background-color:#b9c9fe;}
	.tg .tg-baqh{text-align:center;vertical-align:top}
	.tg .tg-mb3i{background-color:#D2E4FC;text-align:right;vertical-align:top}
	.tg .tg-lqy6{text-align:right;vertical-align:top}
	.tg .tg-6k2t{background-color:#D2E4FC;vertical-align:top}
	.tg .tg-yw4l{vertical-align:top}
	</style>

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
			<h3>Inbox</h3><br>

			<%
				try
				{
				Connection con = dao.createconnection();
				PreparedStatement ps = con.prepareStatement("select * from MAILSENDER_INBOX where receiver=? and trash='false'");
				ps.setString(1,un);
				ResultSet rs = ps.executeQuery();
				out.print("<form action='sendtotrash.jsp' method='get'>");
				out.print("<table class='tg'>");
				out.print("<th class='tg-baqh'><input type='submit' value='Delete'></input></th><th class='tg-baqh'>Sender</th><th class='tg-baqh'>Subject</th><th class='tg-baqh'>Date</th><th class='tg-baqh'>Mark</th>");
				int z = 1;
				while(rs.next())
				{
					if(z==1)
					{
						String me;
						if(un.equals(rs.getString("sender")))
						{
							me="me";
						}
						else
						{
							me=rs.getString("sender");
						}

						out.print("<tr>");
						out.print("<td class='tg-baqh'><input type='checkbox' name='delmsg' value='"+rs.getString("datetime")+"'></input> </td><td class='tg-6k2t'>"+me+"</td><td width='30%' class='tg-6k2t'><a href='displaymessage.jsp?datetime="+rs.getString("datetime")+"&sender="+rs.getString("sender")+"'>"+rs.getString("subject")+"</a></td><td class='tg-6k2t'>"+rs.getString("datetime")+"</td><td class='tg-6k2t'><a href='markimportant.jsp?imp="+rs.getString("datetime")+"'>Important</a></td>");
						out.print("</tr>");
						z=2;
					}
					else if(z==2)
					{
						String me;
						if(un.equals(rs.getString("sender")))
						{
							me="me";
						}
						else
						{
							me=rs.getString("sender");
						}

						out.print("<tr>");
						out.print("<td class='tg-baqh'><input type='checkbox' name='delmsg' value='"+rs.getString("datetime")+"'></input> </td><td class='tg-yw4l'>"+me+"</td><td class='tg-yw4l'><a href='displaymessage.jsp?datetime="+rs.getString("datetime")+"&sender="+rs.getString("sender")+"'>"+rs.getString("subject")+"</a></td><td class='tg-yw4l'>"+rs.getString("datetime")+"</td><td class='tg-yw4l'><a href='markimportant.jsp?imp="+rs.getString("datetime")+"'>Important</a></td>");
						out.print("</tr>");
						z=1;
					}
				}
				con.close();
				out.print("</table>");
				out.print("</form>");
				}
				catch(Exception e)
				{
					System.out.println("inbox.jsp : "+ e);
				}
			%>

		</div>
		<div id="content_bottom"></div>
		<div id="footer"></div>
      	</div>

</div>
</body>
</html>
