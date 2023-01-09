//stop() method

class abc extends Thread
{
	public void run()
	{
		for(int i=1 ; i<=10 ; i++)
		{
			if(i==6)
			{
				System.out.println("sorry!");
				stop();
			}
		
			System.out.println("abc = " + i);
			try
			{
				Thread.sleep(1000);
			}
			catch(InterruptedException ie)
			{
			}
		}
	}
}

class xyz extends Thread
{
	public void run()
	{
		for(int i=1 ; i<=10 ; i++)
		{
			System.out.println("xyz = " + i);
			try
			{
				Thread.sleep(1000);
			}
			catch(InterruptedException ie)
			{
			}
		}
	}
}

class thread2
{
	public static void main(String args[])
	{
		abc aa = new abc();
		xyz xx = new xyz();
		aa.start();
		xx.start();
	}
}