<%@page import="data.dao.MemberDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dto.GonjiDto"%>
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
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<style type="text/css">
	/* #cl-dashboard{display: none;} */
	
/*��Ʈ */
@import url('https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@300&display=swap');

	body{
		display: flex;
		width: 100%;
		margin-left: 230px;	
		font-family: 'Noto Serif KR', serif;
	}
</style>
<script type="text/javascript">
$(function(){
	//������ ���� �̺�Ʈ
	$("input.del").click(function(){
		var gonnum=$(this).attr("gonnum");
		var a=confirm("�����Ϸ��� [Ȯ��]�� �����ּ���");
		if(a){
			//alert(gonnum);
			del(gonnum);
			location.href="index.jsp?main=gonji/gonjilist.jsp";
		}
	});//������ ���� �̺�Ʈ close
});//$function close

//����� �Լ�
function del(gonnum){
	$.ajax({
		type:"get",
		url:"gonji/gondelete.jsp",
		dataType:"html",
		data:{"gonnum":gonnum},
		success:function(d){
			
		}
	});
}
</script>
</head>
<body>
<%
	//�̺κ��� formaction�� String path="../index.jsp?main=gonji/content.jsp?num="
	//���� �������� ������ num���� �Ѿ
	String gonnum=request.getParameter("num");	
	String pageNum=request.getParameter("pageNum");
	String key=request.getParameter("key");
	
	//key ���� �ΰ��� �ƴϸ鼭 'list' �ϰ�� 
	//(����:�����Ŀ��� content.jsp �� ���⶧���� ��Ͽ���
    //			�� ��쿡�� ������)
	//��ȸ�� ����
	GonjiDao db=new GonjiDao();
	if(key!=null && key.equals("list"))
		db.updateReadcount(gonnum);
	
	//��ȣ�� �ش��ϴ� dto ��������
	GonjiDto dto=db.getData(gonnum);
	
	//����� �Ѿ������ Ȯ���ϱ�
	//System.out.println(dto.getGoncontent());
	//System.out.println(dto.getGonwriteday());
	
	//mysql������ �ð����� ������ �Ϸ��� datetime�̾�� �Ѵ�
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	//<������ �α��� idȮ���� ���� �ڹ��Լ�>
	//���� �α��λ���
	String loginok=(String)session.getAttribute("loginok");
	//���ǿ��� id ���
	String myid=(String)session.getAttribute("myid");
	//dao ����
	MemberDao dao=new MemberDao();
	//���̵� �ش��ϴ� �̸� ���
	//String name=dao.getName(myid);
%>	
<table class="table table-striped" style="width: 1000px;">
	<tr>
		<td width="650" height="80">
			<b><%=dto.getGonsubject()%></b>
		</td>
		<td>
			<span style="color: #ccc;font-size: 9pt;float: right;">
			<%=sdf.format(dto.getGonwriteday())%></span>
		</td>
		
	</tr>
	<tr height="350">
		<td colspan="2" valign="top">
			<img src="image/chr15.gif" width="30">
			<b><%=dto.getGonid()%></b>
			<br><br>			
			<pre><%=dto.getGoncontent()%></pre>	
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<span style="color: gray;font-size: 9pt;float: right;">
			��ȸ��&nbsp; <%=dto.getGonreadcount()%></span>		
		</td>
	</tr>
	
	<%-- ��ư�� --%>
	<%
		//myid�� StarBottle(������)�� ��쿡�� ���̱�
		if(loginok!=null && myid.equals("StarBottle"))
		{%>
		<tr>
			<td colspan="2" align="right">
				<input type="button" class="btn btn-warning btn-lg"
				  value="�۾���" style="width: 80px;"
				  onclick="location.href='index.jsp?main=gonji/gonjiform.jsp'">
				<input type="button" class="btn btn-info btn-lg"
				  value="���" style="width: 80px;"
				  onclick="location.href='index.jsp?main=gonji/gonjilist.jsp?pageNum=<%=pageNum%>'">
				<input type="button" class="del btn btn-danger btn-lg"
				  value="����" style="width: 80px;"
				  gonnum="<%=dto.getGonnum()%>">		
			</td>
		</tr>	
		<%}else{%>
		<tr>
			<td colspan="2" align="right">			
				<input type="button" class="btn btn-info btn-lg"
				  value="���" style="width: 180px;"
				  onclick="location.href='index.jsp?main=gonji/gonjilist.jsp?pageNum=<%=pageNum%>'">	
			</td>
		</tr>	
			
		<%}
	%>	
</table>
</body>
</html>