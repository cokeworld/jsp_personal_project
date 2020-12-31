package com.dao;

import java.sql.Connection;
import java.sql.JDBCType;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.tomcat.dbcp.dbcp2.cpdsadapter.PStmtKeyCPDS;

import com.dao.JdbcUtils;
import com.mysql.cj.protocol.Resultset;
import com.vo.PostVo;

public class PostDao {
	
	private static PostDao instance = new PostDao();
	
	public static PostDao getInstance() {
		return instance;
	}
	// addPost
	public void addPost(PostVo postVo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String sql = "";
		
		try {
			con = JdbcUtils.getConnection();
			
			sql  = "INSERT INTO post ";
			sql += "(postId, title, price, view, location, description, sellerId, passwd, file, category, regDate, reRef, reLev, reSeq) ";
			sql += "VALUES (?, ?, ?, ?, ?, ?, ?, ? ,?, ?, ?, ?, ?, ?) ";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, postVo.getPostId());
			pstmt.setString(2, postVo.getTitle());
			pstmt.setInt(3, postVo.getPrice());
			pstmt.setInt(4, postVo.getView());
			pstmt.setString(5, postVo.getLocation());
			pstmt.setString(6, postVo.getDescription());
			pstmt.setString(7, postVo.getSellerId());
			pstmt.setString(8, postVo.getPasswd());
			pstmt.setString(9, postVo.getFile());
			pstmt.setString(10, postVo.getCategory());
			pstmt.setTimestamp(11, postVo.getRegDate());
			pstmt.setInt(12, postVo.getReRef());
			pstmt.setInt(13, postVo.getReLev());
			pstmt.setInt(14, postVo.getReSeq());

			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt);
		}
	} // addPost
	
	//deletePost
	public void deletePost(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		try {
			con = JdbcUtils.getConnection();
			sql = "DELETE FROM post WHERE postId = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt);
		}
	} //deletePost
	
	// deleteALl
	public void deleteAll() {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = JdbcUtils.getConnection();
			
			String sql = "DELETE FROM post";
			pstmt = con.prepareStatement(sql);
			
			pstmt.executeUpdate();
			System.out.println("모든 테이블 데이터 삭제완료");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt);
		}
	} // deleteAll
	
	public void deleteOneCategory(String category) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		
		try {
			con = JdbcUtils.getConnection();
			
			sql = "DELETE FROM post";
			sql += "WHERE category = ?";
					
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, category);
			
			pstmt.executeUpdate();
			System.out.println(category + "테이블 데이터 삭제완료");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt);
		}
	} // deleteOneCategory
	
	public List<PostVo> getPostList(int startRow, int pageSize) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<PostVo> list = new ArrayList<>();
		String sql = "";
		
		try {
			con = JdbcUtils.getConnection();
			
			sql  = "SELECT * ";
			sql += "FROM post ";
			sql += "ORDER BY postId DESC ";
			sql += "LIMIT ?, ? ";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, pageSize);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				PostVo postVo = new PostVo();
				postVo.setPostId(rs.getInt("postId"));
				postVo.setTitle(rs.getString("title"));
				postVo.setPrice(rs.getInt("price"));
				postVo.setView(rs.getInt("view"));
				postVo.setLocation(rs.getString("location"));
				postVo.setDescription(rs.getString("description"));
				postVo.setSellerId(rs.getString("sellerId"));
				postVo.setPasswd(rs.getString("passwd"));
				postVo.setFile(rs.getString("file"));
				postVo.setCategory(rs.getString("category"));
				postVo.setRegDate(rs.getTimestamp("regDate"));
				postVo.setReRef(rs.getInt("reRef"));
				postVo.setReLev(rs.getInt("reLev"));
				postVo.setReSeq(rs.getInt("reSeq"));
				list.add(postVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt, rs);
		}
		return list;
	} 	// getPostList
	
	public List<PostVo> getPostList(String category, int startRow, int pageSize) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<PostVo> list = new ArrayList<>();
		String sql = "";
		
		try {
			con = JdbcUtils.getConnection();
			
			sql  = "SELECT * ";
			sql += "FROM post ";
			sql += "WHERE category = ? ";
			sql += "ORDER BY postId DESC ";
			sql += "LIMIT ?, ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, category);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, pageSize);
//			pstmt.setInt(1, startRow);
//			pstmt.setInt(2, pageSize);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				PostVo postVo = new PostVo();
				postVo.setPostId(rs.getInt("postId"));
				postVo.setTitle(rs.getString("title"));
				postVo.setPrice(rs.getInt("price"));
				postVo.setView(rs.getInt("view"));
				postVo.setLocation(rs.getString("location"));
				postVo.setDescription(rs.getString("description"));
				postVo.setSellerId(rs.getString("sellerId"));
				postVo.setPasswd(rs.getString("passwd"));
				postVo.setFile(rs.getString("file"));
				postVo.setCategory(rs.getString("category"));
				postVo.setRegDate(rs.getTimestamp("regDate"));
				postVo.setReRef(rs.getInt("reRef"));
				postVo.setReLev(rs.getInt("reLev"));
				postVo.setReSeq(rs.getInt("reSeq"));
				
				list.add(postVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt, rs);
		}
		return list;
	} 	// getPostList

	// updatePost
	public void updatePost(PostVo postVo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String sql = "";
		
		try {
			con = JdbcUtils.getConnection();
			
			sql  = "UPDATE post ";
			sql += "SET title = ?, price = ?, location = ?, description = ?, passwd = ? ,file = ?, category = ? ";
			sql += "WHERE postId = ? ";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, postVo.getTitle());
			pstmt.setInt(2, postVo.getPrice());
			pstmt.setString(3, postVo.getLocation());
			pstmt.setString(4, postVo.getDescription());
			pstmt.setString(5, postVo.getPasswd());
			pstmt.setString(6, postVo.getFile());
			pstmt.setString(7, postVo.getCategory());
			pstmt.setInt(8, postVo.getPostId());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt);
		}
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
			
			sql  = "SELECT IFNULL(MAX(postId), 0) + 1 AS next_num ";
			sql += "FROM post";
			
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
	} // getNextNum()
	
	
	// 전체글갯수 가져오기
	public int getPostsCount() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int count = 0;
		String sql = "";
		
		try {
			con = JdbcUtils.getConnection();
			
			sql = "SELECT COUNT(*) FROM post";
//			sql += "WHERE category = ?";
			
			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, category);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt, rs);
		}
		return count;
	} // getPostsCount()

	
	// updatePostView
	public void updatePostView(int postNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String sql = "";
		
		try {
			con = JdbcUtils.getConnection();
			
			sql  = "UPDATE post ";
			sql += "SET view = view + 1 ";
			sql += "WHERE postId = ? ";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, postNum);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt);
		}
	} // updatePostView
	
	// getPostByNum
	public PostVo getPostByNum(int postNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		PostVo postVo = null;
		String sql = "";
		
		try {
			con = JdbcUtils.getConnection();
			
			sql = "SELECT * FROM post ";
			sql += "WHERE postId = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, postNum);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				postVo = new PostVo();
				
				postVo.setPostId(rs.getInt("postId"));
				postVo.setTitle(rs.getString("title"));
				postVo.setPrice(rs.getInt("price"));
				postVo.setView(rs.getInt("view"));
				postVo.setLocation(rs.getString("location"));
				postVo.setDescription(rs.getString("description"));
				postVo.setSellerId(rs.getString("sellerId"));
				postVo.setPasswd(rs.getString("passwd"));
				postVo.setFile(rs.getString("file"));
				postVo.setCategory(rs.getString("category"));
				postVo.setRegDate(rs.getTimestamp("regDate"));
				postVo.setReRef(rs.getInt("reRef"));
				postVo.setReLev(rs.getInt("reLev"));
				postVo.setReSeq(rs.getInt("reSeq"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt, rs);
		}
		return postVo;
	} //getPostByNum

	// makeTestSampels
	public static void makeTestSamples(PostDao postDao) {
		for(int i=0; i<60; i++) {
			PostVo postVo = new PostVo();
			int nextNum = postDao.getNextNum();
			postVo.setPostId(nextNum);
			postVo.setTitle("여자 다운 자켓팔아요" + i);
			postVo.setPrice(i*100);
			postVo.setView(0);
			postVo.setLocation("부산");
			postVo.setDescription("여자 다운자켓 싸게 팝니다. " + i + "모델 급처요~");
			postVo.setSellerId("최미희"+i);
			postVo.setPasswd("1");
			postVo.setFile("sample1");
			postVo.setCategory("female");
			
			System.out.println(postVo);
			
			postDao.addPost(postVo);
			
		}
		for(int i=0; i<60; i++) {
			PostVo postVo = new PostVo();
			int nextNum = postDao.getNextNum();
			postVo.setPostId(nextNum);
			postVo.setTitle("스왈로브스키 목걸이 " + i);
			postVo.setPrice(i*1000);
			postVo.setView(0);
			postVo.setLocation("서울");
			postVo.setDescription(i+"개월 사용한 스왈로브스키 목걸이 " + i + "모델 급처요~");
			postVo.setSellerId("이서연"+i);
			postVo.setPasswd("1");
			postVo.setFile("sample2");
			postVo.setCategory("accessory");
			
			System.out.println(postVo);
			
			postDao.addPost(postVo);
			
		}
		for(int i=0; i<60; i++) {
			PostVo postVo = new PostVo();
			int nextNum = postDao.getNextNum();
			postVo.setPostId(nextNum);
			postVo.setTitle("나이키 바람막이 " + i +"시리즈");
			postVo.setPrice(i*1100);
			postVo.setView(0);
			postVo.setLocation("대구");
			postVo.setDescription("한국에 " + i +"개 있는 리미티드 에디션 " + i + "모델 급처요~");
			postVo.setSellerId("장형욱"+i);
			postVo.setPasswd("1");
			postVo.setFile("sample3");
			postVo.setCategory("male");
			
			System.out.println(postVo);
			
			postDao.addPost(postVo);
			
		}
		for(int i=0; i<60; i++) {
			PostVo postVo = new PostVo();
			int nextNum = postDao.getNextNum();
			postVo.setPostId(nextNum);
			postVo.setTitle("아이폰 " + i + " Pro");
			postVo.setPrice(i*1000);
			postVo.setView(0);
			postVo.setLocation("서울");
			postVo.setDescription("아이폰" + i + " Pro 싸게팝니다. " + "☆직거래 환영☆");
			postVo.setSellerId("박칼린"+i);
			postVo.setPasswd("1");
			postVo.setFile("sample4");
			postVo.setCategory("digital");
			
			System.out.println(postVo);
			
			postDao.addPost(postVo);
			
		}
	}
	
	public static void main(String[] args) {
		
		PostDao postDao = new PostDao();
		int count = postDao.getPostsCount();
		
		// makeTestSamples(postDao);
		
	} // main method
}