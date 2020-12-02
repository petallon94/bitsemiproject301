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

	//���̵� ������ true ��ȯ, ������ false ��ȯ
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
			//���ε�
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
		String sql="insert into Login (id, password, address, addrdetail, birthday, gaipday, email, name, hp) values (?,?,?,?,?,now(),?,?,?)";
		Connection conn=null;
		PreparedStatement pstmt=null;

		conn=db.getMyConnection();

		try {
			pstmt=conn.prepareStatement(sql);
			//���ε�

			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPassword());				
			String address=dto.getPostcode()+dto.getAddress()+dto.getExtraaddr();
			pstmt.setString(3, address);
			pstmt.setString(4, dto.getAddrdetail());			
			pstmt.setString(5, dto.getBirthday());
			String email=dto.getEmail1()+"@"+dto.getEmail2();
			pstmt.setString(6, email);
			pstmt.setString(7, dto.getName());
			String hp=dto.getHp1()+"-"+dto.getHp2()+"-"+dto.getHp3();
			pstmt.setString(8, hp);			

			//����
			pstmt.execute();			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt);
		}		
	}

	//��üȸ�����
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

	//num�� �ش��ϴ� dto ��ȯ
	public MemberDto getData(String num)
	{
		MemberDto dto=new MemberDto();
		String sql="select * from Login where loginnum=?";

		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		conn=db.getMyConnection();

		try {
			pstmt=conn.prepareStatement(sql);
			//���ε�
			pstmt.setString(1, num);
			//����
			rs=pstmt.executeQuery();

			while(rs.next())
			{
				dto.setLoginnum(rs.getString("loginnum"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setAddress(rs.getString("address"));
				dto.setAddrdetail(rs.getString("addrdetail"));
				String []hp=rs.getString("hp").split("-");
				dto.setHp1(hp[0]);
				dto.setHp2(hp[1]);
				dto.setHp3(hp[2]);
				String []email=rs.getString("email").split("@");
				dto.setEmail1(email[0]);
				dto.setEmail2(email[1]);
			}

		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt, rs);
		}
		return dto;

	}

	//id�� ���� getdata
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
			//���ε�
			pstmt.setString(1, id);
			//����
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

	//����-�̸�, �ڵ���,�̸���, �ּҸ� ����
	public void updateMember(MemberDto dto) 
	{
		Connection conn=null;
		PreparedStatement pstmt=null;
		String sql="update Login set name=?, hp=?, email=?, address=?, addrdetail=? birthday=? where num=?";

		conn=db.getMyConnection();

		try {
			pstmt=conn.prepareStatement(sql);
			//���ε�
			pstmt.setString(1, dto.getName());			
			String hp=dto.getHp1()+"-"+dto.getHp2()+"-"+dto.getHp3();
			pstmt.setString(2, hp);
			String email=dto.getEmail1()+"@"+dto.getEmail2();
			pstmt.setString(3, email);	
			pstmt.setString(4, dto.getAddress());
			pstmt.setString(5, dto.getAddrdetail());
			pstmt.setString(6, dto.getBirthday());
			pstmt.setString(7, dto.getLoginnum());

			//����
			pstmt.execute();

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt);
		}		
	}

	//���̵� �ش��ϴ� ����� ������ true��ȯ Ʋ���� false ��ȯ
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
			//���ε�
			pstmt.setString(1, id);
			pstmt.setString(2, password);
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

	//�����ϴ� �޼���
	public void deleteMember(String id)
	{
		String sql="delete from Login where id=?";
		Connection conn=null;
		PreparedStatement pstmt=null;

		conn=db.getMyConnection();

		try {
			pstmt=conn.prepareStatement(sql);
			//���ε�
			pstmt.setString(1, id);
			//����
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt);
		}
	}

	//�α��ν� �ʿ��� �޼���
	/*���̵�  DB ��ܿ� ������� 1 ��ȯ
	   ���̵�� �ִµ� ����� �ȸ´°�� 2 ��ȯ
	  ���̵�� ��� ��� �´°�� 3 ��ȯ*/
	public int loginProcess(String id, String password)
	{
		int ans=0;
		if(this.isIdSearch(id))
		{
			//���̵� �����ϴ� ���
			//����� �´��� üũ�ϱ�
			if(this.isIdPassCheck(id, password)) {
				//����� �´°��
				ans=3;
			}else {
				//����� Ʋ�����
				ans=2;
			}

		}else {//���̵� �ƿ� �������� �ʴ°��
			ans=1;
		}		
		return ans;
	}

	//���̵� �ش��ϴ� �̸��� ��ȯ�ϴ� �޼��� �߰�
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
			//���ε�
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




}
