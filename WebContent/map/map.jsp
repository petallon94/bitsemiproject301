<%@page import="data.dao.StarMapDao"%>
<%@page import="data.dto.StarMapDto"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>키워드로 장소검색하고 목록으로 표출하기</title>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b6754d93f8d097bb07dd758c1b12ba4c&libraries=services,clusterer,drawing"></script>

<link rel="stylesheet" type="text/css" href="css/map_menu.css">
<link rel="stylesheet" type="text/css" href="css/map_window.css">
</head>
<style>
.wrap {
	overflow: hidden;
	font-size: 12px;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	line-height: 1.5;
}

.wrap * {
	padding: 0;
	margin: 0;
}

.wrap .mapinfo {
	width: 286px;
	height: 120px;
	border-radius: 5px;
	border-bottom: 2px solid #ccc;
	border-right: 1px solid #ccc;
	overflow: hidden;
	background: #fff;
}

.wrap .mapinfo:nth-child(1) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.mapinfo .title {
	padding: 5px 0 0 10px;
	height: 30px;
	background: #eee;
	border-bottom: 1px solid #ddd;
	font-size: 18px;
	font-weight: bold;
}

.mapinfo .close {
	position: absolute;
	top: 10px;
	right: 10px;
	color: #888;
	width: 17px;
	height: 17px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');
}

.mapinfo .close:hover {
	cursor: pointer;
}

.mapinfo .body {
	position: relative;
	overflow: hidden;
}

.mapinfo .desc {
	position: relative;
	margin: 13px 0 0 90px;
	height: 75px;
}

.desc .ellipsis {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.desc .jibun {
	font-size: 11px;
	color: #888;
	margin-top: -2px;
}

.mapinfo .img {
	position: absolute;
	top: 6px;
	left: 5px;
	width: 73px;
	height: 71px;
	border: 1px solid #ddd;
	color: #888;
	overflow: hidden;
}

.mapinfo:after {
	content: '';
	position: absolute;
	margin-left: -12px;
	left: 50%;
	bottom: 0;
	width: 22px;
	height: 12px;
	/* background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png') */
}

.mapinfo .link {
	color: #5085BB;
}
/*   지도  */

/* 지도 검색창 */
.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
	color: #000;
	text-decoration: none;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 700px;
}

#menu_wrap {
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	width: 250px;
	margin: 10px 0 30px 10px;
	padding: 5px;
	overflow-y: auto;
	background: rgba(255, 255, 255, 0.7);
	z-index: 1;
	font-size: 12px;
	border-radius: 10px;
}

.bg_white {
	background: #fff;
}

#menu_wrap hr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 2px solid #5F5F5F;
	margin: 3px 0;
}

#menu_wrap .option {
	text-align: center;
}

#menu_wrap .option p {
	margin: 10px 0;
}

#menu_wrap .option button {
	margin-left: 5px;
}

#placesList li {
	list-style: none;
}

#placesList .item {
	position: relative;
	border-bottom: 1px solid #888;
	overflow: hidden;
	cursor: pointer;
	min-height: 65px;
}

#placesList .item span {
	display: block;
	margin-top: 4px;
}

#placesList .item h5, #placesList .item .info {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

#placesList .item .info {
	padding: 10px 0 10px 55px;
}

#placesList .info .gray {
	color: #8a8a8a;
}

#placesList .info .jibun {
	padding-left: 26px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
		no-repeat;
}

#placesList .info .tel {
	color: #009900;
}

#placesList .item .markerbg {
	float: left;
	position: absolute;
	width: 36px;
	height: 37px;
	margin: 10px 0 0 10px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
		no-repeat;
}

#placesList .item .marker_1 {
	background-position: 0 -10px;
}

#placesList .item .marker_2 {
	background-position: 0 -56px;
}

#placesList .item .marker_3 {
	background-position: 0 -102px
}

#placesList .item .marker_4 {
	background-position: 0 -148px;
}

#placesList .item .marker_5 {
	background-position: 0 -194px;
}

#placesList .item .marker_6 {
	background-position: 0 -240px;
}

#placesList .item .marker_7 {
	background-position: 0 -286px;
}

#placesList .item .marker_8 {
	background-position: 0 -332px;
}

#placesList .item .marker_9 {
	background-position: 0 -378px;
}

#placesList .item .marker_10 {
	background-position: 0 -423px;
}

