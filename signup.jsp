<!Doctype html>

<html>
<head>
	<link rel="stylesheet" type="text/css" href="style.css" />
	<title>MailSender</title>

	<script>
		
		var request;
		function checkuser()
		{
			var cu = document.signupform.choose.value;
				
			if(cu.length==0)
			{
				alert("Error! Choose name can't leave blank");
				document.signupform.choose.focus();
				return false; 
			}
			else
			{
				var url = "checkchooseuser.jsp?chooseuser="+cu;	
			
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
				request.onreadystatechange = getInfo;  
				request.open("GET",url,true);  
				request.send();  
				}  
				catch(ex)  
				{  
					alert("Unable to connect to server");  
				}  
			}
		}
		
		function getInfo()
		{
			if(request.readyState==4)
			{  
				var val = request.responseText;
				document.getElementById('amit').innerHTML = val;
				
				if(document.getElementById('amit').innerText == "already in use")
				{
					document.signupform.choose.value="";
				}
			}  
		}

		function phonenumber()  
		{  
			var phoneno = /^\d{10}$/;  
  			if(document.signupform.mobile.value.match(phoneno))  
  			{  
      			}  
  			else  
  			{  
     				alert("Not a valid Mobile Number must contain 10 Digits"); 
				document.signupform.mobile.value="";
				document.signupform.mobile.focus();
     			}    		 
		}  

		function rat()
		{
			alert("Password length must be greater than 6 letters with atleast 1 numeric and lower case alphabet and upper case alphabet letter");
		}

		function cat(form)
		{
			var first = document.signupform.firstname.value;
			var last = document.signupform.lastname.value;
			var gender = document.signupform.gender.value;
			var country = document.signupform.country.value;
			var mobile = document.signupform.mobile.value;
			var email = document.signupform.email.value;
			var choose = document.signupform.loginname.value;
			var password = document.signupform.password.value;
			var cpassword = document.signupform.cpassword.value;
			
			if(choose.length==0)
			{
				alert("Error! LoginName name can't leave blank");
				document.signupform.loginname.focus();
				return false; 
			}
			else if(password.length==0)
			{
				alert("Error! Password can't leave blank");
				document.signupform.password.focus();
				return false; 
			}
			else if(cpassword.length==0)
			{
				alert("Error! Confirm Password can't leave blank");
				document.signupform.cpassword.focus();
				return false; 
			}

			else if(first.length==0)
			{
				alert("Error! First name can't leave blank");
				document.signupform.firstname.focus();
				return false; 
			}	
			else if(last.length==0)
			{
				alert("Error! Last name can't leave blank");
				document.signupform.lastname.focus();
				return false; 
			}
			else if(gender.length==0)
			{
				alert("Error! Gender can't leave blank");
				return false; 
			}
			else if(country.length==0)
			{
				alert("Error! Country can't leave blank");
				document.signupform.country.focus();
				return false; 
			}
			else if(mobile.length==0)
			{
				alert("Error! Mobile can't leave blank");
				document.signupform.mobile.focus();
				return false; 
			}
			else if(email.length==0)
			{
				alert("Error! Email can't leave blank");
				document.signupform.email.focus();
				return false; 
			}

			if(form.password.value != "" && form.password.value == form.cpassword.value)
			{
	      			if(form.password.value.length < 6)
				{
	        			alert("Error: Password must contain at least six characters!");
	        			form.password.focus();
	        			return false;
	      			}
	      			if(form.password.value == form.choose.value)
				{
	        			alert("Error: Password must be different from Choose Name!");
	        			form.password.focus();
        				return false;
      				}
      	
				re = /[0-9]/;
      				if(!re.test(form.password.value))
				{
        				alert("Error: password must contain at least one number (0-9)!");
       					form.password.focus();
        				return false;
      				}
      				re = /[a-z]/;
      				if(!re.test(form.password.value))
				{
        				alert("Error: password must contain at least one lowercase letter (a-z)!");
        				form.password.focus();
        				return false;
      				}
	      			re = /[A-Z]/;
	      			if(!re.test(form.password.value))
				{
	        			alert("Error: password must contain at least one uppercase letter (A-Z)!");
	        			form.password.focus();
	        			return false;
	      			}
    			}
			else
			{
      				alert("Error: Please check that you've entered and confirmed your password!");
      				form.password.focus();
      				return false;
    			}
			
			return true;						
		}

	</script>

	<style>
		.c1
		{
			text-decoration: none;
		}

		.cat
		{		
		height: 2em;
		cursor: pointer;
		background-color: blue;
		color: white;
		}           
		.rat
		{
    		background-color: transparent;
  		color: black;
		width: 80%;
		outline: none;
    		outline-style: none;
   		border-top: none;
    		border-left: none;
  		border-right: none;
    		border-bottom: solid black 1px;
    		padding: 3px 10px;
		}
	</style>
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
		
		<form name="signupform" action="register.jsp" onsubmit="return cat(this)">
		<table>
		<tr><td colspan="2"><font size="6%"><a style="color: red">Create  Account</a></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="index.html" class="c1" style="color: blue; font-size:13px">BACK</a></td></tr>
		<tr><td colspan="2"><hr width="100%"><br></td></tr>
		<tr><td><font size="4%"><p style="color: blue"><b>Login Details</b></p></font></td></tr>
		<tr><td>Choose Login Name</td><td><input type="text" class="rat" name="loginname"/></td><td><span id="lname"></span></td></tr>
		<tr><td>Choose Password</td><td><input type="password" class="rat" name="password"></td><td><span id="pstength"></span></td></tr>
		<tr><td>Confirm Password</td><td><input type="password" class="rat" name="cpassword"></td><td><span id="cpass"></span></td></tr>
		<tr><td><br><font size="4%"><p style="color: blue"><b>Personal Details</b></p></font></td></tr>
		<tr><td>First Name</td><td><input type="text" class="rat" name="firstname"/></td></tr>
		<tr><td>Last Name</td><td><input type="text" class="rat" name="lastname"/></td></tr>
		<tr></tr><tr></tr><tr></tr>
		<tr><td>Gender</td><td><input type="radio" name="gender" value="male">Male&nbsp;&nbsp;&nbsp;&nbsp;</input><input type="radio" name="gender" value="female">Female</input></td></tr>
		<tr></tr><tr></tr><tr></tr>
		<tr><td>Date of Birth</td><td>
		<select name="date">
		<%
			for(int i=1 ; i<=31 ; i++)
			{
			out.print("<option>"+i+"</option>");	
			}
		%>
		</select>
		<select name="month">
		<%
			for(int i=1 ; i<=12 ; i++)
			{
			out.print("<option>"+i+"</option>");	
			}
		%>
		</select>
		<select name="year">
		<%
			for(int i=1970 ; i<=2010 ; i++)
			{
			out.print("<option>"+i+"</option>");	
			}
		%>
		</select>
		<tr><td>Country</td><td><input type="text" class="rat" name="country"/></td></tr>
		<tr><td>Mobile</td><td><input type="text" class="rat" name="mobile" onchange="phonenumber()"/></td></tr>
		<tr><td>Current Email</td><td><input type="email" class="rat" name="email"/><br><br></td></tr>
		<tr><td></td><td><input type="submit" value="Register" class="cat" ></input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" class="cat" value="Reset"></input></td></tr>
		</table>
		</form>		
		
		</div>
		
		<div id="content_bottom"></div>
		<div id="footer"></div>
      	</div>

</div>
</body>
</html>
