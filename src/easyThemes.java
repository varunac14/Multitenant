import java.util.ArrayList;


public class easyThemes {

	private String themeName;
	private String themeCode;
	ArrayList<stories> stories = new ArrayList<stories>();
	ArrayList<easySprints> easySprints = new ArrayList<easySprints>();
	
	public String getThemeCode() {
		return themeCode;
	}

	public void setThemeCode(String themeCode) {
		this.themeCode = themeCode;
	}

	public String getThemeName() {
		return themeName;
	}

	public void setThemeName(String themeName) {
		this.themeName = themeName;
	}

	public ArrayList<stories> getStories() {
		return stories;
	}

	public void setStories(stories s) {
		stories.add(s);
	}

	public easyThemes(){
		
	}
	
	public void createStories()
	{
	}
	
	public void trackStories(){
	}
	
	public void getStoriesStatus()
	{		
	}
}
