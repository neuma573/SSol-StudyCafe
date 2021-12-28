package kr.co.studycafe.question;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import kr.co.studycafe.place.PlaceDTO;
import net.utility.DBClose;
import net.utility.DBOpen;

public class StoreDAO {
	private DBOpen dbopen = null;
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private StringBuilder sql = null;

	public StoreDAO() {
		dbopen = new DBOpen();
		con = dbopen.getConnection();
	}// end

	public int write(StoreDTO dto) {// 12
		int cnt = 0;
		try {
			con = dbopen.getConnection();
			sql = new StringBuilder();
			sql.append(
					" INSERT INTO tb_store_info(store_name,store_address,operating_hours,store_en_no,room_count,desk_count,box_count, store_img, latitude, longitude, tel, en_email) ");
			sql.append(" VALUES(?, ?, ?, ?, ?, ?, ?,?,?,?,?,?); ");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getStore_name());
			pstmt.setString(2, dto.getStore_address());
			pstmt.setString(3, dto.getOperating_hours());
			pstmt.setString(4, dto.getStore_en_no());
			pstmt.setInt(5, dto.getRoom_count());
			pstmt.setInt(6, dto.getDesk_count());
			pstmt.setInt(7, dto.getBox_count());
			pstmt.setString(8, dto.getStore_img());
			pstmt.setDouble(9, dto.getLatitude());
			pstmt.setDouble(10, dto.getLongitude());
			pstmt.setString(11, dto.getTel());
			pstmt.setString(12, dto.getEn_email());
			cnt = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("지점등록 실패 : " + e);
		} finally {
			DBClose.close(con, pstmt);
		}
		return cnt;
	}// write()

	public ArrayList<StoreDTO> StoreList() {
		ArrayList<StoreDTO> list = null;

		try {
			con = dbopen.getConnection();
			sql = new StringBuilder();
			sql.append(" select * ");
			sql.append(" from tb_store_info ");
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				list = new ArrayList<StoreDTO>();
				do {
					StoreDTO dto = new StoreDTO();
					dto.setStore_no(rs.getInt("store_no"));
					dto.setEn_email(rs.getString("en_email"));
					dto.setStore_name(rs.getString("store_name"));
					dto.setStore_address(rs.getString("store_address"));
					dto.setOperating_hours(rs.getString("operating_hours"));
					dto.setStore_en_no(rs.getString("store_en_no"));
					dto.setRoom_count(rs.getInt("room_count"));
					dto.setDesk_count(rs.getInt("desk_count"));
					dto.setBox_count(rs.getInt("box_count"));
					dto.setStore_img(rs.getString("store_img"));
					dto.setTel(rs.getString("tel"));
					dto.setLatitude(rs.getDouble("latitude"));
					dto.setLongitude(rs.getDouble("longitude"));
					list.add(dto); // list에 모으기
				} while (rs.next());
			} // end
		} catch (Exception e) {
			System.out.println("매장 정보 목록 실패: " + e);
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		return list;
	}

	public String storeName(String store_no) {
		String name = null;
		try {
			con = dbopen.getConnection();
			sql = new StringBuilder();
			sql.append(" SELECT * ");
			sql.append(" from tb_store_info");
			sql.append(" WHERE store_no=? ");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, store_no);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				name = rs.getString("store_name");
			}
		} catch (Exception e) {
			System.out.println("로그인 실패" + e);
		} finally {
			DBClose.close(con, pstmt);
		} // end
		return name;
	}// create() end
	
	public ArrayList<StoreDTO> storeInfolist(String uid) { //사업자 보유 지점 정보 리스트
		ArrayList<StoreDTO> list = null;

		try {
			con = dbopen.getConnection();
			sql = new StringBuilder();
			sql.append(" select * ");
			sql.append(" from tb_store_info ");
			sql.append(" where en_email=? ");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, uid);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				list = new ArrayList<StoreDTO>();
				do {
					StoreDTO dto = new StoreDTO();
					dto.setStore_no(rs.getInt("store_no"));
					dto.setEn_email(rs.getString("en_email"));
					dto.setStore_name(rs.getString("store_name"));
					dto.setStore_address(rs.getString("store_address"));
					dto.setOperating_hours(rs.getString("operating_hours"));
					dto.setRoom_count(rs.getInt("room_count"));
					dto.setDesk_count(rs.getInt("desk_count"));
					dto.setBox_count(rs.getInt("box_count"));
					dto.setStore_img(rs.getString("store_img"));
					dto.setStore_en_no(rs.getString("store_en_no"));
					dto.setTel(rs.getString("tel"));
					dto.setLatitude(rs.getDouble("latitude"));
					dto.setLongitude(rs.getDouble("longitude"));
					list.add(dto); // list에 모으기
				} while (rs.next());
			} // end
		} catch (Exception e) {
			System.out.println("보유 매장 정보 목록 실패: " + e);
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		return list;
	}
}
