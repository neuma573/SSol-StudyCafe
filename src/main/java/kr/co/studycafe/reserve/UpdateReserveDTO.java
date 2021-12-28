package kr.co.studycafe.reserve;

public class UpdateReserveDTO {
	private int store_no;
	private String in_email;
	private String seat_code;
	private String res_date;
	private String times;
	
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
	@Override
	public String toString() {
		return "UpdateReserveDTO [store_no=" + store_no + ", seat_code=" + seat_code + ", res_date=" + res_date
				+ ", times=" + times + "]";
	}
}
