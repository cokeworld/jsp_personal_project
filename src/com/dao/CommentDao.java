package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.vo.CommentVo;

public class CommentDao {
	
	private static CommentDao instance = new CommentDao();
	
	public static CommentDao getInstance() {
		return instance;
	}
	
	// addComment
	public void addComment(CommentVo commentVo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String sql = "";
		
		try {
			con = JdbcUtils.getConnection();
			
			sql  = "INSERT INTO comment ";
			sql += "(commentId, postId, userId, commentContent, commentDate, commentSecret) ";
			sql += "VALUES (?, ?, ?, ?, ?, ?) ";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, commentVo.getCommentId());
			pstmt.setInt(2, commentVo.getPostId());
			pstmt.setString(3, commentVo.getUserId());
			pstmt.setString(4, commentVo.getCommentContent());
			pstmt.setTimestamp(5, commentVo.getCommentDate());
			pstmt.setString(6, commentVo.getCommentSecret());

			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt);
		}
	}
	
	//deleteComment
	public void deleteComment(int commentId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		try {
			con = JdbcUtils.getConnection();
			sql = "DELETE FROM comment WHERE commentId = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, commentId);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt);
		}
	}
	
	// deleteAllComments
	public void deleteAllComments() {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = JdbcUtils.getConnection();
			
			String sql = "DELETE FROM comment";
			pstmt = con.prepareStatement(sql);
			
			pstmt.executeUpdate();
			System.out.println("모든 코멘트 데이터 삭제완료");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt);
		}
	}
	
	// getCommentList
	public List<CommentVo> getCommentList(int postId, int startRow, int pageSize) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<CommentVo> list = new ArrayList<>();
		String sql = "";
		
		try {
			con = JdbcUtils.getConnection();
			
			sql  = "SELECT * ";
			sql += "FROM comment ";
			sql += "WHERE postId = ? ";
			sql += "ORDER BY commentId ";
			sql += "LIMIT ?, ? ";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, postId);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, pageSize);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				CommentVo commentVo = new CommentVo();
				commentVo.setCommentId(rs.getInt("commentId"));
				commentVo.setPostId(rs.getInt("postId"));
				commentVo.setUserId(rs.getString("userId"));
				commentVo.setCommentContent(rs.getString("commentContent"));
				commentVo.setCommentDate(rs.getTimestamp("commentDate"));
				commentVo.setCommentSecret(rs.getString("commentSecret"));
				list.add(commentVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt, rs);
		}
		return list;
	}
	
	// getNextNum
	public int getNextNum() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int nextNum = 0;
		String sql = "";
		
		try {
			con = JdbcUtils.getConnection();
			
			sql  = "SELECT IFNULL(MAX(commentId), 0) + 1 AS next_num ";
			sql += "FROM comment";
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				nextNum = rs.getInt("next_num");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt, rs);
		}
		return nextNum;
	}
	
	// main method
	public static void main(String[] args) {
		CommentDao dao = CommentDao.getInstance();
	}
	
}
