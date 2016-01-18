
package jspbook2.test;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class studentBean {
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String jdbc_driver="com.mysql.jdbc.Driver";
	String jdbc_url="jdbc:mysql://localhost:3306/jspbookdb";
	
	void connect(){
		try{		
			Class.forName(jdbc_driver);
			conn=(Connection) DriverManager.getConnection(jdbc_url, "root","jspbook");
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	void disconnect(){
		if(pstmt!=null){
			try{
				pstmt.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		if(conn !=null){
			try{
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
	}
	
	public ArrayList getDBList(String name){
		connect();
		ArrayList<studentBook> data = new ArrayList<studentBook>();
		
		String sql = "selectt * from student where name like ?";
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "%"+name+"%");
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				studentBook book = new studentBook();
				
				book.setName(rs.getString(1));
				book.setMajor(rs.getString(2));
				book.setGpa(rs.getFloat(3));
				
				data.add(book);
			}
			rs.close();
		} catch(SQLException e){
			e.printStackTrace();
		} finally{
			disconnect();
		}
		return data;
	}
	
	

}
