package com.neuma573.studycafe.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import net.utility.DBClose;
import net.utility.DBOpen;

public class LoginDAO {
	private DBOpen dbopen = null;
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private StringBuilder sql = null;

	public LoginDAO() {
		dbopen = new DBOpen();
		con = dbopen.getConnection();
	}// end

	public LoginDTO loginProc(LoginDTO dto) {
		LoginDTO DTO = new LoginDTO();
		try {
			con = dbopen.getConnection();
			sql = new StringBuilder();
			sql.append(" SELECT * ");
			sql.append(" from tb_member_in ");
			sql.append(" WHERE in_email=? and in_pw=? ");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getEmail());
			pstmt.setString(2, dto.getPw());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				System.out.println("1");
				DTO.setEmail(rs.getString(1));
				DTO.setPw(rs.getString(2));
				DTO.setUser("in");
			} else{
				System.out.println("2");
				con = dbopen.getConnection();
				sql = new StringBuilder();
				sql.append(" SELECT * ");
				sql.append(" from tb_member_en ");
				sql.append(" WHERE en_email=? and en_pw=? ");
				pstmt = con.prepareStatement(sql.toString());
				pstmt.setString(1, dto.getEmail());
				pstmt.setString(2, dto.getPw());
				rs = pstmt.executeQuery();
				if (rs.next()) {				
					DTO.setEmail(rs.getString(1));
					DTO.setPw(rs.getString(2));
					DTO.setUser("en");
				}else {
					DTO=null;
				}
			}
		} catch (Exception e) {
			System.out.println("로그인 실패" + e);
		} finally {
			DBClose.close(con, pstmt);
		} // end
		return DTO;
	}// create() end
	
	

}
