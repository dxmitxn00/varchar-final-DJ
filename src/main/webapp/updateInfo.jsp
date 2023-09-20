<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="try"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Var茶 | <spring:message code='updateInfo.title' /></title> <!-- updateInfo.title -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- 파비콘 태그 -->
    <try:favicon/>
    <!-- 링크 부분 태그 -->
    <try:link/>
  </head>
  <!-- 주소 API 커스텀 태그로 빼서 넣어주셈 -->
  <!-- 상단, 하단은 커스텀 태그로 넣어주셈 -->
  <!-- 전화번호, 이메일 유효성 검사 정규식으로 바꿔주셈 -->
  <body class="goto-here">
	<!-- 헤더 부분 태그 -->
	<try:nav/>
	<!-- 페이지 제목 div -->
    <div class="hero-wrap hero-bread" style="background-image: url('images/bg_1.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p class="breadcrumbs"><span class="mr-2"><a href="main.do"><spring:message code='updateInfo.span1.title' /></a></span> <span><spring:message code='updateInfo.span2.title' /></span></p> <!-- updateInfo.span1.title --> <!-- updateInfo.span2.title -->
            <h1 class="mb-0 bread"><spring:message code='updateInfo.title' /></h1> <!-- updateInfo.title -->
          </div>
        </div>
      </div>
    </div>
	<!-- 페이지 제목 div 끝 -->

	<!-- 비밀번호 변경 버튼 div -->
	<div style="padding-top: 100px; padding-right: 15%;">
	<p><a href="updatePw.do" class="btn btn-primary py-3 px-4" style="float: right;">&nbsp;<spring:message code='updateInfo.updatepw' />&nbsp;</a></p> <!-- updateInfo.updatepw -->
	</div>
	<!-- 비밀번호 변경 버튼 div 끝 -->

	<!-- 회원 정보 수정 섹션 -->
	<section class="ftco-section">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-xl-7 ftco-animate">
          <!-- 정보 수정 폼 태그 -->
			<form action="updateInfo.do" method="post" class="billing-form" onsubmit="return test()">
	          	<h3 class="mb-4 billing-heading" style="padding-bottom: 15px; border-bottom: 1px solid #e1e1e1"><spring:message code='updateInfo.title' /> <a href="updateInfo.do?lang=en">EN</a> | <a href="updateInfo.do?lang=ko">KO</a></h3> <!-- updateInfo.form.title -->
	          	<div class="row align-items-end">
	          		<div class="col-md-6" style="margin-top: 30px;">
	                <div class="form-group">
	                	<label for="firstname" ><spring:message code='updateInfo.form.id' /></label> <!-- updateInfo.form.id -->
	                  <input type="text" name="memberId" class="form-control" value="${ memberData.memberId }" readonly>
	                </div>
	              </div>
	              <div class="col-md-6">
	                <div class="form-group">
	                	<label for="lastname"><spring:message code='updateInfo.form.name' /> <span style="color: red;">*</span></label> <!-- updateInfo.form.name -->
	                  <input type="text" name="memberName" class="form-control" value="${ memberData.memberName }" required>
	                </div>
                </div>
                <div class="w-100"></div>
				<div class="col-md-6">
	                <div class="form-group">
                		<label for="lastname"><spring:message code='updateInfo.form.phone' /></label> <!-- updateInfo.form.phone -->
	                	 <c:if test="${ memberData.memberPhone == 0 }">
	                  		<input type="text" name="memberPhone" id="memberPhone" class="form-control" placeholder="<spring:message code='updateInfo.form.phone.placeholder' />"><!-- updateInfo.form.phone.placeholder -->
	                	</c:if>
	                	<c:if test="${ memberData.memberPhone != 0 }">
	                  		<input type="text" name="memberPhone" id="memberPhone" class="form-control" value="${ memberData.memberPhone }">
	               		</c:if>
	                </div>
                </div>
				<div class="col-md-6">
	                <div class="form-group">
	                	<label for="lastname"><spring:message code='updateInfo.form.mail' /></label><!-- updateInfo.form.mail -->
	                  <input type="text" name="memberEmail" id="memberEmail" class="form-control" value="${ memberData.memberEmail }" placeholder="<spring:message code='updateInfo.form.mail.placeholder' />">
	                </div>
                </div>
                <div class="w-100"></div>
                <div class="col-md-6">
	                <div class="form-group" style="margin-bottom: 150px;">
	                	<label for="lastname"><spring:message code='updateInfo.form.address' /> </label> <!-- updateInfo.form.address -->
	                  <!-- 주소 API 적용 -->
	                  <try:addressAPI/>
	                </div>
                </div>
	            </div>
				<div style="margin:auto; text-align:center;">
					<p><input type="submit" class="btn btn-primary py-3 px-4" value="<spring:message code='updateInfo.form.submit' />"style="vertical-align:middle; display:inline-block;"></p> <!-- updateInfo.form.submit -->
				</div>
	          </form>
	          <!-- 정보 수정 폼 태그 끝 -->
			</div>
          </div> <!-- .col-md-8 -->
        </div>
    </section>
	<!-- 회원 정보 수정 섹션 끝-->


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
                <input type="text" class="form-control" placeholder="Enter email address">
                <input type="submit" value="Subscribe" class="submit px-3">
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
	
	 <script type="text/javascript">
	 	// 전화번호, 이메일 유효성 검사
    	function test() {
    		var ph = document.getElementById('memberPhone').value; // 연락처
    		var mail = document.getElementById('memberEmail').value; // 이메일
    		const phoneRegex = /^\d{11}$/; // 11자리의 숫자만 허용 (하이픈 없음)
    		const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/; // 정규표현식을 통한 이메일 유효성 검사
    		const isPhoneValid = ph.length === 0 || ph.match(phoneRegex);
   			const isEmailValid = mail.length === 0 || mail.match(emailRegex);

    		if (isPhoneValid && isEmailValid) {
        		// 연락처와 이메일 모두 유효성 검사를 통과한 경우
       		 	return true;
    		}
    		else if (!isPhoneValid && !isEmailValid) {
        		// 둘 다 입력되지 않은 경우 유효성 검사를 제외하고 회원가입 진행
        		return true;
    		}
    		else {
        		// 유효성 검사를 통과하지 못한 경우
        		if (!isPhoneValid) {
            		alert('연락처를 11자리 숫자로 입력해주세요.');
            		
        		if (!isEmailValid) {
            		alert('이메일을 정확하게 입력하세요.');
            		
        		}
    		}
           return false;
		}
	 }
    </script>
    
  </body>
</html>