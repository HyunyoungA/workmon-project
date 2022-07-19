package member.model.vo;

public class Member {
	private String userId;
	private String userPwd;
	private String userName;
	private String userEmail;
	private String userPhone;
	private String companyName;
	private String companyNum;
	private String companyAddress;
	private int userTYPE;
	private String userStatus;
	private String joinPath;
	
	public Member() {}

	public Member(String userId, String userPwd, String userName, String userEmail, String userPhone,
			String companyName, String companyNum, String companyAddress, int userTYPE, String userStatus,
			String joinPath) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPhone = userPhone;
		this.companyName = companyName;
		this.companyNum = companyNum;
		this.companyAddress = companyAddress;
		this.userTYPE = userTYPE;
		this.userStatus = userStatus;
		this.joinPath = joinPath;
	}

	

	public Member(String userId, String companyName, String companyAddress) {
		super();
		this.userId = userId;
		this.companyName = companyName;
		this.companyAddress = companyAddress;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getCompanyNum() {
		return companyNum;
	}

	public void setCompanyNum(String companyNum) {
		this.companyNum = companyNum;
	}

	public String getCompanyAddress() {
		return companyAddress;
	}

	public void setCompanyAddress(String companyAddress) {
		this.companyAddress = companyAddress;
	}

	public int getUserTYPE() {
		return userTYPE;
	}

	public void setUserTYPE(int userTYPE) {
		this.userTYPE = userTYPE;
	}

	public String getUserStatus() {
		return userStatus;
	}

	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}

	public String getJoinPath() {
		return joinPath;
	}

	public void setJoinPath(String joinPath) {
		this.joinPath = joinPath;
	}

	@Override
	public String toString() {
		return "Member [userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName + ", userEmail="
				+ userEmail + ", userPhone=" + userPhone + ", companyName=" + companyName + ", companyNum=" + companyNum
				+ ", companyAddress=" + companyAddress + ", userTYPE=" + userTYPE + ", userStatus=" + userStatus
				+ ", joinPath=" + joinPath + "]";
	}

	
	
}
