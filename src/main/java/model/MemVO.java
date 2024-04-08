package model;

public class MemVO {
	private int mem_no;
	private String mem_id;
	private String mem_pw;
	private String mem_name;
	private String mem_call;
	private String mem_email;
	
	public MemVO(int no, String id, String pw, String name, String call, String email) {
		this.mem_no = no;
		this.mem_id = id;
		this.mem_pw = pw;
		this.mem_name = name;
		this.mem_call = call;
		this.mem_email = email;
	}

	public int getMem_no() {
		return mem_no;
	}

	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_pw() {
		return mem_pw;
	}

	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getMem_call() {
		return mem_call;
	}

	public void setMem_call(String mem_call) {
		this.mem_call = mem_call;
	}

	public String getMem_email() {
		return mem_email;
	}

	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}

	@Override
	public String toString() {
		return "MemVO [mem_no=" + mem_no + ", mem_id=" + mem_id + ", mem_pw=" + mem_pw + ", mem_name=" + mem_name
				+ ", mem_call=" + mem_call + ", mem_email=" + mem_email + "]";
	}

	
	
}
