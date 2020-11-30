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
	
	public void insertCart(OrderDto dto)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql="insert into morder(orderid,mnname,size,temp,orderprice,takeout,orderdate) values (admin,'아메리카노',?,?,?,?,sysdate)";
		
		conn = db.getMyConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			
			//바인딩
			//pstmt.setString(1, dto.getOrderid());
			//pstmt.setString(1, dto.getMnname());
			pstmt.setString(1, dto.getSize());
			pstmt.setString(2, dto.getTemp());
			pstmt.setInt(3, dto.getOrderprice());
			pstmt.setString(4, dto.getTakeout());
			
			//실행
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt);
		}
	}
	
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
	
	//장바구니 출력
	public List<HashMap<String, String>> getOrderList(String id)
	{
		String sql="select m.menuname, m.menunum, m.menuphoto, m.menuprice, o.size, o.temp, o.takeout, o.orderdate "
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
				map.put("idx", rs.getString("idx"));
				map.put("sangpum", rs.getString("sangpum"));
				map.put("shopnum", rs.getString("shopnum"));
				map.put("photo", rs.getString("photo"));
				map.put("price", rs.getString("price"));
				map.put("cnt", rs.getString("cnt"));
				map.put("mycolor", rs.getString("mycolor"));
				map.put("cartday", rs.getString("cartday").substring(0,10));
				
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
	
	//장바구니 삭제 버튼 이벤
	public void deleteCart(String idx)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql="delete from cart where idx=?";
		conn = db.getMyConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			//���ε�
			pstmt.setString(1, idx);
			//����
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt);
		}
	}
}
