<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
import="java.util.*"
import="dao.*"
import="general.*"
import="org.json.simple.JSONObject"
%>
<%	
	String nmakun = "";
	String kdakun = "";
	
	int min = 0;
	int max = 0;
	int i = 0;
	koneksi conn = new koneksi();	
	List list = null;
	List list1 = null;
	List list2 = null;
	String result = null;
	JSONObject json = new JSONObject(); 
	try {
			akunlistDao flexo = new akunlistDao(conn.getConnection());
			list1 = flexo.query("");
	} catch (Exception x)		
	{
		x.printStackTrace();
	} finally 
	{
		conn.close();
	}
	
	for (i = 0; i < list1.size(); i++) 
	{
		HashMap map = (HashMap)list1.get(i);
		if (map != null) 
		{
	//		map.put("kdcity", kdcity);
			kdakun = (String)map.get("kdakun");
			nmakun = (String)map.get("nmakun");
			
		    min ++;
		    json.put("kdakun", kdakun);  
		    json.put("nmakun", nmakun);
		   	    
		    //    
		    if(min == 1){  
		        result = json.toString();     
		    }  
		    else{  
		        result += "," + json.toString();      
		    }  			
		}
	}
	out.println("{\"total\":\"" + min + "\",\"rows\":[" + result + "]}");	
%>