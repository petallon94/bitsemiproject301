<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.GonjiDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.GonjiDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<!-- ������������ �ʿ��� ��ũ/��Ʈ��Ʈ��  -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<title>Insert title here</title>
<!-- <script src="https://code.jquery.com/jquery-1.10.2.js"></script> -->

<style type="text/css">
	/* #cl-dashboard{display: none;} */
	
/*��Ʈ */
@import url('https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@300&display=swap');
	
	body{
		display: flex;
		width: 100%;
		margin-left: 250px;	
		font-family: 'Noto Serif KR', serif;
	}
	
	/*����Ʈ�� ���� �κ� */
	tr.gontitle{
		background-color: #fffee9;
		text-align: center; 
		height:65px;
		line-height: 65px;
	}
	
	table.table{
		border-left: none;
		border-top: none;
		border-right: none;
		height: 50px;
	}
</style>
</head>
<%
	//����¡ ó���� ���� �ڹ��Լ�
	//dao ����
	GonjiDao db=new GonjiDao();

	//�� ���� ���ϱ�
	int totalCount=db.getTotalCount();
	int perPage=10;//�� �������� ������ ���� ����
	int perBlock=5;//�� ���� ����� �������� ����
	int totalPage;//�� �������� ����
	int startPage;//�� ���� ������ ������ ��ȣ
	int endPage;//�� ���� �� ������ ��ȣ
	int start;//�� ���� �ҷ��� ���� ���� ��ȣ
	int end;//�� ���� �ҷ��� ���� �� ��ȣ
	int currentPage;//���� ������ ������ ��ȣ
	
	//���� ������ ��ȣ ���ϱ�
	String pageNum=request.getParameter("pageNum");
	if(pageNum==null)
		currentPage=1;//������ ��ȣ�� ���� ��� ������ 1�������� ����
		else
			currentPage=Integer.parseInt(pageNum);
	
	//�� ������ ���ϱ�(��: �ѱۼ��� 9�̰� ���������� 2���� �� ���)
	//�������� ���� ���, ���������� �����ش�(��: ���� ���� 11���̰� 10�������� �� ���̶��)
	//�ؼ�: ��Żī��Ʈ�� �������� ������ �� ������ ���ڰ� 0���� ũ�� 1�� �����ְ� �ƴϸ� 0�� (����������) �����ش�
	totalPage=totalCount/perPage+(totalCount%perPage>0?1:0);
	
	//������������ �������� ���ϱ�
	//��:�� �������� 3���� �� ���: 
	//���� �������� 2��� sp(startPage):1, ep(endPage):3
	//���� �������� 7��� sp:7, ep:9
	//=>������������ 1,4,7...
	startPage=(currentPage-1)/perBlock*perBlock+1;//�Ϲ����� ��ŸƮ ������ ����**
	endPage=startPage+perBlock-1;//���� ������ ����**
	//������ ��: endPage�� totalPage���� ũ�� ��Ż�������� ������������ �ص־� �Ѵ�
	if(endPage>totalPage)
		endPage=totalPage;
	
	//mysql�� ù ���� 0��(����Ŭ�� 1��)
	//start=(currentPage-1)*perPage+1; - �̰� ����Ŭ�� 
	start=(currentPage-1)*perPage;
	//�Ʒ��κ��� ����Ŭ��. mysql�� �ʿ����
	/* end=start+perPage-1;
	//������ �۹�ȣ�� �� �ۼ��� ���� ��ȣ��� �Ѵ�
	if(end>totalCount)
		end=totalCount; */
	
	//�� ���������� ����� ���۹�ȣ
	//�� 50���� ��� 1�������� 50, 2�������� 40
	int no=totalCount-(currentPage-1)*perPage;
		
	//mysql���� �ش� �������� �ʿ��� ��� ��������
	List<GonjiDto> list=db.getList(start, perPage);
