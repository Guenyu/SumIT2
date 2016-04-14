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
}