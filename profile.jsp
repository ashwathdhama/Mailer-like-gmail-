<%@ page import="java.io.*" %>
<%@ page import="career.connection.dao" %>
<%@ page import="career.connection.SendSMS" %>
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
		if(un==null)
		{
		response.sendRedirect("signin.jsp");
		}
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
            	<li class="menuitem"><a href="#">Home</a></li>
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

		<%
			try
			{

				Connection con = dao.createconnection();
				PreparedStatement ps = con.prepareStatement("select * from MAILSENDER_INBOX where receiver=? and important='true'");
				ps.setString(1,un);
				ResultSet rs = ps.executeQuery();
			
				java.util.Date dt = new java.util.Date();
				java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
				String strdt = sdf.format(dt);

				out.print("<h2 style='color:red; font-size:200%;'>Today's Reminder : " + strdt + "<h2>");

				String mobile = request.getParameter("mobile");
			
				int i=1;
				boolean bn = (Boolean)session.getAttribute("status");
				while(rs.next()==true)
				{
					String remdt = rs.getString("reminder");
					if(remdt.equals(strdt))
					{
						if(bn==false)
						{
							bn=true;
							SendSMS.sendSMS(rs.getString("reminder_message"),mobile);
							session.removeAttribute("status");
							session.setAttribute("status",true);
						}	
						out.print("<br>"+i+") "+rs.getString("reminder_message") + " <a href='displaymessage.jsp?datetime="+rs.getString("datetime")+"&sender="+rs.getString("sender")+"'>("+rs.getString("datetime")+")</a>");
					}
					
					i++;
				}
				if(bn==false)
				{
					out.print("<br>There is no reminder");
				}

				con.close();
			}
			catch(Exception e)
			{
			}	
		%>
		

		</div>

		<div id="content_bottom"></div>
		<div id="footer"></div>
      	</div>

</div>
</body>
</html>
