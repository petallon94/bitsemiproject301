package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import data.dto.MenuDto;
import data.dto.OrderDto;
import mysql.db.MysqlConnect;

public class OrderDao {
	MysqlConnect db = new MysqlConnect();
	
	public MenuDto getData(String menunum)
	{
		MenuDto dto = new MenuDto();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="select * from menu where menunum=?";
		
		conn=db.getMyConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, menunum);
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				//dto.setMenunum(Integer.parseInt(rs.getString("menunum")));
				dto.setMenunum(rs.getInt("menunum"));
				dto.setMenuid(rs.getString("menuid"));
				dto.setMenuname(rs.getString("menuname"));
				dto.setCategory(rs.getString("category"));
				dto.setMenuprice(rs.getInt("menuprice"));
				dto.setMenuphoto(rs.getString("menuphoto"));
				dto.setMenudetail(rs.getString("menudatail"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt, rs);
		}
		return dto;
	}
	
	public void insertCart(OrderDto dto)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql="insert into morder (orderid,mnname,size,temp,orderprice,takeout,orderdate) values (?,?,?,?,?,?, now())";
		
		conn = db.getMyConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			
			//바인딩
			pstmt.setString(1, dto.getOrderid());
			pstmt.setString(2, dto.getMnname());
			pstmt.setString(3, dto.getSize());
			pstmt.setString(4, dto.getTemp());
			pstmt.setInt(5, dto.getOrderprice());
			pstmt.setString(6, dto.getTakeout());
			
			//실행
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt);
		}
	}
	
	//장바구니 출력
	public List<HashMap<String, String>> getOrderList(String id)
	{
		String sql="select m.menuname, m.menunum, m.menuphoto, m.menuprice, o.size, o.temp, o.takeout, o.orderdate, o.ordernum "
				+ "from morder o,Login l,menu m where o.mnname=m.menuname and o.orderid=l.id and l.id=?";
		List<HashMap<String, String>> list = new ArrayList<HashMap<String, String>>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		conn = db.getMyConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			
			//바인딩
			pstmt.setString(1, id);
			
			//실행
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("menuname", rs.getString("menuname"));
				map.put("menunum", rs.getString("menunum"));
				map.put("menuphoto", rs.getString("menuphoto"));
				map.put("menuprice", rs.getString("menuprice"));
				map.put("size", rs.getString("size"));
				map.put("temp", rs.getString("temp"));
				map.put("takeout", rs.getString("takeout"));
				map.put("orderdate", rs.getString("orderdate"));
				map.put("ordernum", rs.getString("ordernum"));
				
				//list에 추가
				list.add(map);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt, rs);
		}
		return list;
	}
	
}
