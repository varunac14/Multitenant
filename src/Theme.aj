
import java.util.*;
import java.text.*;

aspect Theme {
	after(easybacklog obj): target(obj) && call(void createTheme())
	{
		easyThemes t = new easyThemes();
		System.out.println("Please enter theme details");
		System.out.println("--------------------------");
		Scanner in = new Scanner(System.in);
		
		 System.out.print("Theme Name: ");
		 t.setThemeName(in.nextLine());
		
		 System.out.print("Theme Code: ");
		 t.setThemeCode(in.nextLine());
		
		 obj.setThemes(t);
		 System.out.println("Theme  added successfully!!");
		 		 
		 String status = "N";
		 System.out.print("Do you want to add another Theme? Y/N");
		 status = in.next();
		 if((status.contentEquals("Y")) || (status.contentEquals("y")))
		 {
			 obj.createTheme();
		 }
		 
		 t.createStories();
	}

	after(easybacklog obj): target(obj) && call(void trackTheme())
	{
		System.out.println("Theme details are :");
		System.out.println("-------------------------" );

		Iterator<easyThemes> itr = obj.getThemes().iterator(); 
		while(itr.hasNext())
		{			
			easyThemes t = (easyThemes)itr.next();
			System.out.println("Theme Name 			: " + t.getThemeName());
			System.out.println("Theme Code 			: " + t.getThemeCode());
			System.out.println("***********************************************");
			t.trackStories();
		}
	}
	
	after(easybacklog obj): target(obj) && call(void getThemeStatus())
	{
		
		Iterator<easyThemes> itr = obj.getThemes().iterator(); 
		while(itr.hasNext())
		{			
			easyThemes t = (easyThemes)itr.next();
			t.getStoriesStatus();
			if(b.tasks.isEmpty())
				System.out.println("\t Your Board : " + b.getBoardName() + " currently have no Tasks.Please create one!! " );
			else
				System.out.println("\t Your Boards has following tasks: "  );
			for(KanbanTask k : b.tasks)
			{
				System.out.println("TaskID:" + k.getTaskID() + "Title:" +  k.getTitle() + "Status:" +  k.getColumn());
			}
			
			System.out.println("--------------------------------------------------" );

		}
	}
 }

