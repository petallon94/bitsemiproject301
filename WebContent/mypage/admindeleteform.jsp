<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
  <div class="modal fade" id="logoutModal">
    <div class="modal-dialog">
      <div class="modal-content">   
        
        <div class="modal-header">
          <h4 class="modal-title">회원탈퇴</h4>
          <button type="button" class="close" data-dismiss="modal">×</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
         	<%=name%>님 로그아웃하시겠습니까?
         	<br><br>
         	<button type="button" class="btn btn-warning btn-block" onclick="location.href='login/logoutaction.jsp'">로그아웃</button>
         	
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
         <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">취소</button>
        </div>
        
      </div>
    </div>
  </div>
</body>
<script type="text/javascript">
$("#logoutModal").modal();
</script>
</html>

<body>
<div class="alert alert-info"
 style="width: 350px;height: 170px;text-align: center;
 	padding-top:20px;border: 5px solid gray;">
	<form action="member/deletepassaction.jsp" method="post">
		<!-- hidden -->
		<input type="hidden" name="id" value="<%=id%>">
		<div style="font-size: 16px; font-weight: bold"><%=id%>님 가입시 입력한 비밀번호를 넣어주세요</div><br><br>
		<input type="password" name="pass" style="width: 100px;"
		required="required" autofocus="autofocus">
		
		<button type="submit" class="btn btn-danger">회원탈퇴</button>	
	</form> 
</div>
</body>
</html>













