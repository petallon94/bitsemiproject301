package mysql.db;
//���� ���� : ����Ŭ sql ���� ���� sql�� Ŀ���� ������ߵȴ� ����? �׷����ҵ�


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MysqlConnect {
	String driver="com.mysql.jdbc.Driver";
	String myurl="jdbc:mysql://bitmidproject.cggf5sghxawi.ap-northeast-2.rds.amazonaws.com:3306/bitproject";
	String myid="admin";
	String mypass="bitproject";


	public MysqlConnect() {
		// TODO Auto-generated constructor stub
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			System.out.println("Mysql ����̹� ����:"+e.getMessage());
		}
	}

	//���� pc�� mysql ����
	public Connection getMyConnection()
	{
		Connection conn=null;
		try {
			conn=DriverManager.getConnection(myurl, myid, mypass);
		} catch (SQLException e) {
			System.out.println("�� ���� mysql ���� ����:"+e.getMessage());
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


















