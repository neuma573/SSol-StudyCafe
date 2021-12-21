package kr.co.studycafe.join;

public class Join_inDTO {
	private String in_email;
	private String in_pw;
	private String in_name;
	private String in_birth;
	public String getIn_email() {
		return in_email;
	}
	public void setIn_email(String in_email) {
		this.in_email = in_email;
	}
	public String getIn_pw() {
		return in_pw;
	}
	public void setIn_pw(String in_pw) {
		this.in_pw = in_pw;
	}
	public String getIn_name() {
		return in_name;
	}
	public void setIn_name(String in_name) {
		this.in_name = in_name;
	}
	public String getIn_birth() {
		return in_birth;
	}
	public void setIn_birth(String in_birth) {
		this.in_birth = in_birth;
	}
	@Override
	public String toString() {
		return "Join_inDTO [in_email=" + in_email + ", in_pw=" + in_pw + ", in_name=" + in_name + ", in_birth="
				+ in_birth + "]";
	}
	
	

}
