package kr.co.studycafe.mypage;

import org.springframework.web.multipart.MultipartFile;

public class MypageDTO {
	private int sres_no;
	private String in_email;
	private String in_name;
	private int store_no;
	private String seat_code;
	private String res_date;
	private String times;
	private String pay_prog;
	private int prog;
	private int lres_no;
	private String locker_code;
	private String s_date;
	private String e_date;
	
	public MypageDTO() {}

	public int getSres_no() {
		return sres_no;
	}

	public void setSres_no(int sres_no) {
		this.sres_no = sres_no;
	}

	public String getIn_email() {
		return in_email;
	}

	public void setIn_email(String in_email) {
		this.in_email = in_email;
	}
	
	public String getIn_name() {
		return in_name;
	}

	public void setIn_name(String in_name) {
		this.in_name = in_name;
	}

	public int getStore_no() {
		return store_no;
	}

	public void setStore_no(int store_no) {
		this.store_no = store_no;
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

	public int getLres_no() {
		return lres_no;
	}

	public void setLres_no(int lres_no) {
		this.lres_no = lres_no;
	}

	public String getLocker_code() {
		return locker_code;
	}

	public void setLocker_code(String locker_code) {
		this.locker_code = locker_code;
	}

	public String getS_date() {
		return s_date;
	}

	public void setS_date(String s_date) {
		this.s_date = s_date;
	}

	public String getE_date() {
		return e_date;
	}

	public void setE_date(String e_date) {
		this.e_date = e_date;
	}
	
	
	
}//MypageDTO() end