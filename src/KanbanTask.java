

import java.sql.Date;

public class KanbanTask {
	private String title;
	private String TaskID;
	private String Description;
	private String Priority;
	private String Asignee;
	private Date Deadline;
	private String Column;
	
	
	public KanbanTask() {
		
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTaskID() {
		return TaskID;
	}
	public void setTaskID(String taskID) {
		TaskID = taskID;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
	public String getPriority() {
		return Priority;
	}
	public void setPriority(String priority) {
		Priority = priority;
	}
	public String getAsignee() {
		return Asignee;
	}
	public void setAsignee(String asignee) {
		Asignee = asignee;
	}
	public Date getDeadline() {
		return Deadline;
	}
	public void setDeadline(Date deadline) {
		Deadline = deadline;
	}
	public String getColumn() {
		return Column;
	}
	public void setColumn(String column) {
		Column = column;
	}
	
	

}
