package dbconnections;

import java.sql.Connection;
import java.sql.DriverManager;

public class StudentToOfficeDBConnection {
	private static final String Driver = "com.mysql.cj.jdbc.Driver";
	private static final String url = "jdbc:mysql://localhost:3306/studenttoofficeportal";
	private static final String username = "root";
	private static final String password = "root";
	private static Connection conn = null;
	
	public static Connection getConnection() {
		try {
			Class.forName(Driver);
			conn = DriverManager.getConnection(url,username,password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}
}
