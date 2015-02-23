import java.util.*;
import java.text.*;

aspect GantterTask {
	after(gantterProject obj): target(obj) && call(void createTask())
	{
		Task t = new Task();
		System.out.println("Please enter task details");
		System.out.println("--------------------------");
		Scanner in = new Scanner(System.in);
		
		 System.out.print("Task Name: ");
		 t.setTaskName(in.nextLine());
		
		 System.out.print("Task Start Date: ");
		 try
		 {
			Date date = new SimpleDateFormat("dd-MMM-yy").parse(in.nextLine());
			t.setStartDate(date);
		 }
		 catch(Exception e)
		 {
			System.out.println("Enter a valid task start date");
		 }
			
		 System.out.print("Task Finish Date: ");
		 try
		 {
			Date date1 = new SimpleDateFormat("dd-MMM-yy").parse(in.nextLine());
			t.setEndDate(date1);
		 }
		 catch(Exception e)
		 {
			System.out.println("Enter a valid task finish date");
		 }
		
		 System.out.print("Predecessors: ");
		 t.setPredecessors(in.nextLine());
		
		 System.out.print("Resource: ");
		 t.setResources(in.nextLine());
		 
		 obj.setTasks(t);
		 System.out.println("Gantter task added successfully!!");
		 
		 
		 String status = "N";
		 System.out.print("Do you want to add another Task? Y/N");
		 status = in.next();
		 if((status.contentEquals("Y")) || (status.contentEquals("y")))
		 {
			 obj.createTask();
		 }
	}

	after(gantterProject obj): target(obj) && call(void trackTask())
	{
		System.out.println("Gantter task details are :");
		System.out.println("-------------------------" );

		Iterator<Task> itr = obj.getTasks().iterator(); 
		while(itr.hasNext())
		{			
			Task t = (Task)itr.next();
			System.out.println("Task Name 			: " + t.getTaskName());
			System.out.println("Task Duration 		: " + t.getDuration());
			System.out.println("Task Start Date 	: " + t.getStartDate());
			System.out.println("Task End Date 		: " + t.getEndDate());
			System.out.println("Predecessors 		: " + t.getPredecessors());
			System.out.println("Resources 			: " + t.getResources());
			System.out.println("***********************************************");

			//System.out.println("Percentage Complete : " + t.getPercentComplete());
		}
	}
	
	after(gantterProject obj): target(obj) && call(void getTaskStatus())
	{
		
		Iterator<Task> itr = obj.getTasks().iterator(); 
		while(itr.hasNext())
		{			
			Task t = (Task)itr.next();
			Date today = new Date();
			float percentageCom;
			if(today.before(t.getStartDate()))
			{
				percentageCom = 0;
			}
			else if(today.after(t.getEndDate()))
			{
				percentageCom = 100;
			}
			else
			{
				long diff = today.getTime()- t.getStartDate().getTime();
				float period = (int)diff/(1000*60*60*24);
				period++;	
				percentageCom = (period/t.getDuration()) * 100 ;
			}
			System.out.println("\t Task Status for " + t.getTaskName()+ " is " + percentageCom +"%" );
			//System.out.println("Percentage Complete : " + getPercentComplete());
			System.out.println("--------------------------------------------------" );

		}
	}
 }