#placesList .item .marker_11 {
	background-position: 0 -470px;
}

#placesList .item .marker_12 {
	background-position: 0 -516px;
}

#placesList .item .marker_13 {
	background-position: 0 -562px;
}

#placesList .item .marker_14 {
	background-position: 0 -608px;
}

#placesList .item .marker_15 {
	background-position: 0 -654px;
}

#pagination {
	margin: 10px auto;
	text-align: center;
}

#pagination a {
	display: inline-block;
	margin-right: 10px;
}

#pagination .on {
	font-weight: bold;
	cursor: default;
	color: #777;
}

/* 매장추가,수정,삭제 */
#maphadan {
	position: relative;
	top: 150px;
	left: -330px;
	background-color: red;
	width: 200px;
	height: 200px;
	border-radius: 100px;
	float: left;
	margin-left: 400px;
	margin-top: 50px;
}

#hadan {
	position: relative;
	left: 250px;
	top: 30px;
	width: 300px;
	border: 1px solid gray;
}

#shopadd {
	position: relative;
	width: 635px;
	height: 70px;
	border: 1px solid #d5d5d5;
	border-radius: 5px;
	margin-bottom: 20px;
	margin-left: 20px;
}

#shopplus {
	position: absolute;
	text-align: center;
	margin-bottom: 15px;
	top: 13px;
	left: 50px;
}

#shopupdate {
	position: absolute;
	text-align: center;
	margin-bottom: 15px;
	top: 13px;
	left: 245px;
}

#shopdelete {
	position: absolute;
	text-align: center;
	margin-bottom: 15px;
	top: 13px;
	left: 440px;
}

#shopaddspan {
	position: relative;
	font-weight: bold;
	color: #02a8da;
	font-size: 25px;
	top: 0px;
	background-color: white;
	border-radius: 5px;
	padding: 3px;
	padding-left: 20px;
	padding-right: 20px;
}

#shopaddspan:hover {
	cursor: pointer;
	color: white;
	background-color: #02a8da;
}

#mapadd {
	left: 500px;
}
/* 매장추가,수정,삭제 */
</style>
<body>
	<%
	

	//현재로그인상태를 세션으로부터 얻는다
	String id=(String)session.getAttribute("id");
	//로그인한 아이디를 세션으로부터 얻는다
	String sessionId=(String)session.getAttribute("myid");
