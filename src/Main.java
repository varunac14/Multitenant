import java.util.Scanner;

public class Main 
{
	public void print()
	{
		System.out.println(" ***** Multitenancy Application ***** ");
	}

	public static void main(String[] args){
		ProjectManagementTool pm = new ProjectManagementTool();
		Scanner in = new Scanner(System.in);
		int option = 0;
		
		new Main().print();
		while(option!=4)
		{
			System.out.println("Please choose one from the following options:");
			System.out.println("1.Add New Project");
			System.out.println("2.Get Project Status");
			System.out.println("3.Track Project Details");
			System.out.println("4.Exit");
			System.out.print("Enter your option: ");
			option = in.nextInt();
			//System.out.println(m.getOption());
			switch(option)
			{
				case 1:	pm.add();
						break;
				case 2:pm.status();
						break;
				case 3:pm.track();
						break;
				case 4: System.out.println(" *** THANK YOU **** ");
						break;
			}
		}
	}
}

	