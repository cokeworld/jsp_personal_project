package com.vo;

public class PostVo {
	private int id;
	private String title;
	private int price;
	private int view;
	private String location;
	private String description;
	private String seller;
	private String passwd;
	private String file;
	
	
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public int getPrice() {
		return price;
	}
	public int getView() {
		return view;
	}
	public String getLocation() {
		return location;
	}
	public String getDescription() {
		return description;
	}
	public String getSeller() {
		return seller;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public void setView(int view) {
		this.view = view;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public void setSeller(String seller) {
		this.seller = seller;
	}
	@Override
	public String toString() {
		return "PostVo [id=" + id + ", title=" + title + ", price=" + price + ", view=" + view + ", location="
				+ location + ", description=" + description + ", seller=" + seller + ", passwd=" + passwd + ", file="
				+ file + "]";
	}
	

	
	
	
}
