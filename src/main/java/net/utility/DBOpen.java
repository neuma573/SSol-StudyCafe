package net.utility;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBOpen {

    //DB 연결 메소드
    public Connection getConnection() {
        Connection con=null;
        try {            
            
            String url     ="jdbc:mariadb://localhost:3308/ssol";
            String user    ="root";
            String password="0811";
            String driver  ="org.mariadb.jdbc.Driver"; 
            Class.forName(driver);
            con=DriverManager.getConnection(url, user, password);
            System.out.println("mariaDB연결 성공");
        }catch (Exception e) {
            System.out.println("mariaDB연결 실패:" + e);
        }//end
        
        return con;
        
    }//getConnection() end
    
}//class end
