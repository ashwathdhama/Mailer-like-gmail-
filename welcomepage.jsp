<!Doctype html>

<html>
<head>
	<link rel="stylesheet" type="text/css" href="style.css" />
	<title>MailSender</title>
</head>

<body>
<div id="container">

	<div id="header">
        	<h1>Mail<span class="off">Sender.com</span></h1>
        </div>   
        
        <div id="menu">
        	<ul>
            	<li class="menuitem"><a href="#">Home</a></li>
                <li class="menuitem"><a href="signin.jsp">SignIn</a></li>
                <li class="menuitem"><a href="signup.jsp">SignUp</a></li>
                <li class="menuitem"><a href="about.html">About</a></li>
                </ul>
        </div>
        
        <div id="leftmenu">

        	<div id="leftmenu_top"></div>
		<div id="leftmenu_main">    
	        	<h3>Links</h3>
             		<ul>
                	    <li><a href="https:\\www.facebook.com">FaceBook</a></li>
                	    <li><a href="https:\\www.linkedin.com">LinkedIn</a></li>
			</ul>
		</div>
        	<div id="leftmenu_bottom"></div>
        </div>
        
	<div id="content">
        	<div id="content_top"></div>
        	<div id="content_main">
		
		<%
			String logn = request.getParameter("logn");
		%>

		<h2>Welcome, <%=logn %></h2>
		<br>

		<%
			session.setAttribute("logn",logn);
		%>

		<a href="profile.jsp">Continue with MailSender</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="logout.jsp">Goto Home Page</a>

		</div>
		<div id="content_bottom"></div>
		<div id="footer"></div>
      	</div>

</div>
</body>
</html>
