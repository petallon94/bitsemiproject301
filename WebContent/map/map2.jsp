<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
	<title>Kakao 지도 시작하기</title>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b6754d93f8d097bb07dd758c1b12ba4c&libraries=LIBRARY"></script>
	<!-- services 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b6754d93f8d097bb07dd758c1b12ba4c&libraries=services"></script>
<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b6754d93f8d097bb07dd758c1b12ba4c&libraries=services,clusterer,drawing"></script>
<style type="text/css">
	.wrap {
		position: absolute;
		left: 0;
		bottom: 40px;
		width: 288px;
		height: 132px;
		margin-left: -144px;
		text-align: left;
		overflow: hidden;
		font-size: 12px;
		font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
		line-height: 1.5;
	}
	
    .wrap * {
    	padding: 0;
    	margin: 0;
    }
    
    .wrap .info {
    	width: 286px;
    	height: 120px;
    	border-radius: 5px;
    	border-bottom: 2px solid #ccc;
    	border-right: 1px solid #ccc;
    	overflow: hidden;
    	background: #fff;
    }
    
    .wrap .info:nth-child(1) {
    	border: 0;
    	box-shadow: 0px 1px 2px #888;
    }
    
    .info .title {
    	padding: 5px 0 0 10px;
    	height: 30px;
    	background: #eee;
    	border-bottom: 1px solid #ddd;
    	font-size: 18px;
    	font-weight: bold;
    }
    
    .info .close {
    	position: absolute;
    	top: 10px;
    	right: 10px;
    	color: #888;
    	width: 17px;
    	height: 17px;
    	background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');
    }
    
    .info .close:hover {
    	cursor: pointer;
    }
    
    .info .body {
    	position: relative;
    	overflow: hidden;
    }
    
    .info .desc {
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
    
    .info .img {
    	position: absolute;
    	top: 6px;
    	left: 5px;
    	width: 73px;
    	height: 71px;
    	border: 1px solid #ddd;
    	color: #888;
    	overflow: hidden;
    }
    
    .info:after {
    	content: '';
    	position: absolute;
    	margin-left: -12px;
    	left: 50%;
    	bottom: 0;
    	width: 22px;
    	height: 12px;
    	background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
    }
    
    .info .link {
    	color: #5085BB;
    }
</style>
</head>
<body>
	<div id="map" style="width:700px;height:700px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4b153ff58979c0c47c28283075881f5f"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(37.502641050297306, 127.02492983421176),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
		
		// 커스텀 오버레이에 표시할 컨텐츠 입니다
		// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
		// 별도의 이벤트 메소드를 제공하지 않습니다 
		
		
		// 마커를 표시할 위치와 title 객체 배열입니다 
		var positions = [ 
		    {
		        title: '스타보틀 신논현 교보타워점',
		        content: '<div>카카오</div>',
		        latlng: new kakao.maps.LatLng(37.50375828621347, 127.02411861828377)
		    },
		    {
		        title: '스타보틀 비트캠프점',
		        content: '<div>카카오</div>',
		        latlng: new kakao.maps.LatLng(37.502973847754745, 127.0242398269516)
		    },
		    {
		        title: '스타보틀 강남점',
		        content: '<div>카카오</div>',
		        latlng: new kakao.maps.LatLng(37.49776597948896, 127.0280355722923)
		    },
		    {
		        title: '스타보틀 역삼점',
		        content: '<div>카카오</div>',
		        latlng: new kakao.maps.LatLng(37.50118130576224, 127.02662905661064)
		    },
		    {
		        title: '스타보틀 서초 써밋점',
		        content: '<div>카카오</div>',
		        latlng: new kakao.maps.LatLng(37.502704260822114, 127.02321468191909)
		    }
		];
		
		
		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png", // 마커이미지의 주소입니다    
	    imageSize = new kakao.maps.Size(24, 35), // 마커이미지의 크기입니다
	    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	      
		// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
	    

	    for (var i = 0; i < positions.length; i ++) {
	        
	        // 마커 이미지의 이미지 크기 입니다
	        var imageSize = new kakao.maps.Size(24, 35); 
	        
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
	        kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
	        kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
	        
	        
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
		
		
		
		
		
		
</script>
</body>
</html>