package PSM_DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MyConnection {
	public Connection getConnection() throws SQLException{
		return DriverManager.getConnection("jdbc:mysql://localhost:3306/parking_managment_system", "root", "");
	}
}
