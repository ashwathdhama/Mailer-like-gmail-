class abc extends Thread
{
	public void run()
	{
		for(int i=1 ; i<=10 ; i++)
		{
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

class xyz implements Runnable
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

class thread1
{
	public static void main(String args[])
	{
		abc aa = new abc();
		aa.start();

		xyz xx = new xyz();
		Thread th = new Thread(xx);
		th.start();
	}
}
