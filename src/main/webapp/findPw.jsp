<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="try"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Var茶 | 비밀번호 찾기 페이지</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- 파비콘 태그 -->
    <try:favicon/>
    <!-- 링크 부분 태그 -->
    <try:link/>
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
          	<p class="breadcrumbs"><span class="mr-2"><a href="main.do">Home</a></span> <span>Find Password</span></p>
            <h1 class="mb-0 bread">비밀번호 찾기</h1>
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
			<form action="findPw.do" method="post" class="billing-form" onsubmit="return checkPw();">
				<h3 class="mb-4 billing-heading" style="padding-bottom: 15px; border-bottom: 1px solid #e1e1e1">비밀번호 찾기</h3>
	          	<div class="row align-items-end">
	          		<div class="col-md-6" style="margin-top: 30px;">
	                <div class="form-group">
	                	<label for="firstname" >아이디</label>
	                  <input type="text" name="memberId" class="form-control" placeholder="아이디를 입력하세요." required style="width: 210%;">
	                </div>
	              </div>
                <div class="w-100" style="margin-bottom: 20px;"></div>
	          		<div class="col-md-6">
	                <div class="form-group">
	                	<label for="firstname" >연락처</label>
	                  <input type="text" name="memberPhone" class="form-control" placeholder="연락처를 입력하세요."required style="width: 210%; margin-bottom: 100px;">
	                </div>
	              </div>
	            </div>
				<div style="margin:auto; text-align:center;">
					<p><input type="submit" class="btn btn-primary py-3 px-4" value="  임시 비밀번호 받기  "style="vertical-align:middle; display:inline-block;"></p>
				</div>
	          </form>
           	  <!-- 로그인 폼 태그 끝 -->
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
		// 비밀번호 유효성 검사
    	function checkPw() {
 	  		var nPw = document.getElementById('newPw').value;
       		var cnPw = document.getElementById('checkNewPw').value;
                		
       		if(nPw.length < 8){
   				alert('비밀번호 설정은 8글자 이상부터 가능합니다.');
                			
       			return false;
       		}
       		else if( nPw != cnPw ){
                alert("새 비밀번호와 비밀번호 확인이 일치하지 않습니다.");
                			
                return false;
            }
       		return true;
      	}
    </script>
    
  </body>
</html>