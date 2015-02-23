import java.util.*;

aspect UserStories
{
	after(easyThemes obj): target(obj) && call(void createStories())
	{
		stories t = new stories();
		Scanner in = new Scanner(System.in);

		System.out.println("Please enter story details");
		System.out.println("--------------------------");
				
		 System.out.print("Story ID: ");
		 t.setStoryID(in.nextLine());
		
		 System.out.print("User Story: ");
		 t.setUserStory(in.nextLine());
		 
		 System.out.print("Acceptance Criteria: ");
		 t.setAcceptanceCriteria(in.nextLine());
		 
		 System.out.print("Comments: ");
		 t.setComments(in.nextLine());
		 
		 System.out.print("Sprint: ");
		 t.setSprint(in.nextLine());

		 System.out.print("Story Points: ");
		 t.setStoryPoints(in.nextLine());
		  
		 obj.setStories(t);
		 System.out.println("Story added successfully!!");
		 
		 String status = "N";
		 System.out.print("Do you want to add another Story? Y/N");
		 status = in.next();
		 if((status.contentEquals("Y")) || (status.contentEquals("y")))
		 {
			 obj.createStories();
		 }
	}

	after(easyThemes obj): target(obj) && call(void trackStories())
	{
		System.out.println("Story details are :");
		System.out.println("------------------" );

		Iterator<stories> itr = obj.getStories().iterator(); 
		while(itr.hasNext())
		{			
			stories t = (stories)itr.next();			
			System.out.println("Story ID				: " + t.getStoryID());
			System.out.println("User Story				: " + t.getUserStory());
			System.out.println("Acceptance	Criteria	: " + t.getAcceptanceCriteria());
			System.out.println("Comments				: " + t.getComments());
			System.out.println("Sprints					: " + t.getSprint());
			System.out.println("Story Points			: " + t.getStoryPoints());
			System.out.println("***********************************************");
		}
	}
	
	after(easyThemes obj): target(obj) && call(void getStoriesStatus())
	{	
		Iterator<stories> itr = obj.getStories().iterator(); 
		while(itr.hasNext())
		{			
			stories t = (stories)itr.next();
			System.out.println("The status for story ID " +  t.getStoryID() + " is " + t.getStoryPoints());
			System.out.println("--------------------------------------------------" );
		}
	}
}