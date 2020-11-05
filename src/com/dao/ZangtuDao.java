package com.dao;

import java.sql.Connection;
import java.sql.JDBCType;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.tomcat.dbcp.dbcp2.cpdsadapter.PStmtKeyCPDS;

import com.mysql.cj.protocol.Resultset;
import com.vo.ZangtuVo;

public class ZangtuDao {
	
	public void addUser(ZangtuVo zangtuVo) {
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
	
	public List<ZangtuVo> getPostList() {
		List<ZangtuVo> postList = new ArrayList<>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "";
		
		try {
			con = JdbcUtils.getConnection();
			sql = "SELECT * FROM user";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ZangtuVo vo = new ZangtuVo();
				vo.setName(rs.getString("name"));
				vo.setSubject(rs.getString("subject"));
				vo.setContent(rs.getString("name"));
				vo.setReadCount(rs.getInt("readCount"));
				postList.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtils.close(con, pstmt, rs);
		}
		return postList;
	}
}
