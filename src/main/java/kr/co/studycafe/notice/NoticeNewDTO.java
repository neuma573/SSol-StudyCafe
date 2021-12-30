package kr.co.studycafe.notice;

public class NoticeNewDTO {
	private int n_number;
	private String en_email;
	private String n_title;
	private String n_content;
	private String n_date;
	
	public NoticeNewDTO() {}

	public int getN_number() {
		return n_number;
	}

	public void setN_number(int n_number) {
		this.n_number = n_number;
	}

	public String getEn_email() {
		return en_email;
	}

	public void setEn_email(String en_email) {
		this.en_email = en_email;
	}

	public String getN_title() {
		return n_title;
	}

	public void setN_title(String n_title) {
		this.n_title = n_title;
	}

	public String getN_content() {
		return n_content;
	}

	public void setN_content(String n_content) {
		this.n_content = n_content;
	}

	public String getN_date() {
		return n_date;
	}

	public void setN_date(String n_date) {
		this.n_date = n_date;
	}

	
}
