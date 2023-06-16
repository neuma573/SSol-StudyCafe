package com.neuma573.studycafe.reserve;

public class ReserveDTO {
	private int store_no;
	private String in_email;
	private String seat_code;
	private String res_date;
	private String times;
	private String locker_code;
	private String res_start_date;
	private String res_end_date;
	private int total;
		
	public ReserveDTO() {}
	
	public int getStore_no() {
		return store_no;
	}
	public void setStore_no(int store_no) {
		this.store_no = store_no;
	}
	
	public String getIn_email() {
		return in_email;
	}

	public void setIn_email(String in_email) {
		this.in_email = in_email;
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

	public String getLocker_code() {
		return locker_code;
	}

	public void setLocker_code(String locker_code) {
		this.locker_code = locker_code;
	}

	public String getRes_start_date() {
		return res_start_date;
	}

	public void setRes_start_date(String res_start_date) {
		this.res_start_date = res_start_date;
	}

	public String getRes_end_date() {
		return res_end_date;
	}

	public void setRes_end_date(String res_end_date) {
		this.res_end_date = res_end_date;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	@Override
	public String toString() {
		return "ReserveDTO [store_no=" + store_no + ", in_email=" + in_email + ", seat_code=" + seat_code
				+ ", res_date=" + res_date + ", times=" + times + ", locker_code=" + locker_code + ", res_start_date="
				+ res_start_date + ", res_end_date=" + res_end_date + ", total=" + total + "]";
	}
	
	
	
	
	
}
