package kr.co.studycafe.login;

public class LoginDTO {
	private String email;
	private String pw;
	private String user;
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	@Override
	public String toString() {
		return "LoginDTO [email=" + email + ", pw=" + pw + ", user=" + user + "]";
	}

}
