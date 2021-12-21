package kr.co.studycafe.login;

public class LoginDTO {
	private String in_email;
	private String in_pw;

	LoginDTO() {}

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

	@Override
	public String toString() {
		return "LoginDTO [in_email=" + in_email + ", in_pw=" + in_pw + "]";
	}

}
