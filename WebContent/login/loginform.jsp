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
/* 로그인모달창 */

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
%>
<body>
<!-- 로그인 모달창 -->
<form action="login/loginaction.jsp" method="post" id="loginform" name="loginform">
  <div class="modal fade" id="loginModal">
  <input type="hidden" name="id" id="myid"
					placeholder="아이디" class="form-control"
					value="<%=id%>">
    <div class="modal-dialog">    
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title" style="text-align: center;">로그인</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        <div>아이디</div>
        <input type="text" class="form-control" id="login_id" name="login_id" placeholder="아이디를 입력해주세요" required="required">
		<div>비밀번호</div>         
		<input type="text" class="form-control" id="login_password" name="login_password" placeholder="비밀번호를 입력해주세요" required="required">
        <input type="checkbox" name="login_saveid" <%=saveid==null?"":"checked"%>>아이디저장
        <br>        
        <button type="submit" class="btn btn-warning btn-block" id="login_enterbtn">로그인</button>
        <button type="button" class="btn btn-info btn-block" id="login_joinbtn">회원가입</button> 
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
$("#loginModal").modal();

$("#login_joinbtn").click(function(){
	location.href="index.jsp?main=member/memberform.jsp";    
});  
</script>

</html>









