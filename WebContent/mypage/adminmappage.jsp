<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#mapbgarea{width: 1000px;height: 200px;background-color: #f7f7f7;position: absolute;z-index: -10;}
#btnarea{padding: 2em;}
.ordermapbtn,.ordermapbtn::after {-webkit-transition: all 0.3s;-moz-transition: all 0.3s;-o-transition: all 0.3s;transition: all 0.3s;}
.ordermapbtn {background: none;border: 2px solid #f6c244;border-radius: 5px;color: #f6c244;font-size: 1.6em;font-weight: 500;
				margin: 1em 1em;padding: 1em 3em;position: relative;text-transform: uppercase;}
.ordermapbtn::before, .ordermapbtn::after {background: #f6c244;content: '';position: absolute;z-index: -1;}
.ordermapbtn:hover {color: #333;}
.ordermapbtn::after {height: 100%;left: 0;top: 0;width: 0;}
.ordermapbtn:hover:after {width: 100%;}
#maparea{width: 1000px; height: auto; background-color: #f7f7f7; margin: 30px 0; padding-top: 80px; padding-bottom: 80px; padding-left: 200px; padding-right: 200px;}
</style>
<script type="text/javascript">
	$(function() {
		/* $("#mapadd").hide(); */
		$("#mapupdate").hide();
		$("#mapdelete").hide();
		
		$("#addbutton").click(function() {
			$("#mapadd").toggle();
			$("#mapupdate").hide();
			$("#mapdelete").hide();
			
			
		});
		$("#updatebutton").click(function() {
			$("#mapadd").hide();
			$("#mapupdate").toggle();
			$("#mapdelete").hide();
			
			
		});
		$("#deletebutton").click(function() {
			$("#mapadd").hide();
			$("#mapupdate").hide();
			$("#mapdelete").toggle();
		
			
		});
	});
	function pageinsert(){
		
		$("#maparea").load("map/mapform.jsp");
	}
	function pageupdate(){
			
		$("#maparea").load("map/updatemapform.jsp");
		}
	
	function pagedelete(){
		
		$("#maparea").load("map/deletemapform.jsp");
	}
</script>
</head>
<body>
<div id="adminmap">
	<div id="mapbgarea"></div>
	<div id="btnarea">
		<button id="addbutton" type="button" class="ordermapbtn" onclick ="location.href='javascript:pageinsert()'">매장추가</button>
		<button id="updatebutton" type="button" class="ordermapbtn" onclick ="location.href='javascript:pageupdate()'">매장수정</button>
		<button id="deletebutton" type="button" class="ordermapbtn" onclick ="location.href='javascript:pagedelete()'">매장삭제</button>
	</div>
	<div id="maparea" align="center">
		
	</div>
	
</div>
</body>
</html>