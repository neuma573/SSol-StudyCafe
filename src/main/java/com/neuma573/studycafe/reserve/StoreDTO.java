package com.neuma573.studycafe.reserve;

public class StoreDTO {
	private int store_no;
	private String store_name;
	private String store_address;
	private int room_count;
	private int desk_count;
	private int locker_count;
	
	
	public StoreDTO() {}
	
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
	public int getLocker_count() {
		return locker_count;
	}
	public void setLocker_count(int locker_count) {
		this.locker_count = locker_count;
	}

	
}
