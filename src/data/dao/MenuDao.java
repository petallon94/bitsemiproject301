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

	public void insertMenu(MenuDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "insert into menu (menuid,menuname,category,menuprice,mipgoday,menuphoto,menudetail,menukcal,menunat,menusugar,menucaff) "
				+ "values('admin',?,?,?,?,?,?,?,?,?,?);";
		conn = db.getMyConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			// 바인딩
			pstmt.setString(1, dto.getMenuname());
			pstmt.setString(2, dto.getCategory());
			pstmt.setInt(3, dto.getMenuprice());
			pstmt.setString(4, dto.getMipgoday());
			pstmt.setString(5, dto.getMenuphoto());
			pstmt.setString(6, dto.getMenudetail());
			pstmt.setInt(7,dto.getMenukcal());
			pstmt.setInt(8,dto.getMenunat());
			pstmt.setInt(9,dto.getMenusugar());
			pstmt.setInt(10,dto.getMenucaff());

			//menukcal menunat menusugar menucaff
			
			
			// 실행
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt);
		}
	}

	public List<MenuDto> getallMenus() {
		List<MenuDto> list = new ArrayList<MenuDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from menu order by menunum";

		conn = db.getMyConnection();

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {

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
		} finally {
			db.dbClose(conn, pstmt, rs);
		}

		return list;
	}

	// detailpage
	
	  public MenuDto getdata(String menunum) {
	  
		  MenuDto dto = new MenuDto();
		  Connection conn = null;
		  PreparedStatement pstmt = null;
		  ResultSet rs =null;
		  String sql = "select * from menu where menunum=?";
		  conn=db.getMyConnection();
		  
		  try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, menunum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				dto.setCategory(rs.getString("category"));
				dto.setMenudetail(rs.getString("menudetail"));
				dto.setMenuid(rs.getString("menuid"));
				dto.setMenuname(rs.getString("menuname"));
				dto.setMenunum(rs.getInt("menunum"));
				dto.setMenuphoto(rs.getString("menuphoto"));
				dto.setMenuprice(rs.getInt("menuprice"));
				dto.setMipgoday(rs.getString("mipgoday"));
				dto.setMenukcal(rs.getInt("menukcal"));
				dto.setMenunat(rs.getInt("menunat"));
				dto.setMenusugar(rs.getInt("menusugar"));
				dto.setMenucaff(rs.getInt("menucaff"));
			}
			
			
			
		  } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			db.dbClose(conn, pstmt,rs);
			
		}
		  
		  return dto;
	  }
	 

}
