import java.util.*;


aspect Risk {
	after(gantterProject obj): target(obj) && call(void createRisk())
	{
			
		Risks r = new Risks();
		System.out.println("Please enter risk details");
		System.out.println("--------------------------");
				
		Scanner in = new Scanner(System.in);
		
		System.out.print("Risk Name: ");
		r.setRiskName(in.nextLine());
		
		System.out.print("Response: ");
		r.setResponse(in.nextLine());
		
		 System.out.print("Cause: ");
		 r.setCause(in.nextLine());
		
		 System.out.print("Probability: ");
		 r.setProbability(in.nextLine());

		 System.out.print("Severity: ");
		 r.setSeverity(in.nextLine());
		
		 System.out.print("Priority: ");
		 r.setPriority(in.nextLine());
		 
		 obj.setRisks(r);
		 System.out.println("Gantter Risk added successfully!!");
		 
		 String status = "N";
		 System.out.print("Do you want to add another risk? Y/N");
		 status = in.next();
		 if((status.contentEquals("Y")) || (status.contentEquals("y")))
		 {
			 obj.createRisk();
		 }
		
	}
	
	after(gantterProject obj): target(obj) && call(void trackRisk())
	{
		System.out.println("Gantter risk details are :");
		System.out.println("-------------------------");

		Iterator<Risks> itr = obj.getRisks().iterator(); 
		while(itr.hasNext())
		{			
			Risks r = (Risks)itr.next();
			System.out.println("Risk Name 		: " + r.getRiskName());
			System.out.println("Response 		: " + r.getResponse());
			System.out.println("Cause 			: " + r.getCause());
			System.out.println("Probability 	: " + r.getProbability());
			System.out.println("Severity 		: " + r.getSeverity());
			System.out.println("Priority 		: " + r.getPriority());
			System.out.println("***********************************************");
			
		}
	}
}
