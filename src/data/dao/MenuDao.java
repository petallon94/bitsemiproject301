package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
			//���ε�
			pstmt.setString(1, dto.getMenuname());
			pstmt.setString(2, dto.getCategory());
			pstmt.setInt(3, dto.getMenuprice());
			pstmt.setString(4, dto.getMipgoday());
			pstmt.setString(5, dto.getMenuphoto());
			pstmt.setString(6, dto.getMenudetail());
			

			//����
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt);
		}
	}
	
	public List<MenuDto> getallMenus(){
		List<MenuDto> list = new ArrayList<MenuDto>();
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		String sql = "select * from menu order by menunum";
		
		conn = db.getMyConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				
				MenuDto dto = new MenuDto();
				dto.setCategory(rs.getString("category"));
				dto.setMenudetail(rs.getString("menudetail"));
				dto.setMenuid(rs.getString("menuid"));
				dto.setMenuname(rs.getString("menuname"));
				dto.setMenunum(rs.getInt("menunum"));
				dto.setMenuphoto(rs.getString("menuphoto"));
				dto.setMenuprice(rs.getInt("menuprice"));
				dto.setMipgoday(rs.getString("mipgoday"));
				list.add(dto);
				
			}
		
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt,rs);
		}
		
		
		
		
		return list;
	}
	
	

}
