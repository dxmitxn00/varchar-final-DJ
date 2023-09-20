<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="try"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Var茶 | 티 상세</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- 파비콘 태그 -->
    <try:favicon/>
    <!-- 링크 부분 태그 -->
    <try:link/>
    
    <script src="https://kit.fontawesome.com/7b2dcea907.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
    <script type="text/javascript"> 
	    $(document).ready(function(){
	    	console.log('확인1');
	    	
	        // var favor = 0;
	        var favorResult = ${favorResult};
	
	        if (favorResult > 0){
	           $("#fc").removeClass("fa-regular").addClass("fa-solid");
	        } else {
	           $("#fc").removeClass("fa-solid").addClass("fa-regular");
	        }
	
	        $("#fcBtn").on("click", function(){
	        	console.log('찜 버튼 클릭 확인');
	        	
	        	if (favorResult == 0){
	                $.ajax({
	                   url: 'insertFavor.do?teaNum='+${ teaData.teaNum },
	                   type: 'POST',
	                   success: function(fresult){
	                      console.log('favorResult [' + favorResult + ']');
	                      $("#fc").removeClass("fa-regular").addClass("fa-solid");
	                      $("#fc").addClass('animate-like');
	                      favorResult = 1;
	                      /**
	                      if (fresult == 1) {
	                     	 Swal.fire({
	                     		  position: 'top',
	                     		  icon: 'success',
	                     		  title: '찜 추가!',
	                     		  showConfirmButton: false,
	                     		  timer: 1000
	                     	})
	                      }
	                      else {
	                     	 Swal.fire({
	                     		  position: 'top',
	                     		  icon: 'success',
	                     		  title: '찜 삭제!',
	                     		  showConfirmButton: false,
	                     		  timer: 1000
	                     	})
	                      }
	                      */
	                   },
	                   error: function(error){
	                      alert('error [' + error + ']');
	                   }
	                });
	                //
	        	}
	        	else {
	            	//
	                $.ajax({
	                   url: 'deleteFavor.do?teaNum='+${ teaData.teaNum },
	                   type: 'POST',
	                   success: function(fresult){
	                       console.log('favorResult [' + favorResult + ']');
	                       $("#fc").removeClass("fa-solid").addClass("fa-regular");
	                       $("#fc").removeClass('animate-like');
	                       favorResult = 0;
	                      /**
	                      if (fresult == 1) {
	                     	 Swal.fire({
	                     		  position: 'top',
	                     		  icon: 'success',
	                     		  title: '찜 추가!',
	                     		  showConfirmButton: false,
	                     		  timer: 1000
	                     	})
	                      }
	                      else {
	                     	 Swal.fire({
	                     		  position: 'top',
	                     		  icon: 'success',
	                     		  title: '찜 삭제!',
	                     		  showConfirmButton: false,
	                     		  timer: 1000
	                     	})
	                      }
	                      */
	                   },
	                   error: function(error){
	                      alert('error [' + error + ']');
	                   }
	                });
	                //
	        	} // if-else 문 끝
	        });
	     });
    </script>
    <style type="text/css">
 	#cartform{
 		text-align: start;
 	}
    #cartnum{
    	display: flex;
    	padding : 15px;
    }
    .text{
    	padding : 15px;
    }
    
    /** 좋아요 찜 스타일 */
    .like-content {
    display: inline-block;
    width: 100%;
    margin: 40px 0 0;
    padding: 40px 0 0;
    font-size: 18px;
    border-top: 10px dashed #eee;
    text-align: center;
	}
	.like-content span {
	  	color: #9d9da4;
	  	font-family: monospace;
	}
	.like-content .btn-secondary {
   		display: block;
		margin: 40px auto 0px;
    	text-align: center;
    	background: #ed2553;
    	border-radius: 3px;
    	box-shadow: 0 10px 20px -8px rgb(240, 75, 113);
    	padding: 10px 17px;
    	font-size: 18px;
    	cursor: pointer;
    	border: none;
    	outline: none;
    	color: #ffffff;
    	text-decoration: none;
    	-webkit-transition: 0.3s ease;
   		transition: 0.3s ease;
	}
	.like-content .btn-secondary:hover {
   		transform: translateY(-3px);
	}
	.like-content .btn-secondary .fa {
    	margin-right: 5px;
	}
	.animate-like {
  		animation-name: likeAnimation;
  		animation-iteration-count: 1;
  		animation-fill-mode: forwards;
  		animation-duration: 0.65s;
	}
	@keyframes likeAnimation {
  		0%   { transform: scale(30); }
  		100% { transform: scale(1); }
	}
    .reviewCon {
	   	overflow: hidden;
	   	text-overflow: ellipsis;
	   	white-space: nowrap;
    }
    </style>
  </head>
  <body class="goto-here">
    <!-- 헤더 부분 태그 -->
	<try:nav/>	

    <div class="hero-wrap hero-bread" style="background-image: url('images/bg_1.jpg');">
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<p class="breadcrumbs"><span class="mr-2"><a href="main.do">Home</a></span> <span class="mr-2"><a href="main.do">Product</a></span> <span>Product Single</span></p>
            <h1 class="mb-0 bread">Product Single</h1>
          </div>
        </div>
      </div>
    </div>

    <section class="ftco-section">
    	<div class="container">
    		<div class="row">
    			<div class="col-lg-6 mb-5 ftco-animate">
    				<a href="images/product-1.jpg" class="image-popup"><img src="${teaData.imageUrl}" class="img-fluid" alt="Colorlib Template"></a>
    			</div>
    			<div class="col-lg-6 product-details pl-md-5 ftco-animate">
    				<h3>${ teaData.teaName }</h3>
    				<div class="rating d-flex">
							<p class="text-left mr-4">
								<a href="#" class="mr-2">5.0</a>
								<a href="#"><span class="ion-ios-star-outline"></span></a>
								<a href="#"><span class="ion-ios-star-outline"></span></a>
								<a href="#"><span class="ion-ios-star-outline"></span></a>
								<a href="#"><span class="ion-ios-star-outline"></span></a>
								<a href="#"><span class="ion-ios-star-outline"></span></a>
							</p>
							<p class="text-left mr-4">
								<a href="#" class="mr-2" style="color: #000;">100 <span style="color: #bbb;">별점</span></a>
							</p>
							<p class="text-left">
								<a href="#" class="mr-2" style="color: #000;">500 <span style="color: #bbb;">판매량</span></a>
							</p>
						</div>
    				<p class="price"><span>${ teaData.teaPrice } 원</span></p>
    				<p>${ teaData.teaContent }</p>
    					<div class="tag-widget post-tag-container mb-5 mt-5">
							<div class="tagcloud">
								<c:forEach var="teaHashtag" items="${ teaHashtags }">
									<a href="teaListPage.do?teaHashtagContent=${ teaHashtag.teaHashtagContent }" class="tag-cloud-link"># ${ teaHashtag.teaHashtagContent }</a>
								</c:forEach>
							</div>
						</div>
						<div class="row mt-4">
							<form id="cartform" action="insertCart.do">
							 <input type="hidden" name="teaNum" value="${ teaData.teaNum }">
							<div class="w-100"></div>	
					<div id="cartnum">		
	             	<span class="input-group-btn mr-2">
	                	<button type="button" class="quantity-left-minus btn"  data-type="minus" data-field="">
	                   <i class="ion-ios-remove"></i>
	                	</button>
	            		</span>
	             	<input type="text" id="quantity" name="teaCnt" class="form-control input-number" value="1" min="1" max="${ teaData.teaCnt }">
	             	<span class="input-group-btn ml-2">
	                	<button type="button" class="quantity-right-plus btn" data-type="plus" data-field="">
							<i class="ion-ios-add"></i>
	                 	</button>
	             	</span>
	             	</div>
	          	<div class="w-100"></div>
	          	<div class="text">
	          		<p style="color: #000;">600 kg available</p> <!-- 판매 상태하면 될듯? 아마동?? -->
	          	</div>
			<p>
          		<button type="submit" class="primary-btn">Add to Cart</button> <!-- 카트 추가 버튼 -->
          		
          		<c:if test="${ not empty sessionMemberId }">
				<button id="fcBtn" type="button" class="btn-secondary like-review"> <!-- 찜 좋아요 버튼 -->
					<i id="fc" class="fa fa-heart" aria-hidden="true" style="color: #f22202;" ></i> Like
  				</button>
  				</c:if>
  				<c:if test="${ empty sessionMemberId }">
  					<a href="login.do">
  						<button type="button" class="btn-secondary like-review"> <!-- 찜 좋아요 버튼 -->
						<i id="fc" class="fa fa-heart" aria-hidden="true" style="color: #f22202;" ></i> Like
  						</button>
  					</a>
  				</c:if>
			</p>
          	</form> 
          	
          	<!--  기존하트
	        <div id="heartbox">
	        	<i id="fc" class="fa-regular fa-heart" style="color: #f22202;"></i>
	        </div>
	        -->
	          	</div>				
          	</div>
    			</div>
    		</div>
    	
    </section>

    <section class="ftco-section">
    	<div class="container">
				<div class="row justify-content-center mb-3 pb-3">
          <div class="col-md-12 heading-section text-center ftco-animate">
          	<span class="subheading">Products</span>
            <h2 class="mb-4">Related Products</h2>
            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia</p>
          </div>
        </div>   		
    	</div>
    	<c:set var="reviewSize" value="${ fn:length(reviewDatas) }"/>>
    	<c:set var="endRnum" value="4"/>
    	
    	<c:choose>
    		<c:when test="${ reviewSize == 0 }">
    			<div class="container">
    				<h3 class="heading text-center">후기가 존재하지 않습니다.</h3>
    			</div>
    		</c:when>
    		<c:otherwise>
		    	<div id ="reviewContainer" class="container">
		    		<div id="reviewForEach" class="row">
		    		<!--  
		    		<c:set var="endRnum" value="4"/>
		    			<div class="col-md-6 col-lg-3 ftco-animate">
		    				<div class="product">
		    					<a href="#" class="img-prod"><img class="img-fluid" src="images/product-1.jpg" alt="Colorlib Template">
		    						<span class="status">30%</span>
		    						<div class="overlay"></div>
		    					</a>
		    					<div class="text py-3 pb-4 px-3 text-center">
		    						<h3><a href="#">Bell Pepper</a></h3>
		    						<div class="d-flex">
		    							<div class="pricing">
				    						<p class="price"><span class="mr-2 price-dc">$120.00</span><span class="price-sale">$80.00</span></p>
				    					</div>
			    					</div>
			    					<div class="bottom-area d-flex px-3">
			    						<div class="m-auto d-flex">
			    							<a href="#" class="add-to-cart d-flex justify-content-center align-items-center text-center">
			    								<span><i class="ion-ios-menu"></i></span>
			    							</a>
			    							<a href="#" class="buy-now d-flex justify-content-center align-items-center mx-1">
			    								<span><i class="ion-ios-cart"></i></span>
			    							</a>
			    							<a href="#" class="heart d-flex justify-content-center align-items-center ">
			    								<span><i class="ion-ios-heart"></i></span>
			    							</a>
		    							</div>
		    						</div>
		    					</div>
		    				</div>
		    			</div>
		    			-->
		    			<!-- 반복 시작 -->
		    			<c:forEach var="reviewData" items="${ reviewDatas }" begin="0" end="${ reviewSize }" varStatus="status">
		    			<div id="${ status.index }" class="col-md-6 col-lg-3 ftco-animate" style="display: none;">
		    				<div class="product">
		    					<a href="#" class="img-prod"><img class="img-fluid" src="${ reviewData.imageUrl }" alt="Colorlib Template">
		    						<div class="overlay"></div>
		    					</a>
		    					<div class="text py-3 pb-4 px-3 text-center">
		    						<h3 class="reviewsCon ${ reviewData.reviewNum }"><a href="#">${ reviewData.reviewContent }</a></h3>
		    						<script type="text/javascript">
				                        $(document).ready(function(){
				                          var con = $('.reviewsCon.${ reviewData.reviewNum }').text();
				                          console.log(con);
				                          $('.reviewsCon.${ reviewData.reviewNum } > a').text(con);
				                          var htm = $('.reviewsCon.${ reviewData.reviewNum } > a').html();
				                          console.log(htm);
				                          htm = htm.replace(/&nbsp;/g, '');
				                          $('.reviewsCon.${ reviewData.reviewNum } > a').text(htm);
				                        });
			                        </script>
		    						<div class="d-flex">
		    							<div class="pricing">
				    						<p class="price"><span>$120.00</span></p>
				    					</div>
			    					</div>
		    						<div class="bottom-area d-flex px-3">
			    						<div class="m-auto d-flex">
			    							<a href="#" class="add-to-cart d-flex justify-content-center align-items-center text-center">
			    								<span><i class="ion-ios-menu"></i></span>
			    							</a>
			    							<a href="#" class="buy-now d-flex justify-content-center align-items-center mx-1">
			    								<span><i class="ion-ios-cart"></i></span>
			    							</a>
			    							<a href="#" class="heart d-flex justify-content-center align-items-center ">
			    								<span><i class="ion-ios-heart"></i></span>
			    							</a>
		    							</div>
		    						</div>
		    					</div>
		    				</div>
		    			</div>
		    			</c:forEach>
		    			<!-- 반복 끝 -->
		    		</div>
		    		<c:if test="${ endRnum < reviewSize }">
		    			<p><a id="reviewPlus" class="btn btn-primary py-2 px-3">Read more</a></p>
		    		</c:if>
		
		    		<!--  
		    			<c:if test="${ page.currentPage < page.endPage }">
		    				<span id="reviewPlus">
		    					<a href="teaDetailPage.do?searchName=${ page.searchName }&teaNum=${ teaData.teaNum }&page=${ page.currentPage + 1 }">+</a>
		    				</span>
		    			</c:if>
		    		-->
		    	</div>
		    		<script>
		    			$(document).ready(function(){
		    				//document.getElementsByClassName("col-md-6 col-lg-3 ftco-animate").style.display="none";
		    				var endRnum = ${ endRnum };
		    				console.log("최초 endRnum: " + endRnum);
		    				
		    				for (i = 0; i < endRnum; i++){
								document.getElementsByClassName("col-md-6 col-lg-3 ftco-animate")[i].style.display="block";
								console.log("i 확인: "+ i);
							}
		    				
		    				$('#reviewPlus').click(function(){
		    					console.log("리뷰 더하기 버튼 클릭 확인");
		
		    					endRnum += 4;
		    					console.log("endRnum: " + endRnum);
		    					
		    					if(endRnum >= ${ reviewSize }){
		    						console.log("확인2 endRnum: "+ endRnum);
		    						var con = document.getElementById("reviewPlus");
		    						con.style.display = "none";
		    					}
		    					
		    					for (i = 0; i < endRnum; i++){
		    						document.getElementsByClassName("col-md-6 col-lg-3 ftco-animate")[i].style.display="block";
		    						console.log("i 확인: "+ i);
		    					}
		    					
		    				});
		    				
		    				if(endRnum >= ${ reviewSize }){
								console.log("확인2 endRnum: "+ endRnum);
								var con = document.getElementById("reviewPlus");
								con.style.display = "none";
							}
		    				
		    			});
		    		</script>
    		</c:otherwise>
    	</c:choose>
    	
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