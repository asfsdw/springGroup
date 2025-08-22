package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class GetConn {
	private static Connection conn = null;
	private String driver = "com.mysql.jdbc.Driver";
	private String url = "jdbc:mysql://localhost:3306/springgroup";
	private String user = "root", passowrd = "1234";
	
	@SuppressWarnings("unused")
	private static GetConn instance = new GetConn();
	
	private GetConn() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, passowrd);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버를 찾을 수 없습니다."+e.getMessage());
		} catch (SQLException e) {
			System.out.println("데이터베이스에 접속할 수 없습니다."+e.getMessage());
		}
	}

	public static Connection getConn() {
		return conn;
	}
}
