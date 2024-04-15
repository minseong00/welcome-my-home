package model;

public class MemVO {
	private int memNo;
	private String memId;
	private String memPw;
	private String memName;
	private String memCall;
	private String memEmail;
	
	public MemVO() {
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemPw() {
		return memPw;
	}

	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getMemCall() {
		return memCall;
	}

	public void setMemCall(String memCall) {
		this.memCall = memCall;
	}

	public String getMemEmail() {
		return memEmail;
	}

	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}

	@Override
	public String toString() {
		return "MemVO [memNo=" + memNo + ", memId=" + memId + ", memPw=" + memPw + ", memName=" + memName + ", memCall="
				+ memCall + ", memEmail=" + memEmail + "]";
	}
	
}
