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

	
	public ArrayList<MypageDTO> seatlist(int in_email){
		ArrayList<MypageDTO> seatlist = null;
		try {
			con=dbopen.getConnection();
			sql=new StringBuilder();
			sql.append(" SELECT tb_seat_res.in_email, in_name, sres_no, res_date, times, store_no, seat_code, prog");
			sql.append(" FROM tb_seat_res ");
			sql.append(" JOIN tb_member_in ");
			sql.append(" ON tb_seat_re.in_email = tb_member_in.in_email ");
			sql.append(" WHERE in_email = ? ");
			sql.append(" ORDER BY sres_no DESC ");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, in_email);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				seatlist = new ArrayList<MypageDTO>();
				do {
					MypageDTO dto = new MypageDTO();
					dto.setIn_email(rs.getString("in_email"));
					dto.setIn_name(rs.getString("in_name"));
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

}

