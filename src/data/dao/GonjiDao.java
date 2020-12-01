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
	
	//gonnum�� max�� ���ؼ� ����(null�� ��� 0����)
	public int getMaxNum() 
	{
		int max=0;
		String sql="select ifnull(max(gonnum),0) from gonji";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		conn=db.getMyConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			if(rs.next())
				max=rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt, rs);
		}
		return max;
		
	}
	
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
			//���ε�
			pstmt.setString(1, dto.getGonid());
			pstmt.setString(2, dto.getGonsubject());
			pstmt.setString(3, dto.getGoncontent());
			//����
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt);
		}
	}
	
	//��ü ���� ���ϴ�
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
	
	//����¡ ó���� ����Ʈ ��� ��ȯ
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
			//���ε�
			pstmt.setInt(1, start);
			pstmt.setInt(2, perpage);
			//����
			rs=pstmt.executeQuery();
			while(rs.next())
			{
				GonjiDto dto=new GonjiDto();
				dto.setGonnum(rs.getString("gonnum"));
				dto.setGonid(rs.getString("gonid"));
				dto.setGonsubject(rs.getString("gonsubject"));
				dto.setGoncontent(rs.getString("goncontent"));
				dto.setGonreadcount(rs.getInt("gonreadcount"));
				dto.setGonwriteday(rs.getTimestamp("gonwriteday"));
				//list�� �߰�
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
	
	//num�� �ش��ϴ� dto��ȯ: ���뺸��&����
	public GonjiDto getData(String gonnum)
	{
		System.out.println("n="+gonnum);
		GonjiDto dto=new GonjiDto();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from gonji where gonnum=?";
		
		conn=db.getMyConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//���ε�
			pstmt.setString(1, gonnum);
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				dto.setGonnum(rs.getString("gonnum"));
				dto.setGonid(rs.getString("gonid"));
				dto.setGonsubject(rs.getString("gonsubject"));
				dto.setGoncontent(rs.getString("goncontent"));
				dto.setGonreadcount(rs.getInt("gonreadcount"));
				dto.setGonwriteday(rs.getTimestamp("gonwriteday"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt, rs);
		}
		return dto;
	}
	
	//���뺸��� ��ȸ�� 1����
	public void updateReadcount(String gonnum)
	{
		String sql="update gonji set gonreadcount=gonreadcount+1 where gonnum=?";
		Connection conn=null;
		PreparedStatement pstmt=null;
		conn=db.getMyConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//���ε�
			pstmt.setString(1, gonnum);
			//����
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt);
		}
	}
}








