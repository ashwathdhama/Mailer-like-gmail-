import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

public class sendattachment extends HttpServlet 
{
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException 
	{
		String un = (String)session.getAttribute("logn");
	
		String to = request.getParameter("to");
		String sub = request.getParameter("sub");	
		String msg = request.getParameter("msg");
		String uid = request.getParameter("uid");
		Part part = request.getPart("image");
		String partname = part.getSumittedFileName();
		System.out.println(partname);

		DateFormat dateFormat = new SimpleDateFormat("dd-MMM-yyyy HH-mm-ss");
		java.util.Date date = new java.util.Date();
		String dt = dateFormat.format(date).toString();

		/*try
		{
			Connection con = dao.createconnection();
			PreparedStatement ps1 = con.prepareStatement("select * from mailsender_signup where login_name='"+to+"'");
			ResultSet rs = ps1.executeQuery();
			if(rs.next())
			{
				PreparedStatement ps2 = con.prepareStatement("insert into mailsender_inbox values(?,?,?,?,?,?,?,?,?)");
				PreparedStatement ps3 = con.prepareStatement("insert into mailsender_sentmails values(?,?,?,?,?,?,?,?,?)");
			
				ps2.setString(1,un);
				ps2.setString(2,to);
				ps2.setString(3,sub);
				ps2.setString(4,msg);
				ps2.setString(5,dt);
				ps2.setString(6,"false");
				ps2.setString(7,"false");
				ps2.setString(8,uid);
				ps2.setString(9,"no");
			
				ps3.setString(1,un);
				ps3.setString(2,to);
				ps3.setString(3,sub);
				ps3.setString(4,msg);
				ps3.setString(5,dt);
				ps3.setString(6,"false");
				ps3.setString(7,"false");
				ps3.setString(8,uid);
				ps3.setString(9,"no");

				//int z1 = ps2.executeUpdate();
				//int z2 = ps3.executeUpdate();
				if(z1>0 && z2>0)
				{
					PreparedStatement ps4 = con.prepareStatement("delete from mailsender_draft where uuid=? and draftmaker=?");
					ps4.setString(1,uid);
					ps4.setString(2,un);
					ps4.executeUpdate();
					out.print("done");
				}
				else
				{
					out.print("notdone");
				}
			}
			else
			{
				out.println("notfound");
			}
			con.close();
		}
		catch(Exception e)
		{
			System.out.println("sendmessage.jsp "+e);
		}*/
	}
}