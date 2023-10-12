<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="try"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Var茶 | 주문</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 파비콘 태그 -->
<try:favicon />
<!-- 링크 부분 태그 -->
<try:link />
<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style type="text/css">
	.edit-red {
  		color: red;
  	}
</style>
</head>
<body class="goto-here">
	<!-- 헤더 부분 태그 -->
	<try:nav />
	<!-- 페이지 제목 div -->
	<div class="hero-wrap hero-bread" style="background-image: url('images/bg_1.jpg');">
		<div class="container">
			<div class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="main.do">Home</a></span> <span>Order</span>
					</p>
					<h1 class="mb-0 bread">주문</h1>
				</div>
			</div>
		</div>
	</div>
	<!-- 페이지 제목 div 끝 -->

	<!-- 주문자 정보 섹션 -->
	<section class="ftco-section" style="margin-bottom: 200px;">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-7 ftco-animate">
					<!-- 주문 폼 태그 -->
					<form action="buy.do?total=${ total }" method="post" class="billing-form" onsubmit="return checkPh();">
						<h3 class="mb-4 billing-heading">주문자 정보</h3>
						<div class="row align-items-end">
							<div class="w-100"></div>
							<div class="col-md-12">
								<label for="id">아이디<span id="spanId" class="edit-red"> *</span></label>
								<div class="form-group edit-d-f">
									<input type="text" id="inputId" name="memberId" value="${ memberVO.memberId }" class="form-control" readonly>
								</div>
							</div>
							<div class="w-100"></div>
				            <div class="col-md-12">
				                <label for="name">이름<span id="spanName" class="edit-red"> *</span></label>
				                <div class="form-group">
				                  <input type="text" id="inputName" name="memberName" value="${ memberVO.memberName }" class="form-control" placeholder="이름을 입력하세요.">
				                </div>
			                </div>
			                <div class="w-100"></div>
							<div class="col-md-12">
				                <label for="phone">연락처<span id="spanPhone" class="edit-red"> *</span></label>
				                <div class="form-group edit-d-f">
				                  	<input type="text" id="inputPhone" name="memberPhone" value="${ memberVO.memberPhone }" class="form-control" placeholder="연락처를 입력해주세요.">
				                </div>
			                </div>
			                <div class="w-100"></div>
							<div class="col-md-12">
			                	<label for="email">이메일<span id="spanEmail" class="edit-red"> *</span></label>
				                <div class="form-group edit-d-f">
				                  <input type="text" id="inputEmail" name="memberEmail" value="${ memberVO.memberEmail }" class="form-control" placeholder="이메일을 입력해주세요.">
				                </div>
			                </div>
			                <div class="w-100"></div>
			                <div class="col-md-12">
			                	<label for="address">주소<span id="spanAddress" class="edit-red"> *</span></label>
				                <div class="form-group">
				                	<input type="button" id="inputBtnAddress" class="form-control" onclick="daumPost()" value="우편번호 찾기"><br>
				                	<input type="text" id="inputAddress" name="memberAddress" value="${ memberVO.memberAddress }" class="form-control" placeholder="주소를 입력해주세요." readonly>
				                </div>
				            </div>
			                <div class="col-md-12">
			                	<label for="email">상세주소<span id="spanAddressDetail" class="edit-red"> *</span></label>
				                <div class="form-group edit-d-f">
				                  <input type="text" id="inputAddressDetail" class="form-control" placeholder="상세주소를 입력해주세요.">
				                </div>
			                </div>
			                <!-- kakao 우편번호 서비스 -->
			                <script>
			                    function daumPost() {
			                      	new daum.Postcode({
			                      		oncomplete: function(data) {
			                      			var fullAddr = '';
			                      			var extraAddr = '';
			                      			
			                      			//도로명 주소를 선택했을 경우
			                      			if (data.userSelectedType === 'R') {
			                      				fullAddr = data.roadAddress;
			                      			//지번 주소를 선택했을 경우
			                      			} else {
			                      				fullAddr = data.jibunAddress;
			                      			}
			                      			//도로명일때 조합
			                      			if (data.userSelectedType === 'R') {
			                      				//법정동명 추가
			                      				if (data.bname !== '') {
			                      					extraAddr += data.bname;
			                      				}
			                      				//건물명 추가
			                      				if (data.buildingName !== '') {
			                      					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			                      				}
			                      				//괄호 추가
			                      				fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
			                      			}
			                      			$("#inputAddress").val(fullAddr);
			                      		},
			                      		theme: {
			                                bgColor: "#7895CB", //바탕 배경색
			                                searchBgColor: "#FFFFFF", //검색창 배경색
			                                contentBgColor: "#FFFFFF", //본문 배경색(검색결과,결과없음,첫화면,검색서제스트)
			                                //pageBgColor: "", //페이지 배경색
			                                textColor: "#222222" //기본 글자색
			                                //queryTextColor: "", //검색창 글자색
			                                //postcodeTextColor: "", //우편번호 글자색
			                                //emphTextColor: "", //강조 글자색
			                                //outlineColor: "", //테두리
			                            }
			                      	}).open();
			                    }
			                </script>
						</div>
					</form>
					<!-- 주문 폼 태그 끝 -->
				</div>
				<!-- 결제 섹션 -->
				<c:set var="memberId" value="${ sessionMemberId }" />

				<link rel="icon" type="image/svg+xml" href="/vite.svg" />

				<script src="https://js.tosspayments.com/v1/payment-widget"></script>
				<div style="width: 1000px; height: 300px; margin: 0 auto;">
					<div id="payment-method"></div>
					<div style="text-align: center;">
						<button id="payment-request-button" class="btn btn-primary py-3 px-4">결제하기</button>
					</div>

					<%-- <!-- 총 가격 구하기 -->
				    <c:set var="sum" value="0" />
				    <c:forEach var="v" items="bdatas">
				    	<c:set var="sum" value="${ sum + (v.teaPrice * v.teaCnt) }" />
				    </c:forEach> --%>
					<!-- 결제 -->
					<script>
				    const paymentWidget = PaymentWidget(
				        "test_ck_D5GePWvyJnrK0W0k6q8gLzN97Eoq",
				        // 비회원 customerKey
				    	PaymentWidget.ANONYMOUS
				    );
				    
				    /**
				     * 결제창을 렌더링합니다.
				     * @docs https://docs.tosspayments.com/reference/widget-sdk#renderpaymentmethods%EC%84%A0%ED%83%9D%EC%9E%90-%EA%B2%B0%EC%A0%9C-%EA%B8%88%EC%95%A1
				     */
				     var total =  ${ total };
				     
				     paymentWidget.renderPaymentMethods("#payment-method", { value: total });
				
				    const paymentRequestButton = document.getElementById(
				        "payment-request-button"
				    );
				    paymentRequestButton.addEventListener("click", () => {
				        /** 결제 요청
				         * @docs https://docs.tosspayments.com/reference/widget-sdk#requestpayment%EA%B2%B0%EC%A0%9C-%EC%A0%95%EB%B3%B4
				         */
				        paymentWidget.requestPayment({
				        	orderId: generateRandomString(),
				        	orderName: '${ memberId }',
				            successUrl: "http://localhost:8088/app/paySuccess.do",
				            failUrl: "http://localhost:8088/app/payFail.jsp",
				        });
				    });
				      
				    function generateRandomString() {
				        return window.btoa(Math.random()).slice(0, 20);
				    }
				    </script>
					<!-- 결제 섹션 끝 -->
				</div>
				<!-- .col-md-8 -->
			</div>
		</div>
	</section>
	<!-- 주문자 정보 섹션 끝-->

	<!-- 커스텀 태그 적용하기 -->
	<section class="ftco-section ftco-no-pt ftco-no-pb py-5 bg-light">
		<div class="container py-4">
			<div class="row d-flex justify-content-center py-5">
				<div class="col-md-6">
					<h2 style="font-size: 22px;" class="mb-0">Subcribe to our Newsletter</h2>
					<span>Get e-mail updates about our latest shops and special offers</span>
				</div>
				<div class="col-md-6 d-flex align-items-center">
					<form action="#" class="subscribe-form">
						<div class="form-group d-flex">
							<input type="text" class="form-control" placeholder="Enter email address"> <input type="submit" value="Subscribe" class="submit px-3">
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<footer class="ftco-footer ftco-section">
		<div class="container">
			<div class="row">
				<div class="mouse">
					<a href="#" class="mouse-icon">
						<div class="mouse-wheel">
							<span class="ion-ios-arrow-up"></span>
						</div>
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

					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>document.write(new Date().getFullYear());</script>
						All rights reserved | This template is made with <i class="icon-heart color-danger" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>
	</footer>



	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>


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

	<script>
		$(document).ready(function(){

		var quantitiy=0;
		   $('.quantity-right-plus').click(function(e){
		        
		        // Stop acting like a button
		        e.preventDefault();
		        // Get the field name
		        var quantity = parseInt($('#quantity').val());
		        
		        // If is not undefined
		            
		            $('#quantity').val(quantity + 1);

		          
		            // Increment
		        
		    });

		     $('.quantity-left-minus').click(function(e){
		        // Stop acting like a button
		        e.preventDefault();
		        // Get the field name
		        var quantity = parseInt($('#quantity').val());
		        
		        // If is not undefined
		      
		            // Increment
		            if(quantity>0){
		            $('#quantity').val(quantity - 1);
		            }
		    });
		    
		});
	</script>
</body>
</html>