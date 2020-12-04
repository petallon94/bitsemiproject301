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
<%	
//세션에 저장된 로그인아이디
String loginid=(String)session.getAttribute("myid");

%>
<body>
<body>
<form action="mypage/mypagedeleteaction.jsp" method="post">
  <div id="mypagedeleteform">
  <!-- hidden -->
  <input type="text" name="loginid" value="<%=loginid%>">

    <div class="mypagedelete-dialog">
      <div class="mypagedelete-content">   
        
        <div class="mypagedelete-header">
          <h4 class="mypagedelete-title">회원삭제</h4>
        </div>        

        <div class="mypagedelete-body">
        <div style="font-size: 16px; font-weight: bold"><%=loginid%>님! 정말 <b style="color:red;">탈퇴</b>하시겠습니까?
        <br><br>탈퇴하시려면 비밀번호을 입력해주세요</div><br><br>
        <input type="password" name="pass" required="required" autofocus="autofocus" id="admin_memdeleteinput">
        <button type="submit" class="btn btn-danger" id="mypage_memdeletebtn">회원삭제</button>	         	
        </div>        
  
      </div>
    </div>
  </div>
  </form>
</body>
</html>













