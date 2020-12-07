<%@page import="data.dao.GonjiDao"%>
<%@page import="data.dto.GonjiDto"%>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%--프로젝트경로 : <%=request.getContextPath()%>--%>
<script src="<%=request.getContextPath()%>/se2/js/HuskyEZCreator.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=request.getContextPath()%>/se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" type="text/javascript" charset="utf-8"></script></head>
<script type="text/javascript">
//required 안먹힐 때 사용할 수 있는 이벤트
//각각 항목에 대한 id에 대해서 값이 충족되지 않으면 
//넘어가지 않도록 alert창을 띄운다
//form 태그에 onsubmit="return check(this)" 이부분을 삽입하고
//이벤트를 준다
 function check(f){
	if($("#gonsubject").val().length==0){
		alert("제목을 입력하세요");
		$("#gonsubject").focus();//입력창 포커스로 다시 돌아가게 한다
		return false;
	}
	/* if($("#goncontent").val().length==0){
		alert("내용을 입력하세요");
		$("#goncontent").focus();
		return false;
	} */
} 
</script>
<body>
<div>
<fieldset style="width: 800px;">
	<legend>SmartEditor 입력폼</legend>
	<form action="gonji/formaction.jsp"
	  method="post" enctype="multipart/form-data"
	   name="f" id="f"
	   onsubmit="return check(this)"> 
	   <!-- 자바스크립트에 alert 이벤트 주기 위한
	   onsubmit="return check(this)" id="f" 생성 --> 
	   
	   <%
			 //<관리자 로그인 id확인을 위한 자바함수>
			 //세션 로그인상태
			 String loginok=(String)session.getAttribute("loginok");
			 //세션에서 id 얻기
			 String myid=(String)session.getAttribute("myid");
			 //member dto 선언
			 MemberDao dao=new MemberDao();
			 //id에 따른 getdata를 가져오기 위해서 dao의 getNum을 호출한다
			 //String name=dao.getName(myid);
	   %>
	 <table class="table table-bordered">
	 	<tr>
	 		<th width="100" bgcolor="#ddd">작성자</th>
	 		<td>
	 			<input type="text" class="form-control"
	 			  style="width: 120px;" name="gonid" 
	 			  id="gonid" readonly="readonly"
	 			  value="<%=myid%>">
	 			  <%-- myid가 formaction에 gonid파라미터로 넘어감 --%>		 			  
	 		</td>
	 	</tr>
	 	<tr>
	 		<th width="100" bgcolor="#ddd">제 목</th>
	 		<td>
	 			<input type="text" class="form-control"
	 			  style="width: 300px;" name="gonsubject" 
	 			  id="gonsubject" placeholder="제목"
	 			  required="required">			  
	 		</td>
	 	</tr>
	 	
	 	<tr>
	 		<th width="100" bgcolor="#ddd">내  용</th>
	 		<td>
	 		  <textarea class="form-control"	 			 
	 			 style="width:100%; height:300px; display:none;"
	 			 name="goncontent" id="goncontent"
	 			 required="required"></textarea>
	 	</tr>
	 	<tr>
	 		<td colspan="2" align="center">
	 		<%--type=에서 button이면 required 안된다 --%>
	 			<input type="button" value="글등록"
	 			 class="btn btn-warning btn-sm"
	 			  style="width: 100px;"
	 			  onclick="submitContents(this)">
	 			  <%-- smart editor 자체적으로 있던 onclick기능
	 			  대신해서 type="button"에서 "submit"으로 바꾸고  
	 			  아래 스크립트 부분에서 try 부분을 없앤다 --%>
	 			  <!-- onclick="submitContents(this)" -->
	 			  
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
    	//글수정 부분에서 botton대신 submit을 주고 아랫부분을 삭제한다
      // elClickedObj.form.submit();
    	
       //이 부분은 form에 id="f"를 주고 이곳에서 submit 할 수 있다
       $("#f").submit();
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
