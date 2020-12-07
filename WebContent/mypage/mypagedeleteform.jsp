<%@page import="data.dto.MemberDto"%>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>

<style>
#mypage_deleteform {
margin: 50px 0px 100px 200px;
text-align: center;
}
.mypagedelete-body > div{
font-size: 16px; 
font-weight: bold;
margin: 10px 40px;
float:left;
}
</style>
</head>
<%	
//세션에 저장된 로그인아이디
String loginid=(String)session.getAttribute("myid");
//dao 선언
MemberDao dao=new MemberDao();
MemberDto dto=dao.getDataID(loginid);

%>

<body>
<form action="mypage/mypagedeleteaction.jsp" method="post" id="mypage_deleteform">
   <!-- hidden -->
  <input type="hidden" name="id" value="<%=dto.getId()%>">

    <div class="mypagedelete-dialog">
      <div class="mypagedelete-content">   
        
        <div class="mypagedelete-header">
          <h4 class="mypagedelete-title">스타보틀 회원을 탈퇴하시겠습니까?</h4><br>
        </div><hr>      		
        <div class="mypagedelete-body">
              
        <div style="float:left;">이       름: <%=dto.getName()%></div>
        <div>아  이 디: <%=dto.getId()%></div><br>
        <br>
        <hr>
        <br>
        <div>위 정보가 맞으면 비밀번호를 입력해주세요. <br>탈퇴하시면 모든 개인정보가 삭제됩니다.</div><br>
        <div style="float:left; margin: 5px 10px 0px 100px;">비밀번호:</div><input type="password" class="form-control" style="width: 100px;" name="pass" required="required" id="mypage_memdeleteinput">
        </div>
   		
   		
   		<div class="mypagedelete-footer" style="clear:left;">       
        <hr>
   		<br><button type="submit" class="btn btn-outline-danger" id="mypage_memdeletebtn">탈퇴하기</button>	         	
        </div>   
       </div>
    </div>
  </form>
</body>
</html>








