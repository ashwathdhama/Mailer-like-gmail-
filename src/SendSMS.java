package career.connection;

import java.io.*;
import java.net.*;
import javax.net.ssl.HttpsURLConnection;

public class SendSMS
{
	public static void sendSMS(String message,String number)
	{
		try
		{
			String apiKey = "Hb3sBTX4ZhucfSGgKO120kPxrJNyivn7ode9qQDVwUjztpaIRM5XM0whdfjniArDauPbEO8CRGvmes7I";
			String sendId = "FSTSMS";
			message = URLEncoder.encode(message,"UTF-8");
			String language = "English";
			String route="p";
	
			String myurl = "https://www.fast2sms.com/dev/bulk?authorization="+apiKey+"&sender_id="+sendId+"&message="+message+"&language="+language+"&route="+route+"&numbers="+number;
		
			URL url = new URL(myurl);
			HttpsURLConnection con = (HttpsURLConnection)url.openConnection();
			
			con.setRequestMethod("GET");
			con.setRequestProperty("User-Agent","Mozilla/5.0");
			con.setRequestProperty("cache-control","no-cache");

			int code = con.getResponseCode(); 
		
			System.out.println("Response Code = " + code);

			StringBuffer response = new StringBuffer();

			BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));		
			
			while(true)
			{
				String line = br.readLine();
				if(line==null)
				{
					break;
				}
				response.append(line);
			}

			//System.out.println(response);
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

	//public static void main(String args[])
	//{
		//SendSMS.sendSMS("Reminder:- please come and check your project Career Computer","9997744879");	
	//}
}
