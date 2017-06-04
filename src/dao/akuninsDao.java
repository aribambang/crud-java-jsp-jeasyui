package dao;

import general.*;
import java.util.*;
import java.sql.*;

public class akuninsDao extends dao{
	private Connection conn;
	
	public akuninsDao(Connection conn) {
		if (conn == null) throw new IllegalArgumentException("Connection cannot be null.");
		try {
			this.conn = conn;
		} catch (Exception x) {
			x.printStackTrace();
		}
	}

	public List query(String kdakun, String nmakun, String tombol) 
	{
		List list = null;
		ResultSet rs = null;		
		Statement stmt = null;
		ResultSet u= null;
		String sql="";
		String y="0";
		String ket="";		
		try {

			stmt = conn.createStatement();
			sql ="";
			u = stmt.executeQuery("select count(kdakun) jml " +
				"	from akun_tbl where kdakun="+kdakun);
			u.next();
			int x = u.getInt("jml");
			u.close();				
			if(tombol.equals("Insert Data"))
			{
				if(x<1)
				{
					sql =" insert into akun_tbl(kdakun,nmakun)" +
						 " values("+kdakun+",'"+nmakun+"')";
					
					ket ="Process successful.";
					stmt.executeUpdate(sql);
					conn.commit();
					conn.setAutoCommit(true);
				}else
				{
					ket ="Process cannot be completed, data already exist.";
				}
			}
			if(tombol.equals("Delete Data"))
			{
				sql=" delete from akun_tbl where kdakun="+kdakun;
				ket ="Process successful.";
				stmt.executeUpdate(sql);
				conn.commit();
				conn.setAutoCommit(true);
			}
			if(tombol.equals("Update Data"))
			{
				sql =" update akun_tbl "+
					 " set nmakun='"+nmakun+"'" +				    
					 " where kdakun ="+kdakun;
				System.out.println(" sql"+sql);
				stmt.executeUpdate(sql);
				conn.commit();
				conn.setAutoCommit(true);
				ket ="Process successful.";				
			}
			list = new ArrayList();
			HashMap map = new HashMap();
			map.put("ket",ket);
			list.add(map);													
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
