<%
	if(session!=null)
	{
		session.removeAttribute("logn");
		session.invalidate();
		response.sendRedirect("index.html");
	}
%>