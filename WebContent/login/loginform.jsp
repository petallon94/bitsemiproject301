<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 꽃 주문하기 모달창 -->
<div class="modal fade" id="myModal" role="dialog">
<input type="hidden" id="ins_num" value="">
<div class="modal-dialog">    
      <div class="modal-content">
        <div class="modal-header" style="padding:15px 30px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-lock"></span>꽃 주문하기</h4>
        </div>
        <div class="modal-body" style="padding:40px 50px;">      
          <form role="form">
            <div class="form-group">
              <label for="name"><span class="glyphicon glyphicon-user"></span>이름</label>
              <input type="text" class="form-control" id="ins_name" placeholder="이름을 입력해주세요">
            </div>           
            <div class="form-group">
              <label for="address"><span class="glyphicon glyphicon-home"></span>배송지</label>
              <input type="text" class="form-control" id="ins_address" placeholder="주소를 입력해주세요">
            </div>
            <div class="form-group">
              <label for="hp"><span class="glyphicon glyphicon-home"></span>연락처</label>
              <input type="text" class="form-control" id="ins_hp" placeholder="연락처를 입력해주세요">
            </div>
            <div class="form-group">
             <label for="deliveryday"><span class="glyphicon glyphicon-calendar"></span>배송날짜</label>
            <input type="date" id="ins_deliveryday" value="2020-10-29" class="form-control input-sm">
            </div>
              <button type="submit" class="btn btn-success btn-block" id="btninsert"><span class="glyphicon glyphicon-ok"></span>주문하기</button>
          </form>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> 취소하기</button>
        </div>
       </div>
 </div>
 </div>

</body>
</html>
