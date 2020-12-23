package com.vo;

import java.sql.Timestamp;

public class CommentVo {
	private int commentId;
	private int postId;
	private String userId;
	private String commentContent;
	private Timestamp commentDate;
	private String commentSecret;
	
	public int getCommentId() {
		return commentId;
	}
	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}
	public int getPostId() {
		return postId;
	}
	public void setPostId(int postId) {
		this.postId = postId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public Timestamp getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(Timestamp commentDate) {
		this.commentDate = commentDate;
	}
	public String getCommentSecret() {
		return commentSecret;
	}
	public void setCommentSecret(String commentSecret) {
		this.commentSecret = commentSecret;
	}
	@Override
	public String toString() {
		return "CommentVo [commentId=" + commentId + ", postId=" + postId + ", userId=" + userId + ", commentContent="
				+ commentContent + ", commentDate=" + commentDate + ", commentSecret=" + commentSecret + "]";
	}
}
