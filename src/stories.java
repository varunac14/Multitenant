import java.util.ArrayList;


public class stories {
	
	private String StoryID;
	private String UserStory;
	private String AcceptanceCriteria;
	private String Comments;
	private String sprint;
	private String StoryPoints;
	
	public String getSprint() {
		return sprint;
	}
	public void setSprint(String sprints) {
		this.sprint = sprints;
	}
	public String getStoryID() {
		return StoryID;
	}
	public void setStoryID(String storyID) {
		StoryID = storyID;
	}
	public String getUserStory() {
		return UserStory;
	}
	public void setUserStory(String userStory) {
		UserStory = userStory;
	}
	public String getAcceptanceCriteria() {
		return AcceptanceCriteria;
	}
	public void setAcceptanceCriteria(String acceptanceCriteria) {
		AcceptanceCriteria = acceptanceCriteria;
	}
	public String getComments() {
		return Comments;
	}
	public void setComments(String comments) {
		Comments = comments;
	}
	public String getStoryPoints() {
		return StoryPoints;
	}
	public void setStoryPoints(String storyPoints) {
		StoryPoints = storyPoints;
	}
}
