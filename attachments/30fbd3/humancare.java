class hospital
{
	synchronized public void doctor(String patient)
	{
		System.out.print("["+patient);
			try
			{
			Thread.sleep(5000);
			}
			catch(InterruptedException e)
			{
			}
		System.out.print("]");
	}
}

class patient implements Runnable
{
	String name;
	hospital hos;
	Thread th;  

	public patient(String n,hospital h)
	{
		name = n;
		hos = h;
		th = new Thread(this);
		th.start();
	}	

	public void run()
	{
		hos.doctor(name);
	}
}

class humancare
{
	public static void main(String args[])
	{
		hospital hos = new hospital();

		patient p1 = new patient("amit",hos);
		patient p2 = new patient("neha",hos);
		patient p3 = new patient("sonu",hos);
		patient p4 = new patient("anuj",hos);
		patient p5 = new patient("monu",hos);
 	}
}