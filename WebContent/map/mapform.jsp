<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<script type="text/javascript">
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
<div class="mapform">
	<form action="map/mapaddaction.jsp" method="post" enctype="multipart/form-data" class="form-inline">
		<table class="table table-bordered" style="width: 600px;">
			<caption><b>매장 등록</b></caption>
			<tr>
				<td style="width: 150px; background-color: #66cdaa">
				<b>매장명</b></td>
				<td align="left">
					<input type="text" name="shopname" class="form-control" style="width: 180px;" placeholder="매장명" required="required">
				</td>
			</tr>
			<tr>
				<td align="center"><b>매장전화번호</b></td>
				<td align="left">
					<div class="form-group">
						<input type="text" name="hp1" class="form-control" maxlength="3"
						style="width: 50px;" id="hp2" required="required">
						<input type="text" name="hp2" class="form-control" maxlength="4"
						style="width: 80px;" id="hp2" required="required">
						<input type="text" name="hp3" class="form-control" maxlength="4"
						style="width: 80px;" id="hp3" required="required">
					</div>
				</td>
			</tr>
			<tr>
				<td class="mapaddr"><b>주 소</b></td>
				<td>					
					<input type="text" class="form-control input-sm" id="postcode" name="postcode" placeholder="우편번호" style="background-color: #eee; width: 80px;">
					<button class="btn btn-outline-warning" id="btnpost" onclick="execDaumPostcode()">주소검색</button><br>
					<input type="text" class="w-75 form-control input-sm" id="address" name="address" placeholder="주소" style="background-color: #eee">
					<input type="text" class="w-75 form-control input-sm" id="detailAddress" name="addrdetail" placeholder="상세주소" required="required">
					<input type="text" class="w-75 form-control input-sm" id="extraAddress" name="extraaddr"placeholder="참고항목" style="background-color: #eee">
				</td>
			</tr>
			<tr>
				<td style="width: 150px; background-color: #66cdaa">
				<b>상품사진</b></td>
				<td align="left">
					<div class="form-group">
						<input type="file" name="photo1" style="width: 300px;" class="form-control" required="required">
					</div>
					<div class="addfile"></div>
				</td>
			</tr>
			<tr>
				<td style="width: 150px; background-color: #66cdaa">
				<b>샵정보</b></td>
				<td align="left">
					<input type="text" name="shopdetail" class="form-control" style="width: 180px;" placeholder="샵정보" required="required">
				</td>
			</tr>
			<tr>
				<td style="width: 150px; background-color: #66cdaa">
				<b>위도</b></td>
				<td align="left">
					<input type="text" name="mpositionx" class="form-control" style="width: 180px;" placeholder="위도" required="required">
				</td>
			</tr>
			<tr>
				<td style="width: 150px; background-color: #66cdaa">
				<b>경도</b></td>
				<td align="left">
					<input type="text" name="mpositiony" class="form-control" style="width: 180px;" placeholder="경도" required="required">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-info" style="width: 100px;"><b>매장저장</b></button>
					<button type="button" class="btn btn-info" style="width: 100px;" 
					onclick="location.href='index.jsp?main=map/maplist.jsp'"><b>매장목록</b></button>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>