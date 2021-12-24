package kr.co.studycafe.reserve;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import net.utility.DBClose;
import net.utility.DBOpen;


public class ReserveDAO {
	private DBOpen dbopen = null;
	private Connection con = null;
	private PreparedStatement pstmt=null;
	private ResultSet rs = null;
	private StringBuilder sql = null;
	
	public ReserveDAO() {
		System.out.println("==================ReserveDAO() 시작");
		dbopen = new DBOpen();
	}
	
	public ArrayList<ReserveDTO> storeList(){
		ArrayList<ReserveDTO> storeList = null;
		try {
			con=dbopen.getConnection();
			sql=new StringBuilder();
			sql.append(" SELECT store_no, store_name, store_address, room_count, desk_count, box_count ");
			sql.append(" FROM tb_store_info ");
			pstmt=con.prepareStatement(sql.toString());
			rs=pstmt.executeQuery();
			if(rs.next()) {
				storeList=new ArrayList<ReserveDTO>();
				do {
					ReserveDTO dto = new ReserveDTO();
					dto.setStore_no(rs.getInt("store_no"));
					dto.setStore_name(rs.getString("store_name"));
					dto.setStore_address(rs.getString("store_address"));
					dto.setRoom_count(rs.getInt("room_count"));
					dto.setDesk_count(rs.getInt("desk_count"));
					dto.setBox_count(rs.getInt("box_count"));
					
					storeList.add(dto);
				}while(rs.next());
				
			}
			
		}catch (Exception e){
			System.out.println("reserve view 실패 : " + e);
		}finally {
			DBClose.close(con, pstmt, rs);
		}
		
		return storeList;
	}
	
	public ArrayList<ReserveDTO> resList(int store_no, String res_date){//예약내역 
		ArrayList<ReserveDTO> resList = null;
		try {
			con=dbopen.getConnection();
			sql=new StringBuilder();
			sql.append(" SELECT store_no, store_name, room_count, desk_count, seat_code, res_date, time, pay_prog ");
			sql.append(" FROM( ");
			sql.append(" 	SELECT SI.store_no, SI.store_name, SI.room_count, SI.desk_count, SR.seat_code, SR.res_date, SR.time, SR.pay_prog ");
			sql.append(" 	FROM tb_store_info SI LEFT JOIN tb_seat_res SR ");
			sql.append(" 	ON SI.store_no = SR.store_no ");
			sql.append(" )tb_SISR ");
			sql.append(" WHERE store_no = ? and res_date = ? ");
						
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, store_no);
			pstmt.setString(2, res_date);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				resList = new ArrayList<ReserveDTO>();
				do {
					ReserveDTO dto = new ReserveDTO();
					dto.setRoom_count(rs.getInt("room_count"));
					dto.setDesk_count(rs.getInt("desk_count"));
					dto.setSeat_code(rs.getString("seat_code"));
					dto.setRes_date(rs.getString("res_date"));
					dto.setTime(rs.getString("time"));
					dto.setPay_prog(rs.getString("pay_prog"));
					resList.add(dto);
				}while(rs.next());
			}
			
		}catch (Exception e) {
			System.out.println("resList 실패 : "+e);
		}finally {
			DBClose.close(con, pstmt, rs);
		}
		
		return resList;
	}
	
	
}
