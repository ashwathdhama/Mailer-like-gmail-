<%@ page import="career.connection.dao" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<!Doctype html>

<html>
<head>
	<link rel="stylesheet" type="text/css" href="style.css" />
	<title>MailSender</title>

	<script>
		var request;
		var val;
		var p;
		function cat()
		{
			var opw = document.myform.opw.value;
			var npw = document.myform.npw.value;
			if(npw.length==0)
			{
				alert("Please Enter New Password");
				return false;
			}
			if(opw.length==0)
			{
				alert("Please Enter Old Password");
				return false;
			}
			else
			{
				
				var url = "changepassword.jsp?opw="+opw+"&npw="+npw;

				if(window.XMLHttpRequest)
				{  
					request = new XMLHttpRequest();  
				}  
				else if(window.ActiveXObject)
				{  
					request = new ActiveXObject("Microsoft.XMLHTTP");  
				}

				try
				{
				request.onreadystatechange = rat;  
				request.open("GET",url,true);  
				request.send(); 
				}
				catch(e)
				{
					alert("Unable to connect to server");
				}
			}
			return true;
		}
			
		function rat()
		{
			if(request.readyState==4)
			{  
				val = request.responseText;
				document.getElementById('amit').innerHTML = val;  
			} 
		}

	</script>
</head>

<body>
<div id="container">

	<div id="header">
         <h1>Mail<span class="off">Sender.com</span></h1>
       
	<%
		String un = (String)session.getAttribute("logn");
	
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
			<h3>Settings</h3>

			<form action="loadphoto.jsp" method="post" enctype="multipart/form-data">
			<table>
				<tr><td><b>Upload Photo</b></td></tr>
				<tr><td><input type="file" name="photo"></input></td></tr>
				<tr><td><input type="submit" value="Load"></input></td></tr>
			</table>
			</form>


			<br><hr><br>


			<table>
			<form name="myform">
			<tr><td><b>Change Password</b></td><td></td></tr>
			<tr><td>New Password</td><td><input type="password" name="npw"></input></td></tr>
			<tr><td>Old Password</td><td><input type="password" name="opw"></input></td></tr>
			<tr><td></td><td><input type="button" onclick="return cat()" value="Change"></input></td></tr>
			<tr><td></td><td><br></td></tr>
			<tr><td></td><td><span id="amit"></span></td></tr>
			</form>
			</table>
			
		</div>
		<div id="content_bottom"></div>
		<div id="footer"></div>
      	</div>

</div>
</body>
</html>
