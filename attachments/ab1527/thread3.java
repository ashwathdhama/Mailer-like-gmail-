//suspend() and resume() dono pair me kaam karenge
//java me zis class me main() method hota hai woh class automatically thread hoti hai

class abc extends Thread
{
	public void run()
	{
		for(int i=1 ; i<=10 ; i++)
		{
			if(i==6)
			{
				System.out.println("abc has been suspended");
				suspend();
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

class thread3
{
	public static void main(String args[])
	{
		abc aa = new abc();
		xyz xx = new xyz();
		aa.start();
		xx.start();
		
		for(int i=1 ; i<=30 ; i++)
		{
			if(i==20)
			{
				System.out.println("abc is going to resume");
				aa.resume();
			}

			System.out.println("main = " + i);
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