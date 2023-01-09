class Table
{  
	public void printTable(int n)
	{  
		synchronized(this)
		{
	
   			for(int i=1 ; i<=10 ; i++)
			{
				System.out.println(n+"*"+i+"="+n*i);
				try
				{
					Thread.sleep(500);
				}
				catch(InterruptedException e)
				{
				}
			}
		}
 	} 
}  
  
class abc extends Thread
{  
	Table t;  

	public abc(Table t)
	{  
		this.t=t;  
	}
  
	public void run()
	{  
		t.printTable(5);  
	}  
}
  
class xyz extends Thread
{  
	Table t;  

	public xyz(Table t)
	{  
		this.t=t;  
	}
  
	public void run()
	{  
		t.printTable(3);  
	}  
}  
  
class synchronized_block
{  
	public static void main(String args[])
	{  
		Table t = new Table();	//only one object 
 
		abc aa = new abc(t);
		xyz xx = new xyz(t);
 
		aa.start();  
		xx.start();  
	}  
}  