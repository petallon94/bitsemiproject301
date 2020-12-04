package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
				+ " (id,evsubject,evlistimage,evcontent,evcontentimage,evstartday,evendday,evreadcount,evwriteday)"
				+ " values ('admin',?,?,?,?,?,?,0,now())";
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
	public void updateReadCount(String eventnum)
	{
		String sql="update event set evreadcount=evreadcount+1 where eventnum=?";
		Connection conn=null;
		PreparedStatement pstmt=null;
		conn=db.getMyConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, eventnum);

			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt);
		}
	}
	
	//목록
	public List<EventDto> getAllEvent()
	{
		List<EventDto> list=new ArrayList<EventDto>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from event order by eventnum desc";
		
		conn=db.getMyConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				EventDto dto=new EventDto();
				dto.setEventnum(rs.getString("eventnum"));
				dto.setId(rs.getString("id"));
				dto.setEvsubject(rs.getString("evsubject"));
				dto.setEvlistimage(rs.getString("evlistimage"));
				dto.setEvcontent(rs.getString("evcontent"));
				dto.setEvcontentimage(rs.getString("evcontentimage"));
				dto.setEvstartday(rs.getString("evstartday"));
				dto.setEvendday(rs.getString("evendday"));
				dto.setEvreadcount(rs.getInt("evreadcount"));
				dto.setEvwriteday(rs.getTimestamp("evwriteday"));
				
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
	
	//진행중이벤트
	public List<EventDto> getIngEvent()
	{
		List<EventDto> list=new ArrayList<EventDto>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from event where evendday>DATE_sub(NOW(),INTERVAL 1 DAY) order by eventnum desc";
		
		conn=db.getMyConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				EventDto dto=new EventDto();
				dto.setEventnum(rs.getString("eventnum"));
				dto.setId(rs.getString("id"));
				dto.setEvsubject(rs.getString("evsubject"));
				dto.setEvlistimage(rs.getString("evlistimage"));
				dto.setEvcontent(rs.getString("evcontent"));
				dto.setEvcontentimage(rs.getString("evcontentimage"));
				dto.setEvstartday(rs.getString("evstartday"));
				dto.setEvendday(rs.getString("evendday"));
				dto.setEvreadcount(rs.getInt("evreadcount"));
				dto.setEvwriteday(rs.getTimestamp("evwriteday"));
				
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
	
	
	
	//종료이벤트
	public List<EventDto> getEndEvent()
	{
		List<EventDto> list=new ArrayList<EventDto>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from event where evendday<DATE_sub(NOW(),INTERVAL 1 DAY) order by eventnum desc";
		
		conn=db.getMyConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				EventDto dto=new EventDto();
				dto.setEventnum(rs.getString("eventnum"));
				dto.setId(rs.getString("id"));
				dto.setEvsubject(rs.getString("evsubject"));
				dto.setEvlistimage(rs.getString("evlistimage"));
				dto.setEvcontent(rs.getString("evcontent"));
				dto.setEvcontentimage(rs.getString("evcontentimage"));
				dto.setEvstartday(rs.getString("evstartday"));
				dto.setEvendday(rs.getString("evendday"));
				dto.setEvreadcount(rs.getInt("evreadcount"));
				dto.setEvwriteday(rs.getTimestamp("evwriteday"));
				
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
	
	
	
	
	//총갯수
	public int getIngTotalCount()
	{
		int tot=0;
		String sql="select count(*) from event where evendday>DATE_sub(NOW(),INTERVAL 1 DAY)";
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
	
	public EventDto getData(String eventnum)
	{
		String sql="select * from event where eventnum=?";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		EventDto dto=new EventDto();
		
		conn=db.getMyConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, eventnum);
			rs=pstmt.executeQuery();
			
			while(rs.next())
			{
				dto.setEventnum(rs.getString("eventnum"));
				dto.setId(rs.getString("id"));
				dto.setEvsubject(rs.getString("evsubject"));
				dto.setEvlistimage(rs.getString("evlistimage"));
				dto.setEvcontent(rs.getString("evcontent"));
				dto.setEvcontentimage(rs.getString("evcontentimage"));
				dto.setEvstartday(rs.getString("evstartday"));
				dto.setEvendday(rs.getString("evendday"));
				dto.setEvreadcount(rs.getInt("evreadcount"));
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
	
	
	public List<EventDto> getList(int start,int perpage)
	{
		String sql="select * from event where evendday>DATE_sub(NOW(),"
				+ "INTERVAL 1 DAY) order by eventnum desc limit ?,?";
		List<EventDto> list=new ArrayList<EventDto>();
		
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
				EventDto dto=new EventDto();
				dto.setEventnum(rs.getString("eventnum"));
				dto.setId(rs.getString("id"));
				dto.setEvsubject(rs.getString("evsubject"));
				dto.setEvlistimage(rs.getString("evlistimage"));
				dto.setEvcontent(rs.getString("evcontent"));
				dto.setEvcontentimage(rs.getString("evcontentimage"));
				dto.setEvstartday(rs.getString("evstartday"));
				dto.setEvendday(rs.getString("evendday"));
				dto.setEvreadcount(rs.getInt("evreadcount"));
				dto.setEvwriteday(rs.getTimestamp("evwriteday"));
				
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
	
	
	//삭제
	public void deleteEvent(String eventnum)
	{
		String sql="delete from event where eventnum=?";
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		conn=db.getMyConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, eventnum);
			
			pstmt.execute();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt);
		}
	}
	
	
	//수정
	public void updateEvent(EventDto dto)
	{
		String sql="update event set evsubject=?,evlistimage=?,evcontent=?,"
				+ "evcontentimage=?,evstartday=?,evendday=? where eventnum=?";
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		conn=db.getMyConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getEvsubject());
			pstmt.setString(2, dto.getEvlistimage());
			pstmt.setString(3, dto.getEvcontent());
			pstmt.setString(4, dto.getEvcontentimage());
			pstmt.setString(5, dto.getEvstartday());
			pstmt.setString(6, dto.getEvendday());
			pstmt.setString(7, dto.getEventnum());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt);
		}
	}
	
	
}
