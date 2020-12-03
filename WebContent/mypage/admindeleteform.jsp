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
	String id=request.getParameter("id");
%>
<body>
<form action="mypage/admindeleteaction.jsp" method="post">
  <div class="modal fade" id="admindeleteModal">
  <input type="text" name="id" value="<%=id%>">
  <input type="text" name="name" value="<%=name%>">
    <div class="modal-dialog">
      <div class="modal-content">   
        
        <div class="modal-header">
          <h4 class="modal-title">회원탈퇴</h4>
          <button type="button" class="close" data-dismiss="modal">×</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        <div style="font-size: 16px; font-weight: bold"><%=id %>님의 회원탈퇴를 <b style="color:red;">강제로</b> 진행하시겠습니까?
        <br><br>관리자님의 비밀번호를 넣어주세요</div><br><br>
        <input type="password" name="pass" required="required" autofocus="autofocus" id="admin_memdeleteinput">
        <button type="submit" class="btn btn-danger" id="admin_memdeletebtn">회원강제탈퇴</button>	         	
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














