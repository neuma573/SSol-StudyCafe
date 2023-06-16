package com.neuma573.studycafe.question;

import org.springframework.web.multipart.MultipartFile;

public class StoreDTO {
	private int store_no;
	private String en_email;
	private String store_name;
	private String store_address;
	private String operating_hours;
	private String store_en_no;
	private int room_count;
	private int desk_count;
	private int box_count;
	private double latitude;
	private double longitude;
	private String store_img;
	private String tel;
	private MultipartFile store_imgMF;
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
	public String getStore_en_no() {
		return store_en_no;
	}
	public void setStore_en_no(String store_en_no) {
		this.store_en_no = store_en_no;
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


}
