package com.neuma573.studycafe.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


import net.utility.DBClose;
import net.utility.DBOpen;

public class NoticeDAO {
	private DBOpen dbopen =null;
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private StringBuilder sql = null;
	
	public NoticeDAO() {
		dbopen = new DBOpen();		
	}
	
	public ArrayList<NoticeDTO> list() {
		ArrayList<NoticeDTO> list = null;
		
		try {
			con=dbopen.getConnection();
			sql= new StringBuilder();
			sql.append(" SELECT n_number, en_email, n_title, n_date, store_name ");
			sql.append(" FROM tb_notice ");
			sql.append(" ORDER BY n_number desc ");
			pstmt=con.prepareStatement(sql.toString());
			rs=pstmt.executeQuery();
			if(rs.next()) {
				list = new ArrayList<NoticeDTO>();
				do {
					NoticeDTO dto = new NoticeDTO();
					dto.setN_number(rs.getInt("n_number"));
					dto.setEn_email(rs.getString("en_email"));
					dto.setN_title(rs.getString("n_title"));
					dto.setN_date(rs.getString("n_date"));
					dto.setStore_name(rs.getString("store_name"));
					
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
	
	public NoticeDTO read(int n_number) {
		NoticeDTO dto = null;
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
				dto= new NoticeDTO();
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
	
	public int modify(NoticeDTO dto) {
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
		
	
	public ArrayList<NoticeDTO> storelist(String uid){
		ArrayList<NoticeDTO> storelist = null;
		try {
			con = dbopen.getConnection();
			sql=new StringBuilder();
			sql.append(" SELECT store_name, store_no FROM tb_store_info WHERE en_email=? ");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, uid);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				storelist = new ArrayList<NoticeDTO>();
				do {
					NoticeDTO dto = new NoticeDTO();
					dto.setStore_no(rs.getInt("store_no"));
					dto.setStore_name(rs.getString("store_name"));
					storelist.add(dto);
				}while(rs.next());
				
			}
			
		}catch (Exception e) {
			System.out.println("noticedao storelist 실패 : "+e);
		}finally {
			DBClose.close(con, pstmt, rs);
	
		}
		
		
		return storelist;
	}
	
	public int write(NoticeDTO dto) {
		int cnt=0;
		try {
			String store_name="";
			con=dbopen.getConnection();
			sql=new StringBuilder();
			sql.append(" SELECT store_name FROM tb_store_info WHERE store_no = ? ");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setInt(1, dto.getStore_no());
			rs=pstmt.executeQuery();
			if(rs.next()) {
				store_name = rs.getString("store_name");
			}
			
		
			sql=new StringBuilder();
			sql.append(" INSERT INTO tb_notice (en_email, n_title, n_content ,store_name) ");
			sql.append(" VALUES (?, ?, ?, ?) ");
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getEn_email());
			pstmt.setString(2, dto.getN_title());
			pstmt.setString(3, dto.getN_content());
			pstmt.setString(4, store_name);
			
			cnt=pstmt.executeUpdate();
			
		}catch (Exception e) {
			System.out.println("noticedao write 실패 : "+e);
		}finally {
			DBClose.close(con, pstmt,rs);
			
		}
				
				
		return cnt;
	}
	
}
