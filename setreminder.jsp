<%@ page import="java.util.UUID" %>
<%@ page import="java.io.*"%>

<!Doctype html>

<html>
<head>
	<link rel="stylesheet" type="text/css" href="style.css" />
	<title>MailSender</title>

	<script>
		function cat(form)
		{
			var settime = document.signupform.settime.value;
			var msg = document.signupform.msg.value;
			
			if(settime.length==0)
			{
				alert("Error! Please Select Reminder Date");
				document.signupform.settime.focus();
				return false; 
			}
			else if(msg.length==0)
			{
				alert("Error! Reminder Message can't leave blank");
				document.signupform.msg.focus();
				return false; 
			}

			return true;
		}
	</script>

	
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
            	<li class="menuitem"><a href="profile.jsp">Home</a>
		</li><li class="menuitem"><a href="settings.jsp">Settings</a></li>
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
		
		<h3>Set Reminder</h3>
		
		
		<form name="signupform" action="savereminder.jsp" onsubmit="return cat(this)">
		<table>
			<tr><td></td><td><br></td></tr>	
			<tr><td></td><td><input type="hidden" name="msgid" value="<%=request.getParameter("msgid")%>"></input></td></tr>
			<tr><td><b>Select Reminder Date</td><td><input type="date" name="settime"></input></td></tr>
			<tr><td></td><td><br></td></tr>	
			<tr><td><b>Reminder Message</td><td><textarea name="msg" cols="50" rows="5"><%=request.getParameter("message")%></textarea></td></tr>
			<tr><td></td><td><br></td></tr>	
			<tr><td></td><td><input type="submit" value="Save Reminder"></input></td></tr>
			<tr><td></td><td><br></td></tr>	
			<tr><td></td><td><span id="amit"></span></td></tr>
		</table>
		</form>

		</div>
		
		<div id="content_bottom"></div>
		<div id="footer"></div>
      	</div>

</div>
</body>
</html>
