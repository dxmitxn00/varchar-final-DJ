<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="try"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Var茶 | 티 제품</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- 파비콘 태그 -->
	<try:favicon />
	<!-- 링크 부분 태그 -->
	<try:link />
	<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	<style type="text/css">
	.nolist {
		margin: 0 auto;
	}
	
	.edit_hashtag {
		display: none;
	}
	
	.edit_hover {
		display: block;
		z-index: 99;
	}
	
	.edit_hover_text {
		z-index: 100;
	}
	
	.edit_bg_disabled {
		background: #9d9ca6 !important;
	}
	
	.tagcloud a {
		background-color: #4A55A2 !important;
	    backdrop-filter: blur(10px);
	    color: #FFFFFF;
	}
	</style>
	<script type="text/javascript">
		$(window).on('load', function() {
		    var category = "${ page.categoryName }";
		    
		    if (category != "") {
		    	var categoryName = $(".product-category > li > a").get();
		    	for (var i = 0; i < categoryName.length; i++) {
		    		if (categoryName[i].text == category) {
		    			$(".product-category > li > a").eq(i).addClass('active');		
		    		}
		    	}
		    }
		    else {
		    	$(".product-category > li:first > a").addClass('active');
		    	console.log("카테고리 없음");		    	
		    }
		});
	</script>
