import java.util.*;


aspect Calendars
{
	after(gantterProject obj): target(obj) && call(void createCalendar())
	{
		Calendar r = new Calendar();
		System.out.println("Please enter calendar details");
		System.out.println("-----------------------------");
				
		Scanner in = new Scanner(System.in);
		
		System.out.print("Calendar Name: ");
		r.setCalendarName(in.nextLine());
		
		obj.setRisks(r);
		System.out.println("Gantter calendar added successfully!!");	
		
		String status = "N";
		System.out.print("Do you want to add another calendar? Y/N");
		status = in.next();
		if((status.contentEquals("Y")) || (status.contentEquals("y")))
		{
			obj.createCalendar();
		}
		
	}
		

	after(gantterProject obj): target(obj) && call(void trackCalendar())
	{
		System.out.println("Gantter Calendar details are :");
		System.out.println("------------------------------");
		
		Iterator<Calendar> itr = obj.getCalendars().iterator();
		while(itr.hasNext())
		{			
			Calendar r = (Calendar)itr.next();
			System.out.println("Calendar Name : " + r.getCalendarName());
			System.out.println("*************************************");

		}
	}
}
