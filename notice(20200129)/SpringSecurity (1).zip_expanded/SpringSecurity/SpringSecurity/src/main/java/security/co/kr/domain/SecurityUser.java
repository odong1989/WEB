package security.co.kr.domain;

public class SecurityUser {
	//아이디
	private String userId;
	//비밀번호
	private String userPw;
	//유저명
	private String userNm;
	//권한
	private String userAuth;
	
	public SecurityUser() {
		super();
	}

	public SecurityUser(String userId, String userPw, String userNm, String userAuth) {
		super();
		this.userId = userId;
		this.userPw = userPw;
		this.userNm = userNm;
		this.userAuth = userAuth;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getUserNm() {
		return userNm;
	}

	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}

	public String getUserAuth() {
		return userAuth;
	}

	public void setUserAuth(String userAuth) {
		this.userAuth = userAuth;
	}

	@Override
	public String toString() {
		return "SecurityUser [userId=" + userId + ", userPw=" + userPw + ", userNm=" + userNm + ", userAuth=" + userAuth
				+ "]";
	}
}
