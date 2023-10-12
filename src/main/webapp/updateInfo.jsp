<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="try"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Var茶 | <spring:message code='updateInfo.title' /></title> <!-- updateInfo.title -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
    <!-- 파비콘 태그 -->
    <try:favicon/>
    <!-- 링크 부분 태그 -->
    <try:link/>
    <style type="text/css">
  		.edit-d-f {
  			display: flex;
  		}
  		.edit-btn {
  			width: 83px;
  			border-radius: 3px;
  			background: none;
  			border: 1px solid rgba(0, 0, 0, 0.1) !important;
  		}
  		.edit-red {
  			color: red;
  		}
  	</style>
  </head>
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
			<form id="updateForm" action="updateInfo.do" method="post" class="billing-form">
	          	<h3 class="mb-4 billing-heading" style="padding-bottom: 15px; border-bottom: 1px solid #e1e1e1"><spring:message code='updateInfo.title' /> <a href="updateInfo.do?lang=en">EN</a> | <a href="updateInfo.do?lang=ko">KO</a></h3> <!-- updateInfo.form.title -->
	          	<div class="row align-items-end">
					<c:if test="${ memberData.memberPlatform ne 'varChar' }">
						<try:updateInfoSns/>
					</c:if>
					<c:if test="${ memberData.memberPlatform eq 'varChar' }">
						<try:updateInfoOrigin/>
					</c:if>
                <div class="w-100"></div>
	            <div class="col-md-12">
	                <label for="name"><spring:message code='updateInfo.form.name' /><span id="spanName" class="edit-red"> *</span></label>
	                <div class="form-group">
	                  <input type="text" id="inputName" name="memberName" value="${ memberData.memberName }" class="form-control" placeholder="이름을 입력하세요." required>
	                </div>
                </div>
                <div class="w-100"></div>
				<div class="col-md-12">
	                <label for="phone"><spring:message code='updateInfo.form.phone' /><span id="spanPhone" class="edit-red"> *</span></label>
	                <div class="form-group edit-d-f">
	                  	<input type="text" id="inputPhone" name="memberPhone" value="${ memberData.memberPhone }" class="form-control" placeholder="<spring:message code='updateInfo.form.phone.placeholder' />">
	                </div>
                </div>
                <div class="w-100"></div>
				<div class="col-md-12">
                	<label for="email"><spring:message code='updateInfo.form.mail' /><span id="spanEmail" class="edit-red"> *</span></label>
	                <div class="form-group edit-d-f">
	                  <input type="text" id="inputEmail" name="memberEmail" value="${ memberData.memberEmail }" class="form-control" placeholder="<spring:message code='updateInfo.form.mail.placeholder' />">
	                </div>
                </div>
                <div class="w-100"></div>
                <div class="col-md-12">
                	<label for="address"><spring:message code='updateInfo.form.address' /><span id="spanAddress" class="edit-red"> *</span></label>
	                <div class="form-group">
	                	<input type="button" id="inputBtnAddress" class="form-control" onclick="daumPost()" value="<spring:message code='updateInfo.form.mail.btn' />"><br>
	                	<input type="text" id="inputAddress" name="memberAddress" value="${ memberData.memberAddress }" class="form-control" placeholder="<spring:message code='updateInfo.form.address.placeholder' />" readonly>
	                </div>
	            </div>
	            <div class="col-md-12">
                	<label for="email"><spring:message code='updateInfo.form.addressDetail' /><span id="spanAddressDetail" class="edit-red"> *</span></label>
	                <div class="form-group edit-d-f">
	                  <input type="text" id="inputAddressDetail" class="form-control" placeholder="<spring:message code='updateInfo.form.addressDetail.placeholder' />">
	                </div>
                </div>
	                
		      	<!-- kakao 우편번호 서비스 -->
                <script>
              		var flagAddress = false;
                      
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
                      			$("#inputAddress").attr("readonly", false);
                      			if ($("#inputAddress").val() == fullAddr) {
                      				$("#spanAddress").html(' <i class="fa-solid fa-check"></i>');
                            	    $("#spanAddress").css("color", "green");
                        		   	flagAddress = true;
                      			} else {
                      				$("#spanAddress").html(' <i class="fa-solid fa-x"></i> 필수 정보입니다.');
                        		   	$("#spanAddress").css("color", "red");
                            	    flagAddress = false;
                      			}
                      			$("#inputAddress").attr("readonly", true);
                      			$("#inputAddressDetail").focus();
                      			console.log(flagAddress);
                      		},
                      		theme: {
                                bgColor: "#23512E", //바탕 배경색
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
                <div class="w-100"></div>
	            </div>
	          	<div style="margin:auto; text-align:center;">
					<p><input id="inputSubmit" type="button" class="btn btn-primary py-3 px-4" value="<spring:message code='updateInfo.form.submit' />"style="vertical-align:middle; display:inline-block;"></p>
				</div>
	          </form>
	          <!-- 정보 수정 폼 태그 끝 -->
			</div>
          </div> <!-- .col-md-8 -->
        </div>
    </section>
	<!-- 회원 정보 수정 섹션 끝-->
	
	<script type="text/javascript">
    		var inputName = null;
    		var inputEmail = null;
    		var inputPhone = null;
    		var inputAddress = null;
    		var inputAddressDetail = null;

    		var flagName = false;
    		var flagEmail = false;
    		var flagPhone = false;
    		var flagAddressDetail = false;
			
			// 이름 입력
			$("#inputName").on("input", function(){
				checkInputName();
    		})
    		
    		// 이름 함수
    		function checkInputName(){
    			var regexName = /(^[가-힣]{2,5}$)|(^[a-zA-Z]{2,20}(\s[a-zA-Z]{2,20})?$)/;
    			inputName = $("#inputName").val();		
    			
    			if (!regexName.test(inputName)) {
    				if (inputName == '') {
    					$("#spanName").html(' <i class="fa-solid fa-x"></i> 필수 정보입니다.');
    				} else {
    					$("#spanName").html(' <i class="fa-solid fa-x"></i> 한글과 영문 대 소문자를 사용하세요. 한글: 2~5자, 영문: 2~20자');
    				}
    				flagName = false;
    				$("#spanName").css("color", "red");
    			} else {
    				$("#spanName").html(' <i class="fa-solid fa-check"></i>');
    				$("#spanName").css("color", "green");
    				flagName = true;
    			}
    			console.log(flagName);
    		}
			
			// 연락처 입력
			$("#inputPhone").on("input", function(){
				checkInputPhone();
    		})
    		
    		// 연락처 함수
    		function checkInputPhone(){
				var regexPhone = /^010\d{8}$/;
				inputPhone = $("#inputPhone").val();
    			
    			if (!regexPhone.test(inputPhone)) {
    				if (inputPhone == '') {
    					$("#spanPhone").html(' <i class="fa-solid fa-x"></i> 필수 정보입니다.');
    				} else {
    					$("#spanPhone").html(' <i class="fa-solid fa-x"></i> 휴대전화 형식이 맞지 않습니다. ex)01012345678');
    				}
    				flagPhone = false;
    				$("#spanPhone").css("color", "red");
    			} else {
    				if (inputPhone == "${ memberData.memberPhone }") {
    					$("#spanPhone").html(' <i class="fa-solid fa-check"></i>');
	    				$("#spanPhone").css("color", "green");
	    				flagPhone = true;
	    				return;
    				}
    				$.ajax({
    					url: "checkPhone.do",
    					data: {
    					    memberPhone:inputPhone
    					},
    				    dataType: "json",
    					type: "post",
    					success: function(result){
    					    if (result == 1) {
    					    	$("#spanPhone").html(' <i class="fa-solid fa-x"></i> 중복된 휴대전화 번호가 있습니다.');
    			        		$("#spanPhone").css("color", "red");
    			        		flagPhone = false;
    			    		} else {
    			    			$("#spanPhone").html(' <i class="fa-solid fa-check"></i>');
    		    				$("#spanPhone").css("color", "green");
    		    				flagPhone = true;
    			    		}
    					},
    					error: function(error){
    					    console.log(error);
    				    }
    		    	})
    			}
    			console.log(flagPhone);
			}
			
			// 이메일 입력
			$("#inputEmail").on("input", function(){
				checkInputEmail();
    		})
    		
    		// 이메일 함수
			function checkInputEmail(){
				var regexEmail = /^[A-Za-z0-9\.\-_]+@([a-z0-9\-]+\.)+[a-z]{2,6}$/;
    			inputEmail = $("#inputEmail").val();
    			
    			if (!regexEmail.test(inputEmail)) {
    				if (inputEmail == '') {
    					$("#spanEmail").html(' <i class="fa-solid fa-x"></i> 필수 정보입니다.');
    				} else {
    					$("#spanEmail").html(' <i class="fa-solid fa-x"></i> 이메일 형식이 맞지 않습니다. ex)varchar1234@varchar.com');
    				}
    				flagEmail = false;
    				$("#spanEmail").css("color", "red");
    			} else {
    				if (inputEmail == "${ memberData.memberEmail }") {
    					$("#spanEmail").html(' <i class="fa-solid fa-check"></i>');
	    				$("#spanEmail").css("color", "green");
	    				flagEmail = true;
	    				return;
    				}
    				$.ajax({
    					url: "checkEmail.do",
    					data: {
    					    memberEmail:inputEmail
    					},
    				    dataType: "json",
    					type: "post",
    					success: function(result){
    					    if (result == 1) {
    			    			$("#spanEmail").html(' <i class="fa-solid fa-x"></i> 중복된 이메일이 있습니다.');
    			        		$("#spanEmail").css("color", "red");
    			        		flagEmail = false;
    			    		} else {
    			    			$("#spanEmail").html(' <i class="fa-solid fa-check"></i>');
    		    				$("#spanEmail").css("color", "green");
    		    				flagEmail = true;
    			    		}
    					},
    					error: function(error){
    					    console.log(error);
    				    }
    		    	})
    			}
    			console.log(flagEmail);
			}
			
			// 주소
    		inputAddress = $("inputAddress").val();
			
    		// 주소 함수
			function checkInputAddress(){
				if (inputAddress == '') {
					$("#spanAddress").html(' <i class="fa-solid fa-x"></i> 필수 정보입니다.');
			   		$("#spanAddress").css("color", "red");
					flagAddress = false;
				} else {
					$("#spanAddress").html(' <i class="fa-solid fa-check"></i>');
		    	    $("#spanAddress").css("color", "green");
					flagAddress = true;
				}
    		}
			
			// 상세주소 입력
			$("#inputAddressDetail").on("input", function(){
				checkInputAddressDetail();
    		})
			
    		// 상세주소 함수
    		function checkInputAddressDetail(){
				inputAddressDetail = $("#inputAddressDetail").val();		
    			
				if (inputAddressDetail == '') {
					$("#spanAddressDetail").html(' <i class="fa-solid fa-x"></i> 필수 정보입니다.');
					$("#spanAddressDetail").css("color", "red");
					flagAddressDetail = false;
    			} else {
    				$("#spanAddressDetail").html(' <i class="fa-solid fa-check"></i>');
    				$("#spanAddressDetail").css("color", "green");
    				flagAddressDetail = true;
    			}
				console.log(flagAddressDetail);
			}
			
			// Submit 유효성 검사
	    	$("#inputSubmit").on("click", function(){
				if (!flagName) {
		    		checkInputName();
		    		$("#inputName").focus();
		    	} else if (!flagPhone) {
		    		checkInputPhone();
		    		$("#inputPhone").focus();
		    	} else if (!flagEmail) {
		    		checkInputEmail();
		    		$("#inputEmail").focus();
		    	} else if (!flagAddress) {
		    		checkInputAddress();
		        	$("#inputAddress").focus();
		    	} else if (!flagAddressDetail) {
		    		checkInputAddressDetail();
		    		$("#inputAddressDetail").focus();
		    	} else {
		    		// alert 시작
		    		Swal.fire({
		    			title: '회원정보변경', // 제목 text
		    			text: '변경하시겠습니까?', // 내용 text
		    			icon: 'question', // warning, success, info, error, question
		    			confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
		    			cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
		    			showCancelButton: true, // cancle 버튼 보이기
		    			confirmButtonText: '확인', // confirm 버튼 text
		    			cancelButtonText: '취소' // cancel 버튼 text
		    		}).then((result) => {
		    			if (result.isConfirmed) {
              				$("#updateForm").submit();                			
		    			}
		    			else {
		    				//history.go(-1);
		    			}
		    		});
		    		// alert 끝
		    		
		    	}
	    	});
	</script>

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

  <!-- <script>
  $("#inputSubmit").on("click", function(){
		Swal.fire({
			title: '회원정보변경', // 제목 text
			text: '변경하시겠습니까?', // 내용 text
			icon: 'question', // warning, success, info, error, question
			confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
			cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
			showCancelButton: true, // cancle 버튼 보이기
			confirmButtonText: '확인', // confirm 버튼 text
			cancelButtonText: '취소' // cancel 버튼 text
		}).then((result) => {
			if (result.isConfirmed) {
				Swal.fire({
					title: '회원정보변경',
					text: '회원정보변경이 완료되었습니다!',
					icon: 'success',
					confirmButtonText: '확인'
		        }).then((result) => {
				location.href = 'updateInfo.do';	        		
				});
			}
			else {
				history.go(-1);
			}
		});
	  
  });

  </script> -->
  
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