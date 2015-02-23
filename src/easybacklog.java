import java.util.ArrayList;


public class easybacklog extends ProjectManagementTool
{
	private String BacklogName;
	private int TotalPoints;

	ArrayList<easyThemes> themes = new ArrayList<easyThemes>();
	ArrayList<easySprints> sprints = new ArrayList<easySprints>();
	
	
	public ArrayList<easySprints> getSprints() {
		return sprints;
	}

	public void setSprints(easySprints s) {
		sprints.add(s);
	}

	public int getTotalPoints() {
		return TotalPoints;
	}

	public void setTotalPoints(int totalPoints) {
		TotalPoints = totalPoints;
	}

	
	public ArrayList<easyThemes> getThemes() {
		return themes;
	}

	public void setThemes(easyThemes t) {
		themes.add(t);
	}

	public String getBacklogName() {
		return BacklogName;
	}

	public void setBacklogName(String backlogName) {
		BacklogName = backlogName;
	}

	public easybacklog(){
		
	}
	
	public void createTheme()
	{
	}
	
	public void trackTheme()
	{
	}
	
	public void getThemeStatus()
	{
	}
	
	public void createSprints()
	{
	}
	
	public void trackSprints()
	{
	}
	
	public void getSprintStatus()
	{	
	}
	
	
}

