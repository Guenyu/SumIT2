package project;

import java.sql.*;
import javax.naming.*;
import javax.sql.*;

import project.Schedule2;
public class ScheduleDao2 {
	private static ScheduleDao2 instance; // = new MemberDao();
	private ScheduleDao2() {}
	public static ScheduleDao2 getInstance() {
		if(instance==null) instance=new ScheduleDao2();
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
	public Schedule2 select(String email) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from Schedule2 where email=?";
		Schedule2 sd2 = new Schedule2();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				sd2.setTitle(rs.getString("title"));
				sd2.setWriter(rs.getString("writer"));
				sd2.setContent(rs.getString("content"));
				sd2.setReg_date1(rs.getString("reg_date1"));
				sd2.setReg_date2(rs.getString("reg_date2"));
			}  
		}catch(Exception e){
			System.out.println(e.getMessage());
		}finally {
			if (rs !=null) rs.close();
		    if (pstmt!=null) pstmt.close();
		    if (conn!=null) conn.close();
		}
		return sd2;
	}
	public int insert(Schedule2 user) throws SQLException{
		int result=0; 
		Connection conn=null;
		PreparedStatement pstmt=null;
		//String sql="insert into Schedule2 values(?,?,?,?,?,?)";
		
		//String sql="insert into Schedule2 values((Select seq+1 From(select seq from Schedule2 Order By seq Desc)Where RowNum <= 1),?,?,?,?,?)";
		String sql="insert into Schedule2 values(SCHEDULE_SEQ.NEXTVAL,?,?,?,?,?)";
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
//			pstmt.setInt(1,user.getSeq());
//			pstmt.setString(2, user.getTitle());
//			pstmt.setString(3, user.getContent());
//			pstmt.setString(4, user.getWriter());
//			pstmt.setString(5, user.getReg_date1());
//			pstmt.setString(6, user.getReg_date2());
			
			pstmt.setString(1, user.getTitle());
			pstmt.setString(2, user.getContent());
			pstmt.setString(3, user.getWriter());
			pstmt.setString(4, user.getReg_date1());
			pstmt.setString(5, user.getReg_date2());
			
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