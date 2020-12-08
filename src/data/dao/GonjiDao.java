package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sun.org.apache.xerces.internal.impl.xpath.regex.REUtil;

import data.dto.GonjiDto;
import mysql.db.MysqlConnect;

public class GonjiDao {
	
	MysqlConnect db=new MysqlConnect();
	
	//gonnum의 max값 구해서 리턴(null일 경우 0리턴)
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
		
		//System.out.println("insertgonji : "+dto.getGonid());
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
	//검색시 페이징 처리되는 부분으로 대체함 getSearchList
/*	public List<GonjiDto> getList(int start, int perpage)
	{
		List<GonjiDto> list=new ArrayList<GonjiDto>();
		//limit 시작,갯수
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
				dto.setGonid(rs.getString("gonid"));
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
	*/
	
	//검색결과 리스트 중 한 페이지에서 필요한만큼 반환하기
	public List<GonjiDto> getSearchList(String key,
			String value,int start,int perpage)
	{
		List<GonjiDto> list=new ArrayList<GonjiDto>();
		//all일 경우
		String s="";
		if(key!=null)
		{
			//("")는 html에서 준 변수=>gonlist로 보낸다
			//where=?는 mysql에서 읽어들일 테이블에서의 칼럼명
			if(key.equals("myid"))
				s="where gonid='"+value+"'";
			else if(key.equals("subject"))
				s="where gonsubject like '%"+value+"%'";
			else if(key.equals("content"))
				s="where goncontent like '%"+value+"%'";	
		}
		String sql="select * from gonji "+s+" order by gonnum desc limit ?,?";
		
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
				dto.setGonid(rs.getString("gonid"));
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
	
	//num에 해당하는 dto반환: 내용보기&수정
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
			//바인딩
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
	
	//내용보기시 조회수 1증가
	public void updateReadcount(String gonnum)
	{
		String sql="update gonji set gonreadcount=gonreadcount+1 where gonnum=?";
		Connection conn=null;
		PreparedStatement pstmt=null;
		conn=db.getMyConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, gonnum);
			//실행
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt);
		}
	}
	
	//삭제
	public void deleteGonji(String gonnum)
	{
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql="delete from gonji where gonnum=?";
		
		conn=db.getMyConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, gonnum);
			//실행
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt);
		}
		
	}
	
	//수정
	public void updateGonji(GonjiDto dto)
	{
		String sql="update gonji set gonsubject=?,goncontent=? where gonnum=?";
		Connection conn=null;
		PreparedStatement pstmt=null;
		conn=db.getMyConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, dto.getGonsubject());
			pstmt.setString(2, dto.getGoncontent());
			pstmt.setString(3, dto.getGonnum());
			//실행
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt);
		}
		
	}
	
	//최신원글 1개 리턴용
	//공지사항 메인에 롤링
	public List<GonjiDto> getNewList()
	{
		List<GonjiDto> list=new ArrayList<GonjiDto>();
		//num를 내림차순(desc), limit로 시작번지,몇개 가져올지 바인딩
		String sql="select * from gonji order by gonnum desc limit 0,1";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		conn=db.getMyConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//실행
			rs=pstmt.executeQuery();
			//while문
			while(rs.next())
			{
				GonjiDto dto=new GonjiDto();
				dto.setGonnum(rs.getString("gonnum"));
				dto.setGonid(rs.getString("gonid"));
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