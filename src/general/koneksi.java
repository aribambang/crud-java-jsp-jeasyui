package general;

import java.sql.*;

public class koneksi {
	private Connection conn = null;
	private String url = "jdbc:mysql://localhost:3306/jeasyui?relaxAutoCommit=true";  
	private String password = "1234567890";  
	private String userid = "root";
	
	public koneksi() 
	{
		setConnection();
	}
	
	public void setConnection(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			url = "jdbc:mysql://localhost:3306/jeasyui";
			userid = "root";
			password = "1234567890";
		} catch (Exception x) {
			x.printStackTrace();
		}
	}
	
	public Connection getConnection() {
		if (conn == null)
		try {
			conn = DriverManager.getConnection(this.url, this.userid, this.password);
		} catch (Exception x) {
			x.printStackTrace();
		}
		
		return conn;
	}
	
	public void close() {
		try {
			if (conn != null) conn.close();
			conn = null;
		} catch(Exception x) {
			x.printStackTrace();
		}
	}
}
