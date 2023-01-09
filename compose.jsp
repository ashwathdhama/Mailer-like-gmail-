<%@ page import="java.util.UUID" %>
<%@ page import="java.io.*"%>

<!Doctype html>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" type="text/css" href="style.css" />

	<title>MailSender</title>

	<script></script>

	<script>
		var request;
		function sendinfo1()  
		{ 
			var to = document.myform.to.value;
  			var sub = document.myform.sub.value;
  			var msg = document.myform.msg.value;
 			var uid = document.myform.uid.value;
 
			if(to.length==0)
			{
				alert("Error! Recepient can't leave blank");
				return false;
			}
			else if(sub.length==0)
			{
				alert("Error! Subject can't leave blank");
				return false;
			}
			else if(msg.length==0)
			{
				alert("Error! Message can't leave blank");
				return false;
			}
			else 
			{
				return true;
			} 
		}  
  
		function getinfo1()
		{  
			if(request.readyState==4)
			{  
				var val=request.responseText;  
				document.getElementById('amit').innerHTML=val;  
			}  
		} 

		function sendinfo2()
		{
			var to = document.myform.to.value;
  			var sub = document.myform.sub.value;
  			var msg = document.myform.msg.value;
  			var uid = document.myform.uid.value;
  			var url = "saveasdraft.jsp?to="+to+"&sub="+sub+"&msg="+msg+"&uid="+uid; 

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
				request.onreadystatechange = getinfo2;  
				request.open("GET",url,true);  
				request.send();  
			}  
			catch(e)  
			{  
				alert("Unable to connect to server");  
			} 
		}	
		function getinfo2()
		{  
			if(request.readyState==4)
			{  
				var val=request.responseText;  
			}  
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
		
		<h3>Compose Mail</h3>
		
		<%
			String recepient="";
			String sub="";
			String msg="";

			try
			{
				recepient = request.getParameter("sender");
				if(recepient==null)
				{
					recepient="";
				}
			}
			catch(Exception e)
			{	
				recepient="";
			}
		
			try
			{
				sub = request.getParameter("sub");
				if(sub==null)
				{
					sub="";
				}
			}
			catch(Exception e)
			{
				sub="";	
			}
		
			try
			{
				msg = request.getParameter("msg");
				if(msg==null)
				{
					msg="";
				}
			}
			catch(Exception e)
			{
				msg="";	
			}

			String uid = UUID.randomUUID().toString();
			uid = uid.substring(0,6);
		%>

		
		<form name="myform" id="comform" method="post" action="sendmessage" enctype="multipart/form-data">
		<table>
			<tr><td></td><td><input type="hidden" name="uid" value="<%=uid%>"></input></td></tr>
			<tr><td>To</td><td><input type="email" name="to" value="<%=recepient%>" onfocusout="sendinfo2()"></input></td></tr>
			<tr><td>Subject</td><td><input type="text" name="sub" value="<%=sub%>" onfocusout="sendinfo2()"></input></td></tr>
			<tr><td>Message</td><td><textarea name="msg" cols="50" rows="5" onfocusout="sendinfo2()"><%=msg%></textarea></td></tr>
			<tr><td><br></td><td></td></tr>
		
			<%-- <tr><td></td><td><input type="submit" onclick="return sendinfo1()" value="Send Message"></input></td></tr> --%>
			<tr><td></td><td><input type="submit" onclick="return sendinfo1()" value="Send Message"></input></td></tr>
			<tr><td></td><td><br></td></tr>	
			<tr><td>Attachment</td><td><input type="file" name="image" id="imageupload" multiple></input></td></tr>
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
