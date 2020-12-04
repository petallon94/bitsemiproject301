<%@page import="data.dto.MemberDto"%>
<%@page import="data.dao.MemberDao"%>
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
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>Insert title here</title>
<style type="text/css">
#admin_updateform {
margin-top: 50px;
}
#admin_updateform p{
margin-left: 450px;
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
.form-control::placeholder {
  color: lightgray;
  font-size: 0.8em;
  vertical-align: middle;
}
.btn{
font-size: 15px;
}
.btn {
text-size: 0.8em;
}
</style>
<script type="text/javascript">
$(function() {
	
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
//카카오 우편번호 API
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
       
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            if (data.userSelectedType === 'R') { 
                addr = data.roadAddress;
            } else { 
                addr = data.jibunAddress;
            }
           
            if(data.userSelectedType === 'R'){
              
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
               
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
             
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
               
                document.getElementById("extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("extraAddress").value = '';
            }
          
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("address").value = addr;
           
            document.getElementById("detailAddress").focus();
        }
    }).open();
}

</script>
</head>
<%

//세션에 저장된 로그인아이디
String loginid=(String)session.getAttribute("myid");
//num 읽기
String loginnum=request.getParameter("loginnum");
//db로 부터 get data 호출후 폼안에 값 넣어주기
MemberDao dao=new MemberDao();
MemberDto dto=dao.getData(loginnum);

%>
<body>
<form action="mypage/adminupdateaction.jsp" method="post" id="admin_updateform" class="form-inline d-flex flex-column" name="memberform">
		<!-- hidden -->
		<input type="hidden" name="loginid" value="<%=loginid%>">
		<input type="hidden" name="loginnum" value="<%=dto.getLoginnum()%>">
		<input type="hidden" name="id" value="<%=dto.getId()%>">
	<h3>회원정보수정</h3><br>
	<table class="table" style="width: 550px;">	
		<tr>
				<td class="table_title">아이디</td>
				<td>
					<b><%=dto.getId()%></b></td>
			</tr>
			<tr>
				<td class="table_title">이 름</td>
				<td><input name="name" type="text"
					class="w-50 form-control" required="required" value="<%=dto.getName()%>"></td>
			</tr>
			<tr>
				<td class="table_title">핸드폰</td>
				<td>
					<div class="form-group">
						<select name="hp1" class="form-control" style="margin-right: 10px;">
							<option value="010" <%=dto.getHp1().equals("010")?"selected":""%>>010</option>
							<option value="011" <%=dto.getHp1().equals("011")?"selected":""%>>011</option>
							<option value="019" <%=dto.getHp1().equals("019")?"selected":""%>>019</option>
						</select> 
						<input type="text" name="hp2" id="hp2" 
						class="form-control"
						maxlength="4" style="width: 80px;" required="required" value="<%=dto.getHp2()%>"> 
						<input type="text" name="hp3" id="hp3" 
						class="form-control" 
						maxlength="4" style="width: 80px;" required="required" value="<%=dto.getHp3()%>">
					</div>
				</td>
			</tr>
			<tr>
				<td class="table_title">이메일</td>
				<td>
					<div class="form-group">
					<input type="text" name="email1" style="width: 100px;"
					class="form-control" required="required" value="<%=dto.getEmail1()%>">
					<div style="margin-right:10px;">@</div>
					<input type="text" name="email2" id="email2" style="width: 120px;"
					class="form-control" required="required" value="<%=dto.getEmail2()%>">					
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
				<td class="table_title">주 소</td>
				<td>					
					<input type="text" class="form-control input-sm" id="postcode" name="postcode" placeholder="우편번호" style="background-color: #eee; width: 80px;" value="<%=dto.getPostcode()%>">
					<button class="btn btn-outline-warning" id="btnpost" onclick="execDaumPostcode()">주소검색</button><br>
					<input type="text" class="w-75 form-control input-sm" id="address" name="address" placeholder="주소" style="background-color: #eee" value="<%=dto.getAddress()%>">
					<input type="text" class="w-75 form-control input-sm" id="detailAddress" name="addrdetail" placeholder="상세주소" required="required" value="<%=dto.getAddrdetail()%>">
					<input type="text" class="w-75 form-control input-sm" id="extraAddress" name="extraaddr"placeholder="참고항목" style="background-color: #eee" value="<%=dto.getExtraaddr()%>">
				</td>
			</tr>
			<tr>
				<td class="table_title">생년월일</td>
				<td><input name="birthday" type="text" class="form-control" placeholder="8자리입력" max="8" value="<%=dto.getBirthday()%>"></td>
			</tr>
			<tr>
				<td width="100" style="color:red;">관리자<br>비밀번호확인</td>
				<td><input type="password" id="pass" name="pass" style="width: 100px;" class="form-control" required="required">
				</td>
			</tr>			
			<tr>
				<td colspan="2" align="center">
				<button type="submit" class="btn btn-warning">
				회원정보수정</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
