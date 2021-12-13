package kr.co.studycafe.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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

}
