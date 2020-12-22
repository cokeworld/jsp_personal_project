package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.vo.UserVo;

public class UserDao {

	private static UserDao instance = new UserDao();
	public static UserDao getInstance() {
		return instance;
	}
	
	public void addUser(UserVo userVo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = "";
		try {
			con = JdbcUtils.getConnection();
			sql = "INSERT INTO user(userId, passwd, name) "
					+ "VALUES(?, ? , ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userVo.getUserId());
			pstmt.setString(2, userVo.getPasswd());
			pstmt.setString(3, userVo.getName());
//			pstmt.setTimestamp(4, userVo.getRegDate());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt);
		}
	}
	
	public int checkDuplicatedId(String userId) {
		// 1 = 중복, 0 = 중복x
		int duplication = 1;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		
		try {
			con = JdbcUtils.getConnection();
			sql = "SELECT COUNT(*) FROM user"
					+ "WHERE userId = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userId);
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
	
	public int checkUser(String userId, String passwd) {
		// 1: userId passwd 인증성공
		// 0: userId 틀림
		// -1: pass 틀림
		
		int checkCount = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		
		try {
			con = JdbcUtils.getConnection();
			sql = "SELECT passwd FROM user WHERE userId=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(passwd.equals(rs.getString("passwd"))) {
					checkCount=1;
				} else {
					checkCount=-1;
				}
			} else {
				// userId 틀림
				checkCount = 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt, rs);
		}
		return checkCount;
	}
	
	public void deleteAll() {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = JdbcUtils.getConnection();
			
			String sql = "DELETE FROM user";
			pstmt = con.prepareStatement(sql);
			
			pstmt.executeUpdate();
			System.out.println("모든 테이블 데이터 삭제완료");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt);
		}
	} // deleteAll
	
	public static void main(String[] args) {
		UserDao dao = new UserDao();
		dao.deleteAll();
		
		// admin
		UserVo vo = new UserVo();
		vo.setUserId("a");
		vo.setPasswd("1");
		vo.setName("관리자");
		vo.setAddress("부산");
		dao.addUser(vo);
		System.out.println(vo.toString());
		
		for(int i = 0; i<5; i++) {
			vo = new UserVo();
			vo.setUserId("aaa" + i);
			vo.setPasswd("1");
			vo.setName("남도산" + i);
			vo.setAddress("부산" + i);
			dao.addUser(vo);
			System.out.println(vo.toString());
		}
		
	}
}
