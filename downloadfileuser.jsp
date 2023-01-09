<%    
	String filename = request.getParameter("fn");

	String lid = request.getParameter("lid");

	String filepath = getServletContext().getRealPath("/") + java.io.File.separator + "attachments/"+lid+"/"; 
	
	response.setContentType("APPLICATION/OCTET-STREAM");   

	response.setHeader("Content-Disposition","attachment; filename=\"" + filename + "\"");   

	java.io.FileInputStream fileInputStream = new java.io.FileInputStream(filepath + filename);  

	int i;   
	while ((i=fileInputStream.read()) != -1) 
	{  
		out.write(i);   
	}   
	fileInputStream.close();   
%>
