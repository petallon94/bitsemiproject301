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
			// Ã¯Â¿Â½Ã¯Â¿Â½Ã¯Â¿Â½ÃŽÂµÃ¯Â¿Â½
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
				dto.setMenukcal(rs.getInt("menukcal"));
				dto.setMenunat(rs.getInt("menunat"));
				dto.setMenusugar(rs.getInt("menusugar"));
				dto.setMenucaff(rs.getInt("menucaff"));
				
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
	
	//¸ÞÀÎ ·£´ý ¸Å´º 4°³
	
	public List<MenuDto> getRandomMenus() {
		List<MenuDto> list = new ArrayList<MenuDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from menu order by rand() limit 12";

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
				dto.setMenukcal(rs.getInt("menukcal"));
				dto.setMenunat(rs.getInt("menunat"));
				dto.setMenusugar(rs.getInt("menusugar"));
				dto.setMenucaff(rs.getInt("menucaff"));
				
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
	
	
	
	
	
	
	
	//¸Þ´º °¢ ¸Þ´º ÆäÀÌÁö
	
	
	public List<MenuDto> getoneMenus(String menuname) {
		List<MenuDto> list = new ArrayList<MenuDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from menu where category =? order by menunum";

		conn = db.getMyConnection();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,menuname);
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
				dto.setMenukcal(rs.getInt("menukcal"));
				dto.setMenunat(rs.getInt("menunat"));
				dto.setMenusugar(rs.getInt("menusugar"));
				dto.setMenucaff(rs.getInt("menucaff"));
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
	
	////////// menu admin ////////////
	
	public int getTotalcount() {
		int totalcount=0;
		MenuDto dto = new MenuDto();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from menu ";
		
		
		conn = db.getMyConnection();
		
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next())
				totalcount=rs.getInt(1);
		
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			db.dbClose(conn, pstmt,rs);
		}
		
		return totalcount;
	}
	
	
	public int getMenucount(String menuname) {
		int menucount=0;
		MenuDto dto = new MenuDto();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from menu where category = ? ";
		conn = db.getMyConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, menuname);
			
			rs=pstmt.executeQuery();
			if(rs.next())
				menucount=rs.getInt(1);
		
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			db.dbClose(conn, pstmt,rs);
		}
		
		return menucount;
	}
	
	//ÆäÀÌÂ¡ Ã³¸®/////
	
	public List<MenuDto> getListMenus(int start,int perpage) {
		List<MenuDto> list = new ArrayList<MenuDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from menu order by menunum desc limit ?,?";

		conn = db.getMyConnection();

		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, perpage);
			
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
				dto.setMenukcal(rs.getInt("menukcal"));
				dto.setMenunat(rs.getInt("menunat"));
				dto.setMenusugar(rs.getInt("menusugar"));
				dto.setMenucaff(rs.getInt("menucaff"));
				
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
	
	
	
	////// update //// delete /////
	
	
	public void deleteMenu(String num) {
		
		System.out.println(num);
		String sql = "delete from menu where menunum = ?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		conn = db.getMyConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			
			pstmt.execute();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{			
			db.dbClose(conn,pstmt);
		}
		
		
	}
	
	
	public void updateMenu(MenuDto dto) {
			String sql = "update menu set menuname=?,category=?, menuprice=?, mipgoday=?, menuphoto=?, menudetail=?,menukcal=?,menunat=?,menusugar=?,menucaff=? where menunum = ?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		conn = db.getMyConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMenuname());
			pstmt.setString(2, dto.getCategory());
			pstmt.setInt(3, dto.getMenuprice());
			pstmt.setString(4, dto.getMipgoday());
			pstmt.setString(5, dto.getMenuphoto());
			pstmt.setString(6, dto.getMenudetail());
			pstmt.setInt(7, dto.getMenukcal());
			pstmt.setInt(8, dto.getMenunat());
			pstmt.setInt(9, dto.getMenusugar());
			pstmt.setInt(10, dto.getMenucaff());
			pstmt.setInt(11, dto.getMenunum());
			
			pstmt.execute();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{			
			db.dbClose(conn,pstmt);
		}
		
		
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
	 
	  public int getNum(int menunum)
	  {
		  int num=0;
		  String sql="select menunum from menu where menuname=?";
		  
		  return menunum;
	  }
}
