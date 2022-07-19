package part_time.model.vo;

import java.sql.Date;

public class Image {
	private int imgId;
	private String imgPath; //filePath
	private String originName;
	private String reName;
	private Date uploadDate;
	private String imgStatus;
	private int imgType;
	private int boardNum;
	
	public Image() {}

	public Image(int imgId, String imgPath, String originName, String reName, Date uploadDate, String imgStatus,
			int imgType, int boardNum) {
		super();
		this.imgId = imgId;
		this.imgPath = imgPath;
		this.originName = originName;
		this.reName = reName;
		this.uploadDate = uploadDate;
		this.imgStatus = imgStatus;
		this.imgType = imgType;
		this.boardNum = boardNum;
	}

	public int getImgId() {
		return imgId;
	}

	public void setImgId(int imgId) {
		this.imgId = imgId;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getReName() {
		return reName;
	}

	public void setReName(String reName) {
		this.reName = reName;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getImgStatus() {
		return imgStatus;
	}

	public void setImgStatus(String imgStatus) {
		this.imgStatus = imgStatus;
	}

	public int getImgType() {
		return imgType;
	}

	public void setImgType(int imgType) {
		this.imgType = imgType;
	}

	public int getBoardNum() {
		return boardNum;
	}

	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}

	@Override
	public String toString() {
		return "Image [imgId=" + imgId + ", imgPath=" + imgPath + ", originName=" + originName + ", reName=" + reName
				+ ", uploadDate=" + uploadDate + ", imgStatus=" + imgStatus + ", imgType=" + imgType + ", boardNum="
				+ boardNum + "]";
	}

	
	
}