%>
<%-- <%
	if(id == id.equals("admin")){

%> --%>
	<!-- 매장추가 -->
	<div id="shopadd">
		<div id="shopplus">
			<div id="shopaddspan">매장추가</div>
		</div>
		<div id="shopupdate">
			<div id="shopaddspan">매장수정</div>
		</div>
		<div id="shopdelete">
			<div id="shopaddspan">매장삭제</div>
		</div>
	</div>

<%-- 	<%
}
%> --%>

	<div align="center" id="mapadd">
		<jsp:include page="../map/mapform.jsp"></jsp:include>
	</div>

	<script type="text/javascript">
		$(function() {
			$("#mapadd").hide();
			
			$("#shopadd").click(function() {
				$("#mapadd").toggle();
			});
		});
	</script>
	<!-- 매장추가end -->

	<div class="map_wrap">
		<div id="map"
			style="width: 100%; height: 750px; position: relative; overflow: hidden;"></div>

		<div id="menu_wrap" class="bg_white">
			<div class="option">
				<div>
					<form onsubmit="searchPlaces(); return false;">
						매장: <input type="text" value="강남" id="title" size="15">
						<button type="submit">검색하기</button>
					</form>
				</div>
			</div>
			<hr>
			<ul id="placesList"></ul>
			<div id="pagination"></div>
		</div>
	</div>

	<%
    	StarMapDao StarDao=new StarMapDao();
    	//목록 가져오기
    	List<StarMapDto> list=StarDao.getMainList();
    	
    	
    %>
    <table>
		<%for(StarMapDto dto:list)
		{%>

		<div id="maphadan">
			<div id="hadan">
				<h3><%=dto.getShopname() %></h3>
			</div>
			<div id="hadan"><%=dto.getShopaddr() %></div>
			<div id="hadan"><%=dto.getShopaddrdetail() %></div>
			<div id="hadan"><%=dto.getShophp() %></div>
			<div id="hadan"><%=dto.getShopdetail() %></div>
		</div>
		<%} %>
	</table>
	
	
	<script type="text/javascript">
		// 마커를 담을 배열입니다
		var markers = [];

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.50375828621347, 127.02411861828377), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);
		
		
		/* // 원(Circle)의 옵션으로 넣어준 반지름
		var radius = 100;

		// 마커들이 담긴 배열
		markers.forEach(function(m) {
		    var c1 = map.getCenter();
		    var c2 = m.getPosition();
		    var poly = new Polyline({
		      // map: map, 을 하지 않아도 거리는 구할 수 있다.
		      path: [c1, c2]
		    });
		    var dist = poly.getLength(); // m 단위로 리턴

		    if (dist < radius) {
		        m.setMap(map);
		    } else {
		        m.setMap(null);
		    }
		}); */
		
		var geocoder = new kakao.maps.services.Geocoder();
		
		
		var positions = [ 
		   <%for(StarMapDto dto:list){%>
		   {
		    	  title: '<%=dto.getShopname()%>',
                  content: '<div class="wrap">' + 
                   '    <div class="mapinfo">' + 
                   '        <div class="title">' + 
                   '            <%=dto.getShopname()%>' + 
                   '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
                   '        </div>' + 
                   '        <div class="body">' + 
                   '            <div class="img">' +
                   '                <img src="https://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
                   '           </div>' + 
                   '            <div class="desc">' + 
                   '                <div class="ellipsis"><%=dto.getShopaddr()%></div>' + 
                   '                <div class="jibun ellipsis"><%=dto.getShopaddrdetail()%></div>' + 
                   '				<div class="jibun ellipsis"><%=dto.getShophp()%></div>' +
                   '				<div class="jibun ellipsis"><%=dto.getShopdetail()%></div>' +
                   '            </div>' + 
                   '        </div>' + 
                   '    </div>' +    
                   '</div>',
                  latlng: new kakao.maps.LatLng(<%=dto.getMpositionx()%>, <%=dto.getMpositiony()%>)
              },
		   <%}%>
          ]; 
	
		
    	
	
		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png", // 마커이미지의 주소입니다    
	    imageSize = new kakao.maps.Size(24, 35), // 마커이미지의 크기입니다
	    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	      
		// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
	    

	    for (var i = 0; i < positions.length; i ++) {
	        
	        // 마커 이미지의 이미지 크기 입니다
	        var imageSize = new kakao.maps.Size(36, 58); 
	        
	        // 마커 이미지를 생성합니다    
	        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	        
	        // 마커를 생성합니다
	        var marker = new kakao.maps.Marker({
	            map: map, // 마커를 표시할 지도
	            position: positions[i].latlng, // 마커를 표시할 위치
	            title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	            image : markerImage // 마커 이미지 
	        });
	        
	        var infowindow = new kakao.maps.InfoWindow({
	            content: positions[i].content // 인포윈도우에 표시할 내용
	        });
	    	// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
	        // 이벤트 리스너로는 클로저를 만들어 등록합니다 
	        // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
	        kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow));
	       /*  kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow)); */
	       
	    }
	  
	 	
	 	// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	    function makeOverListener(map, marker, infowindow) {
	        return function() {
	            infowindow.open(map, marker);
	        };
	    }

	    // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
	    function makeOutListener(infowindow) {
	        return function() {
	            infowindow.close();
	        };
	    }
	    
		// 아래 코드는 위의 마커를 생성하는 코드에서 clickable: true 와 같이
		// 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
		marker.setClickable(true);


		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		
		
		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places();

		// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
			zIndex : 1
		});

		// 키워드로 장소를 검색합니다
		searchPlaces();

		// 키워드 검색을 요청하는 함수입니다
		function searchPlaces() {

			var keyword = document.getElementById('title').value;

			if (!keyword.replace(/^\s+|\s+$/g, '')) {
				alert('키워드를 입력해주세요!');
				return false;
			}

			// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
			ps.keywordSearch(keyword, placesSearchCB);
		}

		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
			if (status === kakao.maps.services.Status.OK) {

				// 정상적으로 검색이 완료됐으면
				// 검색 목록과 마커를 표출합니다
				displayPlaces(data);

				// 페이지 번호를 표출합니다
				displayPagination(pagination);

			} else if (status === kakao.maps.services.Status.ZERO_RESULT) {

				alert('검색 결과가 존재하지 않습니다.');
				return;

			} else if (status === kakao.maps.services.Status.ERROR) {

				alert('검색 결과 중 오류가 발생했습니다.');
				return;

			}
		}

		// 검색 결과 목록과 마커를 표출하는 함수입니다
		function displayPlaces(places) {

			var listEl = document.getElementById('placesList'), menuEl = document
					.getElementById('menu_wrap'), fragment = document
					.createDocumentFragment(), bounds = new kakao.maps.LatLngBounds(), listStr = '';

			// 검색 결과 목록에 추가된 항목들을 제거합니다
			removeAllChildNods(listEl);

			// 지도에 표시되고 있는 마커를 제거합니다
			removeMarker();

			for (var i = 0; i < places.length; i++) {

				// 마커를 생성하고 지도에 표시합니다
				var placePosition = new kakao.maps.LatLng(places[i].y,
						places[i].x), marker = addMarker(placePosition, i), itemEl = getListItem(
						i, places[i]); // 검색 결과 항목 Element를 생성합니다

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				// LatLngBounds 객체에 좌표를 추가합니다
				bounds.extend(placePosition);

				// 마커와 검색결과 항목에 mouseover 했을때
				// 해당 장소에 인포윈도우에 장소명을 표시합니다
				// mouseout 했을 때는 인포윈도우를 닫습니다
				(function(marker, title) {
					kakao.maps.event.addListener(marker, 'mouseover',
							function() {
								displayInfowindow(marker, title);
							});

					kakao.maps.event.addListener(marker, 'mouseout',
							function() {
								infowindow.close();
							});

					itemEl.onmouseover = function() {
						displayInfowindow(marker, title);
					};

					itemEl.onmouseout = function() {
						infowindow.close();
					};
				})(marker, places[i].place_name);

				fragment.appendChild(itemEl);
			}

			// 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
			listEl.appendChild(fragment);
			menuEl.scrollTop = 0;

			// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			map.setBounds(bounds);
		}

		// 검색결과 항목을 Element로 반환하는 함수입니다
		function getListItem(index, places) {
			
			var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
					+ (index + 1)
					+ '"></span>'
					+ '<div class="info">'
					+ '   <h5>' + places.place_name + '</h5>';

			if (places.road_address_name) {
				itemStr += '    <span>' + places.road_address_name + '</span>'
						+ '   <span class="jibun gray">' + places.address_name
						+ '</span>';
			} else {
				itemStr += '    <span>' + places.address_name + '</span>';
			}

			itemStr += '  <span class="tel">' + places.phone + '</span>'
					+ '</div>';

			el.innerHTML = itemStr;
			el.className = 'item';

			return el;
			
		}

		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, idx, title) {
			var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
			imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
			imgOptions = {
				spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
				spriteOrigin : new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
				offset : new kakao.maps.Point(13, 37)
			// 마커 좌표에 일치시킬 이미지 내에서의 좌표
			}, markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
					imgOptions), marker = new kakao.maps.Marker({
				position : position, // 마커의 위치
				image : markerImage
			});

			marker.setMap(map); // 지도 위에 마커를 표출합니다
			markers.push(marker); // 배열에 생성된 마커를 추가합니다

			return marker;
		}

		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}
			markers = [];
		}

		// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
		function displayPagination(pagination) {
			var paginationEl = document.getElementById('pagination'), fragment = document
					.createDocumentFragment(), i;

			// 기존에 추가된 페이지번호를 삭제합니다
			while (paginationEl.hasChildNodes()) {
				paginationEl.removeChild(paginationEl.lastChild);
			}

			for (i = 1; i <= pagination.last; i++) {
				var el = document.createElement('a');
				el.href = "#";
				el.innerHTML = i;

				if (i === pagination.current) {
					el.className = 'on';
				} else {
					el.onclick = (function(i) {
						return function() {
							pagination.gotoPage(i);
						}
					})(i);
				}

				fragment.appendChild(el);
			}
			paginationEl.appendChild(fragment);
		}

		// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
		// 인포윈도우에 장소명을 표시합니다
		function displayInfowindow(marker, title) {
			var content = '<div style="padding:5px;z-index:1;">' + title
					+ '</div>';

			infowindow.setContent(content);
			infowindow.open(map, marker);
		}

		// 검색결과 목록의 자식 Element를 제거하는 함수입니다
		function removeAllChildNods(el) {
			while (el.hasChildNodes()) {
				el.removeChild(el.lastChild);
			}
		}

</script>
</body>
</html>