<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="try"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Var茶 | 후기 수정</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<!-- 파비콘 태그 -->
<try:favicon />
<!-- 링크 부분 헤더 -->
<try:link />
<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/38.1.0/classic/ckeditor.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
<script type="module">
    import * as LR from "https://cdn.jsdelivr.net/npm/@uploadcare/blocks@0.25.0/web/lr-file-uploader-regular.min.js";

    LR.registerBlocks(LR);
</script>
<style>
	/* 에디터 최소 높이 */
	.ck-editor__editable {
		height: 500px;
	}
	
	.ck.ck-editor {
		width: 100%;
	}
	
	.quantity.form-control.input-number {
		text-align: center;
		font-size: 14px;
		border: 1px solid rgba(0, 0, 0, 0.05) !important;
		height: 54px !important;
	}
	.remove-button {
		overflow: hidden;
		position: relative;
		border: none;
		padding: 0;
		width: 2em; height: 2em;
		border-radius: 50%;
		background: transparent;
		color: #82ae46;
		font: inherit;
		text-indent: 100%;
		cursor: pointer;
		
		&:focus {
			outline: solid 0 transparent;
			box-shadow: 0 0 0 2px #8ed0f9
		}
		&:hover {
			background: rgba(29, 161, 142, .1)
		}
		&:before, &:after {
			position: absolute;
			top: 15%; left: calc(50% - .0625em);
			width: .125em; height: 70%;
			border-radius: .125em;
			transform: rotate(45deg);
			background: currentcolor;
			content: ''
		}
		&:after { 
			transform: rotate(-45deg); 
		}
	}
	.tagcloud a {
		font-size: 18px;
	}
	.my-config {
	  --darkmode: 0;
	  --h-accent: 223;
	  --s-accent: 100%;
	  --l-accent: 61%;
	}
	lr-file-uploader-minimal {
		width: 100%;
	}
	.cart-list {
		margin-bottom: 30px;
	}
	.col-lg-3 {
		flex: 0 0 20%;
    	max-width: 20%;
	}
