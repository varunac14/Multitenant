

import java.util.ArrayList;

public class Board {
	
	private String BoardName;
	ArrayList<KanbanTask> tasks = new ArrayList<KanbanTask>();

	public Board(){
		BoardName = "";
	}
	
	public String getBoardName(){
		return this.BoardName;
	}
	
	public void setBoardName(String BoardName){
		this.BoardName = BoardName;
	}
	
	public ArrayList<KanbanTask> getKanbanTask() {
		return tasks;
	}

	public void setKanbanTask(KanbanTask t) {
		tasks.add(t);
	}

	public void createTask() {
		// TODO Auto-generated method stub
		
	}
	
	public void trackTask() {
		// TODO Auto-generated method stub
		
	}
	public void getTaskStatus(){
		
	}
}
