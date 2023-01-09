import java.io.*;
import java.util.*;
import java.text.*;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;
import java.sql.*;
import career.connection.*;

@MultipartConfig(
	fileSizeThreshold = 1024 * 1024 * 10, 		// 10 MB
	maxFileSize = 1024 * 1024 * 50, 		// 50 MB
	maxRequestSize = 1024 * 1024 * 100 		// 100 MB
)

public class sendmessage extends HttpServlet 
{
	private static final String SAVE_DIR = "attachments";

	private String extractFileName(Part part) 
	{
        	String contentDisp = part.getHeader("content-disposition");
        	String[] items = contentDisp.split(";");
        	for (String s : items) 
		{
            		if (s.trim().startsWith("filename")) 
			{
                		return s.substring(s.indexOf("=") + 2, s.length()-1);
            		}
        	}
        	return "";
    	}
	
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String un = (String)request.getSession().getAttribute("logn");
	
		String to = request.getParameter("to");
		String sub = request.getParameter("sub");	
		String msg = request.getParameter("msg");
		String uid = request.getParameter("uid");
	
		DateFormat dateFormat = new SimpleDateFormat("dd-MMM-yyyy HH-mm-ss");
		java.util.Date date = new java.util.Date();
		String dt = dateFormat.format(date).toString();
	
		String ruid = UUID.randomUUID().toString();
		ruid = ruid.substring(0,6);

        	try
		{
			Connection con = dao.createconnection();
			PreparedStatement ps1 = con.prepareStatement("select * from mailsender_signup where login_name='"+to+"'");
			ResultSet rs = ps1.executeQuery();
			if(rs.next())
			{
				StringBuffer sb = new StringBuffer("");
				String appPath = request.getServletContext().getRealPath("")+ File.separator + "attachments" + File.separator + ruid;
				String basepath = appPath;

				if (!(new File(basepath)).exists())
				{
					(new File(basepath)).mkdir();// creates the directory if it does not exist        
				}
					
				List<Part> parts = (List<Part>) request.getParts();
        			for (Part part : parts) 
				{
					String filename = extractFileName(part);
					sb.append(filename+",");
            				InputStream is = null;
					OutputStream os = null;

					try
					{
						File outputfilepath = new File(basepath+File.separator+filename);
						is = part.getInputStream();
						os = new FileOutputStream(outputfilepath);
						int read=0;
						final byte bytes[] = new byte[1024];
						while ((read = is.read(bytes)) != -1) 
						{
							os.write(bytes, 0, read);
						}
					}
					catch (Exception ex) 
					{
						filename = null;
					} 
					finally 
					{
						if (os != null) 
						{
							os.close();
						}
						if (is != null) 
						{
							is.close();
						}
					}
        			}

				String files = "no files";
				if(sb==null)
				{
					files = "no files";
				}
				else
				{
					files = sb.toString();
					files = files.substring(4,files.length()-1);	
				}
        
				PreparedStatement ps2 = con.prepareStatement("insert into mailsender_inbox values(?,?,?,?,?,?,?,?,?,?,?,?)");
				PreparedStatement ps3 = con.prepareStatement("insert into mailsender_sentmails values(?,?,?,?,?,?,?,?,?,?,?,?)");
			
				ps2.setString(1,un);
				ps2.setString(2,to);
				ps2.setString(3,sub);
				ps2.setString(4,msg);
				ps2.setString(5,dt);
				ps2.setString(6,"false");
				ps2.setString(7,"false");
				ps2.setString(8,uid);
				ps2.setString(9,"no");
				ps2.setString(10,files);
				ps2.setString(11,ruid);
				ps2.setString(12,"no message");
			
				ps3.setString(1,un);
				ps3.setString(2,to);
				ps3.setString(3,sub);
				ps3.setString(4,msg);
				ps3.setString(5,dt);
				ps3.setString(6,"false");
				ps3.setString(7,"false");
				ps3.setString(8,uid);
				ps3.setString(9,"no");
				ps3.setString(10,files);
				ps3.setString(11,ruid);
				ps3.setString(12,"no message");

				int z1 = ps2.executeUpdate();
				int z2 = ps3.executeUpdate();
				if(z1>0 && z2>0)
				{
					PreparedStatement ps4 = con.prepareStatement("delete from mailsender_draft where uuid=? and draftmaker=?");
					ps4.setString(1,uid);
					ps4.setString(2,un);
					ps4.executeUpdate();
					response.sendRedirect("response.jsp?response=1");
				}
				else
				{
					response.sendRedirect("response.jsp?response=2");
				}
			}
			else
			{
				response.sendRedirect("response.jsp?response=3");
			}
			con.close();
		}
		catch(Exception e)
		{
			System.out.println("sendmessage.jsp "+e);
		}
	}
}