package com.vo;

import java.sql.Timestamp;

public class PostVo {
	private int postId;
	private String title;
	private int price;
	private int view;
	private String location;
	private String description;
	private String seller;
	private String passwd;
	private String file;
	private String category;
	private Timestamp regDate;
	private int reRef;
	private int reLev;
	private int reSeq;
	private String sellerId;
	
	
	public int getPostId() {
		return postId;
	}
	public void setPostId(int postId) {
		this.postId = postId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getView() {
		return view;
	}
	public void setView(int view) {
		this.view = view;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getSeller() {
		return seller;
	}
	public void setSeller(String seller) {
		this.seller = seller;
	}
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
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public int getReRef() {
		return reRef;
	}
	public void setReRef(int reRef) {
		this.reRef = reRef;
	}
	public int getReLev() {
		return reLev;
	}
	public void setReLev(int reLev) {
		this.reLev = reLev;
	}
	public int getReSeq() {
		return reSeq;
	}
	public void setReSeq(int reSeq) {
		this.reSeq = reSeq;
	}
	public String getSellerId() {
		return sellerId;
	}
	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}
	@Override
	public String toString() {
		return "PostVo [postId=" + postId + ", title=" + title + ", price=" + price + ", view=" + view + ", location="
				+ location + ", description=" + description + ", seller=" + seller + ", passwd=" + passwd + ", file="
				+ file + ", category=" + category + ", regDate=" + regDate + ", reRef=" + reRef + ", reLev=" + reLev
				+ ", reSeq=" + reSeq + ", sellerId=" + sellerId + "]";
	}
	
}
