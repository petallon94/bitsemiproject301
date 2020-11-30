<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>로그인</title>
<style type="text/css">

  .modal-header, h4, .close {
    background-color: #ffb210;
    color:white;
    text-align: center;
    font-size: 30px;
  }
  .modal-header{
  padding:15px 30px;
  }
  .modal-title{
  text-align: center;
  }
  .modal-body{
  padding:40px 110px;
  text
  }  
  .modal-footer {
    background-color: #f9f9f9;
  }
  #login_joinbtn{
  margin: 10px;
  }
</style>
</head>
<%
	String url=request.getContextPath();	
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
  <div class="modal fade" id="loginModal">
  <input type="text" name="id" id="myid"
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
        <input type="text" class="form-control" id="login_id" placeholder="아이디를 입력해주세요">
		<div>비밀번호</div>         
		<input type="text" class="form-control" id="login_password" placeholder="비밀번호를 입력해주세요">
         <input type="checkbox" name="saveid"
					 <%=saveid==null?"":"checked"%>>아이디저장
         <br>
         <button type="button" class="btn btn-info" id="login_joinbtn" onclick="<%=url %>/index.jsp?main=member/memberform.jsp">회원가입하기</button> 
         <button type="submit" class="btn btn-warning" id="login_enterbtn">로그인하기</button>
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
$('#loginModal').modal('show')
</script>
</html>
