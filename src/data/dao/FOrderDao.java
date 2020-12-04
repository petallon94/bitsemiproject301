package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.FOrderDto;
import mysql.db.MysqlConnect;

public class FOrderDao {
	MysqlConnect db = new MysqlConnect();
	
	public int getTotalCount(String orderid) 
	{
		int n = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="select count(*) from forder where forderid=?";
		conn=db.getMyConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, orderid);
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				n=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt, rs);
		}
		return n;
	}
	
	public List<FOrderDto> getOrderList(int start, int end, String orderid)
	{
		String sql="select * from forder where forderid=? order by fordernum desc limit ?,?";
		List<FOrderDto> list = new ArrayList<FOrderDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		conn=db.getMyConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, orderid);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				FOrderDto dto = new FOrderDto();
				dto.setFordernum(rs.getInt("fordernum"));
				dto.setFmnname(rs.getString("fmnname"));
				dto.setFsize(rs.getString("fsize"));
				dto.setFtemp(rs.getString("ftemp"));
				dto.setForderprice(rs.getInt("forderprice"));
				dto.setForderdate(rs.getTimestamp("forderdate"));
				
				//list에 추가
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
