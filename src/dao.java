package career.connection;
 
import java.sql.*;

public class dao
{
	public static Connection createconnection()
	{
		Connection con=null;
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","career");
		}
		catch(Exception e)
		{
		}
		return con;
	}
}