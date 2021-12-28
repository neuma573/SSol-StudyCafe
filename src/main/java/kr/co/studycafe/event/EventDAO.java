package kr.co.studycafe.event;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import kr.co.studycafe.place.PlaceDTO;
import kr.co.studycafe.question.StoreDTO;
import net.utility.DBClose;
import net.utility.DBOpen;

public class EventDAO {
	private DBOpen dbopen=null;
    private Connection con=null;
    private PreparedStatement pstmt=null;
    private ResultSet rs=null;
    private StringBuilder sql=null;
    
    public EventDAO() {
    	System.out.println("======EvnetDAO() 시작");
        dbopen=new DBOpen();
    }//end
    
    public ArrayList<EventDTO> event_list(){
		ArrayList<EventDTO> event_list = null;
		try {
			con=dbopen.getConnection();
			sql=new StringBuilder();
			sql.append(" SELECT e_number, en_email, e_title, e_content, e_image, e_start, e_end, e_winners, e_money");
			sql.append(" FROM tb_event ");
			sql.append(" ORDER BY e_number DESC ");
			pstmt=con.prepareStatement(sql.toString());
			rs=pstmt.executeQuery();
			if(rs.next()) {
				event_list = new ArrayList<EventDTO>();
				do {
					EventDTO dto = new EventDTO();
					dto.setE_number(rs.getInt("e_number"));
					dto.setEn_email(rs.getString("en_email"));
					dto.setE_title(rs.getString("e_title"));
					dto.setE_content(rs.getString("e_content"));
					dto.setE_image(rs.getString("e_image"));
					dto.setE_start(rs.getString("e_start"));
					dto.setE_end(rs.getString("e_end"));
					dto.setE_winners(rs.getInt("e_winners"));
					dto.setE_money(rs.getInt("e_money"));
					event_list.add(dto);
				}while(rs.next());
			}//if end
		}catch (Exception e) {
			System.out.println("event_list 실패 : "+e);
		}finally {
			DBClose.close(con, pstmt, rs);
		}
		return event_list;
	}//event_list() end
    
    public int event_write(EventDTO dto) {
		int cnt=0;
		try {
			con=dbopen.getConnection();
			sql=new StringBuilder();
			sql.append(" INSERT INTO tb_event (en_email, e_title, e_content, e_image, e_start, e_end, e_winners, e_money) ");
			sql.append(" VALUES(?, ?, ?, ?, ?, ?, ?, ?) ");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getEn_email());
			pstmt.setString(2, dto.getE_title());
			pstmt.setString(3, dto.getE_content());
			pstmt.setString(4, dto.getE_image());
			pstmt.setString(5, dto.getE_start());
			pstmt.setString(6, dto.getE_end());
			pstmt.setInt(7, dto.getE_winners());
			pstmt.setInt(8, dto.getE_money());
			cnt=pstmt.executeUpdate();
		}catch (Exception e) {
			System.out.println("event_write 실패 : "+e);
		}finally {
			DBClose.close(con, pstmt);
		}
		return cnt;
	}//event_write() end
    
	
	public EventDTO event_read(int e_number) {
		EventDTO dto=null;
		try {
			con=dbopen.getConnection();
			sql=new StringBuilder();
			sql.append(" SELECT e_number, en_email, e_title, e_content, e_image, e_start, e_end, e_winners, e_money ");
			sql.append(" FROM tb_event ");
			sql.append(" WHERE e_number=? ");
			sql.append(" ORDER BY e_number DESC ");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, e_number);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto = new EventDTO();
				dto.setE_number(rs.getInt("e_number"));
				dto.setEn_email(rs.getString("en_email"));
				dto.setE_title(rs.getString("e_title"));
				dto.setE_content(rs.getString("e_content"));
				dto.setE_image(rs.getString("e_image"));
				dto.setE_start(rs.getString("e_start"));
				dto.setE_end(rs.getString("e_end"));
				dto.setE_winners(rs.getInt("e_winners"));
				dto.setE_money(rs.getInt("e_money"));
			}
			
		}catch (Exception e) {
			System.out.println("event_read 실패 : " + e);
		}finally {
			DBClose.close(con, pstmt, rs);
		}
		
		return dto;
	}//event_read() end
	
	public int event_modify(EventDTO dto) {
		int cnt=0;
		try {
			con=dbopen.getConnection();
			sql=new StringBuilder();
			sql.append(" UPDATE tb_event SET en_mail=?, e_title=?, e_start=?, e_end=?, e_winners=?, e_money=?, e_content=?, e_image=? ");
			sql.append(" WHERE e_number = ? ");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getEn_email());
			pstmt.setString(2, dto.getE_title());
			pstmt.setString(3, dto.getE_start());
			pstmt.setString(4, dto.getE_end());
			pstmt.setInt(5, dto.getE_winners());
			pstmt.setInt(6, dto.getE_money());
			pstmt.setString(7, dto.getE_content());
			pstmt.setString(8, dto.getE_image());
			pstmt.setInt(9, dto.getE_number());
			cnt=pstmt.executeUpdate();
		}catch (Exception e) {
			System.out.println("event_modify 실패 : "+e);
		}finally {
			DBClose.close(con, pstmt);
		}
		
		return cnt;
		
	}//event_modify() end
	
	public int event_delete(int e_number) {
		int cnt=0;
		try {
			con=dbopen.getConnection();
			sql=new StringBuilder();
			sql.append(" DELETE FROM tb_event ");
			sql.append(" WHERE e_number = ? ");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, e_number);
			cnt=pstmt.executeUpdate();
		}catch (Exception e) {
			System.out.println("event_delete 실패 : "+e);
		}finally {
			DBClose.close(con, pstmt);
		}
		
		return cnt;
		
	}//event_delete() end
	
	public ArrayList<EventDTO> eventInfolist(String uid) { //이벤트 개최 정보
		ArrayList<EventDTO> list = null;

		try {
			con = dbopen.getConnection();
			sql = new StringBuilder();
			sql.append(" select * ");
			sql.append(" from tb_event ");
			sql.append(" where en_email=? ");
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, uid);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				list = new ArrayList<EventDTO>();
				do {
					EventDTO dto = new EventDTO();
					dto.setE_number(rs.getInt("e_number"));
					dto.setEn_email(rs.getString("en_email"));
					dto.setE_title(rs.getString("e_title"));
					dto.setE_content(rs.getString("e_content"));
					dto.setE_image(rs.getString("e_image"));
					dto.setE_start(rs.getString("e_start"));
					dto.setE_end(rs.getString("e_end"));
					dto.setE_winners(rs.getInt("e_winners"));
					dto.setE_money(rs.getInt("e_money"));
					list.add(dto); // list에 모으기
				} while (rs.next());
			} // end
		} catch (Exception e) {
			System.out.println("개최 이벤트 정보 목록 실패: " + e);
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		return list;
	}

}//class end
