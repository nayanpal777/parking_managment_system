<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="PSM_DB.MyConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	//for unique getParameter funcation
	String unique_id=request.getParameter("unique_id");
	
	//creating HashMap of String and String
	Map<String,String> map=new HashMap<String, String>();
	
	//creating Gson Object 
	Gson gson=new Gson();
	Connection con = null; // instance of Connection
	String ret = "error";  // creating a String ret
	HttpSession httpSession=request.getSession(true); //creating a new Session
	
	//main database Code
	try{
		con=new MyConnection().getConnection(); // creating object of myConnection class
		Statement st=con.createStatement(); 	// calling Statement from con reference variable 
		
		//checking unique id for two different function
		if(unique_id.equals("dashboard_login")){
			
			//getting parameter coming from front end 
			String emp_email=request.getParameter("emp_email"); //user email
			//creating Session to set user email 
			httpSession.setAttribute("USER_EMAIL", emp_email);
			String emp_password=request.getParameter("emp_password"); //user password
			
			//exceuting Query
			ResultSet rs=st.executeQuery("select * from login where Email='"+emp_email+"' and Password='"+emp_password+"'");
			if(rs.next()){
				ret=rs.getString("Level");
			}		
			rs.close();
			
			map.put("ret", ret); 	 //put String into map 
			String toString=gson.toJson(map); //converting map into Gson object and put in String variable
			out.print(toString);    //print String 
			
		}else if(unique_id.equals("forgot_password")){
			//creating list for email storage
			List<String> list=new ArrayList<String>();
			//Getting email from Front End
			String forgot_email=request.getParameter("forgot_email");
			httpSession.setAttribute("forgot_email", forgot_email);
					
			//executing Query
			ResultSet rs=st.executeQuery("select * from login");
			while(rs.next()){
				 list.add(rs.getString("Email"));
			}
			//checking user email in list
			if(list.contains(forgot_email)){
				ret = "yes";
			}else{
				ret = "no";
			}
			
			map.put("ret", ret); 	 //put String into map 
			String toString=gson.toJson(map); //converting map into Gson object and put in String variable
			out.print(toString);    //print String 
			
		}else if(unique_id.equals("update_password")){
			//Getting password from Front End
			String user_password=request.getParameter("user_password");
			String forgot_email=(String)httpSession.getAttribute("forgot_email");
			
			//Executing Query for Update
			st.executeUpdate("update login set Password='"+user_password+"' where Email='"+forgot_email+"'");
			ret = "success";
			
			map.put("ret", ret); 	 //put String into map 
			String toString=gson.toJson(map); //converting map into Gson object and put in String variable
			out.print(toString);    //print String 
			
					
		}
		
		// closing st statement and con connection 
		st.close();
		con.close();
	}catch(Exception e){
		System.out.print(e);
	}
	
%>