package project;

import java.sql.*;
import javax.naming.*;
import javax.sql.*;

public class UserInFoDao {
	private static UserInFoDao instance; // = new MemberDao();
	private UserInFoDao() {}
	public static UserInFoDao getInstance() {//占싱깍옙占쏙옙 占쏙옙占쏙옙,占싱깍옙占쏙옙 占쏙옙占싹몌옙 占쏙옙체占쏙옙 占쏙옙占� 호占쏙옙
		if(instance==null) instance=new UserInFoDao();
		return instance;
	}
	public Connection getConnection(){
		Connection conn=null;
		try {
			Context ctx=new InitialContext();
			DataSource ds=(DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn=ds.getConnection();
					} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}
	public int insert(UserInFo user) throws SQLException{
		int result=0; Connection conn=null;
		PreparedStatement pstmt=null;
		String sql="insert into UserInFo values(?,?,?,?,?,?,?,?)";

		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, user.getEmail());
			pstmt.setString(2, user.getPassword());
			pstmt.setString(3, user.getName());
			pstmt.setString(4, user.getAge());
			pstmt.setString(5, user.getId());
			pstmt.setString(6, user.getAddr());
			pstmt.setString(7, user.getPhone());
			pstmt.setString(8, user.getGender());
			result=pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally{
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		return result;
	}
	public int loginchk(String email,String password) {
		int result = 0; Connection conn = null;
		PreparedStatement pstmt = null; ResultSet rs = null;
		String sql = "select password from UserInFo where email = ?";
		try { conn = getConnection();
			pstmt  = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String dbPass = rs.getString(1);
				if (dbPass.equals(password)) result = 1;
				else result = 0;
			} else result = -1;
		}catch(Exception e) {System.out.println(e.getMessage());
		}finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
	public UserInFo select(String email) {
		System.out.println("email = "+email);
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from UserInFo where email = ?";
		UserInFo ui = new UserInFo();
		try { 
			conn = getConnection();
			pstmt  = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				ui.setEmail(rs.getString("email"));
				ui.setPassword(rs.getString("password"));
				ui.setPhone(rs.getString("phone"));
				ui.setName(rs.getString("name"));
			} else System.out.println("�뾾�꽕");
			System.out.println("name ="+ui.getName());
		} catch(Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {				
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) { }
		}
		return ui;
	}
	public int update(UserInFo ui) throws SQLException {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql="update UserInFo set password=?, phone=?, name=? where email=?";
		try { 
			conn = getConnection();
			pstmt  = conn.prepareStatement(sql);			
			pstmt.setString(1, ui.getPassword());
			pstmt.setString(2, ui.getPhone());
			pstmt.setString(3, ui.getName());
			pstmt.setString(4, ui.getEmail());
			result = pstmt.executeUpdate();
		} catch(Exception e) {
			System.out.println(e.getMessage());
		} finally {			
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
		return result;
	}
	public int delete(String email) throws SQLException {
	      int result = 0;
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      String sql = "delete from UserInFo where email=?";
	      try {
	         conn = getConnection();
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, email);
	         result = pstmt.executeUpdate();
	      } catch (Exception e) {
	         System.out.println(e.getMessage());
	      } finally {
	         if (pstmt != null)
	            pstmt.close();
	         if (conn != null)
	            conn.close();
	      }
	      return result;
	   }
}
