<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="try"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Var茶 | 로그인</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- 파비콘 태그 -->
    <try:favicon/>
    <!-- 링크 부분 태그 -->
    <try:link/>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <!-- 카카오 로그인 -->
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <!-- 네이버 로그인 -->
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    <!-- 구글 로그인 -->
	<script src="https://accounts.google.com/gsi/client"></script>
	<style type="text/css">
		.block-27 ul li span {
			width: 70px;
			height: 70px;
		}
		.block-27 ul li {
			margin-right: 10px;
			margin-left: 10px;
		}
		.edit_hidden {
			display: none;
		}
		#edit_snsLogin_media_l {
			display: none;
		}
		#edit_span_kakao {
			background-image: url("images/login_kakao.png");
			background-size: 70px;
			cursor: pointer;
		}
		#edit_span_naver {
			background-image: url("images/login_naver.png");
			background-size: 70px;
			cursor: pointer;
		}
		#edit_span_google {
			background-image: url("images/login_google.png");
			background-size: 70px;
			cursor: pointer;
		}
		@media (min-width: 768px) {
			#edit_snsLogin_media_s {
				display: none;
			}
			#edit_snsLogin_media_l {
				display: block;
			}
  			#edit_span_kakao_l {
				background-image: url("images/login_kakao_m.png");
				background-size: contain;
				cursor: pointer;
			}
			#edit_span_naver_l {
				background-image: url("images/login_naver_m.png");
				background-size: contain;
				cursor: pointer;
			}
			#edit_span_google_l {
				background-image: url("images/login_google_m.png");
				background-size: contain;
				cursor: pointer;
			}
			.list-unstyled li span {
				display: inline-block;
			}
			.list-unstyled li span {
				width: 288px;
				height: 58px;
			}

		}
		@media (min-width: 992px) {
  			#edit_snsLogin_media_s {
				display: none;
			}
			#edit_snsLogin_media_l {
				display: block;
			}
  			#edit_span_kakao_l {
				background-image: url("images/login_kakao_l.png");
				background-size: contain;
				cursor: pointer;
			}
			#edit_span_naver_l {
				background-image: url("images/login_naver_l.png");
				background-size: contain;
				cursor: pointer;
			}
			#edit_span_google_l {
				background-image: url("images/login_google_l.png");
				background-size: contain;
				cursor: pointer;
			}
			.list-unstyled li span {
				display: inline-block;
			}
			.list-unstyled li span {
				width: 331px;
				height: 58px;
			}
  		}
	</style>
	
	<script src="https://www.google.com/recaptcha/api.js?render=6LfpIUsoAAAAAOAtRW14-c_XrAOW6LyWOpQGLSYV&badge=bottomleft"></script>
  	<script>
   		function onSubmit(token) {
     		document.getElementById("demo-form").submit();
   		}
 	</script>
    
  </head>
  <body class="goto-here">
  <!-- 상단, 하단은 커스텀 태그로 넣어주셈 -->
    <try:nav/>
    <!-- END nav -->

	<!-- 페이지 제목 div -->
    <div class="hero-wrap hero-bread" style="background-image: url('images/bg_1.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p class="breadcrumbs"><span class="mr-2"><a href="main.do">Home</a></span> <span>login</span></p>
            <h1 class="mb-0 bread">로그인</h1>
          </div>
        </div>
      </div>
    </div>
	<!-- 페이지 제목 div 끝 -->

	<!-- 로그인 섹션 -->
	<section class="ftco-section">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-xl-7 ftco-animate">
          	<!-- 로그인 폼 태그 -->
          	
			<form action="login.do" method="post" class="billing-form" onsubmit="return checkPw();" id="demo-form">
				<h3 class="mb-4 billing-heading" style="padding-bottom: 15px; border-bottom: 1px solid #e1e1e1">로그인</h3>
	          	<div class="row align-items-end">
	          		<div class="col-md-6" style="margin-top: 30px;">
	                <div class="form-group">
	                	<label for="firstname">아이디</label>
	                  <input type="text" name="memberId" class="form-control" placeholder="아이디를 입력하세요." required style="width: 210%;">
	                </div>
	              </div>
                <div class="w-100" style="margin-bottom: 20px;"></div>
	          		<div class="col-md-6">
	                <div class="form-group">
	                	<label for="firstname">비밀번호</label>
	                  <input type="password" name="memberPw" class="form-control" placeholder="비밀번호를 입력하세요."required style="width: 210%; margin-bottom: 100px;">
	                  <a href="findPw.do">비밀번호 찾기</a>
	                </div>
	              </div>
	            </div>
				<div style="margin:auto; text-align:center;">
					<p><input type="submit" class="btn btn-primary py-3 px-4 g-recaptcha" value="  로그인  "style="vertical-align:middle; display:inline-block;"
							data-sitekey="6LfpIUsoAAAAAOAtRW14-c_XrAOW6LyWOpQGLSYV" 
        					data-callback='onSubmit' 
        					data-action='submit'></p>
				</div>
	          </form>
	          
           	  <!-- 로그인 폼 태그 끝 -->
           	  
           	  
           	  <!-- SNS 로그인 시작 -->
           	  <div class="row mt-5" id="edit_snsLogin_media_s">
		      	<div class="col text-center">
		      		<div class="block-27">
		              <ul>
		                <li><span class="btn_span_kakao" id="edit_span_kakao"></span></li>
		                <li><span class="btn_span_naver" id="edit_span_naver"></span></li>
		                <li><span class="btn_span_google" id="edit_span_google" data-client_id="831557176408-2a23dinpartetqap2lipe1c046pt24co.apps.googleusercontent.com"></span></li>
		              </ul>
		      		</div>
		      	</div>
		      </div>
		      <div class="row mt-5" id="edit_snsLogin_media_l">
		      	<div class="col text-center">
		      		<ul class="list-unstyled">
		      			<li><span class="btn_span_kakao" id="edit_span_kakao_l"></span></li>
		      			<li><span class="btn_span_naver" id="edit_span_naver_l"></span></li>
		      			<li><span class="btn_span_google" id="edit_span_google_l" data-client_id="831557176408-2a23dinpartetqap2lipe1c046pt24co.apps.googleusercontent.com"></span></li>
		      		</ul>
		      	</div>
		      </div>
		      <!-- SNS 로그인 끝 -->
			  <!-- 구글 로그인 버튼 -->
			  <div class="edit_hidden" id="g_id_onload" data-client_id="831557176408-2a23dinpartetqap2lipe1c046pt24co.apps.googleusercontent.com" data-callback="handleCredentialResponse"></div>
			  <div class="g_id_signin edit_hidden" data-type="standard" data-size="large" data-text="signin_with" data-shape="rectangular" data-width=300 data-radius=15px></div>
		      
		      <!-- kakao API START -->
		      <script type="text/javascript">
		      	$('.btn_span_kakao').click(function(){
		      		loginWithKakao();
		      	});
		      
				Kakao.init('0a516c7a8f0dd1acfb318dd2c3a159d3');
				
				function loginWithKakao() {
					Kakao.Auth.login({
						success: function (authObj) {
							console.log("카카오 JSON : " + JSON.stringify(authObj));
							profileWithKakao();
						},
						fail: function (error) {
							console.log(JSON.stringify(error));
						},
					})
				}
				
				function profileWithKakao() {
					Kakao.API.request({
						url: '/v2/user/me',
						success: function (response) {
							console.log(response);
							$('#status').append(response.kakao_account.profile.nickname);
							console.log('카카오톡 ID : ' + response.id);
							console.log('카카오톡 이름 : ' + response.kakao_account.profile.nickname);
							console.log('카카오톡 프로필 이미지 URL : ' + response.properties.thumbnail_image);
							
							const params = new URLSearchParams();
							params.append('memberId', response.id);
							params.append('memberName', response.kakao_account.profile.nickname);
							params.append('memberPlatform', 'kakao');

							const destinationURL = 'snsLogin.do?' + params.toString();
							window.location.href = destinationURL;
						},
						fail: function (error) {
							console.log(error);
						}
					});
				}
			</script>
			<!-- kakao API END -->
			
			<!-- google API START -->
			<script>
				$('.btn_span_google').click(function(){
					$('.nsm7Bb-HzV7m-LgbsSe-BPrWId').trigger('click');
				});
				
				function handleCredentialResponse(response) {
					// decodeJwtResponse() is a custom function defined by you
					// to decode the credential response.
					const responsePayload = parseJwt(response.credential);
			
					$('#status').append(responsePayload.name);
					console.log("구글 ID : " + responsePayload.sub);
					console.log("구글 Email : " + responsePayload.email);
					console.log("구글 Name : " + responsePayload.name);
			
					const params = new URLSearchParams();
					params.append('memberId', responsePayload.sub);
					params.append('memberEmail', responsePayload.email);
					params.append('memberName', responsePayload.name);
					params.append('memberPlatform', 'google');
			
					// 새로운 URL로 이동합니다. 여기에 목적지 URL을 입력하세요.
					const destinationURL = 'snsLogin.do?' + params.toString();
					window.location.href = destinationURL;
			
				};
			
				function parseJwt(token) {
					var base64Url = token.split('.')[1];
					var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
					var jsonPayload = decodeURIComponent(atob(base64).split('').map(
							function(c) {
								return '%'
										+ ('00' + c.charCodeAt(0).toString(16)).slice(-2);
							}).join(''));
					return JSON.parse(jsonPayload);
				};
			</script>
			<!-- google API END -->
	  		 <div class="edit_hidden" id="naver_id_login"></div>
	  		     
			</div>
          </div> <!-- .col-md-8 -->
        </div>
    </section>
	<!-- 비밀번호 변경 섹션 끝-->


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
	
    <script type="text/javascript">
    	$('.btn_span_naver').click(function(){
    		console.log('네이버 클릭 확인');
    		
    		$("#naver_id_login_anchor").get(0).click();
		});

		// ---[ 네이버 로그인 ]-------------------------------------------------------------------------------------------------------------------------------------------------
		var naver_id_login = new naver_id_login("gSqN5AjK3F7dFSVLcJF0", "http://localhost:8088/app/login.jsp");
		var state = naver_id_login.getUniqState();
		naver_id_login.setButton("green", 3, 40);
		naver_id_login.setDomain("http://localhost:8088/");
		naver_id_login.setState(state);
		//naver_id_login.setPopup();
		
		naver_id_login.init_naver_id_login();
  		// -------------------------------------------------------------------------------------------------------------------------------------------------------------------

  		
  		// 네이버 사용자 프로필 조회
    	naver_id_login.get_naver_userprofile("naverSignInCallback()");
	    
    	// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
    	function naverSignInCallback() {
        	const id = naver_id_login.getProfileData('id');
        	const name = naver_id_login.getProfileData('name');
        	const email = naver_id_login.getProfileData('email');
        	const mobile = naver_id_login.getProfileData('mobile');
        
        	console.log("네이버 ID : " + id);
			console.log("네이버 Email : " + email);
			console.log("네이버 Name : " + name);
			console.log("네이버 mobile : " + mobile);
			
			const params = new URLSearchParams();
			params.append('memberId', id);
			params.append('memberEmail', email);
			params.append('memberName', name);
			params.append('memberPlatform', 'naver');
			
			// 새로운 URL로 이동합니다. 여기에 목적지 URL을 입력하세요.
			const destinationURL = 'snsLogin.do?' + params.toString();
			window.location.href = destinationURL;
    	
    	  }
  	</script>
    
  </body>
</html>