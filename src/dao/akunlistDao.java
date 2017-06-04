package dao;

import general.*;
import java.util.*;
import java.sql.*;

public class akunlistDao extends dao {
	private Connection conn;
	
	public akunlistDao(Connection conn) {
		if (conn == null) throw new IllegalArgumentException("Connection cannot be null.");
		try {
			this.conn = conn;
		} catch (Exception x) {
			x.printStackTrace();
		}
	}
	public List query(String kdakun) 
	{
		List list = null;
		ResultSet rs = null;
		PreparedStatement stmt = null;
		try {
				
				String nmakun = "";
			    String wh= "" ;
				if(kdakun.equals("")||kdakun==null)
				{
					wh ="";
				}else
				{
					wh = " where kdakun="+kdakun;
				}
				
				String sql =" select kdakun , nmakun " +
						"from akun_tbl "+wh ;
	
				stmt = conn.prepareStatement(sql);				
				rs = stmt.executeQuery();
				list = new ArrayList();
				String nmbahasa = "";
				while (rs.next()) 
				{			
					kdakun = rs.getString("kdakun");
					nmakun = rs.getString("nmakun").trim();
						
					HashMap map = new HashMap();
					map.put("kdakun", kdakun);
					map.put("nmakun", nmakun);
										
					list.add(map);
				}			
		} catch (Exception x) {
			x.printStackTrace();
		}
		finally {
			if (stmt != null)
			try {
				 stmt.close();
			} catch (Exception x) {}
		}
		return list;
	}
	public void close() {
		try {
			conn.close();
		} catch (Exception x) {
		}
	}

}
