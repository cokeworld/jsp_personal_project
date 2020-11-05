package com.vo;

import java.sql.Timestamp;

public class ZangtuVo {
	private String id;
	private String passwd;
	private String subject;
	private String content;
	private String name;
	private Integer age;
	private String gender;
	private String email;   // 이메일 주소
	private int readCount;
	private Timestamp regDate;
	
	public String getId() {
		return id;
	}
	public String getPasswd() {
		return passwd;
	}
	public String getName() {
		return name;
	}
	public Integer getAge() {
		return age;
	}
	public String getGender() {
		return gender;
	}
	public String getEmail() {
		return email;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	
	public String getSubject() {
		return subject;
	}
	public String getContent() {
		return content;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	@Override
	public String toString() {
		return "ZangtuVo [id=" + id + ", passwd=" + passwd + ", subject=" + subject + ", content=" + content + ", name="
				+ name + ", age=" + age + ", gender=" + gender + ", email=" + email + ", regDate=" + regDate + "]";
	}

	
	
}


	
