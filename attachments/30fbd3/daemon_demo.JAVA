class daemon_demo extends Thread
{
   	public void run()
	{  
	  	if(Thread.currentThread().isDaemon())
		{ 
	      		System.out.println("Daemon thread executing");  
	  	}  
	  	else
		{  
	      		System.out.println("user(normal) thread executing");  
          	}  
   	}
  
   	public static void main(String[] args)
	{  
		daemon_demo t1 = new daemon_demo();	  
		daemon_demo t2 = new daemon_demo();	  
			 
	 	t1.setDaemon(true);
		     
        	t1.start(); 
        	t2.start();  
   	} 
}
