package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import org.json.JSONArray;
import org.json.JSONObject;
public class DAO 
{
	private Connection con;
	public DAO()
	{
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("Loaded.......................");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/gecb2","root","harika@123");
			System.out.println("Connected....");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public boolean register(String email,String password,String phone,String address)
	{
			boolean flag=false;
			try {
				PreparedStatement pstmt=con.prepareStatement("insert into register(email,password,phone,address) values(?,?,?,?)");
				pstmt.setString(1, email);
				pstmt.setString(2, password);
				pstmt.setString(3, phone);
				pstmt.setString(4, address);
				int r=pstmt.executeUpdate();
				if(r==1)
					flag=true;
			}catch (Exception e) {
				e.printStackTrace();
			}
			return flag;
	}
	public JSONArray getUsers()
	{
		JSONArray array=new JSONArray();
		try {
			PreparedStatement pstmt=con.prepareStatement("select * from register");
			ResultSet rs=pstmt.executeQuery();
			while(rs.next())
			{
				JSONObject object=new JSONObject();
				object.put("email",rs.getString("email"));
				object.put("password",rs.getString("password"));
				object.put("phone",rs.getString("phone"));
				object.put("address",rs.getString("address"));
				object.put("desig",rs.getString("desig"));
				array.put(object);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return array;
	}
}