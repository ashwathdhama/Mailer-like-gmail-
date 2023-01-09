//getPriority() and setPriority()

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

class thread5
{
	public static void main(String args[])
	{
		abc a1 = new abc();
		abc a2 = new abc();
		abc a3 = new abc();

		a1.setName("neha");
		a2.setName("monu");
		a3.setName("amit");

		System.out.println(a1.getPriority());	//5
		System.out.println(a2.getPriority());	//5
		System.out.println(a3.getPriority());	//5

		a1.setPriority(5);
		a2.setPriority(1);
		a3.setPriority(10);

		System.out.println(a1.getPriority());	//5
		System.out.println(a2.getPriority());	//1
		System.out.println(a3.getPriority());	//10
	
		a1.start();
		a2.start();
		a3.start();
	}
}