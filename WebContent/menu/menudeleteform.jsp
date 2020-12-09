<%@page import="data.dto.MenuDto"%>
<%@page import="data.dao.MenuDao"%>
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

<title>Insert title here</title>
<style type="text/css">
/* 삭제모달창 */

	#loginModal .modal-header, #loginModal .modal-title, #loginModal .close {
    background-color: #ffb210;
    color:white;
    text-align: center;
    font-size: 25px;
  }
  #loginModal .modal-header .modal-title{
  padding:15px 30px;
  text-align: center;
  }

  #loginModal .modal-body{
  padding:40px 100px;
  
  }
  #loginModal .modal-body input{
  margin-bottom: 20px;
  
  }  
  #loginModal .modal-footer {
    background-color: #f9f9f9;
  }

</style>
</head>
<%
	//session 에 saveid 가 있을경우(아이디저장체크한경우)
	//세션에서 myid를 얻는다
	String saveid=(String)session.getAttribute("saveid");
	String id="";
	if(saveid!=null){
		id=(String)session.getAttribute("myid");
	}
	String num = request.getParameter("num");

%>
<body>
<!-- 로그인 모달창 -->
<form action="menu/menudeleteaction.jsp" method="post" id="deleteform" name="deleteform">

  <div class="modal fade" id="deleteModal">
    <div class="modal-dialog">    
      <div class="modal-content">
        <!-- Modal body -->
        <div class="modal-body">
        <input type="hidden" class="form-control" id="menunum"  name="menunum" value =<%=num%>>

        <div>정말 삭제하겠습니까?</div>
        <div class ="button-body">
        <button type="submit" class="btn btn-warning btn-block" id="menu_enterbtn">확인</button>
        <button type="button" class="btn btn-info btn-block" id="menu_joinbtn"data-dismiss="modal">취소</button> 
        </div>
        </div>       
      </div>
    </div>
  </div>
  </form>
</body>
<script type="text/javascript">
$("#deleteModal").modal();

$("#menu_enterbtn").click(function(){
	location.href="../index.jsp?main=mypage/adminpagemain.jsp";    
});  
</script>

</html>









