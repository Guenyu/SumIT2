package project;

import java.sql.*;
import javax.naming.*;
import javax.sql.*;

import project.Schedule;
public class ScheduleDao {
	private static ScheduleDao instance; // = new MemberDao();
	private ScheduleDao() {}
	public static ScheduleDao getInstance() {
		if(instance==null) instance=new ScheduleDao();
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
	public Schedule select(String email) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from Schedule where email=?";
		Schedule sd = new Schedule();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				sd.setTitle(rs.getString("title"));
				sd.setWriter(rs.getString("writer"));
				sd.setContent(rs.getString("content"));
				sd.setReg_date(rs.getDate("reg_date"));
			}  
		}catch(Exception e){
			System.out.println(e.getMessage());
		}finally {
			if (rs !=null) rs.close();
		    if (pstmt!=null) pstmt.close();
		    if (conn!=null) conn.close();
		}
		return sd;
	}
	public int insert(Schedule user) throws SQLException{
		int result=0; Connection conn=null;
		PreparedStatement pstmt=null;
		//String sql="insert into UserInFo values(?,?,?,?,?,?,?,?)";
		String sql="insert into Schedule values(?,?,?,?,?)";
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,user.getSeq());
			pstmt.setString(2, user.getTitle());
			pstmt.setString(3, user.getContent());
//			pstmt.setString(4, user.getAge());
//			pstmt.setString(5, user.getId());
//			pstmt.setString(6, user.getAddr());
			pstmt.setString(4, user.getWriter());
			pstmt.setDate(5, user.getReg_date());
			result=pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally{
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		return result;
	}
}