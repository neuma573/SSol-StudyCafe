package com.neuma573.studycafe.join;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import net.utility.DBClose;
import net.utility.DBOpen;

public class JoinDAO {
	private DBOpen dbopen = null;
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private StringBuilder sql = null;

	public JoinDAO() {
		dbopen = new DBOpen();
		con = dbopen.getConnection();
	}// end

	public int emailCheck(String email, String user) {
		int check = 1;
		try {
			con = dbopen.getConnection();
			sql = new StringBuilder();
			sql.append(" SELECT * ");
			sql.append(" FROM tb_member_in");
			sql.append(" WHERE in_email=?");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				check = 0;
			} // if end

			con = dbopen.getConnection();
			sql = new StringBuilder();
			sql.append(" SELECT * ");
			sql.append(" FROM tb_member_en");
			sql.append(" WHERE en_email=?");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				check = 0;
			} // if end

			System.out.println(check);

		} catch (Exception e) {
			System.out.println("Email 중복 확인 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt, rs);
		} // end
		return check;
	}

	public int joinProc_in(Join_inDTO dto) {
		int cnt = 0;
		try {
			con = dbopen.getConnection();
			sql = new StringBuilder();
			sql.append(" INSERT INTO tb_member_in ");
			sql.append(" VALUES(?, ?, ?, ?) ");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getIn_email());
			pstmt.setString(2, dto.getIn_pw());
			pstmt.setString(3, dto.getIn_name());
			pstmt.setString(4, dto.getIn_birth());
			cnt = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("회원가입 실패: " + e);
		} finally {
			DBClose.close(con, pstmt);
		}
		return cnt;
	}

	public int joinProc_en(Join_enDTO dto) {
		int cnt = 0;
		try {
			con = dbopen.getConnection();
			sql = new StringBuilder();
			sql.append(" INSERT INTO tb_member_en ");
			sql.append(" VALUES(?, ?, ?, ?, ?) ");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getEn_email());
			pstmt.setString(2, dto.getEn_pw());
			pstmt.setString(3, dto.getEn_name());
			pstmt.setString(4, dto.getEn_birth());
			pstmt.setString(5, dto.getEn_no());
			cnt = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("회원가입 실패: " + e);
		} finally {
			DBClose.close(con, pstmt);
		}
		return cnt;
	}

	// email 로 name 가져오기
	public String userName(String email) {
		String userName = null;
		try {
			con = dbopen.getConnection();
			sql = new StringBuilder();
			sql.append(" SELECT in_name ");
			sql.append(" FROM tb_member_in");
			sql.append(" WHERE in_email=?");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				userName = rs.getString("in_name");
			} // if end

			con = dbopen.getConnection();
			sql = new StringBuilder();
			sql.append(" SELECT en_name ");
			sql.append(" FROM tb_member_en");
			sql.append(" WHERE en_email=?");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				userName = rs.getString("en_name");
			} // if end

		} catch (Exception e) {
			System.out.println("Name가져오기 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt, rs);
		} // end
		return userName;
	}

	// uid받아서 등록된 회원종류찾기
	public String userType(String uid) {
		String userType=null;
		try {
			con = dbopen.getConnection();
			sql = new StringBuilder();
			sql.append(" SELECT * ");
			sql.append(" from tb_member_in ");
			sql.append(" WHERE in_email=? ");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, uid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				userType="in";
			} else {
				con = dbopen.getConnection();
				sql = new StringBuilder();
				sql.append(" SELECT * ");
				sql.append(" from tb_member_en ");
				sql.append(" WHERE en_email=? ");
				pstmt = con.prepareStatement(sql.toString());
				pstmt.setString(1, uid);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					userType="en";
				} else {
					userType = null;
				}
			}
		} catch (Exception e) {
			System.out.println("회원종류 찾기 실패" + e);
		} finally {
			DBClose.close(con, pstmt);
		} // end
		return userType;
	}// create() end
	
	//email로 사업자 회원정보 가져오기
	public Join_enDTO userInfo_en(String email) {
		Join_enDTO DTO = new Join_enDTO();
		try {
			con = dbopen.getConnection();
			sql = new StringBuilder();
			sql.append(" SELECT * ");
			sql.append(" FROM tb_member_en");
			sql.append(" WHERE en_email=?");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				DTO.setEn_email(rs.getString("en_email"));
				DTO.setEn_name(rs.getString("en_name"));
				DTO.setEn_birth(rs.getString("en_birth"));
				DTO.setEn_no(rs.getString("en_no"));
			} // if end

		} catch (Exception e) {
			System.out.println("회원 정보 가져오기 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt, rs);
		} // end
		return DTO;
	}
	//email로 개인 회원정보 가져오기
	public Join_inDTO userInfo_in(String email) {
		Join_inDTO DTO = new Join_inDTO();
		try {
			con = dbopen.getConnection();
			sql = new StringBuilder();
			sql.append(" SELECT * ");
			sql.append(" FROM tb_member_in");
			sql.append(" WHERE in_email=?");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				DTO.setIn_email(rs.getString("in_email"));
				DTO.setIn_name(rs.getString("in_name"));
				DTO.setIn_birth(rs.getString("in_birth"));
			} // if end

		} catch (Exception e) {
			System.out.println("회원 정보 가져오기 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt, rs);
		} // end
		return DTO;
	}
}
