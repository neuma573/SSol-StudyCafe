package kr.co.studycafe.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import org.springframework.web.bind.annotation.SessionAttribute;

import net.utility.DBClose;
import net.utility.DBOpen;

public class NoticeDAO {
	private DBOpen dbopen = null;
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private StringBuilder sql = null;
	
	public NoticeDAO() {
		dbopen = new DBOpen();
		con = dbopen.getConnection();
	}
	
	
	public int notice_post(NoticeDTO noticeDTO) {
		String sql = "insert into tb_notice values(n_number, ?, ?, ?, ?)";
		try {
			pstmt = con.prepareStatement(sql);
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
			pstmt.setString(1, noticeDTO.getEn_email());
			pstmt.setString(2, noticeDTO.getN_title());
			pstmt.setString(3, noticeDTO.getN_contents());
			pstmt.setString(4, LocalDateTime.now().format(formatter));
			pstmt.executeUpdate();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	  public ArrayList<NoticeDTO> Notice_list(){
			ArrayList<NoticeDTO> Notice_list = null;
			try {
				con=dbopen.getConnection();
				sql=new StringBuilder();
				sql.append(" SELECT n_number, en_email, n_title, n_content, n_date");
				sql.append(" FROM tb_notice ");
				sql.append(" ORDER BY n_number DESC ");
				pstmt=con.prepareStatement(sql.toString());
				rs=pstmt.executeQuery();
				if(rs.next()) {
					Notice_list = new ArrayList<NoticeDTO>();
					do {
						NoticeDTO dto = new NoticeDTO();
						dto.setN_number(rs.getInt("n_number"));
						dto.setEn_email(rs.getString("en_email"));
						dto.setN_title(rs.getString("n_title"));
						dto.setN_contents(rs.getString("n_content"));
						dto.setN_date(rs.getString("n_date"));
						Notice_list.add(dto);
					}while(rs.next());
				}//if end
			}catch (Exception e) {
				System.out.println("Notice_list 실패 : "+e);
			}
			return Notice_list;
		}//Notice_list() end
	  
		public NoticeDTO Notice_read(int n_number) {
			NoticeDTO dto=null;
			try {
				con=dbopen.getConnection();
				sql=new StringBuilder();
				sql.append(" SELECT n_number, en_email, n_title, n_content, n_date");
				sql.append(" FROM tb_notice ");
				sql.append(" WHERE n_number=? ");
				sql.append(" ORDER BY n_number DESC ");
				pstmt=con.prepareStatement(sql.toString());
				pstmt.setInt(1, n_number);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					dto = new NoticeDTO();
					dto.setN_number(rs.getInt("n_number"));
					dto.setEn_email(rs.getString("en_email"));
					dto.setN_title(rs.getString("n_title"));
					dto.setN_contents(rs.getString("n_content"));
					dto.setN_date(rs.getString("n_date"));
				}
				
			}catch (Exception e) {
				System.out.println("Notice_read 실패 : " + e);
			}
			
			return dto;
		}//Notice_read() end
	
	
}
