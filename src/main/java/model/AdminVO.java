package model;

public class AdminVO {	
	private String admin_no;
	private String admin_id;
	private String admin_pwd;
	
	public AdminVO(String no, String id, String pw) {
		this.admin_no = no;
		this.admin_id = id;
		this.admin_pwd= pw;
	}

	public String getAdmin_no() {
		return admin_no;
	}

	public void setAdmin_no(String admin_no) {
		this.admin_no = admin_no;
	}

	public String getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	public String getAdmin_pwd() {
		return admin_pwd;
	}

	public void setAdmin_pwd(String admin_pwd) {
		this.admin_pwd = admin_pwd;
	}

	@Override
	public String toString() {
		return "AdminVO [admin_no=" + admin_no + ", admin_id=" + admin_id + ", admin_pwd=" + admin_pwd + "]";
	}

	
}
