package project;
import java.sql.*;
import java.util.*;
import java.util.Date;

import javax.sql.*;
import javax.naming.*;


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
	
	//월 데이타 리스트
	public List<Schedule> selectList(String id, String Sdate, String Edate) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null; ResultSet rs = null;
		
		String sql = "select SEQ ,TITLE ,REG_DATE ,to_char(REG_DATE, 'dd') as reg_day from SCHEDULE where WRITER = ? and REG_DATE BETWEEN ? and ?";
		
		List<Schedule> list = new ArrayList<>();		
		try { conn = getConnection();
			pstmt  = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, Sdate);
			pstmt.setString(3, Edate);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Schedule sc = new Schedule();				
				sc.setSeq(rs.getInt("seq"));				
				sc.setTitle(rs.getString("title"));
				sc.setReg_date(rs.getDate("reg_date"));
				sc.setReg_day(rs.getString("reg_day"));
				list.add(sc);
			} 
		}catch(Exception e) {System.out.println(e.getMessage());
		}finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return list;
	}
	
	//일정등록
	public int insert(Schedule user) throws SQLException{
		int result=0; 
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql="";		
		try {
			conn=getConnection();
			
			if(user.getSeq() > 0){
				sql="update Schedule set title=?,content=? where seq=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, user.getTitle());
				pstmt.setString(2, user.getContent());
				pstmt.setInt(3, user.getSeq());
			}
			else{
				sql="insert into Schedule values(SCHEDULE_SEQ.NEXTVAL,?,?,?,to_date(?,'YYYY-MM-DD'))";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, user.getTitle());			
				pstmt.setString(2, user.getWriter());
				pstmt.setString(3, user.getContent());
				pstmt.setString(4, user.getAdd_date());
			}
			
			result=pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally{
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		return result;
	}
	
	//상세보기
	public Schedule selectInfo(int seq) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null; ResultSet rs = null;
		Schedule sc = new Schedule();
		String sql = "select seq, title, writer , content, to_char(REG_DATE, 'YYYY-MM-DD') as reg_date  from Schedule where seq = ?";
		
		try { conn = getConnection();
			pstmt  = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				sc.setSeq(rs.getInt("seq"));				
				sc.setTitle(rs.getString("title"));
				sc.setWriter(rs.getString("writer"));
				sc.setContent(rs.getString("content"));
				sc.setReg_day(rs.getString("reg_date"));
			}
			
		}catch(Exception e) {System.out.println(e.getMessage());
		}finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return sc;
	}
	
}