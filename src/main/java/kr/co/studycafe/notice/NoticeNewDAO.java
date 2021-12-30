package kr.co.studycafe.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import kr.co.studycafe.place.PlaceDTO;
import net.utility.DBClose;
import net.utility.DBOpen;

public class NoticeNewDAO {
	private DBOpen dbopen =null;
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private StringBuilder sql = null;
	
	public NoticeNewDAO() {
		dbopen = new DBOpen();		
	}
	
	public ArrayList<NoticeNewDTO> list() {
		ArrayList<NoticeNewDTO> list = null;
		try {
			con=dbopen.getConnection();
			sql= new StringBuilder();
			sql.append(" SELECT n_number, en_email, n_title, n_date ");
			sql.append(" FROM tb_notice ");
			sql.append(" ORDER BY n_number desc ");
			pstmt=con.prepareStatement(sql.toString());
			rs=pstmt.executeQuery();
			if(rs.next()) {
				list = new ArrayList<NoticeNewDTO>();
				do {
					NoticeNewDTO dto = new NoticeNewDTO();
					dto.setN_number(rs.getInt("n_number"));
					dto.setEn_email(rs.getString("en_email"));
					dto.setN_title(rs.getString("n_title"));
					dto.setN_date(rs.getString("n_date"));
					
					list.add(dto);
				}while(rs.next());
			}
			
		}catch (Exception e) {
			System.out.println("noticeNew list 실패 :"+e);
		}finally {
			DBClose.close(con, pstmt, rs);
		}
		
		return list;
	}
	
	
	public NoticeNewDTO read(int n_number) {
		NoticeNewDTO dto = null;
		try {
			con=dbopen.getConnection();
			sql=new StringBuilder();
			sql.append(" SELECT n_number, en_email, n_title, n_content, n_date ");
			sql.append(" FROM tb_notice ");
			sql.append(" WHERE n_number=? ");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, n_number);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto= new NoticeNewDTO();
				dto.setN_number(rs.getInt("n_number"));
				dto.setEn_email(rs.getString("en_email"));
				dto.setN_title(rs.getString("n_title"));
				dto.setN_content(rs.getString("n_content"));
				dto.setN_date(rs.getString("n_date"));
			}
		}catch (Exception e) {
			System.out.println("notice read 실패  : "+e);
		}finally {
			DBClose.close(con, pstmt, rs);
		}
		return dto;
	}
	
	public int modify(NoticeNewDTO dto) {
		int cnt=0;
		try {
			con=dbopen.getConnection();
			sql=new StringBuilder();
			sql.append(" UPDATE tb_notice SET n_title=?, n_content=? ");
			sql.append(" WHERE n_number=? ");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getN_title());
			pstmt.setString(2, dto.getN_content());
			cnt=pstmt.executeUpdate();
		}catch (Exception e) {
			System.out.println("place modify 실패 : "+e);
		}finally {
			DBClose.close(con, pstmt);
		}
		
		return cnt;
		
	}
	
	
}
