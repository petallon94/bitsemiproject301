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

	/* body{
		display: flex;
		width: 100%;
		margin-left: 230px;	
		font-family: 'Noto Serif KR', serif;
	} */
	
	/* ���̺�  */
	tbody{
		width: 100%;
	}
	table.table{
		border-top: 2px solid gray;
		border-bottom: 2px solid gray;
		display: flex;
		width: 100%;
		margin-left: 250px;	
	}
 	#subject{
 		width: 850px;
		height:40px;
		line-height: 40px;
		background-color: #white;
	}
	#datereadcount{
		width: 150px;
		color: gray;
		font-size: 9pt;
		float: right;
	}
	#id{
		border-bottom: 1px solid gray;
		width: 1000px;
	}
	#content{
		height: 350px;
		background-color: white;
		width: 1000px;
		
	}
	
	
	
		/* sub */
.ordsub_visual{min-height:399px;padding:0 10px;text-align:center;background-repeat:no-repeat;background-size:cover;background-position:center;position:relative;}
.ordsub_visual .txt{width:100%;position:absolute;top:120px;left:0;}
.ordsub_visual .txt h1{margin:0;font-size:2.75rem;font-weight:500;}
.ordsub_visual .txt h1:after{display:block;width:40px;height:4px;margin:32px auto;background:#202020;content:'';}
.ordsub_visual .txt p{font-size:1.25rem;font-weight:300;color:white;}
.ordsub_visual.bg-menu{background-image:url(./image/people-coffee-shop-wide.jpg);}
	
	
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


<div class="ordsub_visual bg-menu">
    <div class="txt">
        <h1>��Ÿ��Ʋ</h1>
        <p>��Ÿ��Ʋ�� ���������Դϴ�.</p>
    </div>
</div>




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
<br><br><br><br><br>
<h2 style="display: inline;margin-left: 410px;">��������	</h2>
<table class="table table-striped" style="width: 1000px;margin-left: 410px;">
<tbody>
 <tr>
	<%--������--%>
	<td id="subject">
		<b style="font-size: 1.5em;margin-left: 25px;">
		  <%=dto.getGonsubject()%></b>
	</td>
	<%--��¥/��ȸ���� --%>
	<td id="datereadcount">
		<span>
		<%=sdf.format(dto.getGonwriteday())%>
		<br><br>
		��ȸ��&nbsp; <%=dto.getGonreadcount()%>
		</span>
	</td>
  </tr>
  <%--���̵������ --%>
  <tr id="id">
	<td colspan="2" valign="top">
		<img src="image/sb_symbol.jpg" width="30">
		<b><%=dto.getGonid()%></b>
	</td>
  </tr>
  <br><br>
  <%--������:�ڵ��ٳѱ� �����ϱ�(style) --%>		
  <tr id="content">	
    <td colspan="2">
		<pre style="white-space: pre-wrap;
		  word-wrap:break-word;border: none;">
		  <%=dto.getGoncontent()%>
		</pre>
    </td>
  </tr>

<%-- ��ư�� --%>
<%
	//myid�� StarBottle(������)�� ��쿡�� ���̱�
	if(loginok!=null && myid.equals("StarBottle"))
	{%>
	<tr>
		<td colspan="2" align="right">
		  <input type="button" class="btn btn-warning"
		    value="�۾���" style="width: 80px;"
		    onclick="location.href='index.jsp?main=gonji/gonjiform.jsp'">
		  <input type="button" class="btn btn-info"
		    value="���" style="width: 80px;"
		    onclick="location.href='index.jsp?main=gonji/gonjilist.jsp?pageNum=<%=pageNum%>'">
		  <input type="button" class="update btn btn-dark"
			onclick="location.href='index.jsp?main=gonji/gonupdateform.jsp?num=<%=gonnum%>&pageNum=<%=pageNum%>'"
			style="width: 80px;" value="����">
		  <input type="button" class="del btn btn-danger"
		    value="����" style="width: 80px;"
		    gonnum="<%=dto.getGonnum()%>">		
		</td>
	</tr>	
	<%//�α��� ���� ���,�Ϲ�ȸ���� ��� ���̴� ������
	}else{%>
	<tr>
		<td colspan="2" align="right">			
			<input type="button" class="btn btn-info btn-lg"
			  value="���" style="width: 180px;"
			  onclick="location.href='index.jsp?main=gonji/gonjilist.jsp?pageNum=<%=pageNum%>'">	
		</td>
	</tr>	
</tbody>		
		<%}
	%>	
</table>
</body>
</html>