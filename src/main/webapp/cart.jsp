<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="try"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Var茶 | 장바구니</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 파비콘 태그 -->
<try:favicon />
<!-- 링크 부분 태그 -->
<try:link />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
</head>
<body class="goto-here">
	<!-- 헤더 부분 태그 -->
	<try:nav />
	<div class="hero-wrap hero-bread" style="background-image: url('images/bg_1.jpg');">
		<div class="container">
			<div class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="main.do">Home</a></span> <span>Cart</span>
					</p>
					<h1 class="mb-0 bread">장바구니</h1>
				</div>
			</div>
		</div>
	</div>

	<section class="ftco-section ftco-cart">
		<div class="container">
			<div class="row">
				<div class="col-md-12 ftco-animate">
					<div class="cart-list">
						<table class="table">
							<thead class="thead-primary">
								<tr class="text-center">
									<th>삭제</th>
									<th colspan="2">상품정보</th>
									<th>가격</th>
									<th>수량</th>
									<th>총 가격</th>
								</tr>
							</thead>
							<tbody id="tbodyCart">
								<c:if test="${ empty sessionScope.cart }">
									<tr>
										<td colspan="6">장바구니가 비어있습니다.</td>
									</tr>
								</c:if>
								<c:if test="${ not empty sessionScope.cart }">
									<c:set var="priceSum" value="0" />
									<c:forEach var="cart" items="${ sessionScope.cart }">
										<tr id="cartForEach${ cart.teaNum }" class="text-center">
											<td class="product-remove"><a id="${ cart.teaNum }"> <span class="ion-ios-close"></span>
											</a></td>

											<td class="image-prod"><div class="img" style="background-image:url(${ cart.imageUrl });"></div></td>

											<td class="product-name">
												<h3>${ cart.teaName }</h3>
												<p>${ cart.teaContent }</p>
											</td>

											<td class="price">${ cart.teaPrice }</td>

											<td class="quantity">
												<div class="input-group col-md-12 d-flex">
													<span class="input-group-btn mr-2">
														<button type="button" class="quantity-left-minus ${ cart.teaNum } btn" data-type="minus" data-field="">
															<i class="ion-ios-remove"></i>
														</button>
													</span> <input id="Cnt${ cart.teaNum }" type="text" name="quantity" class="quantity form-control input-number" value="${cart.teaCnt}" min="1" max="${cart.teaCheckCnt}"> <span class="input-group-btn ml-2">
														<button type="button" class="quantity-right-plus ${ cart.teaNum } btn" data-type="plus" data-field="">
															<i class="ion-ios-add"></i>
														</button>
													</span>
												</div>
											</td>

											<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
											<script type="text/javascript">
									</script>
											<td id="price${ cart.teaNum }" class="total">가격</td>
											<script type="text/javascript">
									
										$(document).ready(function(){
											console.log("function ready 확인");
											total();

											var nowCnt = $("#Cnt"+${ cart.teaNum }).val();
											var price = nowCnt * ${ cart.teaPrice };
											
											$("#price"+${ cart.teaNum }).text(price);
											
											
										   var quantitiy=0;
										   $('.quantity-right-plus.${ cart.teaNum }').click(function(e){
										        
										        // Stop acting like a button
										        e.preventDefault();
										        // Get the field name
										        var changeCnt = parseInt($('#Cnt${ cart.teaNum }').val()); //얘가 changeCnt
										        
										        if(changeCnt + 1 > ${ cart.teaCheckCnt }){
										        	changeCnt = ${ cart.teaCheckCnt }
										        }
										        else{
										        	changeCnt = changeCnt + 1;
										        }
										        
										        change(changeCnt);

										        // If is not undefined
										        $('#Cnt${ cart.teaNum }').val(changeCnt);
										        total();
										        // Increment
										    });
								
										     $('.quantity-left-minus.${ cart.teaNum }').click(function(e){
										        // Stop acting like a button
										        e.preventDefault();
										        // Get the field name
										        var changeCnt = parseInt($('#Cnt${ cart.teaNum }').val()); //얘가 changeCnt
										        
										        if(changeCnt - 1 < 1){
										        	changeCnt = 1
										        	// 품절 상태일시 ??????
										        }
										        else{
										        	changeCnt = changeCnt - 1;
										        }
										        
										        change(changeCnt);

										        // If is not undefined
										        $('#Cnt${ cart.teaNum }').val(changeCnt);
										        total();
										    });
										     
										   $("#Cnt"+${ cart.teaNum }).change(function(){
												console.log("구매 갯수 변경 확인");
												var changeCnt = $("#Cnt"+${ cart.teaNum }).val();
												
												if(changeCnt > ${ cart.teaCheckCnt }){
													changeCnt = ${ cart.teaCheckCnt };
													$("#Cnt"+${ cart.teaNum }).val(changeCnt);
												}
												else if(changeCnt < 1){
													changeCnt = 1;
													$("#Cnt"+${ cart.teaNum }).val(changeCnt);
												}
												
												console.log("변경 Cnt 확인"+changeCnt);
												change(changeCnt);
												total();
										   });
										   
										   $("#"+${cart.teaNum}).on("click",function(){
											   console.log("삭제 버튼 클릭 확인");
											  $.ajax({
												 url: 'deleteCart.do?teaNum='+${ cart.teaNum },
												 type: 'POST',
												 success: function(result){
													 total();
													/////console.log('result ['+result+']');
													$("#cartForEach"+${ cart.teaNum }).remove();
													//$("#cartForEach").append();
												 },
												 error: function(error){
													alert('error ['+error+']');
												 }
											  });
											  total();
										   });
										   
										   $("#cartRemove").on("click",function(){
											   console.log("장바구니 비우기 클릭 확인");
											   cartAction = 2;
											   Swal.fire({
													  title: '장바구니 비우기',
													  text: '장바구니를 비우시겠습니까?',
													  icon: 'question', // warning, success, info, error, question
													  confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
													  cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
													  showCancelButton: true, // cancle 버튼 보이기
													  confirmButtonText: '확인', // confirm 버튼 text
														 cancelButtonText: '취소' // cancel 버튼 text
													}).then((result) => {
														if (result.isConfirmed) {
											  $.ajax({
												 url: 'cartDrop.do',
												 type: 'POST',
												 success: function(result){
													console.log('result ['+result+']');
													//$("#tbodyCart").remove();
													//$("#tbodyCart").append();
													$("#subTotal").text("0 원");
													$("#total").text("3000 원");
													$("#tbodyCart").html('<tr><td colspan="6">장바구니가 비어있습니다.</td></tr>');
													//$("#payBtn").removeAttribute('href');
													document.querySelector("#payBtn").removeAttribute('href');
													// 성공하면 cart 전체 remove
													
													priceSum = ${ priceSum };
													console.log(priceSum);
													$("#priceTotal").text(priceSum);
													
													Swal.fire({
														  icon: 'success',
														  title: '장바구니 삭제 완료!',
														  showConfirmButton: false,
														  timer: 1000
													  })
												 },
												 error: function(error){
													alert('error ['+error+']');
												 }
											  });
														}
														else {
															location.href='#';
														}
													});
										   });
										   
												console.log("onready 최하단 진입 확인");
												
												// 재고 변경 모듈화
												function change(changeCnt){
													console.log("change func() 호출 확인 로그");
													$.ajax({
														 url: 'cartChange.do?&teaNum='+${ cart.teaNum }+'&teaCnt='+changeCnt,
														 type: 'POST',
														 success: function(result){
															console.log('result ['+result+']');
															total();
															
															var price2 = changeCnt * ${ cart.teaPrice };
															console.log("총가격: "+price2);
															
															var tbodyCart = $("#aCart"+${ cart.teaNum }).html();
															
															$("#aCart"+${ cart.teaNum }).remove();
															
															console.log("확인1");
															
															$("#cartForEach").append(tbodyCart);
															
															console.log("확인2");
															
															priceSum = ${ priceSum };
															console.log(priceSum);
															$("#price"+${ cart.teaNum }).text(price2);
															
															
															console.log("확인3");
															// 성공하면 재고 변경
															
															$("#priceTotal").text(priceSum);
														 },
														 error: function(error){
															alert('error ['+error+']');
														 }
													  });
												}// change() 함수 끝
												
												// 장바구니 총 가격 계산 모듈화
												function total() {  
												console.log("total func() 호출 확인 로그");
											  		$.ajax({
												 		url: 'total.do?',
												 		type: 'POST',
												 		success: function(result){

												 			var total = parseInt(result) + 3000;
												 			
												 			$("#subTotal").text(result+" 원");
												 			$("#total").text(total+" 원");
												 			
												 			if(result == 0) {
												 				$("#tbodyCart").html('<tr><td colspan="6">장바구니가 비어있습니다.</td></tr>');
												 				$("#total").text("3000 원");
												 				document.querySelector("#payBtn").removeAttribute('href');
												 			}
												 		},
												 		error: function(error){
															alert('error ['+error+']');
												 		}
											  		});
												}// total() 함수 끝

											
										});
										</script>
										</tr>
										<!-- END TR-->
										<c:set var="priceSum" value="${ priceSum + cart.teaCnt * cart.teaPrice }" />
									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-md-12 mt-5 cart-wrap ftco-animate fadeInUp ftco-animated">
						<div class="cart-total mb-3">
							<h3>Cart Totals</h3>
							<p class="d-flex">
								<span>총 상품 금액</span> <span id="subTotal">0 원</span>
							</p>
							<p class="d-flex">
								<span>배송비</span> <span>3000 원</span>
							</p>
							<p class="d-flex">
								<span>할인 금액</span> <span>0 원</span>
							</p>
							<hr>
							<p class="d-flex total-price">
								<span>최종 결제 금액</span> <span id="total">3000 원</span>
							</p>
						</div>
					</div>
				</div>
				<div class="row block-9">
					<div class="col-md-6 d-flex">
						<c:if test="${ not empty sessionMemberId }">
							<c:if test="${ not empty sessionScope.cart }">
								<a id="payBtn" href="buyPage.do" class="btn btn-primary py-3 px-4">결제하기</a>
							</c:if>
							<c:if test="${ empty sessionScope.cart }">
								<a id="payBtnEmpty" class="btn btn-primary py-3 px-4">결제하기</a>
							</c:if>
						</c:if>
						<c:if test="${ empty sessionMemberId }">
							<a href="login.do" class="btn btn-primary py-3 px-4">결제하기</a>
						</c:if>
					</div>
					<div class="col-md-6 d-flex">
						<a id="cartRemove" href="#" class="btn btn-primary py-3 px-4">장바구니 비우기</a>
					</div>
				</div>
			</div>
		</div>
	</section>

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

</body>
</html>