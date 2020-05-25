<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Time"%>
<%@page import="java.util.Date"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Dictionary"%>
<%@page import="java.util.Hashtable"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="PSM_DB.MyConnection"%>
<%
	String checking_id=request.getParameter("checking_id");
	Connection con = null;	
	Gson gson=new Gson();
	HashMap map=new HashMap();
	List list_of_id=new ArrayList();
	List list_of_name=new ArrayList();
	List list_of_status=new ArrayList();
	List list_of_availability=new ArrayList();
	List list_Rate_name=new ArrayList();
	List list_Rate=new ArrayList();
	int i = 0;
	String ret = "error";
		try{
			con=new MyConnection().getConnection();
			Statement st=con.createStatement();
			if(checking_id.equals("add_slot")){
				String slot_name=request.getParameter("slot_name");
				String slot_status=request.getParameter("slot_status");
				String slot_availability=request.getParameter("slot_availability");
				String Rate_name=request.getParameter("Rate_name");
				String Rate=request.getParameter("Rate");
				st.executeUpdate("insert into manage_parking_slot (Slot_name,Rate_category,Rate,slot_status,slot_Availability) values ('"+slot_name+"','"+Rate_name+"','"+Rate+"','"+slot_status+"','"+slot_availability+"')");
				ret = "success";
				map.put("ret", ret);
				String toString=gson.toJson(map);
				out.print(toString);
			}else if(checking_id.equals("select_slot")){
				ResultSet rs=st.executeQuery("select * from manage_parking_slot");
				while(rs.next()){
					list_of_id.add(rs.getString("parking_slot_id"));
					list_of_name.add(rs.getString("Slot_name"));
					list_Rate_name.add(rs.getString("Rate_category"));
					list_Rate.add(rs.getString("Rate"));
					list_of_status.add(rs.getString("slot_status"));
					list_of_availability.add(rs.getString("slot_Availability"));
				}
				map.put("count", list_of_id.size());
				map.put("parking_slot_id", list_of_id);
				map.put("slot_name", list_of_name);
				map.put("Rate_name", list_Rate_name);
				map.put("Rate", list_Rate);
				map.put("slot_status", list_of_status);
				map.put("slot_availability", list_of_availability);
				String toString=gson.toJson(map);
				out.print(toString);
			}else if(checking_id.equals("select_slot_of_active")){
				ResultSet rs=st.executeQuery("select * from manage_parking_slot where slot_status = 'active' and slot_Availability = 'Yes'");
				while(rs.next()){
					list_of_name.add(rs.getString("Slot_name"));
				}
				map.put("count_yes", list_of_name.size());
				map.put("slot_name", list_of_name);
				String toString=gson.toJson(map);
				out.print(toString);
			}
			else if(checking_id.equals("Rate_name_for_parking")){
				ResultSet rs=st.executeQuery("select * from rate_table where action = 'Active'");		
				while(rs.next()){
					list_of_name.add(rs.getString("Rate_name"));
					list_of_id.add(rs.getString("Rate"));
					list_Rate_name.add(rs.getString("Category"));
				}
				map.put("Rate_name", list_of_name);
				map.put("Rate", list_of_id);
				map.put("category", list_Rate_name);
				String toString=gson.toJson(map);
				out.print(toString);
			}else if(checking_id.equals("delete_parking_slot")){
				String value=request.getParameter("value");
				st.executeUpdate("delete from manage_parking_slot where parking_slot_id = '"+value+"'");
				ret = "Success";
				map.put("ret", ret);
				String toString=gson.toJson(map);
				out.print(toString);
			}else if(checking_id.equals("insert_parking_details")){
				Random code=new Random();
				int random_code=code.nextInt(999999999);
				
				LocalDateTime check_in=LocalDateTime.now();
				
				String slot=request.getParameter("slot");
				String category=request.getParameter("category");
				String Rate=request.getParameter("rate");
				
				st.executeUpdate("insert into parking_details (parking_code,check_in,check_out,category,Rate,slot,paid_status) values ('"+random_code+"','"+check_in+"','-','"+category+"','"+Rate+"','"+slot+"','No')");
				ret = "success";
				map.put("ret", ret);
				String toString=gson.toJson(map);
				out.print(toString);
			}else if(checking_id.equals("selecting_parking_main_details")){
				List parking_code=new ArrayList();
				List check_in=new ArrayList();
				List check_out=new ArrayList();
				ResultSet rs=st.executeQuery("select * from parking_details");
				while(rs.next()){
					parking_code.add(rs.getString("parking_code"));
					check_in.add(rs.getString("check_in"));
					check_out.add(rs.getString("check_out"));
					list_of_availability.add(rs.getString("category"));
					list_of_id.add(rs.getString("Rate"));
					list_of_status.add(rs.getString("slot"));
					list_of_name.add(rs.getString("paid_status"));
				}
				map.put("parking_code", parking_code);
				map.put("check_in", check_in);
				map.put("check_out", check_out);
				map.put("category",list_of_availability);
				map.put("Rate", list_of_id);
				
				map.put("slot", list_of_status);
				map.put("paid_status", list_of_name);
				String toString=gson.toJson(map);
				out.print(toString);
			}else if(checking_id.equals("deleting_parking_main_details")){
				String value=request.getParameter("value");
				st.executeUpdate("delete from parking_details where parking_code = '"+value+"'");
				ret = "Success";
				map.put("ret", ret);
				String toString=gson.toJson(map);
				out.print(toString);
			}else if(checking_id.equals("updating_parking_details")){
				String slot=request.getParameter("slot");
				st.executeUpdate("update manage_parking_slot set slot_Availability = 'no' where Slot_name = '"+slot+"'");
			}else if(checking_id.equals("update_parking_slot")){
				String slot_id=request.getParameter("slot_id");
				String update_slot_name=request.getParameter("update_slot_name");
				String update_slot_status=request.getParameter("update_slot_status");
				String update_slot_Availability=request.getParameter("update_slot_Availability");
				st.executeUpdate("update manage_parking_slot set Slot_name = '"+update_slot_name+"',slot_status = '"+update_slot_status+"',slot_Availability = '"+update_slot_Availability+"' where parking_slot_id = '"+slot_id+"'");
				ret = "Success";
				map.put("ret", ret);
				String toString=gson.toJson(map);
				out.print(toString);
			}else if(checking_id.equals("update_Details_of_parking")){
				String parking_details_id=request.getParameter("parking_details_id");
				String check_out=request.getParameter("check_out");
				String paid_status=request.getParameter("paid_status");
				
				st.executeUpdate("update parking_details set check_out = '"+check_out+"',paid_status = '"+paid_status+"' where parking_code = '"+parking_details_id+"'");
				ret = "Success";
				map.put("ret", ret);
				String toString=gson.toJson(map);
				out.print(toString);
			}
			st.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
%>