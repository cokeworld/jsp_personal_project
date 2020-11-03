package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.vo.ZangtuVo;

public class ZangtuDao {
	
	public ZangtuDao() {}
	
	private static ZangtuDao instance = new ZangtuDao();
	
	public static ZangtuDao getInstance() {
		return instance;
	}
	
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
}
