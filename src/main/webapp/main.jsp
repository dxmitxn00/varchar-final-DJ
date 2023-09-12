<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="try"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Var茶 | 홈</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- 파비콘 태그 -->
    <try:favicon/>
    <!-- 링크 부분 태그 -->
    <try:link/>
  </head>
  <body class="goto-here">
     <!-- 헤더 부분 태그 -->
    <try:nav/>
	<!-- 히어로 섹션 : 메인 사진 및 애니메이션 텍스트 -->
    <section id="home-section" class="hero">
		  <div class="home-slider owl-carousel">
	      <div class="slider-item" style="background-image: url(images/bg_1.jpg);">
	      	<div class="overlay"></div>
	        <div class="container">
	          <div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">

	            <div class="col-md-12 ftco-animate text-center">
				  <h1>Healing and Fresh with  <span class="typer" id="some-id" data-delay="200" data-delim=":" data-words="varchar:var茶" data-colors="green"></span><span class="cursor" data-cursorDisplay="_" data-owner="some-id"></span></h1>
	              <h1 class="mb-2">We serve Fresh Vegestables &amp; Fruits</h1>
	              <h2 class="subheading mb-4">We deliver organic vegetables &amp; fruits</h2>
	              <p><a href="teaListPage.do" class="btn btn-primary">Feel Healing</a></p>
	            </div>

	          </div>
	        </div>
	      </div>

	      <div class="slider-item" style="background-image: url(images/bg_2.jpg);">
	      	<div class="overlay"></div>
	        <div class="container">
	          <div class="row slider-text justify-content-center align-items-center" data-scrollax-parent="true">

	            <div class="col-sm-12 ftco-animate text-center">
				  <h1>Healing and Fresh with  <span class="typer" id="some-id" data-delay="200" data-delim=":" data-words="varchar:var茶" data-colors="green"></span><span class="cursor" data-cursorDisplay="_" data-owner="some-id"></span></h1>
				  <h1 class="mb-2">100% Fresh &amp; Organic Foods</h1>
	              <h2 class="subheading mb-4">We deliver organic vegetables &amp; fruits</h2>
	              <p><a href="teaListPage.do" class="btn btn-primary">Feel Healing</a></p>
	            </div>

	          </div>
	        </div>
	      </div>
	    </div>
    </section>
	<!-- 히어로 섹션 끝 -->

	<!-- 링크 연결 섹션 -->
	<!-- 각 아이콘 맞춰서 삽입하셈 -->
	<!-- 링크도 연결하셈 -->
	<!-- var茶 탄생기는 우리가 사용한 언어랑 DB등등 알려주는 페이지 만들어서 연결하셈 -->
    <section class="ftco-section">
			<div class="container">
				<div class="row no-gutters ftco-services">
          <div class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services mb-md-0 mb-4">
              <div class="icon bg-color-1 active d-flex justify-content-center align-items-center mb-2">
            		<span class="flaticon-shipped"></span>
              </div>
              <div class="media-body">
                <h3 class="heading">var茶에 대해</h3>
                <span>더 향긋한 var茶 이용법</span>
              </div>
            </div>      
          </div>
          <div class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services mb-md-0 mb-4">
              <div class="icon bg-color-2 d-flex justify-content-center align-items-center mb-2">
            		<span class="flaticon-diet"></span>
              </div>
              <div class="media-body">
                <h3 class="heading">Instagram</h3>
                <span>var茶의 많은 이벤트 공지</span>
              </div>
            </div>    
          </div>
          <div class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services mb-md-0 mb-4">
              <div class="icon bg-color-3 d-flex justify-content-center align-items-center mb-2">
            		<span class="flaticon-award"></span>
              </div>
              <div class="media-body">
                <h3 class="heading">Youtube</h3>
                <span>var茶와 함께하면</span><br>
				<span>좋은 플레이리스트</span>
              </div>
            </div>      
          </div>
          <div class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services mb-md-0 mb-4">
              <div class="icon bg-color-4 d-flex justify-content-center align-items-center mb-2">
            		<span class="flaticon-customer-service"></span>
              </div>
              <div class="media-body">
                <h3 class="heading">var茶 탄생기</h3>
                <span>var茶를 탄생시킨 툴</span>
              </div>
            </div>      
          </div>
        </div>
			</div>
		</section>
		<!-- 링크 연결 섹션 끝 -->

		<!-- 카테고리 별 상품 목록 페이지 이동 섹션 -->
		<section class="ftco-section ftco-category ftco-no-pt">
			<div class="container">
				<div class="row">
					<div class="col-md-8">
						<div class="row">
							<div class="col-md-6 order-md-last align-items-stretch d-flex">
								<div class="category-wrap-2 ftco-animate img align-self-stretch d-flex" style="background-image: url(images/category.jpg);">
									<div class="text text-center">
										<h2>Healing, Fresh,</h2>
										<p>var茶와 함께</p>
										<p><a href="teaListPage.do?teaCategory=허브차" class="btn btn-primary">허브차</a></p>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="category-wrap ftco-animate img mb-4 d-flex align-items-end" style="background-image: url(images/category-1.jpg);">
									<div class="text px-3 py-1">
										<h2 class="mb-0"><a href="teaListPage.do?teaCategory=녹차">녹차</a></h2>
									</div>
								</div>
								<div class="category-wrap ftco-animate img d-flex align-items-end" style="background-image: url(images/category-2.jpg);">
									<div class="text px-3 py-1">
										<h2 class="mb-0"><a href="teaListPage.do?teaCategory=홍차">홍차</a></h2>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-md-4">
						<div class="category-wrap ftco-animate img mb-4 d-flex align-items-end" style="background-image: url(images/category-3.jpg);">
							<div class="text px-3 py-1">
								<h2 class="mb-0"><a href="teaListPage.do?teaCategory=루이보스">루이보스</a></h2>
							</div>		
						</div>
						<div class="category-wrap ftco-animate img d-flex align-items-end" style="background-image: url(images/category-4.jpg);">
							<div class="text px-3 py-1">
								<h2 class="mb-0"><a href="teaListPage.do?teaCategory=우롱차">우롱차</a></h2>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- 카테고리 별 상품 목록 페이지 이동 섹션 끝 -->

		<!-- 행사 기간 섹션 -->
		<!-- 아래 섹션은 남은 행사 기간으로 활용할 것 -->
		<section class="ftco-section img" style="background-image: url(images/bg_3.jpg);">
    	<div class="container">
				<div class="row justify-content-end">
          <div class="col-md-6 heading-section ftco-animate deal-of-the-day ftco-animate">
          	<span class="subheading">Best Price For You</span>
            <h2 class="mb-4">Deal of the day</h2>
            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia</p>
            <h3><a href="#">Spinach</a></h3>
            <span class="price">$10 <a href="#">now $5 only</a></span>
            <div id="timer" class="d-flex mt-5">
						  <div class="time" id="days"></div>
						  <div class="time pl-3" id="hours"></div>
						  <div class="time pl-3" id="minutes"></div>
						  <div class="time pl-3" id="seconds"></div>
						</div>
          </div>
        </div>   		
    	</div>
    </section>
	<!-- 행사 기간 섹션 끝 -->

	<!-- 차 효능 섹션 -->
	<!-- 차 효능 몇 개 더 추가해도 됨 -->
	<!-- 사진 크기 키워주면 감사 -->
	<!-- 차 효능 내용 좀 줄이고 글자수 맞춰서 <br>해주셈 -->
    <section class="ftco-section testimony-section">
      <div class="container">
        <div class="row justify-content-center mb-5 pb-3" >
          <div class="col-md-7 heading-section ftco-animate text-center">
          	<span class="subheading" style="font-size: 2rem;">Benefits of var茶</span>
            <h2 class="mb-4" style="font-size: 2rem;">var茶의 효능</h2>
          </div>
        </div>
        <div class="row ftco-animate">
          <div class="col-md-12">
            <div class="carousel-testimony owl-carousel">
              <div class="item">
                <div class="testimony-wrap p-4 pb-5">
                  <div class="user-img mb-5" style="background-image: url(images/person_1.jpg)"></div>
                  <div class="text text-center">
					<p class="name">테아닌</p>
					<span class="position">천연진정제, 테아닌</span><br><br>
                    <p class="mb-5 pl-4 line">차를 마시면 긴장이 완화되고 기분이 느긋해지며 침착해지는 것을 느낄 수 있는데, 이는 테아닌이 뇌신경 전달물질을 조절하고 신경계를 안정시켜 긴장을 이완시키기 때문입니다.</p>
                  </div>
                </div>
              </div>

			  <div class="item">
                <div class="testimony-wrap p-4 pb-5">
                  <div class="user-img mb-5" style="background-image: url(images/person_1.jpg)"></div>
                  <div class="text text-center">
					<p class="name">카테킨</p>
					<span class="position">다이어트에 효과적인 카테킨</span><br><br>
                    <p class="mb-5 pl-4 line">카테킨은 혈액중의 포도당, 지방산, 콜레스테롤의 농도를 감소시켜 지방합성을 억제하고 지방분해를 촉진해 줍니다.</p>
                  </div>
                </div>
              </div>

			  <div class="item">
                <div class="testimony-wrap p-4 pb-5">
                  <div class="user-img mb-5" style="background-image: url(images/person_1.jpg)"></div>
                  <div class="text text-center">
					<p class="name">카페인</p>
					<span class="position">사랑의 묘약, 카페인</span><br><br>
                    <p class="mb-5 pl-4 line">사랑의 묘약, 카페인</p>
					<p class="mb-5 pl-4 line">카페인을 적당히 복용하면 중추신경계를 흥분시켜 정신이 맑아지고 졸음이 없어지며 사고력이 향상됩니다.</p>
                  </div>
                </div>
              </div>

			  <div class="item">
                <div class="testimony-wrap p-4 pb-5">
                  <div class="user-img mb-5" style="background-image: url(images/person_1.jpg)"></div>
                  <div class="text text-center">
					<p class="name">테아닌</p>
					<span class="position">천연진정제, 테아닌</span><br><br>
                    <p class="mb-5 pl-4 line">차를 마시면 긴장이 완화되고 기분이 느긋해지며 침착해지는 것을 느낄 수 있는데, 이는 테아닌이 뇌신경 전달물질을 조절하고 신경계를 안정시켜 긴장을 이완시키기 때문입니다.</p>
                  </div>
                </div>
              </div>

			  <div class="item">
                <div class="testimony-wrap p-4 pb-5">
                  <div class="user-img mb-5" style="background-image: url(images/person_1.jpg)"></div>
                  <div class="text text-center">
					<p class="name">테아닌</p>
					<span class="position">천연진정제, 테아닌</span><br><br>
                    <p class="mb-5 pl-4 line">차를 마시면 긴장이 완화되고 기분이 느긋해지며 침착해지는 것을 느낄 수 있는데, 이는 테아닌이 뇌신경 전달물질을 조절하고 신경계를 안정시켜 긴장을 이완시키기 때문입니다.</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
	<!-- 차 효능 섹션 끝 -->

	<!-- 개발자 소감 섹션 -->
	<!-- 소감 내용 줄 수 맞춰야됨 -->
	<!-- 사진은 가능하면 각자 ai사진 넣으면 어떰? 싫음 말구 -->
    <section class="ftco-section testimony-section">
		<div class="container">
		  <div class="row justify-content-center mb-5 pb-3">
			<div class="col-md-7 heading-section ftco-animate text-center">
				<span class="subheading" style="font-size: 2rem;">TryCatchers<br>: Developer of var茶</span>
			  <h2 class="mb-4">팀원 소개 및 소감</h2>
			  <p>var茶 프로젝트 기간동안 고생한 팀원들을 위해<br>따뜻한 위로의 말과 격려의 박수 부탁드립니다 :D</p>
			</div>
		  </div>
		  <div class="row ftco-animate">
			<div class="col-md-12">
			  <div class="carousel-testimony owl-carousel">
				<div class="item">
				  <div class="testimony-wrap p-4 pb-5">
					<div class="user-img mb-5" style="background-image: url(images/person_1.jpg)">
					  <span class="quote d-flex align-items-center justify-content-center">
						<i class="icon-quote-left"></i>
					  </span>
					</div>
					<div class="text text-center">
					  <p class="mb-5 pl-4 line">쥰나 하기 싫다<br>집가고 싶다<br>에효 이거 줄 수<br>맞춰야되네<br>그지같은 거<br>뷰 화이팅</p>
					  <p class="name">탄 다 미</p>
					  <span class="position">팀원 &nbsp;:&nbsp; Controller</span>
					</div>
				  </div>
				</div>
				<div class="item">
				  <div class="testimony-wrap p-4 pb-5">
					<div class="user-img mb-5" style="background-image: url(images/person_2.jpg)">
					  <span class="quote d-flex align-items-center justify-content-center">
						<i class="icon-quote-left"></i>
					  </span>
					</div>
					<div class="text text-center">
					  <p class="mb-5 pl-4 line">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
					  <p class="name">박 준 현</p>
					  <span class="position">팀장 &nbsp;:&nbsp; View</span>
					</div>
				  </div>
				</div>
				<div class="item">
				  <div class="testimony-wrap p-4 pb-5">
					<div class="user-img mb-5" style="background-image: url(images/person_3.jpg)">
					  <span class="quote d-flex align-items-center justify-content-center">
						<i class="icon-quote-left"></i>
					  </span>
					</div>
					<div class="text text-center">
					  <p class="mb-5 pl-4 line">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
					  <p class="name">권 지 현</p>
					  <span class="position">팀원 &nbsp;:&nbsp; Controller</span>
					</div>
				  </div>
				</div>
				<div class="item">
				  <div class="testimony-wrap p-4 pb-5">
					<div class="user-img mb-5" style="background-image: url(images/person_1.jpg)">
					  <span class="quote d-flex align-items-center justify-content-center">
						<i class="icon-quote-left"></i>
					  </span>
					</div>
					<div class="text text-center">
					  <p class="mb-5 pl-4 line">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
					  <p class="name">김 지 훈</p>
					  <span class="position">팀원 &nbsp;:&nbsp; Model</span>
					</div>
				  </div>
				</div>
				<div class="item">
				  <div class="testimony-wrap p-4 pb-5">
					<div class="user-img mb-5" style="background-image: url(images/person_1.jpg)">
					  <span class="quote d-flex align-items-center justify-content-center">
						<i class="icon-quote-left"></i>
					  </span>
					</div>
					<div class="text text-center">
					  <p class="mb-5 pl-4 line">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
					  <p class="name">류 준 원</p>
					  <span class="position">팀원 &nbsp;:&nbsp; Model</span>
					</div>
				  </div>
				</div>
				<div class="item">
					<div class="testimony-wrap p-4 pb-5">
					  <div class="user-img mb-5" style="background-image: url(images/person_1.jpg)">
						<span class="quote d-flex align-items-center justify-content-center">
						  <i class="icon-quote-left"></i>
						</span>
					  </div>
					  <div class="text text-center">
						<p class="mb-5 pl-4 line">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
						<p class="name">정 윤 구</p>
						<span class="position">팀원 &nbsp;:&nbsp; View</span>
					  </div>
					</div>
				  </div>
			  </div>
			</div>
		  </div>
		</div>
	  </section>
	  <!-- 개발자 소감 섹션 끝 -->

    <hr>

	<!-- 개발 툴 로고 섹션 -->
		<section class="ftco-section ftco-partner">
    	<div class="container">
    		<div class="row">
    			<div class="col-sm ftco-animate">
    				<a href="#" class="partner"><img src="images/partner-1.png" class="img-fluid" alt="Colorlib Template"></a>
    			</div>
    			<div class="col-sm ftco-animate">
    				<a href="#" class="partner"><img src="images/partner-2.png" class="img-fluid" alt="Colorlib Template"></a>
    			</div>
    			<div class="col-sm ftco-animate">
    				<a href="#" class="partner"><img src="images/partner-3.png" class="img-fluid" alt="Colorlib Template"></a>
    			</div>
    			<div class="col-sm ftco-animate">
    				<a href="#" class="partner"><img src="images/partner-4.png" class="img-fluid" alt="Colorlib Template"></a>
    			</div>
    			<div class="col-sm ftco-animate">
    				<a href="#" class="partner"><img src="images/partner-5.png" class="img-fluid" alt="Colorlib Template"></a>
    			</div>
    		</div>
    	</div>
    </section>
	<!-- 개발 툴 로고 섹션 끝 -->

	<!-- subscribe: 구독 이메일 섹션 -->
		<section class="ftco-section ftco-no-pt ftco-no-pb py-5 bg-light">
      <div class="container py-4">
        <div class="row d-flex justify-content-center py-5">
          <div class="col-md-6">
          	<h2 style="font-size: 22px;" class="mb-0" >e-mail로 구독하기</h2>
          	<span>e-mail로 날마다 향긋한 이벤트를 확인해보세요 :)</span>
          </div>
          <div class="col-md-6 d-flex align-items-center">
            <form action="#" class="subscribe-form">
              <div class="form-group d-flex">
                <input type="text" class="form-control" placeholder="e-mail을 입력하세요">
                <input type="submit" value="구독" class="submit px-3">
              </div>
            </form>
          </div>
        </div>
      </div>
    </section>
	<!-- subscribe 섹션 끝 -->

	<!-- footer 섹션 -->
	<!-- 인스타, 유튜브 아이콘 넣고 링크 연결하기 -->
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
              <h2 class="ftco-heading-2">Tea</h2>
              <p>Green tea,<br>Black tea,<br>Rooibos tea,<br>Oolong tea,<br>Hub tea</p>

			  <!-- 인스타, 유튜브 아이콘 위치 -->
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
                <li><a href="main.do" class="py-2 d-block">Home</a></li>
                <li><a href="teaListPage.do" class="py-2 d-block"></a>Tea</li>
                <li><a href="updateInfoPage.do" class="py-2 d-block">My Page</a></li>
                <li><a href="reviewListPage.do?searchName=ALL" class="py-2 d-block">Review</a></li>
				<li><a href="mapPage.do" class="py-2 d-block">Pick up</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
            	<h2 class="ftco-heading-2">Have a Questions?</h2>
            	<div class="block-23 mb-3">
	              <ul>
	                <li><span class="icon icon-map-marker"></span><span class="text">서울 강남구 테헤란로26길 12 제일비전타워 13층</span></li>
	                <li><a href="#"><span class="icon icon-phone"></span><span class="text">+82 2 1588 5890</span></a></li>
	                <li><a href="#"><span class="icon icon-envelope"></span><span class="text">tryCatchers@gmail.com</span></a></li>
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
	<!-- footer 섹션 끝 -->
	
	<!-- 채팅 API -->
	<try:chatAPI/>
    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

  <script src="js/all.js"></script>
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