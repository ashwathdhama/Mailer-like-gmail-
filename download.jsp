<%@ page import="java.io.*" %>
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

		<h2 style="font-family:verdana; font-size:140%; color:green;">Download Attachments</h2>
		<br>
		<%
			String lid = request.getParameter("attachmentid");
			String path = getServletContext().getRealPath("/") + File.separator + "attachments/"+lid+"/"; 
			System.out.println(path);
			File fe1 = new File(path);
			File fl[] = fe1.listFiles();
			out.print("<table>");
			out.print("<th></th><th style='font-family:verdana; font-size:120%; color:brown;'>Document Name</th><th style='font-family:verdana; font-size:120%; color:brown;'>Size</th>");
			for(int i=0 ; i<fl.length ; i++)
			{
				out.print("<tr>");
				out.print("<td style='font-family:verdana; font-size:110%; color:red;'>"+(i+1)+")</td><td style='font-family:verdana; font-size:110%;'><a href='downloadfileuser.jsp?fn="+fl[i].getName()+"&lid="+lid+"'>"+fl[i].getName()+"</a></td><td>"+fl[i].length()+" bytes</td>");
				out.print("</tr>");
			}
			out.print("</table>");
		%>

		</div>

		<div id="content_bottom"></div>
		<div id="footer"></div>
      	</div>

</div>
</body>
</html>
