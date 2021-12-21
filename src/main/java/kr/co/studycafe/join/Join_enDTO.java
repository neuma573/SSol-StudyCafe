package kr.co.studycafe.join;

public class Join_enDTO {
	private String en_email;
	private String en_pw;
	private String en_name;
	private String en_birth;
	private String en_no;
	public String getEn_email() {
		return en_email;
	}
	public void setEn_email(String en_email) {
		this.en_email = en_email;
	}
	public String getEn_pw() {
		return en_pw;
	}
	public void setEn_pw(String en_pw) {
		this.en_pw = en_pw;
	}
	public String getEn_name() {
		return en_name;
	}
	public void setEn_name(String en_name) {
		this.en_name = en_name;
	}
	public String getEn_birth() {
		return en_birth;
	}
	public void setEn_birth(String en_bitrh) {
		this.en_birth = en_bitrh;
	}
	public String getEn_no() {
		return en_no;
	}
	public void setEn_no(String en_no) {
		this.en_no = en_no;
	}
	@Override
	public String toString() {
		return "Join_enDTO [en_email=" + en_email + ", en_pw=" + en_pw + ", en_name=" + en_name + ", en_bitrh="
				+ en_birth + ", en_no=" + en_no + "]";
	}
	
}
