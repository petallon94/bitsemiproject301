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
<link href="https://fonts.googleapis.com/css2??family=Gothic+A1&family=Karma&family=Open+Sans:ital@1&family=Yeon+Sung&display=swap" rel="stylesheet">
<title>로그아웃</title>
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
	//세션에서 id 얻기
	String id=(String)session.getAttribute("myid");
	//dao 선언
	MemberDao dao=new MemberDao();
	//아이디에 해당하는 이름 얻기
	String name=dao.getName(id);
%>
<body>
  <div class="modal fade" id="logoutModal">
    <div class="modal-dialog">
      <div class="modal-content">   
        
        <div class="modal-header">
          <h4 class="modal-title">로그아웃</h4>
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
