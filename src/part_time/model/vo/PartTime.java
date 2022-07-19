package part_time.model.vo;

import java.sql.Date;

public class PartTime {
   private int boardNum;
   private String boardTitle;
   private String boardContent;
   private Date boardDate;
   private int hits;
   private int boardType;
   private String boardStatus;
   private String userId;
   private String managerId;
   private String companyName;
   private String career;
   private String educationLevel;
   private String prefer;
   private String workPeriod;
   private String dutyHours;
   private String salary;
   private String area;
   
   public PartTime() {}

	public PartTime(int boardNum, String boardTitle, String boardContent, Date boardDate, int hits, int boardType,
			String boardStatus, String userId, String managerId, String companyName, String career, String educationLevel,
			String prefer, String workPeriod, String dutyHours, String salary, String area) {
		super();
		this.boardNum = boardNum;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardDate = boardDate;
		this.hits = hits;
		this.boardType = boardType;
		this.boardStatus = boardStatus;
		this.userId = userId;
		this.managerId = managerId;
		this.companyName = companyName;
		this.career = career;
		this.educationLevel = educationLevel;
		this.prefer = prefer;
		this.workPeriod = workPeriod;
		this.dutyHours = dutyHours;
		this.salary = salary;
		this.area = area;
	}
	
	

	
	public PartTime(int boardNum, String boardTitle, String userId, String companyName, String career,
			String educationLevel, String prefer, String workPeriod, String dutyHours, String salary, String area) {
		super();
		this.boardNum = boardNum;
		this.boardTitle = boardTitle;
		this.userId = userId;
		this.companyName = companyName;
		this.career = career;
		this.educationLevel = educationLevel;
		this.prefer = prefer;
		this.workPeriod = workPeriod;
		this.dutyHours = dutyHours;
		this.salary = salary;
		this.area = area;
	}

	public PartTime(int boardNum, String area, String boardTitle, String companyName, String salary, String workPeriod, 
	           Date boardDate, String boardStatus) {
	      super();
	      this.boardNum = boardNum;
	      this.area = area;
	      this.boardTitle = boardTitle;
	      this.companyName = companyName;
	      this.salary = salary;
	      this.workPeriod = workPeriod;
	      this.boardDate = boardDate;
	      this.boardStatus = boardStatus;
	   }

	public int getBoardNum() {
		return boardNum;
	}

	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public Date getBoardDate() {
		return boardDate;
	}

	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

	public int getBoardType() {
		return boardType;
	}

	public void setBoardType(int boardType) {
		this.boardType = boardType;
	}

	public String getBoardStatus() {
		return boardStatus;
	}

	public void setBoardStatus(String boardStatus) {
		this.boardStatus = boardStatus;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getManagerId() {
		return managerId;
	}

	public void setManagerId(String managerId) {
		this.managerId = managerId;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getCareer() {
		return career;
	}

	public void setCareer(String career) {
		this.career = career;
	}

	public String getEducationLevel() {
		return educationLevel;
	}

	public void setEducationLevel(String educationLevel) {
		this.educationLevel = educationLevel;
	}

	public String getPrefer() {
		return prefer;
	}

	public void setPrefer(String prefer) {
		this.prefer = prefer;
	}

	public String getWorkPeriod() {
		return workPeriod;
	}

	public void setWorkPeriod(String workPeriod) {
		this.workPeriod = workPeriod;
	}

	public String getDutyHours() {
		return dutyHours;
	}

	public void setDutyHours(String dutyHours) {
		this.dutyHours = dutyHours;
	}

	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	@Override
	public String toString() {
		return "PartTime [boardNum=" + boardNum + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", boardDate=" + boardDate + ", hits=" + hits + ", boardType=" + boardType + ", boardStatus="
				+ boardStatus + ", userId=" + userId + ", managerId=" + managerId + ", companyName=" + companyName
				+ ", career=" + career + ", educationLevel=" + educationLevel + ", prefer=" + prefer + ", workPeriod="
				+ workPeriod + ", dutyHours=" + dutyHours + ", salary=" + salary + ", area=" + area + "]";
	}


   
}