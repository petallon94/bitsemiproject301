package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import data.dto.EventDto;
import mysql.db.MysqlConnect;

public class EventDao {
	
	MysqlConnect db=new MysqlConnect();

	
	//이벤트 추가
	public void insertEvent(EventDto dto)
	{
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql="insert into event"
				+ " (evsubject,evlistimage,evcontent,evcontentimage,evstartday,evendday,evwriteday)"
				+ " values (?,?,?,?,?,?,now())";
		conn=db.getMyConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getEvsubject());
			pstmt.setString(2, dto.getEvlistimage());
			pstmt.setString(3, dto.getEvcontent());
			pstmt.setString(4, dto.getEvcontentimage());
			pstmt.setString(5, dto.getEvstartday());
			pstmt.setString(6, dto.getEvendday());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt);
		}
	}
	
	//조회수증가
	public void updateReadCount(String num)
	{
		String sql="update event set readcount=readcount+1 where num=?";
		Connection conn=null;
		PreparedStatement pstmt=null;
		conn=db.getMyConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, num);

			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt);
		}
	}
	
	//내용보기
	public EventDto getData(String num)
	{
		EventDto dto=new EventDto();
		String sql="select * from event where num=?";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		conn=db.getMyConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, num);
			
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				dto.setEventnum(rs.getInt("eventnum"));
				dto.setId(rs.getString("id"));
				dto.setEvsubject(rs.getString("evsubject"));
				dto.setEvlistimage(rs.getString("evlistimage"));
				dto.setEvcontent(rs.getString("evcontent"));
				dto.setEvcontentimage(rs.getString("evcontentimage"));
				dto.setEvstartday(rs.getString("evstartday"));
				dto.setEvendday(rs.getString("evendday"));
				dto.setEvwriteday(rs.getTimestamp("evwriteday"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt, rs);
		}
		
		return dto;
	}
	
	//총갯수
	public int getTotalCount()
	{
		int tot=0;
		String sql="select count(*) from event";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		conn=db.getMyConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			if(rs.next())
				tot=rs.getInt(1);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt, rs);
		}	
		return tot;
	}
	
	
}
