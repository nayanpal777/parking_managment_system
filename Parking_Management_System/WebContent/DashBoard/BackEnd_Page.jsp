<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="PSM_DB.MyConnection"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	
	String Unique_id=request.getParameter("Unique_id");
	Gson gson=new Gson();
	Connection con = null;	
	if(Unique_id.equals("Select_category")){
		List<String> category_id=new ArrayList<String>();
		List<String> category_name=new ArrayList<String>();
		List<String> category_status=new ArrayList<String>();
		Map<String,List> hash_map=new HashMap<String,List>();
		try{
			con=new MyConnection().getConnection();
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select * from category");	
			while(rs.next()){
				category_id.add(rs.getString("category_id"));
				category_name.add(rs.getString("category_name"));
				category_status.add(rs.getString("Status"));
			}
			hash_map.put("category_id", category_id);
			hash_map.put("category_name", category_name);
			hash_map.put("category_status", category_status);
			rs.close();
			st.close();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			con.close();	
		}
		String toString=gson.toJson(hash_map);
		out.print(toString);
		
	}else if(Unique_id.equals("delete_Rate")){
		String val=request.getParameter("value");
		Map<String,String> map=new HashMap<String,String>();
		String ret = "error";
		try{
			con=new MyConnection().getConnection();
			Statement st=con.createStatement();
			st.executeUpdate("delete from rate_table where Rate_id = '"+val+"'");
			ret = "Success";
			st.close();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			con.close();
		}
		map.put("ret", ret);
		String toString=gson.toJson(map);
		out.print(toString);
	}else if(Unique_id.equals("name_for_rate")){
		Map<String,List> map=new HashMap<String,List>();
		ArrayList list = new ArrayList();
		try{
			con=new MyConnection().getConnection();
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select category_name from category where Status = 'Active'");	
			while(rs.next()){
				list.add(rs.getString("category_name"));
			}
			rs.close();
			st.close();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			con.close();	
		}
		map.put("list",list);
		String toString=gson.toJson(map);
		out.print(toString);
	}else if(Unique_id.equals("update_category")){
		String id = request.getParameter("id");
		String status = request.getParameter("status");
		HashMap map=new HashMap();
		String ret = "error";
		try{
			con=new MyConnection().getConnection();
			Statement st=con.createStatement();
			st.executeUpdate("update category set Status = '"+status+"' where category_id = '"+id+"'");
			ret = "Success";
			st.close();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			con.close();
		}
		map.put("ret", ret);
		String toString=gson.toJson(map);
		out.print(toString);
	}else if(Unique_id.equals("delete_category")){
		String value=request.getParameter("value");
		Map<String,String> map=new HashMap<String,String>();
		String ret = "error";
		try{
			con=new MyConnection().getConnection();
			Statement st=con.createStatement();
			st.executeUpdate("delete from category where category_id = '"+value+"'");
			ret = "Success";
			st.close();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			con.close();
		}
		map.put("ret", ret);
		String toString=gson.toJson(map);
		out.print(toString);	
	}else if(Unique_id.equals("Add_Rate")){
		String Rate_name=request.getParameter("Rate_name");
		String Category=request.getParameter("Category");
		String Rate_type=request.getParameter("Rate_type");
		String Rate=request.getParameter("Rate");
		String action=request.getParameter("action");
		Map<String,String> map=new HashMap<String,String>();
		String ret = "error";
		try{
			con=new MyConnection().getConnection();
			Statement st=con.createStatement();
			st.executeUpdate("insert into rate_table (Rate_name,Category,Rate_type,Rate,action) values ('"+Rate_name+"','"+Category+"','"+Rate_type+"','"+Rate+"','"+action+"')");
			ret = "success";
			st.close();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			con.close();
		}
		map.put("ret", ret);
		String toString=gson.toJson(map);
		out.print(toString);
	}else if(Unique_id.equals("Select_Rate")){
		Map<String,List> hash_Map=new HashMap<String,List>();
		ArrayList<String> Rate_id=new ArrayList<String>();
		ArrayList<String> Rate_name=new ArrayList<String>();
		ArrayList<String> category=new ArrayList<String>();
		ArrayList<String> Rate_type=new ArrayList<String>();
		ArrayList<String> Rate=new ArrayList<String>();
		ArrayList<String> status=new ArrayList<String>();
		try{
			con=new MyConnection().getConnection();
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select * from rate_table");	
			while(rs.next()){
				Rate_id.add(rs.getString("Rate_id"));
				Rate_name.add(rs.getString("Rate_name"));
				category.add(rs.getString("Category"));
				Rate_type.add(rs.getString("Rate_type"));
				Rate.add(rs.getString("Rate"));
				status.add(rs.getString("action"));
			}
			hash_Map.put("Rate_id",Rate_id);
			hash_Map.put("Rate_name", Rate_name);
			hash_Map.put("Category", category);
			hash_Map.put("Rate_type", Rate_type);
			hash_Map.put("Rate", Rate);
			hash_Map.put("Status", status);
			rs.close();
			st.close();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			con.close();	
		}
		String toString=gson.toJson(hash_Map);
		out.print(toString);
	}else if(Unique_id.equals("update_Rate")){
		String rate_id=request.getParameter("rate_id");
		String update_rate=request.getParameter("update_rate");
		String update_rate_type=request.getParameter("update_rate_type");
		String update_status=request.getParameter("update_status");
		String ret = "error";
		Map<String,String> map=new HashMap<String,String>();
		try{
			con=new MyConnection().getConnection();
			Statement st=con.createStatement();
			st.executeUpdate("update rate_table set Rate_type = '"+update_rate_type+"',Rate = '"+update_rate+"',action = '"+update_status+"' where Rate_id = '"+rate_id+"'");
			ret = "success";
			st.close();
		
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			con.close();	
		}
		map.put("ret", ret);
		String toString=gson.toJson(map);
		out.print(toString);
	}	
	else{
		String Category_name=request.getParameter("Category_name");
		String Category_status=request.getParameter("Category_status");
		Map<String,String> map=new HashMap<String,String>();
		String ret = "error";
		try{
			con=new MyConnection().getConnection();
			Statement st=con.createStatement();
			st.executeUpdate("insert into category (category_name,Status) values ('"+Category_name+"','"+Category_status+"')");
			ret = "success";
			st.close();
		
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			con.close();	
		}
		map.put("ret", ret);
		String toString=gson.toJson(map);
		out.print(toString);	
	}
%>