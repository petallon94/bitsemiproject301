<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<script type="text/javascript">
//카카오 우편번호 API
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
       
            var shopaddr = ''; // 주소 변수
            var shopextraAddress = ''; // 참고항목 변수

            if (data.userSelectedType === 'R') { 
            	shopaddr = data.roadAddress;
            } else { 
            	shopaddr = data.jibunAddress;
            }
           
            if(data.userSelectedType === 'R'){
              
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                	shopextraAddress += data.bname;
                }
               
                if(data.buildingName !== '' && data.apartment === 'Y'){
                	shopextraAddress += (shopextraAddress !== '' ? ', ' + data.buildingName : data.buildingName);
                }
             
                if(shopextraAddress !== ''){
                	shopextraAddress = ' (' + shopextraAddress + ')';
                }
               
                document.getElementById("shopextraAddress").value = shopextraAddress;
            
            } else {
                document.getElementById("shopextraAddress").value = '';
            }
          
            document.getElementById('shoppostcode').value = data.zonecode;
            document.getElementById("shopaddr").value = shopaddr;
           
            document.getElementById("shopaddrdetail").focus();
        }
    }).open();
}
</script>
<div class="mapform">
	<form action="map/mapaddaction.jsp" method="post" enctype="multipart/form-data" class="form-inline">
		<table class="table table-bordered" style="width: 600px;">
			<tr>
				<td style="width: 150px; background-color: #02a8da">
				<b>매장명</b></td>
				<td align="left">
					<input type="text" name="shopname" class="form-control" style="width: 180px;" placeholder="매장명" required="required">
				</td>
			</tr>
			<tr>
				<td style="width: 150px; background-color: #02a8da"><b>매장전화번호</b></td>
				<td align="left">
					<div class="form-group">
						<input type="text" name="shophp1" class="form-control" maxlength="4"
						style="width: 80px;" id="shophp2" required="required" placeholder="앞번호">
						<b>&nbsp;&nbsp;-&nbsp;&nbsp;</b>
						<input type="text" name="shophp2" class="form-control" maxlength="4"
						style="width: 80px;" id="shophp2" required="required" placeholder="뒷번호">
					</div>
				</td>
			</tr>
			<tr>
				<td class="mapaddr" style="width: 150px; background-color: #02a8da"><b>주 소</b></td>
				<td>					
					<input type="text" class="form-control input-sm" id="shoppostcode" name="shoppostcode" placeholder="우편번호" style="background-color: #eee; width: 80px;">&nbsp;
					<button class="btn btn-outline-warning" id="btnpost" onclick="execDaumPostcode()">주소검색</button><br><p></p>
					<input type="text" class="w-75 form-control input-sm" id="shopaddr" name="shopaddr" placeholder="주소" style="background-color: #eee">
					<input type="text" class="w-75 form-control input-sm" id="shopaddrdetail" name="shopaddrdetail" placeholder="상세주소" required="required">
					<input type="text" class="w-75 form-control input-sm" id="shopextraAddress" name="shopextraAddress"placeholder="참고항목" style="background-color: #eee">
				</td>
			</tr>
			<tr>
				<td style="width: 150px; background-color: #02a8da">
				<b>매장사진</b></td>
				<td align="left">
					<div class="form-group">
						<input type="file" name="shopphoto" style="width: 300px;" class="form-control" required="required">
					</div>
					<div class="addfile"></div>
				</td>
			</tr>
			<tr>
				<td style="width: 150px; background-color: #02a8da">
				<b>샵정보</b></td>
				<td align="left">
					<input type="text" name="shopdetail" class="form-control" style="width: 180px;" placeholder="샵정보" required="required">
				</td>
			</tr>
			<tr>
				<td style="width: 150px; background-color: #02a8da">
				<b>위도</b></td>
				<td align="left">
					<input type="text" name="mpositionx" class="form-control" style="width: 180px;" placeholder="위도" required="required">
				</td>
			</tr>
			<tr>
				<td style="width: 150px; background-color: #02a8da">
				<b>경도</b></td>
				<td align="left">
					<input type="text" name="mpositiony" class="form-control" style="width: 180px;" placeholder="경도" required="required">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-info" style="width: 100px;"><b>매장저장</b></button>
					<button type="button" class="btn btn-info" style="width: 100px;" 
					onclick="location.href='index.jsp?main=map/map.jsp'"><b>매장목록</b></button>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>