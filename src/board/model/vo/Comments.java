package board.model.vo;

import java.sql.Date;

public class Comments {
	private int mentNum;
	private String mentContent;
	private int boardNum;
	private String userId;
	private	Date mentDate;
	private	String mentStatus;
	private String managerId;
	
	public Comments() {}

	public Comments(int mentNum, String mentContent, int boardNum, String userId, Date mentDate, String mentStatus,
			String managerId) {
		super();
		this.mentNum = mentNum;
		this.mentContent = mentContent;
		this.boardNum = boardNum;
		this.userId = userId;
		this.mentDate = mentDate;
		this.mentStatus = mentStatus;
		this.managerId = managerId;
	}

	public int getMentNum() {
		return mentNum;
	}

	public void setMentNum(int mentNum) {
		this.mentNum = mentNum;
	}

	public String getMentContent() {
		return mentContent;
	}

	public void setMentContent(String mentContent) {
		this.mentContent = mentContent;
	}

	public int getBoardNum() {
		return boardNum;
	}

	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Date getMentDate() {
		return mentDate;
	}

	public void setMentDate(Date mentDate) {
		this.mentDate = mentDate;
	}

	public String getMentStatus() {
		return mentStatus;
	}

	public void setMentStatus(String mentStatus) {
		this.mentStatus = mentStatus;
	}

	public String getManagerId() {
		return managerId;
	}

	public void setManagerId(String managerId) {
		this.managerId = managerId;
	}

	@Override
	public String toString() {
		return "Comments [mentNum=" + mentNum + ", mentContent=" + mentContent + ", boardNum=" + boardNum + ", userId="
				+ userId + ", mentDate=" + mentDate + ", mentStatus=" + mentStatus + ", managerId=" + managerId + "]";
	}
	
}