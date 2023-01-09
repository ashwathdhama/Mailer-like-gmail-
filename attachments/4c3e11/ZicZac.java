//Zic - Zac Array ka use zab kiya zata hai zab har row ki colunm size alag-2 hota hai

import java.util.Scanner;

class ZicZac
{
	public static void main(String args[])
	{
		Scanner sc = new Scanner(System.in);

		System.out.print("Enter Total Names = ");
		int row = sc.nextInt();

		int a[][] = new int[row][];

		for(int i=0 ; i<row ; i++)
		{
			System.out.print("Enter Size of "+(i+1) + " Name = ");
			int col = sc.nextInt();
			a[i] = new int[col];
		}

		for(int i=0 ; i<row ; i++)
		{
			for(int k=0 ; k<a[i].length ; k++)
			{
				System.out.print(a[i][k]);
			}
			System.out.println();
		}
	}
}
