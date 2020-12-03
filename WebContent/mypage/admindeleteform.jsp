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
<style type="text/css">
	#logoutModal .modal-header, #logoutModal .modal-title, #logoutModal .close {
    background-color: #ffb210;
    color:white;
    text-align: center;
    font-size: 25px;
  }
  #logoutModal .modal-header .modal-title{
  padding:15px 30px;
  text-align: center;
  }
  #logoutModal .modal-body{
  padding:30px 100px;
 }
  #logoutModal .modal-footer {
    background-color: #f9f9f9;
  }
</style>
</head>
<%
	//세션에 저장된 로그인아이디
	String loginid=(String)session.getAttribute("myid");
	String id=request.getParameter("id");
	String name=request.getParameter("name");
%>
<body>
<form action="mypage/admindeleteaction.jsp" method="post">
  <div class="modal fade" id="admindeleteModal">
  <!-- hidden -->
  <input type="hidden" name="loginid" value="<%=loginid%>">
  <input type="hidden" name="id" value="<%=id%>">
    <div class="modal-dialog">
      <div class="modal-content">   
        
        <div class="modal-header">
          <h4 class="modal-title">회원삭제</h4>
          <button type="button" class="close" data-dismiss="modal">×</button>
        </div>        
        <!-- Modal body -->
        <div class="modal-body">
        <div style="font-size: 16px; font-weight: bold"><%=id %>님의 회원정보를 <b style="color:red;">삭제</b> 하시겠습니까?
        <br><br>관리자님의 비밀번호를 입력주세요</div><br><br>
        <input type="password" name="pass" required="required" autofocus="autofocus" id="admin_memdeleteinput">
        <button type="submit" class="btn btn-danger" id="admin_memdeletebtn">회원삭제</button>	         	
        </div>        
        <!-- Modal footer -->
        <div class="modal-footer">
         <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">취소</button>
        </div>
        
      </div>
    </div>
  </div>
  </form>
</body>
<script type="text/javascript">
$("#admindeleteModal").modal();

</script>
</html>














