

import java.util.ArrayList;

public class kanbanProject extends ProjectManagementTool{

	private String projectName;
	ArrayList<Board> boards = new ArrayList<Board>();

	public kanbanProject(){
		projectName = "";
	}
	
	public String getProjectName(){
		return this.projectName;
	}
	
	public void setProjectName(String projectName){
		this.projectName = projectName;
	}
	
	public ArrayList<Board> getBoards() {
		return boards;
	}

	public void setBoards(Board b) {
		boards.add(b);
	}

	public void createBoard() {
		// TODO Auto-generated method stub
		
	}

	public void trackBoard() {
		// TODO Auto-generated method stub
		
	}

	public void getBoardStatus() {
		// TODO Auto-generated method stub	
	}

	

	
	
}
