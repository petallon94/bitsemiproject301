package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import data.dto.MemberDto;
import data.dto.MemberDto2;
import mysql.db.MysqlConnect;


public class MemberDao {
	MysqlConnect db=new MysqlConnect();

	public MemberDao() {
		// TODO Auto-generated constructor stub
	}

	//아이디가 있으면 true 반환, 없으면 false 반환
	public boolean isIdSearch(String id)
	{
		boolean find=false;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from Login where id=?";

		conn=db.getMyConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next())
				find=true;

		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt, rs);
		}

		return find;

	}

	//insert
	public void insertMember(MemberDto dto) {
		String sql="insert into Login (id, password, address, addrdetail, birthday, gaipday, email, name, barcode, hp) values (?,?,?,?,?,now(),?,?,?,?)";
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		int barcode = (int) (Math.random()*100000000)+1;
		conn=db.getMyConnection();

		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩

			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPassword());				
			String address=dto.getPostcode()+" "+dto.getAddress()+" "+dto.getExtraaddr();
			pstmt.setString(3, address);
			pstmt.setString(4, dto.getAddrdetail());			
			pstmt.setString(5, dto.getBirthday());
			String email=dto.getEmail1()+"@"+dto.getEmail2();
			pstmt.setString(6, email);
			pstmt.setString(7, dto.getName());
			String hp=dto.getHp1()+"-"+dto.getHp2()+"-"+dto.getHp3();
			pstmt.setInt(8, barcode);	
			pstmt.setString(9, hp);		

			//실행
			pstmt.execute();			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt);
		}		
	}

	//전체회원목록
	public List<MemberDto2> getAllMembers() {
		List<MemberDto2> list=new Vector<MemberDto2>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from Login order by id asc";
		conn=db.getMyConnection();

		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				MemberDto2 dto=new MemberDto2();
				dto.setLoginnum(rs.getString("loginnum"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setAddress(rs.getString("address"));
				dto.setAddrdetail(rs.getString("addrdetail"));
				dto.setHp(rs.getString("hp"));
				dto.setBirthday(rs.getString("birthday"));
				dto.setEmail(rs.getString("email"));
				dto.setBarcode(rs.getString("barcode"));
				dto.setGaipday(rs.getTimestamp("gaipday"));

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

	//num에 해당하는 dto 반환
	public MemberDto getData(String loginnum)
	{
		MemberDto dto=new MemberDto();
		String sql="select * from Login where loginnum=?";

		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		conn=db.getMyConnection();

		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, loginnum);
			//실행
			rs=pstmt.executeQuery();

			while(rs.next())
			{
				dto.setLoginnum(rs.getString("loginnum"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				String []address=rs.getString("address").split(" ");
				dto.setPostcode(address[0]);
				dto.setAddress(address[1]);
				dto.setExtraaddr(address[2]);
				dto.setAddrdetail(rs.getString("addrdetail"));
				String []hp=rs.getString("hp").split("-");
				dto.setHp1(hp[0]);
				dto.setHp2(hp[1]);
				dto.setHp3(hp[2]);
				String []email=rs.getString("email").split("@");
				dto.setEmail1(email[0]);
				dto.setEmail2(email[1]);
				dto.setBirthday(rs.getString("birthday"));
				dto.setBarcode(rs.getString("barcode"));
			}

		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt, rs);
		}
		return dto;

	}

	//id에 따른 getdata
	public String getNum(String id)
	{
		String num="";
		String sql="select loginnum from Login where id=?";

		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		conn=db.getMyConnection();

		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, id);
			//실행
			rs=pstmt.executeQuery();

			if(rs.next())
			{
				num=rs.getString("loginnum");				
			}

		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt, rs);
		}
		return num;		
	}

	//수정-이름, 핸드폰,이메일, 주소만 수정
	public void updateMember(MemberDto dto) 
	{
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql="update Login set name=?, hp=?, email=?, address=?, addrdetail=?, birthday=? where loginnum=?";

		conn=db.getMyConnection();

		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, dto.getName());			
			String hp=dto.getHp1()+"-"+dto.getHp2()+"-"+dto.getHp3();
			pstmt.setString(2, hp);
			String email=dto.getEmail1()+"@"+dto.getEmail2();
			pstmt.setString(3, email);
			String address=dto.getPostcode()+" "+dto.getAddress()+" "+dto.getExtraaddr();
			pstmt.setString(4, address);
			pstmt.setString(5, dto.getAddrdetail());			
			pstmt.setString(6, dto.getBirthday());
			pstmt.setString(7, dto.getLoginnum());

			//실행
			pstmt.execute();

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt);
		}		
	}

	//아이디에 해당하는 비번이 맞으면 true반환 틀리면 false 반환
	public boolean isIdPassCheck(String id, String password)
	{
		boolean find=false;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from Login where id=? and password=?";

		conn=db.getMyConnection();

		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			//System.out.println(id+"   "+ password);
			rs=pstmt.executeQuery();
			if(rs.next())
				find=true;

		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt, rs);
		}

		return find;
	}
	
	//삭제하는 메서드
	public void deleteMember(String id)
	{
		String sql="delete from Login where id=?";
		Connection conn=null;
		PreparedStatement pstmt=null;

		conn=db.getMyConnection();

		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, id);
			//실행
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt);
		}
	}

	//로그인시 필요한 메서드
	/*아이디가  DB 명단에 없을경우 1 반환
	   아이디는 있는데 비번이 안맞는경우 2 반환
	  아이디와 비번 모두 맞는경우 3 반환*/
	public int loginProcess(String id, String password)
	{
		int ans=0;
		if(this.isIdSearch(id))
		{
			//아이디가 존재하는 경우
			//비번이 맞는지 체크하기
			if(this.isIdPassCheck(id, password)) {
				//비번이 맞는경우
				ans=3;
			}else {
				//비번이 틀린경우
				ans=2;
			}

		}else {//아이디가 아예 존재하지 않는경우
			ans=1;
		}		
		return ans;
	}

	//아이디에 해당하는 이름을 반환하는 메서드 추가
	public String getName(String id)
	{
		String name="";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select name from Login where id=?";

		conn=db.getMyConnection();

		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next())
			name=rs.getString("name");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt, rs);
		}
		return name;
	}
	
	
	//id에 해당하는 dto 반환
		public MemberDto getDataID(String id)
		{
			MemberDto dto=new MemberDto();
			String sql="select * from Login where id=?";

			Connection conn=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;

			conn=db.getMyConnection();

			try {
				pstmt=conn.prepareStatement(sql);
				//바인딩
				pstmt.setString(1, id);
				//실행
				rs=pstmt.executeQuery();

				while(rs.next())
				{
					dto.setLoginnum(rs.getString("loginnum"));
					dto.setId(rs.getString("id"));
					dto.setName(rs.getString("name"));
					String []address=rs.getString("address").split(" ");
					dto.setPostcode(address[0]);
					dto.setAddress(address[1]);
					dto.setExtraaddr(address[2]);
					dto.setAddrdetail(rs.getString("addrdetail"));
					String []hp=rs.getString("hp").split("-");
					dto.setHp1(hp[0]);
					dto.setHp2(hp[1]);
					dto.setHp3(hp[2]);
					String []email=rs.getString("email").split("@");
					dto.setEmail1(email[0]);
					dto.setEmail2(email[1]);
					dto.setBirthday(rs.getString("birthday"));
					dto.setBarcode(rs.getString("barcode"));
				}

			}catch (SQLException e) {
				e.printStackTrace();
			}finally {
				db.dbClose(conn, pstmt, rs);
			}
			return dto;

		}




}
