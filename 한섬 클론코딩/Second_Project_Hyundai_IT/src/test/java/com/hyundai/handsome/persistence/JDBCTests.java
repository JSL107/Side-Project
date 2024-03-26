package com.hyundai.handsome.persistence;

import static org.junit.Assert.fail;
import org.junit.Test;
import lombok.extern.log4j.Log4j;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

@Log4j
public class JDBCTests {   
   static {
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
      } catch (ClassNotFoundException e) {
         e.printStackTrace();
      }
   }//end static
   
//   해당 링크로 접속이 가능한지 테스트하는 코드
   @Test
   public void TestConnection() {
      try {
         Connection con = 
               DriverManager.getConnection(
                     "jdbc:oracle:thin:@edudb_high?TNS_ADMIN=C:/app/kosa/product/18.0.0/Wallet_edudb"
                     ,"handsome","xxxxxxAt21cc");
         log.info(con);
      } catch (SQLException e) {
         fail(e.getMessage());         
      }//end try         
   }//end test
}//end class