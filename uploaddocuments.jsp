<%@ page import="java.io.*" %>
<%@ page import="com.oreilly.servlet.multipart.MultipartParser" %>
<%@ page import="com.oreilly.servlet.multipart.Part" %>
<%@ page import="com.oreilly.servlet.multipart.FilePart" %>

<html>

<%
	String un = (String)session.getAttribute("loginid");
	String fileSavePath = getServletContext().getRealPath("/") + File.separator + "documents/"+un; 
		
	if (!(new File(fileSavePath)).exists())
	{
		(new File(fileSavePath)).mkdir();// creates the directory if it does not exist        
	}

	String resp="";
	try
	{
		MultipartParser parser = new MultipartParser(request, 1024 * 1024 * 15);  /* file limit size of 15GB*/
		Part _part;
			
		int i=1;
		while((_part = parser.readNextPart()) != null)
		{
			if (_part.isFile())
			{
        			FilePart fPart = (FilePart) _part;  	
        			String name = fPart.getFileName(); 	
        			if (name != null)
				{
        				fPart.writeTo(new File(fileSavePath+"/"));
        			}

        		}
        	}
        }
	catch(java.io.IOException ioe)
	{
       		System.out.println(ioe);
        }
	response.sendRedirect("uploaddoc.jsp");
%>

