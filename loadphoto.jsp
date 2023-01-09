<%@ page import="java.io.*" %>
<%@ page import="com.oreilly.servlet.multipart.MultipartParser" %>
<%@ page import="com.oreilly.servlet.multipart.Part" %>
<%@ page import="com.oreilly.servlet.multipart.FilePart" %>

<html>

<%
	String un = (String)session.getAttribute("logn");
	String n = un.substring(0,un.indexOf(".com"));
	String fileSavePath = getServletContext().getRealPath("/") + File.separator + "photos/"; 
		
	if (!(new File(fileSavePath)).exists())
	{
		(new File(fileSavePath)).mkdir();// creates the directory if it does not exist        
	}

	String resp="";
	try
	{
		MultipartParser parser = new MultipartParser(request, 1024 * 1024 * 5);  /* file limit size of 1GB*/
		Part _part;
			
		int i=1;
		while((_part = parser.readNextPart()) != null)
		{
		if (_part.isFile())
		{
        		FilePart fPart = (FilePart) _part;  // get some info about the file
        		String name = fPart.getFileName(); //n+".jpg";
        		if (name != null)
			{
        		long filesize = fPart.writeTo(new File(fileSavePath+"/"+n+".jpg"));
        		resp = "Uploaded File Size " + filesize;
			}
			else
			{
        		resp = "<br>Sorry! Photo not uploaded";
        		}
        	}
        	}// end while 
        }
	catch(java.io.IOException ioe)
	{
       		System.out.println(ioe);
        }

	response.sendRedirect("settings.jsp?status="+resp);
%>

