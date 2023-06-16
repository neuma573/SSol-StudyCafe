package com.neuma573.studycafe.mypage;

import org.springframework.web.multipart.MultipartFile;

public class MypageDTO {
	private int res_no;
	private String in_email;
	private int store_no;
	private String store_name;
	private String seat_code;
	private String res_date;
	private String end_date;
	private String times;
	private String pay_prog;
	private int prog;
	private int e_number;
	private String e_title;
	private int e_money;
	
	public MypageDTO() {}

	public int getRes_no() {
		return res_no;
	}

	public void setRes_no(int res_no) {
		this.res_no = res_no;
	}

	public String getIn_email() {
		return in_email;
	}

	public void setIn_email(String in_email) {
		this.in_email = in_email;
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

	public String getSeat_code() {
		return seat_code;
	}

	public void setSeat_code(String seat_code) {
		this.seat_code = seat_code;
	}

	public String getRes_date() {
		return res_date;
	}

	public void setRes_date(String res_date) {
		this.res_date = res_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public String getTimes() {
		return times;
	}

	public void setTimes(String times) {
		this.times = times;
	}

	public String getPay_prog() {
		return pay_prog;
	}

	public void setPay_prog(String pay_prog) {
		this.pay_prog = pay_prog;
	}

	public int getProg() {
		return prog;
	}

	public void setProg(int prog) {
		this.prog = prog;
	}

	public int getE_number() {
		return e_number;
	}

	public void setE_number(int e_number) {
		this.e_number = e_number;
	}

	public String getE_title() {
		return e_title;
	}

	public void setE_title(String e_title) {
		this.e_title = e_title;
	}

	public int getE_money() {
		return e_money;
	}

	public void setE_money(int e_money) {
		this.e_money = e_money;
	}

	
	
	

}//MypageDTO() end