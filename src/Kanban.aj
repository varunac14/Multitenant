import java.util.*;

public aspect Kanban {

	private ProjectManagementTool Main.pm = new kanbanProject(); 

	after(Main m): target(m) && call(void print())
	{
        System.out.println( "Welcome to Kanban" ) ;

	}		
	
	before(ProjectManagementTool obj): target(obj) && call(void add())
	{	
		kanbanProject p = new kanbanProject();
		Scanner in = new Scanner(System.in);
		System.out.println("Please enter your project details");
		System.out.println("----------------------------------");
		
		System.out.print("Project Name: ");
		p.setProjectName(in.nextLine());
		
		
		obj.setProject(p);		
		
		p.createBoard();
		
	}
	
	after(ProjectManagementTool obj): target(obj) && call(void track())
	{
		System.out.println("Kanban project details are :");
		System.out.println("--------------------------------------------");
		Iterator<ProjectManagementTool> itr = obj.getProject().iterator(); 
		while(itr.hasNext())
		{			
			kanbanProject p = (kanbanProject)itr.next();
			System.out.println("Project Name : " + p.getProjectName() );
			
			
			p.trackBoard();
			System.out.println("--------------------------------------------------" );
			
		}
	}
	
	after(ProjectManagementTool obj): target(obj) && call(void status())
	{
		System.out.println("The Status of task in Kanban can either be Requested/In Progress/Completed/Archived " );

		System.out.println("kanban task status:");

		ArrayList<ProjectManagementTool> pro = obj.getProject();
		Iterator<ProjectManagementTool> itr = pro.iterator(); 
		while(itr.hasNext())
		{			
			kanbanProject p = (kanbanProject)itr.next();
			p.getBoardStatus();
		}

	}
}
