import java.util.*;
import java.text.*;

aspect kanbanTasks {
	
	after(Board obj): target(obj) && call(void createTask())
	{
		KanbanTask t = new KanbanTask();
		System.out.println("Please enter task details");
		System.out.println("--------------------------");
		Scanner in = new Scanner(System.in);
		
		 System.out.print("Task Title: ");
		 t.setTitle(in.nextLine());
		
		 System.out.print("Task ID: ");
		 t.setTaskID(in.nextLine());
		 
		 System.out.print("Task Description: ");
		 t.setDescription(in.nextLine());
		 
		 System.out.print("Task Priority: ");
		 t.setPriority(in.nextLine());
		 
		 System.out.print("Task Assignee: ");
		 t.setAsignee(in.nextLine());

		System.out.print("Task Deadline: ");
		 try
		 {
			Date date1 = new SimpleDateFormat("dd-MMM-yy").parse(in.nextLine());
			t.setDeadline((java.sql.Date) date1);
		 }
		 catch(Exception e)
		 {
			System.out.println("Enter a valid task finish date");
		 }
		 
		 System.out.println("Enter current status:");
		 	System.out.println("1.Backlog");
			System.out.println("2.Requested");
			System.out.println("3.In Progress");
			System.out.println("4.Done");
			System.out.println("5.Archive");
			System.out.print("Enter your option: ");
			int option = in.nextInt();
			//System.out.println(m.getOption());
			switch(option)
			{
				case 1:	t.setColumn("Backlog");
						break;
				case 2:	t.setColumn("Requested");
						break;
				case 3:	t.setColumn("In Progress");
						break;
				case 4:	t.setColumn("Done");
						break;
				case 5:	t.setColumn("Archive");
						break;
				
			}
		 
		 obj.setKanbanTask(t);
		 System.out.println("Tasks added to your board successfully!!");
		 
		 
		 String status = "N";
		 System.out.print("Do you want to add another Task? Y/N");
		 status = in.next();
		// System.out.print("Ia m out here" + status);

		 if((status.contentEquals("Y")) || (status.contentEquals("y")))
		 {
			 //System.out.print("Ia m in here" + status);
			 obj.createTask();
		 }
	}

	after(Board obj): target(obj) && call(void trackTask())
	{
		System.out.println("Task details are :");
		System.out.println("-------------------------" );

		Iterator<KanbanTask> itr = obj.getKanbanTask().iterator(); 
		while(itr.hasNext())
		{			
			KanbanTask t = (KanbanTask)itr.next();
			
			System.out.println("Kanban Task ID			: " + t.getTaskID());
			System.out.println("Kanban Task Title			: " + t.getTitle());
			System.out.println("Kanban Task Description			: " + t.getDescription());
			System.out.println("Kanban Task Priority			: " + t.getPriority());
			System.out.println("Kanban Task Assignee			: " + t.getAsignee());
			System.out.println("Kanban Task Column			: " + t.getColumn());
			System.out.println("***********************************************");

			
		}
	}
	
	after(Board obj): target(obj) && call(void getTaskStatus())
	{
		
		Iterator<KanbanTask> itr = obj.getKanbanTask().iterator(); 
		while(itr.hasNext())
		{			
			KanbanTask t = (KanbanTask)itr.next();
			System.out.println("The Task status for " + t.getTitle() + " is : " + t.getColumn());
			System.out.println("--------------------------------------------------" );

			
		}
	}
 }
