<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="try"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
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
    	
        //var favor = 0;
        var favorResult = ${favorResult};

        if(favorResult > 0){
           $("#fc").removeClass("fa-regular").addClass("fa-solid");
        } else {
           $("#fc").removeClass("fa-solid").addClass("fa-regular");
        }

        $("#fc").on("click", function(){
        	console.log('찜 버튼 클릭 확인');
        	
        	if(favorResult == 0){
            	//
                $.ajax({
                   url: 'insertFavor.do?teaNum='+${ teaData.teaNum },
                   type: 'POST',
                   success: function(fresult){
                      console.log('favorResult [' + favorResult + ']');
                      $("#fc").removeClass("fa-regular").addClass("fa-solid");
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
        	else{
            	//
                $.ajax({
                   url: 'deleteFavor.do?teaNum='+${ teaData.teaNum },
                   type: 'POST',
                   success: function(fresult){
                       console.log('favorResult [' + favorResult + ']');
                       $("#fc").removeClass("fa-solid").addClass("fa-regular");
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
    				<p class="price"><span>${ teaData.teaPrice }</span></p>
    				<p>${ teaData.teaContent }</p>
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
	          		<p style="color: #000;">600 kg available</p>
          	<p><button type="submit" class="primary-btn">Add to Cart</button></p>
	        <div id="heartbox">
	        	<i id="fc" class="fa-regular fa-heart" style="color: #f22202;"></i>
	        </div>
	          	</div>				
          	</form> 
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
    	<div class="container">
    		<div class="row">
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
    			<div class="col-md-6 col-lg-3 ftco-animate">
    				<div class="product">
    					<a href="#" class="img-prod"><img class="img-fluid" src="images/product-2.jpg" alt="Colorlib Template">
    						<div class="overlay"></div>
    					</a>
    					<div class="text py-3 pb-4 px-3 text-center">
    						<h3><a href="#">Strawberry</a></h3>
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
    			<div class="col-md-6 col-lg-3 ftco-animate">
    				<div class="product">
    					<a href="#" class="img-prod"><img class="img-fluid" src="images/product-3.jpg" alt="Colorlib Template">
	    					<div class="overlay"></div>
	    				</a>
    					<div class="text py-3 pb-4 px-3 text-center">
    						<h3><a href="#">Green Beans</a></h3>
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
    			<div class="col-md-6 col-lg-3 ftco-animate">
    				<div class="product">
    					<a href="#" class="img-prod"><img class="img-fluid" src="images/product-4.jpg" alt="Colorlib Template">
    						<div class="overlay"></div>
    					</a>
    					<div class="text py-3 pb-4 px-3 text-center">
    						<h3><a href="#">Purple Cabbage</a></h3>
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