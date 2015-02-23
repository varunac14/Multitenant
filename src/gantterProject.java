import java.util.*;

public class gantterProject extends ProjectManagementTool
{
	private String ProjectName;
	private Date startDate;
	private Date finishDate;
	private int duration;
	private String calendar;
	ArrayList<Task> tasks = new ArrayList<Task>();
	ArrayList<Resources> resources = new ArrayList<Resources>();
	ArrayList<Risks> risks = new ArrayList<Risks>();
	ArrayList<Calendar> calendars = new ArrayList<Calendar>();

	public gantterProject()
	{
		ProjectName = "";
		calendar 	= "Standard";
	}
	
	public String getProjectName(){
		return this.ProjectName;
	}
	
	public void setProjectName(String ProjectName){
		this.ProjectName = ProjectName;
	}

	public Date getStartDate() {
		return startDate;
	}


	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}


	public Date getFinishDate() {
		return finishDate;
	}

	public void setFinishDate(Date finishDate) {
		this.finishDate = finishDate;
	}
	
	public int getDuration() {
		if((startDate!= null) && (finishDate != null))
		{			
			long diff = finishDate.getTime() - startDate.getTime() ;
			duration = (int)diff/(1000*60*60*24);
			duration++;
			return duration;
		}
		else
		{
			return 0;
		}
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	public String getCalendar() {
		return calendar;
	}

	public void setCalendar(String calendar) {
		this.calendar = calendar;
	}

	public ArrayList<Task> getTasks() {
		return tasks;
	}

	public void setTasks(Task t) {
		tasks.add(t);
	}

	public ArrayList<Resources> getResources() {
		return resources;
	}

	public void setResources(Resources re) {
		resources.add(re);
	}

	public ArrayList<Risks> getRisks() {
		return risks;
	}

	public void setRisks(Risks r) {
		risks.add(r);
	}

	public ArrayList<Calendar> getCalendars() {
		return calendars;
	}

	public void setRisks(Calendar c) {
		calendars.add(c);
	}

	public void createTask()
	{
	}
	
	public void trackTask()
	{
	}
	
	public void getTaskStatus()
	{
		
	}
	
	public void createResource()
	{
	}
	
	public void trackResource()
	{
	}
	
	public void createRisk()
	{
	}
	
	public void trackRisk()
	{
	}
	
	public void createCalendar()
	{
	}
	
	public void trackCalendar()
	{
	}
	
}
