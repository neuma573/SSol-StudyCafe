package kr.co.studycafe.join;

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
	
	//email 로 name 가져오기
	public String userName(String email) {
		String userName=null;
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
			System.out.println("Email 중복 확인 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt, rs);
		} // end
		return userName;
	}
}
