package com.neuma573.studycafe.notice;

public class NoticeDTO {
	private int n_number;
	private String en_email;
	private String n_title;
	private String n_content;
	private String n_date;
	private String store_name;
	private int store_no;
	
	public NoticeDTO() {}

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
	
	public int getStore_no() {
		return store_no;
	}

	public void setStore_no(int store_no) {
		this.store_no = store_no;
	}

	public String getStore_name() {
		return store_name;
	}

	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}
	
	
}
