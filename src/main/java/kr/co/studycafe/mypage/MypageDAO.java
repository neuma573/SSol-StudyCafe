package kr.co.studycafe.mypage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import net.utility.DBClose;
import net.utility.DBOpen;

public class MypageDAO {
	private DBOpen dbopen =null;
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private StringBuilder sql = null;
	
	public MypageDAO() {
		System.out.println("==========MypageDAO() 시작");
		dbopen = new DBOpen();
	}

	
	public ArrayList<MypageDTO> seatlist(String uid){
		ArrayList<MypageDTO> seatlist = null;
		try {
			con=dbopen.getConnection();
			sql=new StringBuilder();
			sql.append(" SELECT sres_no, res_date, times, store_no, seat_code, prog");
			sql.append(" FROM tb_seat_res ");
			sql.append(" WHERE in_email = ? AND pay_prog = 'Y' ");
			sql.append(" ORDER BY sres_no DESC ");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, uid);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				seatlist = new ArrayList<MypageDTO>();
				do {
					MypageDTO dto = new MypageDTO();
					dto.setSres_no(rs.getInt("sres_no"));
					dto.setRes_date(rs.getString("res_date"));
					dto.setTimes(rs.getString("times"));
					dto.setStore_no(rs.getInt("store_no"));
					dto.setSeat_code(rs.getString("seat_code"));
					dto.setProg(rs.getInt("prog"));
					seatlist.add(dto);
				}while(rs.next());
			}
		}catch (Exception e) {
			System.out.println("seatlist 실패 : "+e);
		}finally {
			DBClose.close(con, pstmt, rs);
		}
		return seatlist;
	}// seatlist() end
	
	public ArrayList<MypageDTO> lockerlist(String uid){
		ArrayList<MypageDTO> lockerlist = null;
		try {
			con=dbopen.getConnection();
			sql=new StringBuilder();
			sql.append(" SELECT lres_no, s_date, e_date, store_no, locker_code, prog");
			sql.append(" FROM tb_locker_res ");
			sql.append(" WHERE in_email = ? AND pay_prog = 'Y' ");
			sql.append(" ORDER BY lres_no DESC ");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, uid);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				lockerlist = new ArrayList<MypageDTO>();
				do {
					MypageDTO dto = new MypageDTO();
					dto.setLres_no(rs.getInt("lres_no"));
					dto.setS_date(rs.getString("s_date"));
					dto.setE_date(rs.getString("e_date"));
					dto.setStore_no(rs.getInt("store_no"));
					dto.setLocker_code(rs.getString("locker_code"));
					dto.setProg(rs.getInt("prog"));
					lockerlist.add(dto);
				}while(rs.next());
			}
		}catch (Exception e) {
			System.out.println("lockerlist 실패 : "+e);
		}finally {
			DBClose.close(con, pstmt, rs);
		}
		return lockerlist;
	}// lockerlist() end

}

