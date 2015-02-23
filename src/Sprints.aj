import java.util.*;
import java.text.*;


public aspect Sprints {

	after(easybacklog obj): target(obj) && call(void createSprints())
	{
		easySprints t = new easySprints();
		Scanner in = new Scanner(System.in);

		System.out.println("Please enter sprint details");
		System.out.println("--------------------------");
				
		 System.out.print("Sprint No: ");
		 t.setSprintNo(in.nextLine());
		
		 System.out.print("Sprint Start Date: ");
		 try
		 {
			Date date = new SimpleDateFormat("dd-MMM-yy").parse(in.nextLine());
			t.setSprintStartDate(date);
		 }
		 catch(Exception e)
		 {
			System.out.println("Enter a valid task start date");
		 }
		
		 
		 System.out.print("Duration: ");
		 t.setDuration(in.nextLine());
		 
		 System.out.print("Expected Team Velocity: ");
		 t.setExpTeamVelocity(in.nextLine());
		 
		 System.out.println("Sprint Status: ");
		 System.out.println("1.Accepted");
		 System.out.println("2.Completed");
		 System.out.println("3.In Progress");
		 System.out.print("Enter your option: ");
		
		 t.setSprintStatus(in.nextLine());
		 
		 System.out.print("Enter User Story IDs for this sprint: ");
		 t.setStories(in.nextLine());
		  
		 obj.setSprints(t);
		 System.out.println("Sprint added successfully!!");
		 
		 String status = "N";
		 System.out.print("Do you want to add another Sprint? Y/N");
		 status = in.next();
		 if((status.contentEquals("Y")) || (status.contentEquals("y")))
		 {
			 obj.createSprints();
		 }
	}

	after(easybacklog obj): target(obj) && call(void trackSprints())
	{
		System.out.println("Sprints details are :");
		System.out.println("-----------------------" );

		Iterator<easySprints> itr = obj.getSprints().iterator(); 
		while(itr.hasNext())
		{			
			easySprints t = (easySprints)itr.next();
			
			System.out.println("Sprint Number				: " + t.getSprintNo());
			System.out.println("Sprint Start Date			: " + t.getSprintStartDate());
			System.out.println("Duration					: " + t.getDuration());
			System.out.println("Expected Team Velocity		: " + t.getExpTeamVelocity());
			System.out.println("Sprint Status				: " + t.getSprintStatus());
			System.out.println("Story IDs for this sprint	: " + t.getStories());
			System.out.println("***********************************************");
		}
	}
	
	after(easybacklog obj): target(obj) && call(void getSprintStatus())
	{	
		Iterator<easySprints> itr = obj.getSprints().iterator(); 
		while(itr.hasNext())
		{			
			easySprints t = (easySprints)itr.next();
			System.out.println("The status for Sprint No. " +  t.getSprintNo() + " is " + t.getSprintStatus());
			System.out.println("--------------------------------------------------" );
		}
	}

}