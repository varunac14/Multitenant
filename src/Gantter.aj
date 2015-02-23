import java.util.*;
import java.text.*;

public aspect Gantter {

	private ProjectManagementTool Main.pm = new gantterProject(); 
	after(Main m): target(m) && call(void print())
	{
        System.out.println( "Welcome to Gantter" ) ;

	}	
	
	before(ProjectManagementTool obj): target(obj) && call(void add())
	{	
		gantterProject p = new gantterProject();
		Scanner in = new Scanner(System.in);
		System.out.println("Please enter your project details");
		System.out.println("----------------------------------");
		
		System.out.print("Project Name: ");
		p.setProjectName(in.nextLine());
		
		System.out.print("Project Start Date: ");
		try
		{
			Date date = new SimpleDateFormat("dd-MMM-yy").parse(in.nextLine());
			p.setStartDate(date);
		}
		catch(Exception e)
		{
			System.out.println("Enter a valid project start date");
		}
		
		System.out.print("Project End Date: ");
		
		try
		{
			Date date1 = new SimpleDateFormat("dd-MMM-yy").parse(in.nextLine());
			p.setFinishDate(date1);			
		}
		catch(Exception e)
		{
			System.out.println("Enter a valid project finish date");
		}
		
		System.out.print("Enter the Calendar Type: ");
		p.setCalendar(in.nextLine());
		
		obj.setProject(p);		
		
		p.createTask();
		p.createResource();
		p.createRisk();
		p.createCalendar();
	}
	
	after(ProjectManagementTool obj): target(obj) && call(void track())
	{
		System.out.println("Gantter project details are :");
		System.out.println("--------------------------------------------");
		Iterator<ProjectManagementTool> itr = obj.getProject().iterator(); 
		while(itr.hasNext())
		{			
			gantterProject p = (gantterProject)itr.next();
			System.out.println("Project Name : " + p.getProjectName() );
			System.out.println("Start Date   : " + p.getStartDate());
			System.out.println("Finish Date  : " + p.getFinishDate());
			System.out.println("Duration  	 : " + p.getDuration());
			System.out.println("Calendar Type: " + p.getCalendar());
			
			p.trackTask();
			p.trackResource();
			p.trackRisk();
			p.trackCalendar();
			System.out.println("--------------------------------------------------" );
			
		}
	}
	
	after(ProjectManagementTool obj): target(obj) && call(void status())
	{
		System.out.println("The Status in Gantter is calculated in terms of Percentage Complete" );
		System.out.println("Gantter task status:");
		ArrayList<ProjectManagementTool> pro = obj.getProject();
		Iterator<ProjectManagementTool> itr = pro.iterator(); 
		while(itr.hasNext())
		{			
			gantterProject p = (gantterProject)itr.next();
			p.getTaskStatus();
		}

	}
}
