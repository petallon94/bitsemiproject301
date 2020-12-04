<%@page import="data.dao.GonjiDao"%>
<%@page import="data.dto.GonjiDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--  gonnum�� �ش��ϴ� ������ �����ͼ� ���� ���
	    ������ �ۼ��ϱ�
	  hidden���� gonnum�� pageNum�� �־��ֱ�     --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<%--������Ʈ��� : <%=request.getContextPath()%>--%>
<script src="<%=request.getContextPath()%>/se2/js/HuskyEZCreator.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=request.getContextPath()%>/se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" type="text/javascript" charset="utf-8"></script>
</head>
<%
	//������gonnum�� getdata ������(gonnum)�̶� ���ƾ� �Ѵ�
	String gonnum=request.getParameter("num");
	String pageNum=request.getParameter("pageNum");
	String gonid=request.getParameter("gonid");
	//num�� �ش��ϴ� dto��������
	GonjiDao dao=new GonjiDao();
	GonjiDto dto=dao.getData(gonnum);
%>
<body>
<div class="gonupdateform">
  <fieldset style="width: 800px;">
    <legend>SmartEditor �Է���</legend>
  	  <form action="gonji/gonupdateaction.jsp" method="post"
  		enctype="multipart/form-data"name="f">
	    <!-- hidden -->
	    <input type="hidden" name="num" value="<%=gonnum%>">
	    <input type="hidden" name="pageNum" value="<%=pageNum%>">
	    
	    <%-- ������ : �߿��� �� value��--%>
	    <table class="table table-bordered">
	      <caption><b>�Խñ� ����</b></caption>
		 	<tr>
		 		<th width="100" bgcolor="#ddd">�ۼ���</th>
		 		<td>
		 			<input type="text" class="form-control"
		 			  style="width: 120px;" required="required"
		 			  name="gonid" value="<%=dto.getGonid()%>">		 			  
		 		</td>
		 	</tr>
		 	<tr>
		 		<th width="100" bgcolor="#ddd">�� ��</th>
		 		<td>
		 			<input type="text" class="form-control"
		 			  style="width: 300px;" required="required"
		 			  name="gonsubject" value="<%=dto.getGonsubject()%>">		 			  
		 		</td>
		 	</tr>
		 	
		 	<tr>
		 		<th width="100" bgcolor="#ddd">��  ��</th>
		 		<td>
		 		  <textarea class="form-control"	 			 
		 			 style="width:100%; height:300px; display:none;"
		 			 name="goncontent" id="goncontent">
		 			 <%=dto.getGoncontent()%></textarea>
		 	</tr>
		 	<tr>
		 		<td colspan="2" align="center">
		 			<input type="button" value="�ۼ���"
		 			 class="btn btn-dark btn-sm"
		 			  style="width: 100px;"
		 			  onclick="submitContents(this)">
		 			  
		 			<input type="button" value="�۸��"
		 			 class="btn btn-info btn-sm"
		 			  style="width: 100px;"
		 			  onclick="location.href='index.jsp?main=gonji/gonjilist.jsp'">  
		 		</td>		 		
		 	</tr>
	  </table>
    </form>
  </fieldset>
</div>

<script type="text/javascript">
var oEditors = [];

nhn.husky.EZCreator.createInIFrame({

    oAppRef: oEditors,

    elPlaceHolder: "goncontent",

    sSkinURI: "<%=request.getContextPath()%>/se2/SmartEditor2Skin.html",

    fCreator: "createSEditor2"

}); 

//�����塯 ��ư�� ������ �� ������ ���� �׼��� ���� �� submitContents�� ȣ��ȴٰ� �����Ѵ�.

function submitContents(elClickedObj) {

    // �������� ������ textarea�� ����ȴ�.

    oEditors.getById["goncontent"].exec("UPDATE_CONTENTS_FIELD", [ ]);

 

    // �������� ���뿡 ���� �� ������ �̰�����

    // document.getElementById("textAreaContent").value�� �̿��ؼ� ó���Ѵ�.
    try {
        elClickedObj.form.submit();
    } catch(e) { 

    }

}

// textArea�� �̹��� ÷��

function pasteHTML(filepath){
    var sHTML = '<img src="<%=request.getContextPath()%>/gonsave/'+filepath+'">';
    oEditors.getById["goncontent"].exec("PASTE_HTML", [sHTML]); 

}
</script>
</body>
</html>