</head>
<body class="goto-here">
	<!-- 헤더 부분 태그 -->
	<try:nav />
	<div class="hero-wrap hero-bread" style="background-image: url('images/bg_1.jpg');">
		<div class="container">
			<div class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="main.do">Tea</a></span> <span>Products</span>
					</p>
					<h1 class="mb-0 bread">상품 목록</h1>
				</div>
			</div>
		</div>
	</div>

	<section class="ftco-section">
		<div class="container">
			<div class="row d-flex justify-content-center py-5">
				<div class="col-md-6 d-flex align-items-center">
					<form action="teaListPage.do" class="subscribe-form">
						<div class="form-group d-flex">
							<input type="text" name="teaSearchWord" class="form-control" placeholder="검색" value="${ page.teaSearchWord }"> <input type="submit" value="검색" class="submit px-3">
						</div>
					</form>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-10 mb-5 text-center">
					<ul class="product-category">
						<li><a href="teaListPage.do">전체</a></li>
						<c:forEach var="category" items="${ categorys }">
							<c:if test="${ category.categoryName != '해당없음'  }">
			                	<li><a href="teaListPage.do?categoryName=${category.categoryName}">${category.categoryName}</a></li>
							</c:if>
		                </c:forEach>
					</ul>
				</div>
			</div>
			<div class="row">
				<c:if test="${ empty teaDatas }">
					<!-- model.addAttribute("teaDatas", teaDatas); -->
					<div class="nolist">
						<h3>💚💚 보여드릴 상품이 없어용..^^💚💚</h3>
					</div>
				</c:if>
				<c:if test="${ not empty teaDatas }">
					<c:forEach var="teaData" items="${ teaDatas }">
						<div class="col-md-6 col-lg-3 ftco-animate">
							<!-- 반복 시작점 -->
							<div class="product edit_product_${ teaData.teaNum }">
								<a href="teaDetailPage.do?teaNum=${ teaData.teaNum }&searchName=DETAIL" class="img-prod"><img class="img-fluid" src="${ teaData.imageUrl }" alt="Colorlib Template">
									<div class="tagcloud ftco-animate edit_hashtag edit_hashtag_${ teaData.teaNum }" style="position: absolute; top: 15%; left: 0; right: 0; bottom: 0; text-align: center; vertical-align: middle;">
										<c:forEach var="teaHashtag" items="${ teaData.teaHashtags }">
											<br>
											<a href="teaListPage.do?teaHashtagContent=${ teaHashtag.teaHashtagContent }" class="tag-cloud-link" style="background: #ffffff"># ${ teaHashtag.teaHashtagContent }</a>
										</c:forEach>
									</div>
									<div class="overlay"></div>
								</a>
								<div class="text py-3 pb-4 px-3 text-center">
									<h3>
										<a href="teaDetailPage.do?teaNum=${ teaData.teaNum }&searchName=DETAIL">${ teaData.teaName }</a>
									</h3>
									<div class="d-flex">
										<div class="pricing">
											<p class="price">
												<c:if test="${ teaData.teaStatus eq 0 }">
													<span>${ teaData.teaPrice } ₩</span>
												</c:if>
												<c:if test="${ teaData.teaStatus eq 1 }">
													<span>판매 중단</span>
												</c:if>
											</p>
										</div>
									</div>
									<div class="bottom-area d-flex px-3 edit_text_${ teaData.teaNum }">
										<div class="m-auto d-flex">
											<c:if test="${ empty sessionMemberId }">
												<a href="teaDetailPage.do?teaNum=${ teaData.teaNum }&searchName=DETAIL" class="add-to-cart d-flex justify-content-center align-items-center text-center"> <span><i class="ion-ios-menu"></i></span>
												</a>
												<c:if test="${ teaData.teaStatus eq 0 }">
													<a href="insertCart.do?teaNum=${ teaData.teaNum }&teaCnt=1" class="buy-now d-flex justify-content-center align-items-center mx-1"><span><i class="ion-ios-cart"></i></span>
													</a>
												</c:if>
												<c:if test="${ teaData.teaStatus eq 1 }">												
													<a href="#" class="buy-now d-flex justify-content-center align-items-center mx-1 edit_bg_disabled"> <span><i class="ion-ios-cart"></i></span>
													</a>
												</c:if>
												<a href="login.do" class="heart d-flex justify-content-center align-items-center"> <span><i class="ion-ios-heart-empty"></i></span>
												</a>
											</c:if>
											<c:if test="${ not empty sessionMemberId }">
												<a href="teaDetailPage.do?teaNum=${ teaData.teaNum }&searchName=DETAIL" class="add-to-cart d-flex justify-content-center align-items-center text-center"> <span><i class="ion-ios-menu"></i></span>
												</a>
												<c:if test="${ teaData.teaStatus eq 0 }">
													<a href="insertCart.do?teaNum=${ teaData.teaNum }&teaCnt=1" class="buy-now d-flex justify-content-center align-items-center mx-1"><span><i class="ion-ios-cart"></i></span>
													</a>
												</c:if>
												<c:if test="${ teaData.teaStatus eq 1 }">												
													<a href="#" class="buy-now d-flex justify-content-center align-items-center mx-1 edit_bg_disabled"> <span><i class="ion-ios-cart"></i></span>
													</a>
												</c:if>
												<a id="${ teaData.teaNum }" class="heart d-flex justify-content-center align-items-center"> <span><i id="fc${ teaData.teaNum }" class="ion-ios-heart-empty"></i></span>
												</a>
											</c:if>
										</div>
									</div>
									<script type="text/javascript">
			    						$(".edit_hashtag > a.img-prod").remove();
			    						$(".tagcloud > a.img-prod").remove();
			    						
			    						$(".edit_product_${ teaData.teaNum }").hover(
			    							function() {
			    								$(".edit_hashtag_${ teaData.teaNum }").addClass("edit_hover");
			    								$(".edit_text_${ teaData.teaNum }").addClass("edit_hover_text");
			    							},
			    							function() {
			    								$(".edit_hashtag_${ teaData.teaNum }").removeClass("edit_hover");
			    								$(".edit_text_${ teaData.teaNum }").removeClass("edit_hover_text");
			    							}
			    						);
	    							</script>
								</div>
							</div>
						</div>
						<!-- 반복 끝 지점 -->
						<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
						<script type="text/javascript">
							$(document).ready(function() {
	
							    const Toast = Swal.mixin({
							        toast: true,
							        position: 'top-end',
							        showConfirmButton: false,
							        timer: 1500,
							        timerProgressBar: true,
							        didOpen: (toast) => {
							            toast.addEventListener('mouseenter', Swal.stopTimer)
							            toast.addEventListener('mouseleave', Swal.resumeTimer)
							        }
							    })
	
							    var favorResult = ${ teaData.favorResult }; // 찜 안한 상태가 default
							    console.log('favorResult: ' + favorResult);
	
							    if (favorResult > 0) {
							        $("#fc" + ${ teaData.teaNum }).removeClass("ion-ios-heart-empty").addClass("ion-ios-heart");
							    } else {
							        $("#fc" + ${ teaData.teaNum }).removeClass("ion-ios-heart").addClass("ion-ios-heart-empty");
							    }
	
							    $('#${ teaData.teaNum }').on("click", function() {
							        console.log('찜 버튼 클릭됨');
	
							        if (favorResult == 0) {
							            //
							            $.ajax({
							                url: 'insertFavor.do?teaNum=' + ${ teaData.teaNum },
							                type: 'POST',
							                success: function(fresult) {
							                    console.log('favorResult [' + favorResult + ']');
							                    $("#fc" + ${ teaData.teaNum }).removeClass("ion-ios-heart-empty").addClass("ion-ios-heart");
							                    favorResult = 1;
	
							                    Toast.fire({
							                        icon: 'success',
							                        title: '찜 추가 완료!'
							                    })
							                },
							                error: function(error) {
							                    alert('error [' + error + ']');
							                }
							            });
							            //
							        } else {
							            //
							            $.ajax({
							                url: 'deleteFavor.do?teaNum=' + ${ teaData.teaNum },
							                type: 'POST',
							                success: function(fresult) {
							                    console.log('favorResult [' + favorResult + ']');
							                    $("#fc" + ${ teaData.teaNum }).removeClass("ion-ios-heart").addClass("ion-ios-heart-empty");
							                    favorResult = 0;
	
							                    Toast.fire({
							                        icon: 'error',
							                        title: '찜 삭제 완료...'
							                    })
							                },
							                error: function(error) {
							                    alert('error [' + error + ']');
							                }
							            });
							            //
							        } // if-else 문 끝
							    });
							});
					    </script>
					</c:forEach>
				</c:if>
			</div>
			<div class="row mt-5">
				<div class="col text-center">
					<div class="block-27">
						<ul>
							<c:if test="${ page.startPage > 1 }">
								<li>
									<a href="teaListPage.do?categoryName=${ page.categoryName }&teaSearchWord=${ page.teaSearchWord }
															&teaHashtagContent=${ page.teaHashtagContent }&page=${ page.startPage - 1 }">
										&lt;
									</a>
								</li>
							</c:if>
							<c:forEach begin="${ page.startPage }" end="${ page.endPage }" var="p">
								<c:choose>
									<c:when test="${ page.currentPage eq p }">
										<li class="active">
											<a href="teaListPage.do?categoryName=${ page.categoryName }&teaSearchWord=${ page.teaSearchWord }
																	&teaHashtagContent=${ page.teaHashtagContent }&page=${ p }">
												${ p }
											</a>
										</li>
									</c:when>
									<c:otherwise>
										<li>
											<a href="teaListPage.do?categoryName=${ page.categoryName }&teaSearchWord=${ page.teaSearchWord }
																	&teaHashtagContent=${ page.teaHashtagContent }&page=${ p }">
												${ p }
											</a>
										</li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${ page.endPage < page.totalPageCnt }">
								<li>
									<a href="teaListPage.do?categoryName=${ page.categoryName }&teaSearchWord=${ page.teaSearchWord }
															&teaHashtagContent=${ page.teaHashtagContent }&page=${ page.endPage + 1 }">
										&gt;
									</a>
								</li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Subscribe + Footer -->
	<try:footer />
	<!-- Subscribe + Footer 부분 끝-->
	<!-- 채팅 API -->
	<try:chatAPI />
	<!-- loader -->
	<try:loader />
</body>
</html>