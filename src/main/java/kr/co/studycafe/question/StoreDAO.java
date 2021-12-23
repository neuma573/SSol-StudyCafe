package kr.co.studycafe.question;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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
	
	 public ArrayList<StoreDTO> StoreList(){
	    	ArrayList<StoreDTO> list=null;
	 
	    	try {
	    		con=dbopen.getConnection();
	    		sql=new StringBuilder();
	    		sql.append(" select * ");
	    		sql.append(" from tb_store_info ");
	    		pstmt=con.prepareStatement(sql.toString());
	    		rs=pstmt.executeQuery();
	    		
	    		if(rs.next()) {
	                list=new ArrayList<StoreDTO>();
	                do {
	                	StoreDTO dto=new StoreDTO(); 
	                	dto.setStore_no(rs.getInt("store_no"));
						dto.setEn_email(rs.getString("en_email"));
						dto.setStore_name(rs.getString("store_name"));
						dto.setStore_address(rs.getString("store_address"));
						dto.setOperating_hours(rs.getString("operating_hours"));
						dto.setRoom_count(rs.getInt("room_count"));
						dto.setDesk_count(rs.getInt("desk_count"));
						dto.setBox_count(rs.getInt("box_count"));
						dto.setStore_img(rs.getString("store_img"));
						dto.setTel(rs.getString("tel"));
						dto.setLatitude(rs.getDouble("latitude"));
						dto.setLongitude(rs.getDouble("longitude"));
	                    list.add(dto); //list에 모으기
	                }while(rs.next());
	            }//end
	    	}catch(Exception e) {
	    		System.out.println("매장 정보 목록 실패: "+ e);
	    	}finally {
	    		DBClose.close(con,pstmt,rs);
	    	}
	    	return list;
	    }
}
