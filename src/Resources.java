
public class Resources {
	private String resourceName;
	private String email;
	private String resourceType;
	private String cost;
	private String baseCalendar;
	
	public Resources()
	{
		baseCalendar = "Standard";
	}
	public String getResourceName() {
		return resourceName;
	}
	public void setResourceName(String resourceName) {
		this.resourceName = resourceName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getResourceType() {
		return resourceType;
	}
	public void setResourceType(String resourceType) {
		this.resourceType = resourceType;
	}
	public String getCost() {
		return cost;
	}
	public void setCost(String cost) {
		this.cost = cost;
	}
	public String getBaseCalendar() {
		return baseCalendar;
	}
	public void setBaseCalendar(String baseCalendar) {
		this.baseCalendar = baseCalendar;
	}
	
	
}
