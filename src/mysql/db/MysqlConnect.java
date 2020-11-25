package mysql.db;
//만든 이유 : 오라클 sql 말고 마이 sql도 커넥을 시켜줘야된다 알지? 그래야할듯


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MysqlConnect {
	String driver="com.mysql.jdbc.Driver";
	String myurl="jdbc:mysql://bitmidproject.cggf5sghxawi.ap-northeast-2.rds.amazonaws.com:3306";
	String myid="admin";
	String mypass="bitproject";


	public MysqlConnect() {
		// TODO Auto-generated constructor stub
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			System.out.println("Mysql 드라이버 오류:"+e.getMessage());
		}
	}

	//본인 pc의 mysql 연결
	public Connection getMyConnection()
	{
		Connection conn=null;
		try {
			conn=DriverManager.getConnection(myurl, myid, mypass);
		} catch (SQLException e) {
			System.out.println("내 컴의 mysql 연결 실패:"+e.getMessage());
		}
		return conn;
	}

		public void dbClose(Connection conn,Statement stmt)
	{
		try {
			if(stmt!=null) stmt.close();
			if(conn!=null) conn.close();
		}catch (Exception e) {			
		}
	}

	public void dbClose(Connection conn,Statement stmt,ResultSet rs)
	{
		try {
			if(rs!=null) rs.close();
			if(stmt!=null) stmt.close();
			if(conn!=null) conn.close();
		}catch (Exception e) {			
		}
	}

	public void dbClose(Connection conn,PreparedStatement pstmt)
	{
		try {
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		}catch (Exception e) {			
		}
	}

	public void dbClose(Connection conn,PreparedStatement pstmt,ResultSet rs)
	{
		try {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		}catch (Exception e) {			
		}
	}
}


















