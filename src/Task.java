import java.util.*;

public class Task
{
	private String taskName;
	private int duration;
	private String percentComplete;
	private Date startDate;
	private Date endDate;
	//private String[] predecessors;
	//private String[] resources;
	private String predecessors;
	private String resources;
	
	public String getTaskName() {
		return taskName;
	}
	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}
	
	public int getDuration() { //TODO
		if((startDate!= null) && (endDate != null))
		{			
			long diff = endDate.getTime() - startDate.getTime() ;
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
	public String getPercentComplete() {
		return percentComplete;
	}
	public void setPercentComplete(String percentComplete) {
		this.percentComplete = percentComplete;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getPredecessors() {
		return predecessors;
	}
	public void setPredecessors(String predecessors) {
		this.predecessors = predecessors;
	}
	public String getResources() {
		return resources;
	}
	public void setResources(String resources) {
		this.resources = resources ;
	}
}
