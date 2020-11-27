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
<style>
  .modal-header, h4, .close {
    background-color: #5cb85c;
    color:white !important;
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
  padding:40px 50px;
  }
  
  .modal-footer {
    background-color: #f9f9f9;
  }
</style>
</head>
<body>
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#loginModal">
  Open modal
</button>

<!-- 로그인 모달창 -->
  <div class="modal" id="loginModal">
  <input type="text" id="login_num" value="">
    <div class="modal-dialog">    
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">로그인</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <input type="text" class="form-control" id="login_id" placeholder="아이디를 입력해주세요">
          <input type="text" class="form-control" id="login_password" placeholder="비밀번호를 입력해주세요">
          <button type="submit" class="btn btn-warning" id="login_enterbtn">로그인하기</button>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
        </div>
        
      </div>
    </div>
  </div>
</body>
</html>
