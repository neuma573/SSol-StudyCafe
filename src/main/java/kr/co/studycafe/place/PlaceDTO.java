package kr.co.studycafe.place;

import org.springframework.web.multipart.MultipartFile;

public class PlaceDTO {
	private int store_no;
	private String en_email;
	private String store_name;
	private String store_address;
	private String operating_hours;
	private int room_count;
	private int desk_count;
	private int box_count;
	private double latitude;
	private double longitude;
	private String store_img;
	private String tel;
	private MultipartFile store_imgMF;
	private int score_avg;
	private int review_tot;
	
	// 리뷰 테이블 
	private int e_number;
	private String e_title;
	private String e_content;
	private String e_image;
	private String in_email;
	private int e_end;
	private String rev_date;
	private MultipartFile revimgMF;
	
	
	public PlaceDTO() {}

	public int getStore_no() {
		return store_no;
	}

	public void setStore_no(int store_no) {
		this.store_no = store_no;
	}

	public String getEn_email() {
		return en_email;
	}

	public void setEn_email(String en_email) {
		this.en_email = en_email;
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

	public String getOperating_hours() {
		return operating_hours;
	}

	public void setOperating_hours(String operating_hours) {
		this.operating_hours = operating_hours;
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

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

	public void setLongitude(long longitude) {
		this.longitude = longitude;
	}

	public void setLongitude(int longitude) {
		this.longitude = longitude;
	}

	public String getStore_img() {
		return store_img;
	}

	public void setStore_img(String store_img) {
		this.store_img = store_img;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public MultipartFile getStore_imgMF() {
		return store_imgMF;
	}

	public void setStore_imgMF(MultipartFile store_imgMF) {
		this.store_imgMF = store_imgMF;
	}
	
	public MultipartFile getRevimgMF() {
		return revimgMF;
	}

	public void setRevimgMF(MultipartFile revimgMF) {
		this.revimgMF = revimgMF;
	}

	public int getScore_avg() {
		return score_avg;
	}

	public void setScore_avg(int score_agv) {
		this.score_avg = score_agv;
	}

	public int getReview_tot() {
		return review_tot;
	}

	public void setReview_tot(int review_tot) {
		this.review_tot = review_tot;
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

	public String getE_content() {
		return e_content;
	}

	public void setE_content(String e_content) {
		this.e_content = e_content;
	}

	public String getE_image() {
		return e_image;
	}

	public void setE_image(String e_image) {
		this.e_image = e_image;
	}

	public String getIn_email() {
		return in_email;
	}

	public void setIn_email(String in_email) {
		this.in_email = in_email;
	}

	public int getE_end() {
		return e_end;
	}

	public void setE_end(int e_end) {
		this.e_end = e_end;
	}

	public String getRev_date() {
		return rev_date;
	}

	public void setRev_date(String rev_date) {
		this.rev_date = rev_date;
	}
	
}// class end 
