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
<%--���� ȭ���� �ȳ����� ��Ʈ��Ʈ�� ���� 5�� �߰��ϱ� : main�� �ִ�--%>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<style type="text/css">
	#cl-dashboard{display: none;}
</style>
</head>
<%
	//����¡ ó���� ���� �ڹ��Լ�
	//dao ����
	GonjiDao db=new GonjiDao();

	//�� ���� ���ϱ�
	int totalCount=db.getTotalCount();
	int perPage=10;//�� �������� ������ ���� ����
	int perBlock=5;//�� ������ ����� �������� ����
	int totalPage;//�� �������� ����
	int startPage;//�� ������ ������ ������ ��ȣ
	int endPage;//�� ������ �� ������ ��ȣ
	int start;//�� ������ �ҷ��� ���� ���� ��ȣ
	int end;//�� ������ �ҷ��� ���� �� ��ȣ
	int currentPage;//���� ������ ������ ��ȣ
	
	//���� ������ ��ȣ ���ϱ�
	String pageNum=request.getParameter("pageNum");
	if(pageNum==null)
		currentPage=1;//������ ��ȣ�� ���� ��� ������ 1�������� ����
		else
			currentPage=Integer.parseInt(pageNum);
	
	//�� ������ ���ϱ�(��: �ѱۼ��� 9�̰� ���������� 2���� �� ���)
	//�������� ���� ���, ���������� �����ش�(��: ���� ���� 11���̰� 10�������� �� �����̶��)
	//�ؼ�: ��Żī��Ʈ�� �������� ������ �� ������ ���ڰ� 0���� ũ�� 1�� �����ְ� �ƴϸ� 0�� (����������) �����ش�
	totalPage=totalCount/perPage+(totalCount%perPage>0?1:0);
	
	//������������ �������� ���ϱ�
	//��:�� �������� 3���� �� ���: 
	//���� �������� 2��� sp(startPage):1, ep(endPage):3
	//���� �������� 7��� sp:7, ep:9
	//=>������������ 1,4,7...
	startPage=(currentPage-1)/perBlock*perBlock+1;//�Ϲ����� ��ŸƮ ������ ����**
	endPage=startPage+perBlock-1;//���� ������ ����**
	//������ ����: endPage�� totalPage���� ũ�� ��Ż�������� ������������ �ص־� �Ѵ�
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
<b>�� <span style="color: red;"><%=totalCount%></span>
 ���� ���� �ֽ��ϴ�</b>
 <input type="button" value="�Խù����"
 class="btn btn-danger btn-sm"
  style="width: 100px;margin-left: 200px;"
 onclick="location.href='index.jsp?main=gonji/gonjiform.jsp'">  
 
 <br><br>
 <%
 	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
 %>
 <div>
 <%--���̺��� ����ֱ�--%>
 	<table class="table table-bordered" style="width: 1200px;">
 		<tr bgcolor="#ddd">
 		 	<th width="80">��ȣ</th>
 		 	<th width="350">�� ��</th>
 		 	<th width="100">�ۼ���</th>
 		 	<th width="80">��ȸ��</th>
 		 	<th width="130">�ۼ���</th> 		 	
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
				<a style="color: black;" 
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
			<li><a href="index.jsp?main=gonji/gonjilist.jsp?pageNum=<%=startPage-1%>">
			����&gt;</a></li>
		<%}	
			//������ ���� ǥ��
			for(int i=startPage; i<=endPage; i++)
			{
				//���� �ε����� ���ؼ� ������� ��� / i:�̵��� ������ �߰�(url�ּ� ���� �߰���)
				String url="index.jsp?main=gonji/gonjilist.jsp?pageNum="+i;
			
	/* 			//�� ���������� ����� ���۹�ȣ
				//�� 50���� ��� 1�������� 50, 2�������� 40
				int no=totalCount-(currentPage-1)*perPage;
					
				//mysql���� �ش� �������� �ʿ��� ��� ��������
				List<BoardDto> list=db.getList(start, perPage); */
				
				if(i==currentPage)
				{%>
					<li class="active">
					  <a href="<%=url%>"><%=i%></a>
					</li>
			  
			  <%}else{%>
					<li>
					  <a href="<%=url%>"><%=i%></a>
					</li>
			  <%}
			}//for�� close
		//���� ������ ǥ��
		if(endPage<totalPage)
		{%>
			<%-- �ε�ȣ ��ȣ(>)�� ��¾ȵɶ�: &gt; --%>
			<li>
			  <a href="index.jsp?main=gonji/gonjilist.jsp?pageNum=<%=endPage+1%>">
			����&gt;</a>
			</li>
	  <%}%>
	  </ul>
	</div>
<%}//if�� close
%>
</body>
</html>