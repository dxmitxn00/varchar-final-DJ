<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="try"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Var茶 | 지점 위치</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- 파비콘 태그 -->
    <try:favicon/>
    <!-- 링크 부분 태그 -->
    <try:link/>
    <link rel="stylesheet" href="css/elegant-icons.css">
  </head>
  <body class="goto-here">
	<!-- 헤더 부분 태그 -->	
	<try:nav/>
    <div class="hero-wrap hero-bread" style="background-image: url('images/bg_1.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p class="breadcrumbs"><span class="mr-2"><a href="main.do">Home</a></span> <span>Contact us</span></p>
            <h1 class="mb-0 bread">지점 위치</h1>
          </div>
        </div>
      </div>
    </div>

    <section class="ftco-section contact-section bg-light">
      <div class="container">
      	<div class="row d-flex mb-5 contact-info">
          <div class="w-100"></div>
          <div class="col-md-3 d-flex">
          	<div class="info bg-white p-4">
	            <p><h5>주소</h5>서울특별시 강남구 테헤란로 26길 12 제일비전타워 13층</p>
	          </div>
          </div>
          <div class="col-md-3 d-flex">
          	<div class="info bg-white p-4">
	            <p><h5>번호</h5>02-538-0021</p>
	          </div>
          </div>
          <div class="col-md-3 d-flex">
          	<div class="info bg-white p-4">
	            <p><h5>이메일</h5>varchar@gmail.com</p>
	          </div>
          </div>
          <div class="col-md-3 d-flex">
          	<div class="info bg-white p-4">
	            <p><h5>웹사이트</h5>www.varchar.com</p>
	          </div>
          </div>
        </div>
        <!-- Map Begin -->
        <div class="map" id="edit_map">
         <!--  <iframe
              src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3165.3595716986933!2d127.03327467563624!3d37.49943667205608!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca3fe1f1d901b%3A0x41f4e65cc8389abe!2z7ISc7Jq47Yq567OE7IucIOqwleuCqOq1rCDthYztl6TrnoDroZwyNuq4uCAxMg!5e0!3m2!1sko!2skr!4v1689230881220!5m2!1sko!2skr"
              height="500" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
          <div class="map-inside">
              <i class="icon_pin"></i>
              <div class="inside-widget">
                  <h4>J 강의실</h4>
                  <ul>
                      <li>연락처: 02-538-0021</li>
                      <li>서울 강남구 테헤란로 146</li>
                  </ul>
              </div>
          </div> -->
        </div>
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0019d78e8bf70fb84979b12d8d60ee64"></script>
		<script>
		var mapContainer = document.getElementById('edit_map'), // 지도를 표시할 div  
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
        <!-- Map End -->
      </div>
    </section>

    <footer class="ftco-footer ftco-section">
      <div class="container">
      	<div class="row">
      		<div class="mouse">
						<a href="#" class="mouse-icon">
							<div class="mouse-wheel"><span class="ion-ios-arrow-up"></span></div>
						</a>
					</div>
      	</div>
        <div class="row mb-5">
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Vegefoods</h2>
              <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia.</p>
              <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4 ml-md-5">
              <h2 class="ftco-heading-2">Menu</h2>
              <ul class="list-unstyled">
                <li><a href="#" class="py-2 d-block">Shop</a></li>
                <li><a href="#" class="py-2 d-block">About</a></li>
                <li><a href="#" class="py-2 d-block">Journal</a></li>
                <li><a href="#" class="py-2 d-block">Contact Us</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md-4">
             <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Help</h2>
              <div class="d-flex">
	              <ul class="list-unstyled mr-l-5 pr-l-3 mr-4">
	                <li><a href="#" class="py-2 d-block">Shipping Information</a></li>
	                <li><a href="#" class="py-2 d-block">Returns &amp; Exchange</a></li>
	                <li><a href="#" class="py-2 d-block">Terms &amp; Conditions</a></li>
	                <li><a href="#" class="py-2 d-block">Privacy Policy</a></li>
	              </ul>
	              <ul class="list-unstyled">
	                <li><a href="#" class="py-2 d-block">FAQs</a></li>
	                <li><a href="#" class="py-2 d-block">Contact</a></li>
	              </ul>
	            </div>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
            	<h2 class="ftco-heading-2">Have a Questions?</h2>
            	<div class="block-23 mb-3">
	              <ul>
	                <li><span class="icon icon-map-marker"></span><span class="text">203 Fake St. Mountain View, San Francisco, California, USA</span></li>
	                <li><a href="#"><span class="icon icon-phone"></span><span class="text">+2 392 3929 210</span></a></li>
	                <li><a href="#"><span class="icon icon-envelope"></span><span class="text">info@yourdomain.com</span></a></li>
	              </ul>
	            </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12 text-center">

            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart color-danger" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
						  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						</p>
          </div>
        </div>
      </div>
    </footer>
    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="js/jquery.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/jquery.waypoints.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>
  <script src="js/jquery.animateNumber.min.js"></script>
  <script src="js/bootstrap-datepicker.js"></script>
  <script src="js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="js/google-map.js"></script>
  <script src="js/main.js"></script>
    
  </body>
</html>