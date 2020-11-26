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
<title>Insert title here</title>
<style type="text/css">
#joinform {
display: flex;
flex-direction: column;
}

#joinform p{
margin-left: 400px;
font-size: 0.7rem;
}
.table_title {
width: 130px;
font-size: 15px;
text-align: left;
}
.table td {
vertical-align: middle;
}
table tr td input{
margin-right: 10px;
width: 250px;
}
.btn{
font-size: 15px;
}
b{
color: red;
}
.btn {
text-size: 0.8em;
}
</style>
<script type="text/javascript">
$(function() {
	//@카카오 오픈 api 사용 예정!!!!!
	//주소 검색 파일 오픈
	$("#btnpost").click(function() {
		window.open("member/postsearch.jsp","",
				"left=100px,top=100px,width=400px,height=250px");
		});
	//아이디 입력시 메세지 지우기
	$("#id").keydown(function () {
		$("b.idcheck").html("");
		
	});
	
	//아이디 입력후 포커스가 벗어날때 아이디 체크하기
	$("#id").blur(function() {
		var id=$(this).val();//앞뒤공백제거
		if(id.trim().length==0){
			$(this).val('');
			return;
		}
		$.ajax({
			type:"get",
			url:"member/idcheckxml.jsp",
			dataType:"xml",
			data:{"id":id},
			success:function(data){
				//alert($(data).text());
				if($(data).text()=='yes'){
					$("b.idcheck").html("이미 등록된 아이디 입니다.");
					$("b.idcheck").css({
						"color":"red",
						"font-size":"14px"
					});
					$("#id").val("");
				}else{
					$("b.idcheck").html("사용가능한 아이디입니다.");
					$("b.idcheck").css({
						"color":"green",
						"font-size":"14px"
					});

				}			
			}			
		});		
	});	
	
	//1. 핸드폰 4자리 입력시 다음 번호칸으로 이동
	$("#hp2").keyup(function() {
		var len=$(this).val().length;
		if(len==4)
		$("#hp3").focus();
	});
		
	
	//2. 이메일 선택시 앞칸에 이메일 주소 출력
	
	$("#email3").change(function() {
		var s=$(this).val();
		if(s=='-'){
			$("#email2").val("");
			$("#email2").focus();
		}else{
			$("#email2").val(s);
		}
	});
});

</script>
</head>
<body>
<form action="member/insertaction.jsp" method="post" id="joinform" class="form-inline" name="memberform">
	<h3>회원가입</h3><br>
	<p><b>*</b>필수입력사항</p>		
	<table class="table" style="width: 500px;">	
		<tr>
				<td class="table_title">아이디<b>*</b></td>
				<td><input name="id" id="id" type="text"
					autofocus="autofocus" class="form-control" required="required" >
					<button class="btn btn-outline-warning" id="idcheck">중복확인</button></td>
			</tr>
			<tr>
				<td class="table_title">비밀번호<b>*</b></td>
				<td><input type="password" id="pwd" name="pass" class="form-control" required="required">
 				</td>
			</tr>
			<tr>
				<td class="table_title">비밀번호확인<b>*</b></td>
				<td><input type="password" id="pwd2" name="pass" class="form-control" required="required">
 				</td>
			</tr>
			<tr>
				<td class="table_title">이 름<b>*</b></td>
				<td><input name="name" type="text"
					class="form-control" required="required"></td>
			</tr>
			<tr>
				<td class="table_title">핸드폰<b>*</b></td>
				<td>
					<div class="form-group">
						<select name="hp1" class="form-control" style="margin-right: 10px;">
							<option value="02">02</option>
							<option value="010" selected="selected">010</option>
							<option value="019">019</option>
						</select> 
						<input type="text" name="hp2" id="hp2" 
						class="form-control"
						maxlength="4" style="width: 80px;" required="required"> 
						<input type="text" 	name="hp3" id="hp3" 
						class="form-control" 
						maxlength="4" style="width: 80px;" required="required">
					</div>
				</td>
			</tr>
			<tr>
				<td class="table_title">이메일<b>*</b></td>
				<td>
					<div class="form-group">
					<input type="text" name="email1" style="width: 80px;"
					class="form-control" required="required">
					<b>@ </b>
					<input type="text" name="email2" id="email2" style="width: 100px;"
					class="form-control" required="required">
					
					<select id="email3" class="form-control">
						<option selected disabled hidden="">이메일선택</option>
						<option value="-">직접작성</option>
						<option value="naver.com">네이버</option>
						<option value="nate.com">네이트</option>
						<option value="gmail.com">구글</option>						
					</select>
				</div>
			</tr>
			<tr>
				<td class="table_title">주소</td>
				<td><input type="text" name="address" style=" background-color: #eee"
				readonly="readonly"	class="form-control" class="form-control input-sm">
					<button class="btn btn-outline-warning" id="btnpost">주소검색</button>
					<br>
					<input type="text" class="form-control input-sm" name="addrdetail" 
					class="form-control">
				</td>
			</tr>
			<tr>
				<td class="table_title">생년월일<b>*</b></td>
				<td><input name="birthday" type="text" class="form-control"></td>
			</tr>			
			<tr>
				<td colspan="2" align="center">
				<button type="submit" class="btn btn-warning">
				가입하기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>