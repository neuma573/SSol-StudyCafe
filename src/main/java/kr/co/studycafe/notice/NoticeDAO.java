package kr.co.studycafe.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

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
	
	
	public int post(NoticeDTO noticeDTO) {
		String sql = "insert into tb_notice values(n_number, ?, ?, ?, ?)";
		try {
			pstmt = con.prepareStatement(sql);
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			pstmt.setString(1, noticeDTO.getId());
			pstmt.setString(2, noticeDTO.getTitle());
			pstmt.setString(3, noticeDTO.getContents());
			pstmt.setString(4, LocalDate.now().format(formatter));
			pstmt.executeUpdate();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	
}
