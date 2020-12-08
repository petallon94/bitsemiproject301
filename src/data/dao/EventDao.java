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
			

			//�뛾�룆�뾼占쎈데�뜝�럥�럠
			pstmt.setInt(1, start);
			pstmt.setInt(2, perpage);
			//�뜝�럥堉꾢뜝�럥六�

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
	

	public void updateEvent(EventDto dto)
	{
		String sql="";
		Connection conn=null;
		PreparedStatement pstmt=null;

		conn=db.getMyConnection();
		
		try {
			if(dto.getEvlistimage()==null && dto.getEvcontentimage().length()<2)
			{
				sql="update event set evsubject=?,evcontent=?,evstartday=?,evendday=? where eventnum=?";
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setString(1, dto.getEvsubject());
				pstmt.setString(2, dto.getEvcontent());
				pstmt.setString(3, dto.getEvstartday());
				pstmt.setString(4, dto.getEvendday());
				pstmt.setString(5, dto.getEventnum());
			}else if(dto.getEvlistimage()!=null  && dto.getEvcontentimage().length()<2)
			{
				sql="update event set evsubject=?,evlistimage=?,evcontent=?,evstartday=?,evendday=? where eventnum=?";
				pstmt=conn.prepareStatement(sql);
			
				pstmt.setString(1, dto.getEvsubject());
				pstmt.setString(2, dto.getEvlistimage());
				pstmt.setString(3, dto.getEvcontent());
				pstmt.setString(4, dto.getEvstartday());
				pstmt.setString(5, dto.getEvendday());
				pstmt.setString(6, dto.getEventnum());
				
			}else if(dto.getEvlistimage()==null && dto.getEvcontentimage()!=null) 
			{
				sql="update event set evsubject=?,evcontent=?,evcontentimage=?,evstartday=?,evendday=? where eventnum=?";
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setString(1, dto.getEvsubject());
				pstmt.setString(2, dto.getEvcontent());
				pstmt.setString(3, dto.getEvcontentimage());
				pstmt.setString(4, dto.getEvstartday());
				pstmt.setString(5, dto.getEvendday());
				pstmt.setString(6, dto.getEventnum());
				
				
			}else if(dto.getEvlistimage()!=null  &&  dto.getEvcontentimage()!=null)
			{
				sql="update event set evsubject=?,evlistimage=?,evcontent=?,evcontentimage=?,evstartday=?,evendday=? where eventnum=?";
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setString(1, dto.getEvsubject());
				pstmt.setString(2, dto.getEvlistimage());
				pstmt.setString(3, dto.getEvcontent());
				pstmt.setString(4, dto.getEvcontentimage());
				pstmt.setString(5, dto.getEvstartday());
				pstmt.setString(6, dto.getEvendday());
				pstmt.setString(7, dto.getEventnum());
				
			}
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt);
		}
	}

	public List<EventDto> getMainEvent()
	   {
	      List<EventDto> list=new ArrayList<EventDto>();
	      Connection conn=null;
	      PreparedStatement pstmt=null;
	      ResultSet rs=null;
	      
	      String sql="select * from event order by eventnum desc limit 3";
	      
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

	
	
	
}
