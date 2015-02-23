import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.Scanner;

public aspect Backlog {

	private ProjectManagementTool Main.pm = new easybacklog(); 

	after(Main m): target(m) && call(void print())
	{
        System.out.println( "Welcome to EasyBacklog" ) ;

	}		
	
	before(ProjectManagementTool obj): target(obj) && call(void add())
	{	
		easybacklog b = new easybacklog();
		Scanner in = new Scanner(System.in);
		System.out.println("Please enter your backlog details");
		System.out.println("----------------------------------");
		
		System.out.print("Backlog Name: ");
		b.setBacklogName(in.nextLine());
		
		System.out.print("Total Backlog Points: ");
		b.setTotalPoints(in.nextInt());
		
		obj.setProject(b);		
		b.createTheme();
		b.createSprints();
		
	}
	
	after(ProjectManagementTool obj): target(obj) && call(void track())
	{
		System.out.println("Backlog details are :");
		System.out.println("--------------------------------------------");
		Iterator<ProjectManagementTool> itr = obj.getProject().iterator(); 
		while(itr.hasNext())
		{			
			easybacklog b = (easybacklog)itr.next();
			System.out.println("Backlog Name : " + b.getBacklogName() );
			System.out.println("Total backlog Points : " + b.getTotalPoints() );

			b.trackTheme();
			b.trackSprints();
			System.out.println("--------------------------------------------------" );
			
		}
	}
	
	after(ProjectManagementTool obj): target(obj) && call(void status())
	{
		
		ArrayList<ProjectManagementTool> pro = obj.getProject();
		Iterator<ProjectManagementTool> itr = pro.iterator(); 
	
		System.out.println("The Status in EasyBacklog is calculated in terms of Burndown Velocity" );
		System.out.println("Expected Burndown Velocity is defaulted to : 70 " );
		System.out.println("Actual Burndown Velocity is: " );
	
		while(itr.hasNext())
		{			
			easybacklog b = (easybacklog)itr.next();
			b.getThemeStatus();
			b.getSprintStatus();
		}

	}
}
