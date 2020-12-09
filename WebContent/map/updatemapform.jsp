
<%@page import="java.util.List"%>
<%@page import="data.dto.StarMapDto"%>
<%@page import="data.dao.StarMapDao"%>
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
$(function(){
	
	var shopnum;
	
	
	$("#mapcategory").change(function() {
		var shopnum2=$(this).val();
		shopnum =shopnum2;
		//alert(shopnum);
		if(shopnum=='-'){
			$("#mapcategory2").val("");
			$("#mapcategory2").focus();
		}else{
			$("#mapcategory2").val(shopnum2);
		}
	});
	
	
	
	

	$("#mapcategory").change(function() {
		$.ajax({
			type: "post",
			url: "map/storepositionlistdata.jsp",
			data: {"shopnum":shopnum},
			dataType: "xml",
			success: function(data) {
				$(data).find("store").each(function(i, element) {
				var n=$(element);
				$("#shopnum").val(n.find("shopnum").text());
				$("#shopname").val(n.find("shopname").text());
				$("#shophp1").val(n.find("shophp1").text());
				$("#shophp2").val(n.find("shophp2").text());
				$("#shoppostcode").val(n.find("shoppostcode").text());
				$("#shopaddr").val(n.find("shopaddr").text());
				$("#shopextraAddress").val(n.find("shopextraAddress").text());
				$("#shopaddrdetail").val(n.find("shopaddrdetail").text());
				$("#shopdetail").val(n.find("shopdetail").text());
				$("#mpositionx").val(n.find("mpositionx").text());
				$("#mpositiony").val(n.find("mpositiony").text());
				
				});
				
			}
		});
	});	

});		
	
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
<%
	String shopnum=request.getParameter("shopnum");
	StarMapDao dao=new StarMapDao();
	StarMapDto dto=dao.getData(shopnum);
	List<StarMapDto> list=dao.getMainList();
%>
<div class="updatemapform">
	<form action="map/updatemapaction.jsp" method="post" class="form-inline" enctype="multipart/form-data">
	
		<table class="table table-bordered" style="width: 600px;">
			<tr>
				<td style="width: 150px; background-color: #f6c244;"><b>매장명</b></td>
				<td align="left">
					<input type="hidden" class="form-control" id="shopnum"  name="shopnum" >
					<input type="hidden" class="form-control" id="shopname"  name="shopname" >
					<select style="width: 200px;" name="mapcategory" class="form-control" id="mapcategory">
					<%for(StarMapDto starDto:list){%>
						<option selected disabled hidden>매장을 선택하세요</option>
						<option value="<%=starDto.getShopnum()%>"><%=starDto.getShopname()%></option>
					<%}%>
					</select>
					<!-- 버튼 -->
				<!-- 	<button type="button" id="shopsearch" name="shopsearch" class="shopsearch" >매장검색</button> -->
					<input type="hidden" class="form-control" id="mapcategory2"  name="mapcategory2" >
					
				</td>
			</tr>
			<tr>
				<td style="width: 150px; background-color: #f6c244;"><b>매장전화번호</b></td>
				<td align="left">
					<div class="form-group">
						<input type="text" name="shophp1" class="form-control" maxlength="4"
						style="width: 80px;" id="shophp1" required="required">
						<b>&nbsp;&nbsp;-&nbsp;&nbsp;</b>
						<input type="text" name="shophp2" class="form-control" maxlength="4"
						style="width: 80px;" id="shophp2" required="required">
					</div>
				</td>
			</tr>
			<tr>
				<td class="mapaddr" style="width: 150px; background-color: #f6c244;"><b>주 소</b></td>
				<td>					
					<input type="text" class="form-control input-sm" id="shoppostcode" name="shoppostcode" style="background-color: #eee; width: 100px;">&nbsp;
					<button class="btn btn-outline-warning" id="btnpost" onclick="execDaumPostcode()">주소검색</button><br><p></p>
					<input type="text" class="w-75 form-control input-sm" id="shopaddr" name="shopaddr"  style="background-color: #eee">
					<input type="text" class="w-75 form-control input-sm" id="shopaddrdetail" name="shopaddrdetail" required="required">
					<input type="text" class="w-75 form-control input-sm" id="shopextraAddress" name="shopextraAddress" style="background-color: #eee">
				</td>
			</tr>
			<tr>
				<td style="width: 150px; background-color: #f6c244;">
				<b>매장사진</b></td>
				<td align="left">
					<div class="form-group">
						<input id="shopphoto" type="file" name="shopphoto" style="width: 300px;" class="form-control">
					</div>
				</td>
			</tr>
			<tr>
				<td style="width: 150px; background-color: #f6c244;">
				<b>샵정보</b></td>
				<td align="left">
					<input id="shopdetail" type="text" name="shopdetail" class="form-control" style="width: 180px;" required="required">
				</td>
			</tr>
			<tr>
				<td style="width: 150px; background-color: #f6c244;">
				<b>위도</b></td>
				<td align="left">
					<input id="mpositionx" type="text" name="mpositionx" class="form-control" style="width: 180px;" required="required">
				</td>
			</tr>
			<tr>
				<td style="width: 150px; background-color: #f6c244;">
				<b>경도</b></td>
				<td align="left">
					<input id="mpositiony" type="text" name="mpositiony" class="form-control" style="width: 180px;" required="required">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-outline-warning" style="width: 100px;"><b>매장수정</b></button>
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>