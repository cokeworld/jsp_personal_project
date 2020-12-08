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
import com.vo.UserVo;

public class PostDao {
	
	public void addUser(UserVo zangtuVo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		try {
			con = JdbcUtils.getConnection();
			sql = "INSERT INTO user(id, passwd, name) "
					+ "VALUES(?, ? , ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, zangtuVo.getId());
			pstmt.setString(2, zangtuVo.getPasswd());
			pstmt.setString(3, zangtuVo.getName());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt);
		}
	}
	
	public int checkDuplicatedId(String id) {
		// 1 = 중복, 0 = 중복x
		int duplication = 1;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		
		try {
			con = JdbcUtils.getConnection();
			sql = "SELECT COUNT(*) FROM user"
					+ "WHERE id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				duplication = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt, rs);
		}
		return duplication;
	}
	
	public int checkUser(String id, String passwd) {
		// 1: id passwd 인증성공
		// 0: id 틀림
		// -1: pass 틀림
		
		int checkCount = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		
		try {
			con = JdbcUtils.getConnection();
			sql = "SELECT passwd FROM user WHERE id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(passwd.equals(rs.getString("passwd"))) {
					checkCount=1;
				} else {
					checkCount=-1;
				}
			} else {
				// id 틀림
				checkCount = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt, rs);
		}
		return checkCount;
	}

	public List<PostVo> getPostList(String tableName, int startRow, int pageSize) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<PostVo> list = new ArrayList<>();
		String sql = "";
		
		try {
			con = JdbcUtils.getConnection();
			
			sql  = "SELECT * ";
			sql += "FROM " + tableName + " ";
			sql += "ORDER BY id DESC ";
			sql += "LIMIT ?, ? ";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, pageSize);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				PostVo postVo = new PostVo();
				postVo.setId(rs.getInt("id"));
				postVo.setTitle(rs.getString("title"));
				postVo.setPrice(rs.getInt("price"));
				postVo.setView(rs.getInt("view"));
				postVo.setLocation(rs.getString("location"));
				postVo.setDescription(rs.getString("description"));
				postVo.setSeller(rs.getString("seller"));
				postVo.setPasswd(rs.getString("passwd"));
				postVo.setFile(rs.getString("file"));
				
				list.add(postVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt, rs);
		}
		return list;
	} // getPosts()
	public int getNextNum(String tableName) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int nextNum = 0;
		String sql = "";
		
		try {
			con = JdbcUtils.getConnection();
			
			sql  = "SELECT IFNULL(MAX(id), 0) + 1 AS next_num ";
			sql += "FROM " + tableName;
			
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
	public int getPostsCount(String tableName) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int count = 0;
		String sql = "";
		
		try {
			con = JdbcUtils.getConnection();
			
			sql = "SELECT COUNT(*) FROM " + tableName;
			
			pstmt = con.prepareStatement(sql);
			
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
	

	

	// addPost
	public void addPost(String tableName, PostVo postVo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String sql = "";
		
		try {
			con = JdbcUtils.getConnection();
			
			sql  = "INSERT INTO " + tableName + " (id, title, price, view, location, description, seller, passwd, file) ";
			sql += "VALUES (?, ?, ?, ?, ?, ?, ?, ? ,?) ";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, postVo.getId());
			pstmt.setString(2, postVo.getTitle());
			pstmt.setInt(3, postVo.getPrice());
			pstmt.setInt(4, postVo.getView());
			pstmt.setString(5, postVo.getLocation());
			pstmt.setString(6, postVo.getDescription());
			pstmt.setString(7, postVo.getSeller());
			pstmt.setString(8, postVo.getPasswd());
			pstmt.setString(9, postVo.getFile());

			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt);
		}
	} // addPost
	
	public void deleteAll(String tableName) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = JdbcUtils.getConnection();
			
			String sql = "DELETE FROM " + tableName;
			pstmt = con.prepareStatement(sql);
			
			pstmt.executeUpdate();
			System.out.println(tableName + "테이블 데이터 삭제완료");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt);
		}
	} // deleteAll
	
	// updatePostView
	public void updatePostView(String boardName, int postNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		String sql = "";
		
		try {
			con = JdbcUtils.getConnection();
			
			sql  = "UPDATE " + boardName + " ";
			sql += "SET view = view + 1 ";
			sql += "WHERE id = ? ";
			
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
	public PostVo getPostByNum(String tableName, int postNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		PostVo postVo = null;
		String sql = "";
		
		try {
			con = JdbcUtils.getConnection();
			
			sql = "SELECT * FROM " + tableName + " " + "WHERE id = ?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, postNum);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				postVo = new PostVo();
				
				postVo.setId(rs.getInt("id"));
				postVo.setTitle(rs.getString("title"));
				postVo.setPrice(rs.getInt("price"));
				postVo.setView(rs.getInt("view"));
				postVo.setLocation(rs.getString("location"));
				postVo.setDescription(rs.getString("description"));
				postVo.setSeller(rs.getString("seller"));
				postVo.setPasswd(rs.getString("passwd"));
				postVo.setFile(rs.getString("file"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt, rs);
		}
		return postVo;
	} //getPostByNum

	
// main method
public static void main(String[] args) {
	
	PostDao postDao = new PostDao();
	postDao.deleteAll("female");
	for(int i=0; i<100; i++) {
		PostVo postVo = new PostVo();
		int nextNum = postDao.getNextNum("female");
		postVo.setId(nextNum);
		postVo.setTitle("자전거 팔아요~" + i);
		postVo.setPrice(i*100);
		postVo.setView(0);
		postVo.setLocation("부산");
		postVo.setDescription(i+"개월 사용한 삼천리 " + i + "모델 급처요~");
		postVo.setSeller("꾀돌이"+i);
		postVo.setPasswd("1");
		
		System.out.println(postVo);
		
		postDao.addPost("female", postVo);
		
	}
} // main method
}
