package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.StarMapDto;
import mysql.db.MysqlConnect;

public class StarMapDao {
	
	MysqlConnect db=new MysqlConnect();
	
	public StarMapDto getData(String shopnum)
	{
		String sql="select * from map where shopnum=?";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		StarMapDto dto=new StarMapDto();
		
		conn=db.getMyConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, shopnum);
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				dto.setShopnum(rs.getString("shopnum"));
				dto.setShopname(rs.getString("shopname"));
				dto.setShophp(rs.getString("shophp"));
				dto.setShopaddr(rs.getString("shopaddr"));
				dto.setShopaddrdetail(rs.getString("shopaddrdetail"));
				dto.setShopphoto(rs.getString("shopphoto"));
				dto.setShopdetail(rs.getString("shopdetail"));
				dto.setMpositionx(rs.getString("mpositionx"));
				dto.setMpositiony(rs.getString("mpositiony"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt, rs);
		}
		return dto;
	}
	
	public List<StarMapDto> getMainList()
	{
		
		String sql="select * from map2 order by shopname asc";
		List<StarMapDto> list=new ArrayList<StarMapDto>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		conn=db.getMyConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				StarMapDto dto=new StarMapDto();
				dto.setShopnum(rs.getString("shopnum"));
				dto.setShopname(rs.getString("shopname"));
				dto.setShophp(rs.getString("shophp"));
				dto.setShopaddr(rs.getString("shopaddr"));
				dto.setShopaddrdetail(rs.getString("shopaddrdetail"));
				dto.setShopphoto(rs.getString("shopphoto"));
				dto.setShopdetail(rs.getString("shopdetail"));
				dto.setMpositionx(rs.getString("mpositionx"));
				dto.setMpositiony(rs.getString("mpositiony"));
				
				list.add(dto);
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

