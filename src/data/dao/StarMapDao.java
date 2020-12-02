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

		String sql="select * from map order by shopname asc";
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

	//insert
	public void insertMap(StarMapDto dto) {
		String sql="insert into map (shopname,shophp,shopaddr,shopaddrdetail,shopphoto,shopdetail,mpositionx,mpositiony) values (?,?,?,?,?,?,?,?)";
		Connection conn=null;
		PreparedStatement pstmt=null;

		conn=db.getMyConnection();

		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩

			pstmt.setString(1, dto.getShopname());
			String shophp=dto.getShophp1()+"-"+dto.getShophp2();
			pstmt.setString(2, shophp);					
			String shopaddr=dto.getShoppostcode()+","+dto.getShopaddr()+dto.getShopextraAddress();
			pstmt.setString(3, shopaddr);
			pstmt.setString(4, dto.getShopaddrdetail());		
			pstmt.setString(5, dto.getShopphoto());
			pstmt.setString(6, dto.getShopdetail());
			pstmt.setString(7, dto.getMpositionx());
			pstmt.setString(8, dto.getMpositiony());			

			//실행
			pstmt.execute();			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt);
		}		
	}
	

	//전체 갯수 구하기
	public int getTotalCount()
	{
		int tot=0;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select count(*) from map";
		conn=db.getMyConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next())
			{
				tot=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt, rs);
		}
		return tot;
	}
	
	public List<StarMapDto> getList(int start,int perpage)
	{
		//그룹변수의 내림차순,같은 그룹인경우 step 의 오름차순 출력
		//limit 로 시작번지와 몇개르 가져올지 바인딩
		String sql="select * from map order by shopnum desc limit ?,?";
		List<StarMapDto> list=new ArrayList<StarMapDto>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		conn=db.getMyConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, perpage);
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

