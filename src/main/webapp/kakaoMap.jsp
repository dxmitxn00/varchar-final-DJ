<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>픽업 지점 위치 안내</title>
    
</head>
<body>
<div id="map" style="width:100%;height:1000px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0019d78e8bf70fb84979b12d8d60ee64"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(36.35106360000046, 127.37133367903712), // 지도의 중심좌표
        level: 13 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
// 마커를 표시할 위치와 title 객체 배열입니다 
var positions = [
    {
        title: '강남점', 
        latlng: new kakao.maps.LatLng(37.500022499999325, 127.03132005393762)
    },
    {
        title: '신촌점', 
        latlng: new kakao.maps.LatLng(37.554154285659564, 126.93285762121194)
    },
    {
        title: '인천점', 
        latlng: new kakao.maps.LatLng(37.49220000000072, 126.715640579039)
    },
    {
        title: '노원점',
        latlng: new kakao.maps.LatLng(37.65754729999988, 127.05344077903595)
    },
    {
        title: '대전점',
        latlng: new kakao.maps.LatLng(36.35106360000046, 127.37133367903712)
    },
    {
        title: '부산점',
        latlng: new kakao.maps.LatLng(35.15242059999862, 129.05123727903722)
    },
    {
        title: '대구점',
        latlng: new kakao.maps.LatLng(35.866108599999265, 128.58544407903443)
    }
];

// 마커 이미지의 이미지 주소입니다
var imageSrc = "images/local.png"; 
//var imageSrc = "img/pin.png"; 

    
for (var i = 0; i < positions.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(50, 50); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    const marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    });
    
    console.log(marker.getTitle());
    console.log(marker.getPosition().getLat());
    console.log(marker.getPosition().getLng());
    
    kakao.maps.event.addListener(marker, 'click', function() {
    	var searchAdd = "https://map.kakao.com/link/to/"+ marker.getTitle() +","+ marker.getPosition().getLat()+","+ marker.getPosition().getLng();
    	window.open(searchAdd, '길찾기', 'width=1000, height=750');
  	});



}
</script>
</body>