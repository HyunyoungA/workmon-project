package notice.model.vo;

import java.sql.Date;

public class Notice {
	private int boardNum;
	private String boardTitle;
	private String boardContent;
	private Date boardDate;
	private int hits;
	private int boardType;
	private String status;
	private String userId;
	private String managerId;
	private String companyName;
	
	public Notice() {}

	public Notice(int boardNum, String boardTitle, String boardContent, Date boardDate, int hits, int boardType,
			String status, String userId, String managerId, String companyName) {
		super();
		this.boardNum = boardNum;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardDate = boardDate;
		this.hits = hits;
		this.boardType = boardType;
		this.status = status;
		this.userId = userId;
		this.managerId = managerId;
		this.companyName = companyName;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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

	@Override
	public String toString() {
		return "Notice [boardNum=" + boardNum + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", boardDate=" + boardDate + ", hits=" + hits + ", boardType=" + boardType + ", status=" + status
				+ ", userId=" + userId + ", managerId=" + managerId + ", companyName=" + companyName + "]";
	}
}
