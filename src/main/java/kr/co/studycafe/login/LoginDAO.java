package kr.co.studycafe.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import net.utility.DBClose;
import net.utility.DBOpen;

public class LoginDAO {
	private DBOpen dbopen=null;
    private Connection con=null;
    private PreparedStatement pstmt=null;
    private ResultSet rs=null;
    private StringBuilder sql=null;
    
    public LoginDAO() {
        dbopen=new DBOpen();
        con=dbopen.getConnection();
    }//end
    
    public String loginProc(LoginDTO dto) {  
    	String in_email=null;
        try {
        	 con=dbopen.getConnection();
             sql=new StringBuilder();
             sql.append(" SELECT * ");
             sql.append(" from tb_member_in ");
             sql.append(" WHERE in_email=? and in_pw=? ");     
             pstmt=con.prepareStatement(sql.toString());
             pstmt.setString(1, dto.getIn_email());
             pstmt.setString(2, dto.getIn_pw());        
             rs=pstmt.executeQuery();
             if(rs.next()) {
            	 in_email=rs.getString(1);
             }        
        } catch (Exception e) {
            System.out.println("로그인 실패"+e);
        } finally {
            DBClose.close(con, pstmt);
        }//end
        return in_email;
    }//create() end
    
    

}
