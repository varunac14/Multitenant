import java.util.*;

aspect Resource {
	after(gantterProject obj): target(obj) && call(void createResource())
	{		
		Resources r = new Resources();
		System.out.println("Please enter  resource details");
		System.out.println("--------------------------");
				
		Scanner in = new Scanner(System.in);
		
		System.out.print("Resource Name: ");
		r.setResourceName(in.nextLine());
		
		System.out.print("Resource Type: ");
		r.setResourceType(in.nextLine());
		
		 System.out.print("Cost: ");
		 r.setCost(in.nextLine());
		
		 System.out.print("Base Calendar: ");
		 r.setBaseCalendar(in.nextLine());

		 obj.setResources(r);
		 System.out.println("Gantter Resource added successfully!!");
		 
		 String status = "N";
		 System.out.println("Do you want to add another resource? Y/N");
		 status = in.next();
		 if((status.contentEquals("Y")) || (status.contentEquals("y")))
		 {
			 obj.createResource();
		 }
	}
	
	after(gantterProject obj): target(obj) && call(void trackResource())
	{
		System.out.println("Gantter resource details are :");
		System.out.println("-----------------------------" );

		Iterator<Resources> itr = obj.getResources().iterator(); 
		while(itr.hasNext())
		{			
			Resources r = (Resources)itr.next();
			System.out.println("Resource Name 	: " + r.getResourceName());
			System.out.println("Resource Type 	: " + r.getResourceType());
			System.out.println("Cost			: " + r.getCost());
			System.out.println("Base Calendar 	: " + r.getBaseCalendar());
			System.out.println("***********************************************");

		}
	}
}