</style>
</head>
<body class="goto-here">
	<!-- 헤더 부분 태그 -->
	<try:nav />
	<div class="hero-wrap hero-bread" style="background-image: url('images/bg_1.jpg')">
		<div class="container">
			<div class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-9 ftco-animate text-center">
					<p class="breadcrumbs">
						<span class="mr-2"><a href="main.do">Home</a></span> <span>Blog</span>
					</p>
					<h1 class="mb-0 bread">리뷰수정</h1>
				</div>
			</div>
		</div>
	</div>
	<form action="updateReview.do" method="post">
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
								<td class="image-prod"><div class="img" style="background-image:url(${ reviewData.imageUrl });"></div></td>
								<td class="product-name">
									<h3>${ reviewData.teaName }</h3>
									<p>${ reviewData.teaContent }</p>
								</td>
								<td class="price">${ reviewData.buySerial }</td>
								<td class="quantity">
									<div class="input-group">
										<input type="text" name="quantity" class="quantity form-control input-number" value="${ reviewData.buyCnt }">
									</div>
								</td>
								<td class="total">${ reviewData.memberId }</td>
							</tr>
							<!-- END TR-->
						</tbody>
					</table>
				</div>
				<div class="row" id="reviewImagesThumbnail">
					
				</div>
				<div class="row">
					<input type="hidden" name="buySerial" value="${ reviewData.buySerial }"> <input type="hidden" name="reviewNum" value="${ reviewData.reviewNum }">
					<div id="reviewImages">
						
					</div>
					<lr-config
					    ctx-name="my-uploader"
					    pubkey="86c01c87f383d8c2191c"
					    max-local-file-size-bytes="10000000"
					    multiple-max="10"
					    img-only="true"
					></lr-config>
					<lr-file-uploader-minimal
					    css-src="https://cdn.jsdelivr.net/npm/@uploadcare/blocks@0.25.0/web/lr-file-uploader-minimal.min.css"
					    ctx-name="my-uploader"
					    class="my-config"
					>
					</lr-file-uploader-minimal>
					<lr-data-output
					  ctx-name="my-uploader"
					  use-console
					  use-input
					  use-group
					  use-event
					></lr-data-output>
					<textarea id="editor" name="reviewContent">
						${ reviewData.reviewContent }
					</textarea>
					<!-- CKEditor -->
					<script>
						ClassicEditor.create(document.querySelector("#editor"), {
							language: "ko",
						}).catch((error) => {
							console.error(error);
						});
					</script>
					<script>
			        	const reviewImagesContainer = document.getElementById("reviewImages");
						const reviewImagesThumbnailContainer = document.getElementById("reviewImagesThumbnail");
						const dataOutput = document.querySelector('lr-data-output');
				        
						dataOutput.addEventListener('lr-data-output', (event) => {
				        	reviewImagesContainer.replaceChildren();
				        	reviewImagesThumbnailContainer.replaceChildren();
				        	for (var i = 0; i < event.detail.data.files.length; i++) {
					        	console.log(event.detail.data.files[i].cdnUrl);
					        	
				        		const reviewImage = document.createElement("input");
				        		reviewImage.type = "hidden";
				        		reviewImage.value = event.detail.data.files[i].cdnUrl;
				        		reviewImage.setAttribute("name", "reviewImage");
				        		reviewImagesContainer.appendChild(reviewImage);
				        		
				        		var reviewImageThumbnailHtml = "";
				        		reviewImageThumbnailHtml += "<div class='col-md-6 col-lg-3 ftco-animate'>";
				        		reviewImageThumbnailHtml += 	"<div class='product'>";
				        		reviewImageThumbnailHtml += 		"<a href='#' class='img-prod'>";
				        		reviewImageThumbnailHtml += 			"<img class='img-fluid' src=" + event.detail.data.files[i].cdnUrl + " alt='Colorlib Template'>";
				        		reviewImageThumbnailHtml += 			"<div class='overlay'></div>";
				        		reviewImageThumbnailHtml += 		"</a>";
				        		reviewImageThumbnailHtml += 	"</div>";
				        		reviewImageThumbnailHtml += "</div>";
				        		reviewImagesThumbnailContainer.innerHTML += reviewImageThumbnailHtml;
				        	}
				        });
			        </script>
					<input type="text" class="form-control" id="hashtags-input" placeholder="해시태그를 입력해주세요.">
					<input type="hidden" id="reviewHashtag">
					<div class="tag-widget post-tag-container mb-5 mt-5">
						<div id="hashtags-container" class="tagcloud">
						<script>
							const hashtagsInput = document.getElementById("hashtags-input");
			            	const hashtagsContainer = document.getElementById("hashtags-container");
			            	
			            	let hashtags = [];
						
			            	function addHashtag(tag) {
			            		if (hashtags.length > 2) {
			            			return;
			            		}
			            		if (tag && !hashtags.includes(tag)) {
			            			const a = document.createElement("a");
			            			a.innerText = "# " + tag;
			            			a.classList.add("tag-cloud-link");
			            			const i = document.createElement("input");
			            			i.type = "hidden";
			            			i.value = tag;
			            			i.setAttribute("name", "reviewHashtag");
			            			
			            			const removeButton = document.createElement("button");
			            			removeButton.innerText = "X";
			            			removeButton.classList.add("remove-button");
			            			removeButton.addEventListener("click", () => {
			            				hashtagsContainer.removeChild(a);
			            				hashtagsContainer.removeChild(i);
			            				hashtags = hashtags.filter((hashtag) => hashtag !== tag);
			            				document.getElementById("reviewHashtag").value = hashtags;
			            				console.log(hashtags);
			            				console.log(document.getElementById("reviewHashtag").value);
			            			});
			            			a.appendChild(removeButton);
			            			hashtagsContainer.appendChild(a);
			            			hashtagsContainer.appendChild(i);
			            			hashtags.push(tag);
			            			
			            			document.getElementById("reviewHashtag").value = hashtags;
			            			console.log(hashtags);
			            			console.log(document.getElementById("reviewHashtag").value);
			            		}
			            	}
			            	
			            	hashtagsInput.addEventListener("keydown", (event) => {
			            		if (event.key === 'Enter') {
			            			event.preventDefault();
			            			const tag = hashtagsInput.value.trim();
			            			if (tag) {
			            				addHashtag(tag);
			            				hashtagsInput.value = "";
			            			}
			            		}
			            	});
			            </script>
							<c:if test="${ reviewData.reviewHashtags ne null }">
								<c:forEach var="reviewHashtag" items="${ reviewData.reviewHashtags }">
									<script>
										var tag = "${ reviewHashtag.reviewHashtagContent }";
										addHashtag(tag);
									</script>
								</c:forEach>
							</c:if>
						</div>
					</div>
				</div>
				<input type="submit" class="btn btn-primary py-3 px-4" value="후기수정">
			</div>
		</section>
	</form>
	<!-- .section -->

	<footer class="ftco-footer ftco-section bg-light">
		<div class="container">
			<div class="row">
				<div class="mouse">
					<a href="#" class="mouse-icon">
						<div class="mouse-wheel">
							<span class="ion-ios-arrow-up"></span>
						</div>
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
					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>
                document.write(new Date().getFullYear());
              </script>
						All rights reserved | This template is made with <i class="icon-heart color-danger" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>
	</footer>

	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
        <circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
        <circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" />
      </svg>
	</div>

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
