# parking_managment_system
This is a website for parking management System build on jsp(BackEnd) and AngularJS(FrontEnd) 


Step -1) Download this website in local computer and import in Ecllipse.

Step -2) In This Website MYSQL DataBase is use so make sure you have to install MYSQL Database in your computer

Step -3) Create Your Database with name parking_managment_system

Step -4) After Creation of Database make the Following Tables in it
         
         1st table --> category
         
         2nd table --> login
         
         3rd table --> manage_parking_slot
         
         4th table --> parking_details
         
         5th table --> rate_table

Step -5) After Creation of tables please create fields of each table

         1) fields of category table --> category_id, category_name, Status

         2) fields of login table --> Email, Password, Level put default value of email and password as Admin@gmail.com and Admin
         
         3) fields of manage_parking_slot table --> parking_slot_id, slot_name, Rate_category, slot_status, slot_Availability
         
         4) fields of parking_details table --> parking_code, check_in, check_out, category, Rate, slot, paid_status
         
         5) fields of rate_table table -->Rate_id, Rate_name, Category, Rate_type, Rate, action

Step -6) Now we can run our Project for running the project right click on project which is import in ecllipse and click on run  


 



