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

	
	//�̺�Ʈ �߰�
	public void insertEvent(EventDto dto)
	{
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql="insert into event"
				+ " (id,evsubject,evlistimage,evcontent,evcontentimage,evstartday,evendday,evwriteday)"
				+ " values ('admin',?,?,?,?,?,?,now())";
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
	
	//��ȸ������
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
	
	//���
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
	
	//�Ѱ���
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
	
	
}
