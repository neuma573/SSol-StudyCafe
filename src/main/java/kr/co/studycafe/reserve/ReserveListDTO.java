package kr.co.studycafe.reserve;

import java.util.List;

public class ReserveListDTO {
	private String in_email;
	private int store_no;
	private String seat_code;
	private String res_date;
	private String end_date;
	private String times;
	private int total; 
	

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

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	@Override
	public String toString() {
		return "ReserveListDTO [in_email=" + in_email + ", store_no=" + store_no + ", seat_code=" + seat_code
				+ ", res_date=" + res_date + ", end_date=" + end_date + ", times=" + times + ", total=" + total + "]";
	}
	
	
	
	
	
}