%>
<body>
<%--�������� ����Ʈ ������ --%>
<h2 style="display: inline;">��������	</h2>
<b>	�� <span style="color: red;">
<%=totalCount%></span>���� ���� �ֽ��ϴ�</b>
 <input type="button" value="�Խù����"
 class="btn btn-warning btn-sm" 
  style="width: 100px;float: right;margin-right: 100px;"
 onclick="location.href='index.jsp?main=gonji/gonjiform.jsp'">  
 
 <br><br>
 <%
 	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
 %>
 <div class="gonlist">
 <%--���̺�� ����ֱ�--%>
 	<table class="table" style="width: 1000px;">
 		<tr class="gontitle" style="text-align: center; ">
 		 	<th width="40">��ȣ</th>
 		 	<th width="400">�� ��</th>
 		 	<th width="60">�ۼ���</th>
 		 	<th width="50">��ȸ��</th>
 		 	<th width="70">�ۼ���</th> 		 	
 		</tr>
 	<%
 	if(totalCount==0)
 	{%>
 		<tr align="center" height="50">
 		  <td colspan="5">
 		    <b>��ϵ� ���� �����ϴ�</b>
 		  </td>
 		</tr>
 	<%}
 	%>
 	<%for(GonjiDto dto:list)//list�κ��� dto�� �����´�
 	{%>
		<tr>
			<td align="center"><%=no--%></td>
			<td>
				<a style="color: black;text-align: left;" 
				href="index.jsp?main=gonji/content.jsp?num=<%=dto.getGonnum()%>&pageNum=<%=currentPage%>&key=list">
				<%=dto.getGonsubject()%></a>
			</td>	
			<td align="center"><%=dto.getGonid()%></td>
			<td align="center"><%=dto.getGonreadcount()%></td>
			<td align="center">
				<%=sdf.format(dto.getGonwriteday())%>
			</td>
		</tr>			
 	<%}
 %>

    </table>
</div>    

<%--����¡ ó��--%>
<%
  if(totalCount>0)
  {%>
	<div style="width: 900px; text-align: center;">
	  <ul class="pagination">
		<%
		//���� ������ ǥ��
		if(startPage>1)
		{%>
			<li class="page-item"><a class="page-link" href="index.jsp?main=gonji/gonjilist.jsp?pageNum=<%=startPage-1%>">
			����&gt;</a></li>
		<%}	
			//������ ��� ǥ��
			for(int i=startPage; i<=endPage; i++)
			{
				//���� �ε����� ���ؼ� ������ ��� / i:�̵��� ������ �߰�(url�ּ� ���� �߰���)
				String url="index.jsp?main=gonji/gonjilist.jsp?pageNum="+i;
			
	/* 			//�� ���������� ����� ���۹�ȣ
				//�� 50���� ��� 1�������� 50, 2�������� 40
				int no=totalCount-(currentPage-1)*perPage;
					
				//mysql���� �ش� �������� �ʿ��� ��� ��������
				List<BoardDto> list=db.getList(start, perPage); */
				
				if(i==currentPage)
				{%>
					<li class="page-item">
					  <a class="page-link" href="<%=url%>"><%=i%></a>
					</li>
			  
			  <%}else{%>
					<li class="page-item">
					  <a class="page-link" href="<%=url%>"><%=i%></a>
					</li>
			  <%}
			}//for�� close
		//���� ������ ǥ��
		if(endPage<totalPage)
		{%>
			<%-- �ε�ȣ ��ȣ(>)�� ��¾ȵɶ�: &gt; --%>
			<li class="page-item">
			  <a class="page-link" href="index.jsp?main=gonji/gonjilist.jsp?pageNum=<%=endPage+1%>">
			����&gt;</a>
			</li>
	  <%}%>
	  </ul>
	</div>
<%}//if�� close
%> 
<%-- ����¡ �� --%>

<%-- �˻�â  --%>
<form action="" class="form-inline">
  <div style="width: 800px;text-align: center;">
	<div class="form-group">
	<%
		//�˻�â�� �˻��� �ܾ� �����ְ� ���ֱ�
		String search=(String)session.getAttribute("key");
		String word=(String)session.getAttribute("value");
		if(search==null)
			search="all";
		if(word==null)
			word="";
	%>
	<%-- �˻� �� --%>
		<select id="search" class="form-control"
			style="width: 100px;">
		  <option value="all">��ü</option>
		  <option value="myid">���̵�</option>
		  <option value="subject">����</option>
		  <option value="content">����</option>
		</select>
	<%-- ajax���� actionȣ���ϱ� ���� id --%>
		<input type="text" class="form-control" style="width: 150px;"
			name="word" id="word" placeholder="�˻��ܾ��Է�"
			>
	</div>
  </div>
</form>
</body>
</html>



















