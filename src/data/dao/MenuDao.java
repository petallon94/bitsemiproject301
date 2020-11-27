package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import data.dto.MenuDto;
import mysql.db.MysqlConnect;

public class MenuDao {
	
	MysqlConnect db = new MysqlConnect();
	
	
	public void insertShop(MenuDto dto)
	{
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql="insert into menu (menuid,menuname,category,menuprice,mipgoday,menuphoto,menudetail) "
				+ "values('admin',?,?,?,?,?,?);";
		conn=db.getMyConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, dto.getMenuname());
			pstmt.setString(2, dto.getCategory());
			pstmt.setInt(3, dto.getMenuprice());
			pstmt.setString(4, dto.getMipgoday());
			pstmt.setString(5, dto.getMenuphoto());
			pstmt.setString(6, dto.getMenudetail());
			

			//실행
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt);
		}
	}
	
	
	

}
