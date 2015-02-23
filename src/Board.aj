import java.util.*;
import java.text.*;

aspect Boards {
	after(kanbanProject obj): target(obj) && call(void createBoard())
	{
		Board b = new Board();
		System.out.println("Please enter board details");
		System.out.println("--------------------------");
		Scanner in = new Scanner(System.in);
		
		 System.out.print("Board Name: ");
		 b.setBoardName(in.nextLine());
		

		 obj.setBoards(b);
		 System.out.println("Kanban board added successfully!!");
		 
		 
		 String status = "N";
		 System.out.print("Do you want to add another Board? Y/N");
		 status = in.next();
		 if((status.contentEquals("Y")) || (status.contentEquals("y")))
		 {
			 obj.createBoard();
		 }
		 
		 b.createTask();
	}

	after(kanbanProject obj): target(obj) && call(void trackBoard())
	{
		System.out.println("Kanban board details are :");
		System.out.println("-------------------------" );

		Iterator<Board> itr = obj.getBoards().iterator(); 
		while(itr.hasNext())
		{			
			Board b = (Board)itr.next();
			System.out.println("Board Name 			: " + b.getBoardName());
			
			System.out.println("***********************************************");

			b.trackTask();
		}
	}
	
	after(kanbanProject obj): target(obj) && call(void getBoardStatus())
	{
		
		Iterator<Board> itr = obj.getBoards().iterator(); 
		while(itr.hasNext())
		{			
			Board b = (Board)itr.next();
			b.getTaskStatus();
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
