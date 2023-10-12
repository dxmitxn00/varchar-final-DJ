<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="try"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Var茶 | 후기 상세</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- 파비콘 태그 -->
    <try:favicon/>
    <!-- 링크 부분 태그 -->
    <try:link/>
    <style type="text/css">
    	.col-lg-8 {
    		margin-top: 50px;
    	}
    	.quantity.form-control.input-number {
    		text-align: center;
    		font-size: 14px;
    		border: 1px solid rgba(0, 0, 0, 0.05) !important;
    		height: 54px !important;
    	}
    	.edit_align_center_f {
			flex: 0 0 25%;
	    	max-width: 25%;
			display: flex;
			align-items: center;
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
          	<p class="breadcrumbs"><span class="mr-2"><a href="main.do">Home</a></span> <span>Blog</span></p>
            <h1 class="mb-0 bread">상세리뷰</h1>
          </div>
        </div>
      </div>
    </div>

    <section class="ftco-section ftco-degree-bg">
      <div class="container">
        <div class="cart-list">
          <table class="table">
            <thead class="thead-primary">
              <tr class="text-center">
                <th>&nbsp;</th>
                <th>상품정보</th>
                <th>시리얼번호</th>
                <th>구매개수</th>
                <th>회원아이디</th>
              </tr>
            </thead>
            <tbody>
              <tr class="text-center">
                <td class="image-prod"><div class="img" style="background-image:url('${ reviewData.imageUrl }');"></div></td>
                <td class="product-name">
                  <h3>${ reviewData.teaName }</h3>
                  <p>${ reviewData.teaContent }</p>
                </td>
                <td class="price">${ reviewData.buySerial }</td>
                <td class="quantity">
                  <div class="input-group">
                   <input type="text" name="quantity" class="quantity form-control input-number" value="${ reviewData.buyCnt }" readonly>
                  </div>
                </td>
                <td class="total">${ reviewData.memberName }</td>
              </tr>
              <!-- END TR-->
            </tbody>
          </table>
        </div>
        <div class="row">
          <div class="col-lg-8 ftco-animate">
	        <div class="row" id="reviewImagesThumbnail">
	        	<c:forEach var="reviewImage" items="${ reviewData.reviewImages }">
	        		<div class="col-md-6 col-lg-3 edit_align_center_f">
	        		<div class="product">
	        			<a href="${ reviewImage.imageUrl }" class="image-popup">
		        			<img class="img-fluid" src="${ reviewImage.imageUrl }" alt="Colorlib Template">
		        			<div class="overlay"></div>
	        			</a>
	        		</div>
	        	</div>
	        	</c:forEach>
	        	<!-- sample start -->
	        	<!-- <div class="col-md-6 col-lg-3 edit_align_center_f">
	        		<div class="product">
	        			<a href="https://ucarecdn.com/88c59e41-d50e-464f-afc9-729c4c2ea84c/-/preview/500x500/-/quality/smart/-/format/auto/" class="image-popup">
		        			<img class="img-fluid" src="https://ucarecdn.com/88c59e41-d50e-464f-afc9-729c4c2ea84c/-/preview/500x500/-/quality/smart/-/format/auto/" alt="Colorlib Template">
		        			<div class="overlay"></div>
	        			</a>
	        		</div>
	        	</div> -->
	        	<!-- sample end -->
	        </div>
          	<hr>
          	<div class="about-author d-flex p-4 bg-light">              
				${ reviewData.reviewContent }
            </div>
			<hr>
            <div class="tag-widget post-tag-container mb-5 mt-5">
              <div class="tagcloud">
              	<c:forEach var="reviewHashtag" items="${ reviewData.reviewHashtags }">
              		<a href="reviewListPage.do?searchName=HASHTAG&reviewHashtagContent=${ reviewHashtag.reviewHashtagContent }" class="tag-cloud-link"># ${ reviewHashtag.reviewHashtagContent }</a>
              	</c:forEach>
              </div>
            </div>
            <c:if test="${ reviewData.memberId eq sessionMemberId }">
            	<form>
	            	<input type="hidden" name="reviewNum" value="${ reviewData.reviewNum }">
		            <input type="submit" class="btn btn-primary py-3 px-4" value="후기수정" formaction="updateReviewPage.do">
		            <input type="submit" class="btn btn-primary py-3 px-4" value="후기삭제" formaction="deleteReviewPage.do">
	            </form>
	        </c:if>
          </div> <!-- .col-md-8 -->
          <div class="col-lg-4 sidebar ftco-animate">
            <div class="sidebar-box">
              <form action="reviewListPage.do" class="search-form">
                <div class="form-group">
                  <span class="icon ion-ios-search"></span>
                  <input type="hidden" name="searchName" value="REVIEW">
                  <input type="text" name="reviewSearch" class="form-control" placeholder="Search...">
                </div>
              </form>
            </div>
            <div class="sidebar-box ftco-animate">
            	<h3 class="heading">Categories</h3>
              <ul class="categories">
              <c:forEach var="category" items="${ categorys }">
              	<c:if test="${ category.categoryName != '해당없음'  }">
	                <li><a href="reviewListPage.do?searchName=CATEGORY&reviewSearch=${category.categoryName}">${category.categoryName}</a></li>
              	</c:if>
              </c:forEach>
              </ul>
            </div>

            <!-- 최근 본 상품 사이드 바 시작 -->
            <div class="sidebar-box ftco-animate">
              <h3 class="heading">최근 본 상품</h3>
              <c:if test="${ sessionScope.recentList ne null}">
	              <c:forEach var="recentList" items="${ sessionScope.recentList }">
		              <div class="block-21 mb-4 d-flex">
		                <a class="blog-img mr-4" style="background-image: url(${recentList.imageUrl});"></a>
		                <div class="text">
		                  <h3 class="heading-1"><a href="#"><b>${recentList.teaName}</b></a></h3>
		                  <h4 class="heading-1"><a href="#">${recentList.teaContent}</a></h4>
		                  <div class="meta">
		                    <div><a href="#"><span class="icon-money"></span> ${recentList.teaPrice}</a></div>
		                    <div><a href="#"><span class="icon-chat"></span> ${recentList.categoryName}</a></div>
		                  </div>
		                </div>
		              </div>
	              </c:forEach>
              </c:if>
              <c:if test="${ sessionScope.recentList eq null}">
              	<div class="block-21 mb-4 d-flex">
		          <div class="text">
		            <h4 class="heading-1">최근 본 상품이 없습니다.</h4>
		            <div class="meta">
		            </div>
		          </div>
		        </div>
              </c:if>
            </div>
            <!-- 최근 본 상품 사이드 바 끝 -->

            <div class="sidebar-box ftco-animate">
              <h3 class="heading">Tag Cloud</h3>
              <div class="tagcloud">
              	<c:forEach var="tag" items="${ tagCloud }" begin="0" end="8">
	                <a href="reviewListPage.do?searchName=HASHTAG&reviewHashtagContent=${ tag.reviewHashtagContent }" class="tag-cloud-link"># ${ tag.reviewHashtagContent }</a>
              	</c:forEach>
              </div>
            </div>
            
          </div>
        </div>
      </div>
    </section> <!-- .section -->

    <footer class="ftco-footer ftco-section bg-light">
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
    
  </body>
</html>