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
#joinform {
margin-top: 50px;
}
#joinform #must{
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
.table > b{
color: red;
}

.btn {
text-size: 0.8em;
}
/* .step_style{
list-style: none;
}
.step_style li{
	float:left;
    text-align: center;
}
.step_style li img{
    width: 80px;
    height: 80px;
    background-color: lightgray;
    border-radius: 100px;
    } */
</style>
<script type="text/javascript">
$(function() {
	
	//패스워드 확인
    $('#pwd').keyup(function(){
      $('#passcheck').html('');
    });

    $('#pwd2').keyup(function(){

        if($('#pwd').val() != $('#pwd2').val()){
          $('#passcheck').html('비밀번호 일치하지 않음');
          $('#passcheck').css({
        	  	"color":"red",
				"font-size":"14px"
			});
        } else{
          $('#passcheck').html('비밀번호 일치함');
          $('#passcheck').css({
				"color":"green",
				"font-size":"14px"
          });
        }
        return;

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


//아이디 유효성 검사(1 = 중복 / 0 != 중복)
$("#id").blur(function() {
		
		var id=$(this).val();//앞뒤공백제거
		if(id.trim().length==0){
			$(this).val('');
			return;
		}
		//alert(id);
		$.ajax({
			type:"get",
			url:"member/idcheck.jsp",
			dataType:"xml",
			data:{"id":id},
			success:function(data){
				//id 중복확인 버튼 클릭시
				$("#idcheck_btn").one("click",function() {				

				if($(data).text()=='yes'){
					
					alert("이미 등록된 아이디 입니다.");
					$("#id").val('');
					$("#id").focus();	
				
										
				}else{

					alert("사용가능한 아이디입니다.");
					$("#pwd").focus();						
				}
			
			});	
			}
		});	
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
<body>

<br>	
<form action="member/insertaction.jsp" method="post" id="joinform" class="form-inline d-flex flex-column" name="memberform">
<!-- <ul class="step_style">
			<li>
			<img src="./image/pencil.png" alt="회원정보입력" id="pc" style="padding:10px;"/>					
			<p>회원정보입력</p>
			</li>
			<li>ㅡ</li>
			<li>
				<img src="./image/sb_symbol.jpg" alt="가입완료" id="sb"/>
			<p>가입완료</p>
			</li>
		</ul> -->
<h3>회원가입</h3><br>
	<p id="must"><b>*</b>필수입력사항</p>		
	<table class="table" style="width: 550px;">	
		<tr>
				<td class="table_title">아이디<b>*</b></td>
				<td><input name="id" id="id" type="text"
					autofocus="autofocus" class="w-50 form-control" required="required" placeholder="중복확인을 해주세요" >
					<button class="btn btn-outline-warning" id="idcheck_btn">중복확인</button>					
				</td>
			</tr>
			<tr>
				<td class="table_title">비밀번호<b>*</b></td>
				<td><input type="password" id="pwd" name="password" class="w-50 form-control" required="required" placeholder="비밀번호를 입력해주세요">
				<b id="passcheck"></b></td>
			</tr>
			<tr>
				<td class="table_title">비밀번호확인<b>*</b></td>
				<td><input type="password" id="pwd2" class="w-50 form-control" required="required" placeholder="비밀번호를 확인해주세요">
 				</td>
			</tr>
			<tr>
				<td class="table_title">이 름<b>*</b></td>
				<td><input name="name" type="text"
					class="w-50 form-control" required="required"></td>
			</tr>
			<tr>
				<td class="table_title">핸드폰<b>*</b></td>
				<td>
					<div class="form-group">
						<select name="hp1" class="form-control" style="margin-right: 10px;">
							<option value="010" selected="selected">010</option>
							<option value="011" >011</option>
							<option value="019">019</option>
						</select> 
						<input type="text" name="hp2" id="hp2" 
						class="form-control"
						maxlength="4" style="width: 80px;" required="required"> 
						<input type="text" name="hp3" id="hp3" 
						class="form-control" 
						maxlength="4" style="width: 80px;" required="required">
					</div>
				</td>
			</tr>
			<tr>
				<td class="table_title">이메일<b>*</b></td>
				<td>
					<div class="form-group">
					<input type="text" name="email1" style="width: 100px;"
					class="form-control" required="required">
					<div style="margin-right:10px;">@</div>
					<input type="text" name="email2" id="email2" style="width: 120px;"
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
				<td class="table_title">주 소<b>*</b></td>
				<td>					
					<input type="text" class="form-control input-sm" id="postcode" name="postcode" placeholder="우편번호" style="background-color: #eee; width: 80px;">
					<button class="btn btn-outline-warning" id="btnpost" onclick="execDaumPostcode()">주소검색</button><br>
					<input type="text" class="w-75 form-control input-sm" id="address" name="address" placeholder="주소" style="background-color: #eee">
					<input type="text" class="w-75 form-control input-sm" id="detailAddress" name="addrdetail" placeholder="상세주소" required="required">
					<input type="text" class="w-75 form-control input-sm" id="extraAddress" name="extraaddr"placeholder="참고항목" style="background-color: #eee">
				</td>
			</tr>
			<tr>
				<td class="table_title">생년월일</td>
				<td><input name="birthday" type="text" class="form-control" placeholder="8자리입력" max="8"></td>
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