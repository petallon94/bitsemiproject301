package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.GonjiDto;
import mysql.db.MysqlConnect;

public class GonjiDao {
	
	MysqlConnect db=new MysqlConnect();
	
	//insert
	public void insertGonji(GonjiDto dto)
	{
		String sql="insert into gonji (gonid,gonsubject,goncontent,"
				+ "gonreadcount,gonwriteday) values (?,?,?,0,now())";
		Connection conn=null;
		PreparedStatement pstmt=null;
		conn=db.getMyConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, dto.getGonid());
			pstmt.setString(2, dto.getGonsubject());
			pstmt.setString(3, dto.getGoncontent());
			//실행
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt);
		}
	}
	
	//전체 갯수 구하는
	public int getTotalCount() 
	{
		int n=0;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select count(*) from gonji";
		
		conn=db.getMyConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next())
				n=rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt, rs);
		}
		return n;
	}
	
	//페이징 처리한 리스트 목록 반환
	public List<GonjiDto> getList(int start, int perpage)
	{
		List<GonjiDto> list=new ArrayList<GonjiDto>();
		String sql="select * from gonji order by gonnum desc limit ?,?";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		conn=db.getMyConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setInt(1, start);
			pstmt.setInt(2, perpage);
			//실행
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				GonjiDto dto=new GonjiDto();
				dto.setGonnum(rs.getString("gonnum"));
				dto.setGonid(rs.getNString("gonid"));
				dto.setGonsubject(rs.getString("gonsubject"));
				dto.setGoncontent(rs.getString("goncontent"));
				dto.setGonreadcount(rs.getInt("gonreadcount"));
				dto.setGonwriteday(rs.getTimestamp("gonwriteday"));
				//list에 추가
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
}








