<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="try"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Var茶 | 회원가입</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- 파비콘 태그 -->
    <try:favicon/>
    <!-- 링크 부분 헤더 -->
	<try:link/>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script> 
  	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
          	<p class="breadcrumbs"><span class="mr-2"><a href="main.do">Home</a></span> <span>Sign Up</span></p>
            <h1 class="mb-0 bread">회원가입</h1>
          </div>
        </div>
      </div>
    </div>
	<!-- 페이지 제목 div 끝 -->

	<!-- 회원가입 섹션 -->
	<section class="ftco-section">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-xl-7 ftco-animate">
          	<!-- 회원가입 폼 태그 -->
			<form id="signForm" action="signup.do" method="post" class="billing-form">
	          	<h3 class="mb-4 billing-heading" style="padding-bottom: 25px; border-bottom: 1px solid #e1e1e1">회원가입</h3>
	          	<div class="row align-items-end">
					<c:if test="${ memberData.memberPlatform ne null }">
						<try:signupSns/>
					</c:if>
					<c:if test="${ memberData.memberPlatform eq null }">
						<try:signupOrigin/>
					</c:if>
					
	              <script>
                      	$(document).ready(function(){
                      		$("#inputBtnPassword1").on("click", function(){
                      			$("#inputPassword1").toggleClass("eye");
                      			if ($("#inputPassword1").hasClass("eye")) {
                      				$(this).find("i").attr("class", "fa-solid fa-eye");
                      				$("#inputPassword1").attr("type", "text");
                      			} else {
                      				$(this).find("i").attr("class", "fa-solid fa-eye-slash");
                      				$("#inputPassword1").attr("type", "password");
                      			}
                      		});
                      		$("#inputBtnPassword2").on("click", function(){
                      			$("#inputPassword2").toggleClass("eye");
                      			if ($("#inputPassword2").hasClass("eye")) {
                      				$(this).find("i").attr("class", "fa-solid fa-eye");
                      				$("#inputPassword2").attr("type", "text");
                      			} else {
                      				$(this).find("i").attr("class", "fa-solid fa-eye-slash");
                      				$("#inputPassword2").attr("type", "password");
                      			}
                      		});
                      	});
                  </script>
                <div class="w-100"></div>
	            <div class="col-md-12">
	                <label for="name">이름<span id="spanName" class="edit-red"> *</span></label>
	                <div class="form-group">
	                  <input type="text" id="inputName" name="memberName" value="${ memberData.memberName }" class="form-control" placeholder="이름을 입력하세요." required>
	                </div>
                </div>
                <div class="w-100"></div>
				<div class="col-md-12">
	                <label for="phone">연락처<span id="spanPhone" class="edit-red"> *</span></label>
	                <div class="form-group edit-d-f">
	                  	<input type="text" id="inputPhone" name="memberPhone" value="${ memberData.memberPhone }" class="form-control" placeholder="연락처를 입력해주세요.">
	                </div>
                </div>
                <div class="w-100"></div>
				<div class="col-md-12">
                	<label for="email">이메일<span id="spanEmail" class="edit-red"> *</span></label>
	                <div class="form-group edit-d-f">
	                  <input type="text" id="inputEmail" name="memberEmail" value="${ memberData.memberEmail }" class="form-control" placeholder="이메일을 입력해주세요.">
	                </div>
                </div>
                <div class="w-100"></div>
                <div class="col-md-12">
                	<label for="address">주소<span id="spanAddress" class="edit-red"> *</span></label>
	                <div class="form-group">
	                	<input type="button" id="inputBtnAddress" class="form-control" onclick="daumPost()" value="우편번호 찾기"><br>
	                	<input type="text" id="inputAddress" name="memberAddress" value="${ memberData.memberAddress }" class="form-control" placeholder="주소를 입력해주세요." readonly>
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
					<p><input id="inputSubmit" type="button" class="btn btn-primary py-3 px-4" value="  가입하기  "style="vertical-align:middle; display:inline-block;"></p>
				</div>
	          </form>
          	  <!-- 회원가입 폼 태그 끝 -->
			</div>
          </div> <!-- .col-md-8 -->
        </div>
    </section>
	<!-- 회원가입 섹션 끝-->

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
		    	if (!flagId) {
		    		checkInputId();
		    		$("#inputId").focus();
		    	} else if (!flagPassword1) {
		    		checkInputPassword1();
		    		$("#inputPassword1").focus();
		    	} else if (!flagPassword2) {
		    		checkInputPassword2();
		    		$("#inputPassword2").focus();
		    	} else if (!flagName) {
		    		checkInputName();
		    		$("#inputName").focus();
		    	} else if (!flagEmail) {
		    		checkInputEmail();
		    		$("#inputEmail").focus();
		    	} else if (!flagPhone) {
		    		checkInputPhone();
		    		$("#inputPhone").focus();
		    	} else if (!flagAddress) {
		    		$("#spanAddress").html(' <i class="fa-solid fa-x"></i> 필수 정보입니다.');
		        	$("#spanAddress").css("color", "red");
		        	$("#inputAddress").focus();
		    	} else if (!flagAddressDetail) {
		    		checkInputAddressDetail();
		    		$("#inputAddressDetail").focus();
		    	} else {
              		$("#signForm").submit();                			
		    	}
	    	});
	</script>

	<!-- 커스텀 태그 적용하기 -->
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