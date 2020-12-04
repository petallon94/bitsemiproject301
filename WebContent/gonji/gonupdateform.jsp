<%@page import="data.dao.GonjiDao"%>
<%@page import="data.dto.GonjiDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--  gonnum에 해당하는 데이터 가져와서 폼에 출력
	    수정폼 작성하기
	  hidden으로 gonnum과 pageNum을 넣어주기     --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<%--프로젝트경로 : <%=request.getContextPath()%>--%>
<script src="<%=request.getContextPath()%>/se2/js/HuskyEZCreator.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=request.getContextPath()%>/se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" type="text/javascript" charset="utf-8"></script>
</head>
<%
	//변수명gonnum이 getdata 변수명(gonnum)이랑 같아야 한다
	String gonnum=request.getParameter("num");
	String pageNum=request.getParameter("pageNum");
	String gonid=request.getParameter("gonid");
	//num에 해당하는 dto가져오기
	GonjiDao dao=new GonjiDao();
	GonjiDto dto=dao.getData(gonnum);
%>
<body>
<div class="gonupdateform">
  <fieldset style="width: 800px;">
    <legend>SmartEditor 입력폼</legend>
  	  <form action="gonji/gonupdateaction.jsp" method="post"
  		enctype="multipart/form-data"name="f">
	    <!-- hidden -->
	    <input type="hidden" name="num" value="<%=gonnum%>">
	    <input type="hidden" name="pageNum" value="<%=pageNum%>">
	    
	    <%-- 수정폼 : 중요한 건 value값--%>
	    <table class="table table-bordered">
	      <caption><b>게시글 수정</b></caption>
		 	<tr>
		 		<th width="100" bgcolor="#ddd">작성자</th>
		 		<td>
		 			<input type="text" class="form-control"
		 			  style="width: 120px;" required="required"
		 			  name="gonid" value="<%=dto.getGonid()%>">		 			  
		 		</td>
		 	</tr>
		 	<tr>
		 		<th width="100" bgcolor="#ddd">제 목</th>
		 		<td>
		 			<input type="text" class="form-control"
		 			  style="width: 300px;" required="required"
		 			  name="gonsubject" value="<%=dto.getGonsubject()%>">		 			  
		 		</td>
		 	</tr>
		 	
		 	<tr>
		 		<th width="100" bgcolor="#ddd">내  용</th>
		 		<td>
		 		  <textarea class="form-control"	 			 
		 			 style="width:100%; height:300px; display:none;"
		 			 name="goncontent" id="goncontent">
		 			 <%=dto.getGoncontent()%></textarea>
		 	</tr>
		 	<tr>
		 		<td colspan="2" align="center">
		 			<input type="button" value="글수정"
		 			 class="btn btn-dark btn-sm"
		 			  style="width: 100px;"
		 			  onclick="submitContents(this)">
		 			  
		 			<input type="button" value="글목록"
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

//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.

function submitContents(elClickedObj) {

    // 에디터의 내용이 textarea에 적용된다.

    oEditors.getById["goncontent"].exec("UPDATE_CONTENTS_FIELD", [ ]);

 

    // 에디터의 내용에 대한 값 검증은 이곳에서

    // document.getElementById("textAreaContent").value를 이용해서 처리한다.
    try {
        elClickedObj.form.submit();
    } catch(e) { 

    }

}

// textArea에 이미지 첨부

function pasteHTML(filepath){
    var sHTML = '<img src="<%=request.getContextPath()%>/gonsave/'+filepath+'">';
    oEditors.getById["goncontent"].exec("PASTE_HTML", [sHTML]); 

}
</script>
</body>
</html>