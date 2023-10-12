<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="try"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Var茶 | 결제 완료</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">
    
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">

    <link rel="stylesheet" href="css/aos.css">

    <link rel="stylesheet" href="css/ionicons.min.css">

    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/style.css">

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
  </head>
  <body class="goto-here">
	<!-- 헤더 부분 태그 -->
	<try:nav />
    <!-- END nav -->

    <div class="hero-wrap hero-bread" style="background-image: url('images/bg_1.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>Cart</span></p>
            <h1 class="mb-0 bread">결제완료</h1>
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
									<th colspan="2">상품정보</th>
									<th>가격</th>
									<th>수량</th>
									<th>총 가격</th>
								</tr>
							</thead>
							<tbody id="tbodyCart">
									<c:set var="priceSum" value="0" />
									<c:forEach var="cart" items="${ buyCart }">
										<tr id="cartForEach${ cart.teaNum }" class="text-center">
											<td class="image-prod"><div class="img" style="background-image:url(${ cart.imageUrl });"></div></td>

											<td class="product-name">
												<h3>${ cart.teaName }</h3>
												<p>${ cart.teaContent }</p>
											</td>

											<td class="price">${ cart.teaPrice }</td>

											<td class="quantity">
												<div class="input-group">
													<input id="Cnt${ cart.teaNum }" type="text" name="quantity" class="quantity form-control input-number" value="${ cart.teaCnt }">
												</div>
											</td>
											<c:set var="priceSum" value="${ cart.teaCnt * cart.teaPrice }" />
											<td id="price${ cart.teaNum }" class="total">${ priceSum }</td>
										</tr>
										<!-- END TR-->
									</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- 정보 start -->
			
			<div class="container">
				<div class="row">
					<div class="col-md-12 mt-5 cart-wrap ftco-animate fadeInUp ftco-animated">
						<div class="cart-total mb-3">
							<h3>결제 정보</h3>
							<p class="d-flex">
								<span>주문자</span> <span id="orderName"></span>
							</p>
							<p class="d-flex">
								<span>총 가격</span> <span id="totalAmount"></span>
							</p>
							<p class="d-flex">
								<span>결제시간</span> <span id="approvedAt"></span>
							</p>
							<p class="d-flex">
								<span>결제수단</span> <span id="method"></span>
							</p>
							<p class="d-flex">
								<span>결제방법</span> <span id="provider"></span>
							</p>
						</div>
					</div>
				</div>
				
				<script	type="text/javascript">
					let json = ${ data };
					document.getElementById("orderName").innerHTML = json.orderName;
					document.getElementById("totalAmount").innerHTML = json.totalAmount + " 원";
					document.getElementById("approvedAt").innerHTML = json.approvedAt;
					document.getElementById("method").innerHTML = json.method;
					document.getElementById("provider").innerHTML = json.easyPay.provider;
				</script>
				<div style="margin:auto; text-align:center;">
					<p><a href="main.do" class="btn btn-primary py-3 px-4" style="vertical-align:middle; display:inline-block;">메인으로</a></p>
				</div>
			</div>
			
			<!-- 정보 end -->			
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
                <input type="text" class="form-control" placeholder="Enter email address">
                <input type="submit" value="Subscribe" class="submit px-3">
              </div>
            </form>
          </div>
        </div>
      </div>
    </section>
    
	<try:footer/>
    <!-- 채팅 API -->
	<try:chatAPI/>

  <!-- loader -->
  <try:loader/>

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