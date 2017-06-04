<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
import="java.util.*"
import="dao.*"
import="general.*"
import="org.json.simple.JSONObject"
%>
		<META http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<META name="GENERATOR" content="IBM WebSphere Studio">
		<META http-equiv="Content-Style-Type" content="text/css">
<%	
	String nmakun     = request.getParameter("nmakun");
	String kdakun     = request.getParameter("kdakun");
	
	String tombol = request.getParameter("tombol");
	System.out.println("kdakun '"+kdakun+"'");
//	System.out.println("nmjnsjab "+nmjnsjab);
//	System.out.println("tombol "+tombol);
	if(tombol.equals("")){
//		System.out.println("tombol Insert Data");
		tombol = "Insert Data";
	}
	String result = null;
	JSONObject json = new JSONObject(); 
	
	int min = 0;
	int max = 0;
	int i = 0;
	koneksi conn = new koneksi();	
	List list = null;
	List list1 = null;
	List list2 = null;
	try {
			akuninsDao flexo = new  akuninsDao(conn.getConnection());
			list1 = flexo.query(kdakun,nmakun, tombol);	
			
			if(tombol.equals("Delete Data"))
			{
				 json.put("success", "ok");    
				 result = json.toString();
				 out.println(result);		
			}else
			{
			    json.put("kdakun", kdakun);  
			    json.put("nmakun", nmakun);
		   			  		     
				result = json.toString();
				out.println("{\"total\":\"" + min + "\",\"rows\":[" + result + "]}");		
			}
	} catch (Exception x) 
	{
		 json.put("errorMsg", x);    
		 result = json.toString();
		 out.println(result);
		  
		x.printStackTrace();
	} finally 
	{
		conn.close();
	}		
%>	