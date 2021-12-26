package kr.co.studycafe.event;


import org.springframework.web.multipart.MultipartFile;

public class EventDTO {
	
	private int e_number;
	private String en_email;
	private String e_title;
	private String e_content;
	private String e_image;
	private String e_start;
	private String e_end;
	private int e_winners;
	private int e_money;
	private MultipartFile eimgMF;
	
	//이벤트 당첨
	private int ep_number;
	private String in_email;

	
	public EventDTO () {}


	public int getE_number() {
		return e_number;
	}


	public void setE_number(int e_number) {
		this.e_number = e_number;
	}


	public String getEn_email() {
		return en_email;
	}


	public void setEn_email(String en_email) {
		this.en_email = en_email;
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


	public String getE_start() {
		return e_start;
	}


	public void setE_start(String e_start) {
		this.e_start = e_start;
	}


	public String getE_end() {
		return e_end;
	}


	public void setE_end(String e_end) {
		this.e_end = e_end;
	}


	public int getE_winners() {
		return e_winners;
	}


	public void setE_winners(int e_winners) {
		this.e_winners = e_winners;
	}


	public int getE_money() {
		return e_money;
	}


	public void setE_money(int e_money) {
		this.e_money = e_money;
	}


	public MultipartFile getEimgMF() {
		return eimgMF;
	}


	public void setEimgMF(MultipartFile eimgMF) {
		this.eimgMF = eimgMF;
	}


	public int getEp_number() {
		return ep_number;
	}


	public void setEp_number(int ep_number) {
		this.ep_number = ep_number;
	}


	public String getIn_email() {
		return in_email;
	}


	public void setIn_email(String in_email) {
		this.in_email = in_email;
	}
	
}
