package kr.co.studycafe.reserve;

public class ReserveDTO {
	private String store_name;
	private String store_address;
	private int room_count;
	private int desk_count;
	private int box_count;
	
	private int sres_no;
	private String in_email;
	private int store_no;
	private String seat_code;
	private String res_date;
	private String s_time;
	private String e_time;
	private int e_number;
	private int total;
	private String pay_prog;
	private int prog;
	
	public ReserveDTO() {}

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

	public String getS_time() {
		return s_time;
	}

	public void setS_time(String s_time) {
		this.s_time = s_time;
	}

	public String getE_time() {
		return e_time;
	}

	public void setE_time(String e_time) {
		this.e_time = e_time;
	}

	public int getE_number() {
		return e_number;
	}

	public void setE_number(int e_number) {
		this.e_number = e_number;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
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

	public String getStore_name() {
		return store_name;
	}

	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}

	public String getStore_address() {
		return store_address;
	}

	public void setStore_address(String store_address) {
		this.store_address = store_address;
	}

	public int getRoom_count() {
		return room_count;
	}

	public void setRoom_count(int room_count) {
		this.room_count = room_count;
	}

	public int getDesk_count() {
		return desk_count;
	}

	public void setDesk_count(int desk_count) {
		this.desk_count = desk_count;
	}

	public int getBox_count() {
		return box_count;
	}

	public void setBox_count(int box_count) {
		this.box_count = box_count;
	}
	
	
	
	
}
