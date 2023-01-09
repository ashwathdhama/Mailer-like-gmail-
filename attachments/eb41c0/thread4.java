//getname() and setname()

class abc extends Thread
{
	public void run()
	{
		for(int i=1 ; i<=10 ; i++)
		{
			System.out.println(getName() + " = " + i);
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

class thread4
{
	public static void main(String args[])
	{
		abc a1 = new abc();
		abc a2 = new abc();
		abc a3 = new abc();

		a1.setName("neha");
		a2.setName("monu");
		a3.setName("amit");
	
		a1.start();
		a2.start();
		a3.start();
	}
}