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
/* function check(f){
	if($("#gonid").val().length==0){
		alert("입력해라");
		return false;
	}
} */
</script>
<body>
<div>
<fieldset style="width: 800px;">
	<legend>SmartEditor 입력폼</legend>
	<form action="gonji/formaction.jsp"
	  method="post" enctype="multipart/form-data"
	   name="f"> 
	   <!-- 자바스크립트에 alert 이벤트 주기 위한
	   onsubmit="return check(this)" id="f" 생성 --> 
	   
	 <table class="table table-bordered">
	 	<tr>
	 		<th width="100" bgcolor="#ddd">작성자</th>
	 		<td>
	 			<input type="text" class="form-control"
	 			  style="width: 120px;" required="required"
	 			  name="gonid" id="gonid" placeholder="작성자">		 			  
	 		</td>
	 	</tr>
	 	<tr>
	 		<th width="100" bgcolor="#ddd">제 목</th>
	 		<td>
	 			<input type="text" class="form-control"
	 			  style="width: 300px;" required="required"
	 			  name="gonsubject" placeholder="제목">		 			  
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
	 			<input type="submit" value="글등록"
	 			 class="btn btn-warning btn-sm"
	 			  style="width: 100px;">
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
      // $("#f").submit();
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
