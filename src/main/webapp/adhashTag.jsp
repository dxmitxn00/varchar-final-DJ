<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="try"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Star Admin2 </title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="Ad/vendors/feather/feather.css">
  <link rel="stylesheet" href="Ad/vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="Ad/vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="Ad/vendors/typicons/typicons.css">
  <link rel="stylesheet" href="Ad/vendors/simple-line-icons/css/simple-line-icons.css">
  <link rel="stylesheet" href="Ad/vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <!-- Plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="Ad/css/vertical-layout-light/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="Ad/images/favicon.png" />
<style type="text/css">

  a {
  	text-decoration: none;
  }

  a:hover {
    text-decoration: underline;
    color: black;
  }
  
  .hashTagItem {
    display: flex; /* 입력 필드와 버튼을 가로로 정렬 */
 
}

.hashTagItem button {
    margin-top: 10px; /* 원하는 간격으로 조정 */
    margin-right: 5px;
}
</style>    
</head>

<body>
  <div class="container-scroller">
    <!-- partial:Ad/partials/_navbar.html -->
    <try:adnav/>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:Ad/partials/_settings-panel.html -->
      <try:adpartial/>
      <!-- partial -->
      <!-- partial:Ad/partials/_sidebar.html -->
      <try:adsidebar/>
      <!-- partial -->
      <div class="main-panel">          
        <div class="content-wrapper">
          <div class="row">
            <div class="col-12 grid-margin stretch-card">
              <div class="card">
                <div class="row">
                  <div class="col-md-6">
                    <div class="card-body">
                      <h4 class="card-title">상품 해시태그 추가/삭제/수정</h4>
                      <p class="card-description">Add class <code>.btn-{color}</code> for buttons in theme colors</p>
                      <div class="template-demo">
									  <div class="form-group">
										<h5><strong>상품 카테고리 선택 [1) 카테코리를 먼저 지정한다.]</strong></h5>
										<select class="form-control" id="exampleFormControlSelect2">
											<option>$-{teaData.teaCategory}</option>
											<option>$-{teaData.teaCategory}</option>
											<option>$-{teaData.teaCategory}</option>
											<option>$-{teaData.teaCategory}</option>
											<option>$-{teaData.teaCategory}</option>
										</select>
									</div>
										<div class="form-group">
										<h5><strong>상품 선택 [2) 위에서 나눈 카테고리 별로 상품이 출력되게 한다.]</strong></h5>
										<select class="form-control" id="exampleFormControlSelect2">
											<option>$-{teaData.teaNum}</option>
											<option>$-{teaData.teaNum}</option>
											<option>$-{teaData.teaNum}</option>
											<option>$-{teaData.teaNum}</option>
											<option>$-{teaData.teaNum}</option>
										</select>
									</div>
                    	<form id="hashTagForm" method="post" action="aaa.do" onsubmit="return false;">
                    	<div id="hashTagContainer" class="template-demo">
                         </div> <br>
                        <button type="button" class="btn btn-primary">저장(Save)</button>
                        </form>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="card-body">
                      <h4 class="card-title">해시태그 입력란</h4>
                      <p class="card-description">Add class <code>.btn-rounded</code></p>
                      <div class="template-demo">
                    	<div id="hashTagMaker" class="template-demo">
                        <button type="button" id="addHashTag" class="btn btn-dark btn-rounded btn-fw">직접 입력 ㅇㅇ</button>
                         </div> <br>
                        <button type="button" class="btn btn-primary">저장(Save)</button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-12 grid-margin stretch-card">
              <div class="card">
                <div class="row">
                  <div class="col-md-6">
                    <div class="card-body">
                      <h4 class="card-title">여기부터 밑엔 걍 안봐도됨</h4>
                      <p class="card-description">Add class <code>.btn-{color}</code> for buttons in theme colors</p>
                      <div class="template-demo">
									  <div class="form-group">
										<h5><strong>상품 카테고리 선택 [1) 카테코리를 먼저 지정한다.]</strong></h5>
										<select class="form-control" id="exampleFormControlSelect2">
											<option>$-{teaData.teaCategory}</option>
											<option>$-{teaData.teaCategory}</option>
											<option>$-{teaData.teaCategory}</option>
											<option>$-{teaData.teaCategory}</option>
											<option>$-{teaData.teaCategory}</option>
										</select>
									</div>
										<div class="form-group">
										<h5><strong>상품 선택 [2) 위에서 나눈 카테고리 별로 상품이 출력되게 한다.]</strong></h5>
										<select class="form-control" id="exampleFormControlSelect2">
											<option>$-{teaData.teaNum}</option>
											<option>$-{teaData.teaNum}</option>
											<option>$-{teaData.teaNum}</option>
											<option>$-{teaData.teaNum}</option>
											<option>$-{teaData.teaNum}</option>
										</select>
									</div>
                    	<div id="hashTagFix" class="template-demo">
                         </div> <br>
                        <button type="button" class="btn btn-primary">저장(Save)</button>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="card-body">
                      <h4 class="card-title">후기 해시태그 변경</h4>
                      <p class="card-description">Add class <code>.btn-rounded</code></p>
                      <div class="template-demo">
                        <button type="button" class="btn btn-primary btn-rounded btn-fw">Primary</button>
                        <button type="button" class="btn btn-secondary btn-rounded btn-fw">Secondary</button>
                        <button type="button" class="btn btn-success btn-rounded btn-fw">Success</button>
                        <button type="button" class="btn btn-danger btn-rounded btn-fw">Danger</button>
                        <button type="button" class="btn btn-warning btn-rounded btn-fw">Warning</button>
                        <button type="button" class="btn btn-info btn-rounded btn-fw">Info</button>
                        <button type="button" class="btn btn-light btn-rounded btn-fw">Light</button>
                        <button type="button" class="btn btn-dark btn-rounded btn-fw">Dark</button>
                        <button type="button" class="btn btn-link btn-rounded btn-fw">Link</button>
                        <button type="button" id="addHashTag" class="btn btn-dark btn-rounded btn-fw">직접 입력 ㅇㅇ</button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-8 grid-margin stretch-card">
              <div class="card">
                <div class="row">
                  <div class="col-md-7">
                    <div class="card-body">
                    <h4 class="card-title">Icon Buttons</h4>
                    <p class="card-description">Add class <code>.btn-icon</code> for buttons with only icons</p>
                    <div class="template-demo d-flex justify-content-between flex-nowrap">
                      <button type="button" class="btn btn-primary btn-rounded btn-icon">
                        <i class="ti-home"></i>
                      </button>
                      <button type="button" class="btn btn-dark btn-rounded btn-icon">
                        <i class="ti-world"></i>
                      </button>
                      <button type="button" class="btn btn-danger btn-rounded btn-icon">
                        <i class="ti-email"></i>
                      </button>
                      <button type="button" class="btn btn-info btn-rounded btn-icon">
                        <i class="ti-star"></i>
                      </button>
                      <button type="button" class="btn btn-success btn-rounded btn-icon">
                        <i class="ti-location-pin"></i>
                      </button>
                    </div>
                    <div class="template-demo d-flex justify-content-between flex-nowrap">
                      <button type="button" class="btn btn-inverse-primary btn-rounded btn-icon">
                        <i class="ti-home"></i>
                      </button>
                      <button type="button" class="btn btn-inverse-dark btn-icon">
                        <i class="ti-world"></i>
                      </button>
                      <button type="button" class="btn btn-inverse-danger btn-icon">
                        <i class="ti-email"></i>
                      </button>
                      <button type="button" class="btn btn-inverse-info btn-icon">
                        <i class="ti-star"></i>
                      </button>
                      <button type="button" class="btn btn-inverse-success btn-icon">
                        <i class="ti-location-pin"></i>
                      </button>
                    </div>
                    <div class="template-demo d-flex justify-content-between flex-nowrap mt-4">
                      <button type="button" class="btn btn-outline-secondary btn-rounded btn-icon">
                        <i class="ti-heart text-danger"></i>
                      </button>
                      <button type="button" class="btn btn-outline-secondary btn-rounded btn-icon">
                        <i class="ti-music-alt text-dark"></i>
                      </button>
                      <button type="button" class="btn btn-outline-secondary btn-rounded btn-icon">
                        <i class="ti-star text-primary"></i>
                      </button>
                      <button type="button" class="btn btn-outline-secondary btn-rounded btn-icon">
                        <i class="ti-bar-chart-alt text-info"></i>                          
                      </button>
                      <button type="button" class="btn btn-outline-secondary btn-rounded btn-icon">
                        <i class="ti-stats-up text-success"></i>                          
                      </button>
                    </div>
                    <div class="template-demo d-flex justify-content-between flex-nowrap">
                      <button type="button" class="btn btn-outline-secondary btn-rounded btn-icon">
                        <i class="ti-heart"></i>
                      </button>
                      <button type="button" class="btn btn-outline-secondary btn-rounded btn-icon">
                        <i class="ti-music-alt"></i>
                      </button>
                      <button type="button" class="btn btn-outline-secondary btn-rounded btn-icon">
                        <i class="ti-star"></i>
                      </button>
                      <button type="button" class="btn btn-outline-secondary btn-rounded btn-icon">
                        <i class="ti-bar-chart-alt"></i>                          
                      </button>
                      <button type="button" class="btn btn-outline-secondary btn-rounded btn-icon">
                        <i class="ti-stats-up"></i>                          
                      </button>
                    </div>
                  </div>
                  </div> 
                  <div class="col-md-5">
                    <div class="card-body">
                      <h4 class="card-title">Button Size</h4>
                      <p class="card-description">Use class <code>.btn-{size}</code></p>
                      <div class="template-demo">
                        <button type="button" class="btn btn-outline-secondary btn-lg">btn-lg</button>
                        <button type="button" class="btn btn-outline-secondary btn-md">btn-md</button>
                        <button type="button" class="btn btn-outline-secondary btn-sm">btn-sm</button>
                      </div>
                      <div class="template-demo mt-4">
                        <button type="button" class="btn btn-danger btn-lg">btn-lg</button>
                        <button type="button" class="btn btn-success btn-md">btn-md</button>
                        <button type="button" class="btn btn-primary btn-sm">btn-sm</button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-4 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">Block buttons</h4>
                  <p class="card-description">Add class <code>.btn-block</code></p>
                  <div class="template-demo">
                    <button type="button" class="btn btn-info btn-lg btn-block">Block buttons
                      <i class="ti-menu float-right"></i>
                    </button>
                    <button type="button" class="btn btn-dark btn-lg btn-block">Block buttons</button>
                    <button type="button" class="btn btn-primary btn-lg btn-block">
                      <i class="ti-user"></i>                      
                      Block buttons
                    </button>
                    <button type="button" class="btn btn-outline-secondary btn-lg btn-block">Block buttons</button>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-12 grid-margin">
              <div class="card">
                <div class="row">
                  <div class="col-md-6">
                    <div class="card-body">
                      <h4 class="card-title">Button groups</h4>
                      <p class="card-description">Wrap a series of buttons with <code>.btn</code> 
                        in <code>.btn-group</code></p>
                      <div class="template-demo">
                        <div class="btn-group" role="group" aria-label="Basic example">
                          <button type="button" class="btn btn-outline-secondary">1</button>
                          <button type="button" class="btn btn-outline-secondary">2</button>
                          <button type="button" class="btn btn-outline-secondary">3</button>
                        </div>
                        <div class="btn-group" role="group" aria-label="Basic example">
                          <button type="button" class="btn btn-outline-secondary">
                            <i class="ti-heart"></i>
                          </button>
                          <button type="button" class="btn btn-outline-secondary">
                            <i class="ti-calendar"></i>
                          </button>
                          <button type="button" class="btn btn-outline-secondary">
                            <i class="ti-time"></i>
                          </button>
                        </div>
                      </div>
                      <div class="template-demo">
                        <div class="btn-group" role="group" aria-label="Basic example">
                          <button type="button" class="btn btn-primary">1</button>
                          <button type="button" class="btn btn-primary">2</button>
                          <button type="button" class="btn btn-primary">3</button>
                        </div>
                        <div class="btn-group" role="group" aria-label="Basic example">
                          <button type="button" class="btn btn-primary">
                            <i class="ti-heart"></i>
                          </button>
                          <button type="button" class="btn btn-primary">
                            <i class="ti-calendar"></i>
                          </button>
                          <button type="button" class="btn btn-primary">
                            <i class="ti-time"></i>
                          </button>
                        </div>
                      </div>
                      <div class="template-demo mt-4">
                        <div class="btn-group-vertical" role="group" aria-label="Basic example">
                          <button type="button" class="btn btn-outline-secondary">
                            <i class="ti-upload"></i>
                          </button>
                          <button type="button" class="btn btn-outline-secondary">
                            <i class="ti-split-v"></i>
                          </button>
                          <button type="button" class="btn btn-outline-secondary">
                            <i class="ti-download"></i>
                          </button>
                        </div>
                        <div class="btn-group-vertical" role="group" aria-label="Basic example">
                          <button type="button" class="btn btn-outline-secondary">Default</button>
                          <div class="btn-group">
                            <button type="button" class="btn btn-outline-secondary dropdown-toggle" data-bs-toggle="dropdown">Dropdown</button>
                            <div class="dropdown-menu">
                              <a class="dropdown-item">Go back</a>
                              <a class="dropdown-item">Delete</a>
                              <a class="dropdown-item">Swap</a>
                            </div>                          
                          </div>
                          <button type="button" class="btn btn-outline-secondary">Default</button>
                        </div>
                        <div class="btn-group-vertical" role="group" aria-label="Basic example">
                          <button type="button" class="btn btn-outline-secondary">Top</button>
                          <button type="button" class="btn btn-outline-secondary">Middle</button>                          
                          <button type="button" class="btn btn-outline-secondary">Bottom</button>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="card-body">
                      <h4 class="card-title">Button with text and icon</h4>
                      <p class="card-description">Wrap icon and text inside <code>.btn-icon-text</code> and use <code>.btn-icon-prepend</code> 
                        or <code>.btn-icon-append</code> for icon tags</p>
                      <div class="template-demo">
                        <button type="button" class="btn btn-primary btn-icon-text">
                          <i class="ti-file btn-icon-prepend"></i>
                          Submit
                        </button>
                        <button type="button" class="btn btn-dark btn-icon-text">
                          Edit
                          <i class="ti-file btn-icon-append"></i>                          
                        </button>
                        <button type="button" class="btn btn-success btn-icon-text">
                          <i class="ti-alert btn-icon-prepend"></i>                                                    
                          Warning
                        </button>
                      </div>
                      <div class="template-demo">
                        <button type="button" class="btn btn-danger btn-icon-text">
                          <i class="ti-upload btn-icon-prepend"></i>                                                    
                          Upload
                        </button>
                        <button type="button" class="btn btn-info btn-icon-text">
                          Print
                          <i class="ti-printer btn-icon-append"></i>                                                                              
                        </button>
                        <button type="button" class="btn btn-warning btn-icon-text">
                          <i class="ti-reload btn-icon-prepend"></i>                                                    
                          Reset
                        </button>
                      </div>
                      <div class="template-demo mt-2">
                        <button type="button" class="btn btn-outline-primary btn-icon-text">
                          <i class="ti-file btn-icon-prepend"></i>
                          Submit
                        </button>
                        <button type="button" class="btn btn-outline-secondary btn-icon-text">
                          Edit
                          <i class="ti-file btn-icon-append"></i>                          
                        </button>
                        <button type="button" class="btn btn-outline-success btn-icon-text">
                          <i class="ti-alert btn-icon-prepend"></i>                                                    
                          Warning
                        </button>
                      </div>
                      <div class="template-demo">
                        <button type="button" class="btn btn-outline-danger btn-icon-text">
                          <i class="ti-upload btn-icon-prepend"></i>                                                    
                          Upload
                        </button>
                        <button type="button" class="btn btn-outline-info btn-icon-text">
                          Print
                          <i class="ti-printer btn-icon-append"></i>                                                                              
                        </button>
                        <button type="button" class="btn btn-outline-warning btn-icon-text">
                          <i class="ti-reload btn-icon-prepend"></i>                                                    
                          Reset
                        </button>
                      </div>
                      <div class="template-demo mt-2">
                        <button class="btn btn-outline-dark btn-icon-text">
                          <i class="ti-apple btn-icon-prepend"></i>
                          <span class="d-inline-block text-left">
                            <small class="fw-light d-block">Available on the</small>
                            App Store
                          </span>
                        </button>
                        <button class="btn btn-outline-dark btn-icon-text">
                          <i class="ti-android btn-icon-prepend"></i>
                          <span class="d-inline-block text-left">
                            <small class="fw-light d-block">Get it on the</small>
                            Google Play
                          </span>
                        </button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-6 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">Social Icon Buttons</h4>
                  <p class="card-description">Add class <code>.btn-social-icon</code></p>
                  <div class="template-demo">
                    <button type="button" class="btn btn-social-icon btn-outline-facebook"><i class="ti-facebook"></i></button>
                    <button type="button" class="btn btn-social-icon btn-outline-youtube"><i class="ti-youtube"></i></button>                                        
                    <button type="button" class="btn btn-social-icon btn-outline-twitter"><i class="ti-twitter-alt"></i></button>
                    <button type="button" class="btn btn-social-icon btn-outline-dribbble"><i class="ti-dribbble"></i></button>
                    <button type="button" class="btn btn-social-icon btn-outline-linkedin"><i class="ti-linkedin"></i></button>
                    <button type="button" class="btn btn-social-icon btn-outline-google"><i class="ti-google"></i></button>
                  </div>
                  <div class="template-demo">
                    <button type="button" class="btn btn-social-icon btn-facebook"><i class="ti-facebook"></i></button>
                    <button type="button" class="btn btn-social-icon btn-youtube"><i class="ti-youtube"></i></button>                                        
                    <button type="button" class="btn btn-social-icon btn-twitter"><i class="ti-twitter-alt"></i></button>
                    <button type="button" class="btn btn-social-icon btn-dribbble"><i class="ti-dribbble"></i></button>
                    <button type="button" class="btn btn-social-icon btn-linkedin"><i class="ti-linkedin"></i></button>
                    <button type="button" class="btn btn-social-icon btn-google"><i class="ti-google"></i></button>
                  </div>
                  <div class="template-demo">
                    <button type="button" class="btn btn-social-icon btn-facebook btn-rounded"><i class="ti-facebook"></i></button>
                    <button type="button" class="btn btn-social-icon btn-youtube btn-rounded"><i class="ti-youtube"></i></button>                                        
                    <button type="button" class="btn btn-social-icon btn-twitter btn-rounded"><i class="ti-twitter-alt"></i></button>
                    <button type="button" class="btn btn-social-icon btn-dribbble btn-rounded"><i class="ti-dribbble"></i></button>
                    <button type="button" class="btn btn-social-icon btn-linkedin btn-rounded"><i class="ti-linkedin"></i></button>
                    <button type="button" class="btn btn-social-icon btn-google btn-rounded"><i class="ti-google"></i></button>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-6 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">Social button with text</h4>
                  <p class="card-description">Add class <code>.btn-social-icon-text</code></p>
                  <div class="template-demo">
                    <button type="button" class="btn btn-social-icon-text btn-facebook"><i class="ti-facebook"></i>Facebook</button>
                    <button type="button" class="btn btn-social-icon-text btn-youtube"><i class="ti-youtube"></i>Youtube</button>                                        
                    <button type="button" class="btn btn-social-icon-text btn-twitter"><i class="ti-twitter-alt"></i>Twitter</button>
                    <button type="button" class="btn btn-social-icon-text btn-dribbble"><i class="ti-dribbble"></i>Dribbble</button>
                    <button type="button" class="btn btn-social-icon-text btn-linkedin"><i class="ti-linkedin"></i>Linkedin</button>
                    <button type="button" class="btn btn-social-icon-text btn-google"><i class="ti-google"></i>Google</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- content-wrapper ends -->
        <!-- partial:Ad/partials/_footer.html -->
        <footer class="footer">
          <div class="d-sm-flex justify-content-center justify-content-sm-between">
            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Premium <a href="https://www.bootstrapdash.com/" target="_blank">Bootstrap admin template</a> from BootstrapDash.</span>
            <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Copyright © 2021. All rights reserved.</span>
          </div>
        </footer>
        <!-- partial -->
      </div>
      <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->
  <!-- plugins:js -->
  <script src="Ad/vendors/js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page -->
  <script src="Ad/vendors/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
  <!-- End plugin js for this page -->
  <!-- inject:js -->
  <script src="Ad/js/off-canvas.js"></script>
  <script src="Ad/js/hoverable-collapse.js"></script>
  <script src="Ad/js/template.js"></script>
  <script src="Ad/js/settings.js"></script>
  <script src="Ad/js/todolist.js"></script>
  <!-- endinject -->

<script>
        // 예비 스크립트
      // <div id="hashTagContainer"> 요소를 가져오기
var hashTagContainer = document.getElementById("hashTagContainer");
var isButtonVisible = false;


// <div> 내의 클릭 이벤트를 처리
hashTagContainer.addEventListener("click", function(event) {
    // 클릭한 요소를 가져오기
    var clickedElement = event.target;
    // 클릭한 요소가 <input> 요소이며 클래스에 "btn"이 포함되어 있는 경우에만 해당 요소를 삭제
    if (clickedElement.tagName === "INPUT" && clickedElement.classList.contains("btn")) {
    	 var containerDiv = clickedElement.nextElementSibling;
    	 // nextElementSibling, nextSibling 모두 같은 노드 레벨의 다음 값을 가져온다.
    	 // 다만 Element는 Element(요소)만 가져오고, nextSibling은 공백이든 텍스트든 가리지 않고 다음값을 가져온다.
         if (!containerDiv || !containerDiv.classList.contains("hashTagItem")) {
             // 버튼이 아직 추가되지 않았으면 수정하기 버튼과 삭제하기 버튼을 추가
             var editButton = document.createElement("button"); // <button> 생성
             editButton.textContent = "수정"; // 브라우저에서 "수정"이라는 글자의 버튼이 나오도록
             editButton.classList.add("btn", "btn-outline-dark", "btn-sm"); // 버튼 디자인 및 색깔 지정

             var deleteButton = document.createElement("button"); // <button> 생성
             deleteButton.textContent = "삭제"; // 브라우저에서 "삭제"라는 글자의 버튼이 나오도록
             deleteButton.classList.add("btn", "btn-outline-danger", "btn-sm"); // 버튼 디자인 및 색깔 지정

             // 위의 수정, 삭제 버튼들을 담아낼 hashTagItem이라는 <div> 생성 
             containerDiv = document.createElement("div");
             containerDiv.classList.add("hashTagItem");

             // <div class="hashTagItem">의 하위요소 (자식) 으로 들어가게 설정 --> <div class="hashTagIem"> *버튼들이 들어갈 공간* </div>
             containerDiv.appendChild(editButton);
             containerDiv.appendChild(deleteButton);

             // div 요소를 <input> 요소 앞에 추가
             clickedElement.parentElement.insertBefore(containerDiv, clickedElement.nextElementSibling);
             isButtonVisible = true; // 요거 밑의 else랑 같이 토글형식 구현
         } else {
             // 클릭한 버튼을 다시 클릭하면 버튼을 숨기도록 설정
             containerDiv.remove();
             isButtonVisible = false;
         }
    	 
             editButton.addEventListener("click", function() {
            	 event.stopPropagation();
            	 var fixTag = prompt("수정할 해시태그를 입력하세요.")
				 var inputElements = hashTagContainer.querySelectorAll("input[type='button']"); // 유효성 검사를 위해 해시태그 입력란 내 모든 input 요소 찾기
				 console.log(inputElements);
                if (Validation.isSpecialCharacterOrNumber(fixTag)) { // 이쪽의 Validation은 script 하단쪽에 모듈화 시킨 상태
                alert("특수 문자나 숫자는 허용되지 않습니다.");
                return;
               } else if (Validation.isMaxLengthExceeded(fixTag, 15)) { // 이미 해시태그를 입력해서 추가하는 곳에 유사한 유효성 검사식이 작성되었기 때문
                alert("해시태그는 총 15자까지만 가능합니다.");
                return;
               } else if (Validation.isNullOrWhitespace(fixTag)) { // js파일 임포트하는거 몰라서... ㅎㅎ ㅈㅅ
                alert("공백은 허용하지 않습니다.");
                return; // 여기까지가 해시태그를 입력해서 추가했을 때의 유효성 검사식 모듈화
                
               //======================== 여기서 부터 해시태그 수정 자체 유효성 검사식 ===============================
            	   
               } else if (fixTag === clickedElement.value){ // 나중에 js 너무 길어진다 싶으면 저희 webapp 폴더 내 js 폴더에 넣어서 가독성 높이고 임포트/익스포트 하는 방향으로 고려하겠음
            	alert("기존의 해시태그와 다른 해시태그를 입력해주세요.");
            	return;
               } else if (hashZungBok(fixTag, inputElements)){ // 위에서 선언한 inputElements 사용 -> 이렇게 안하면 일일히 js에서 for문 돌려야ㅐ한다
            	  alert("해당 상품에 동일한 해시태그가 존재합니다.");
            	  return;
               }
                 // 수정하기 버튼을 클릭했을 때 수행할 동작을 여기에 추가
                 clickedElement.value = fixTag; // clickedElement -> <input name="teaHashTagName">
                 console.log("수정 완료시"); // 콘솔로그로 잘 되는 지 확인 + 위의 메서드는 기존의 아래의 js식에서 진행된 newhashTag를 fixTag로 고치는 것
                 alert("수정이 완료되었습니다!.");
                 return true;
             });
         
             deleteButton.addEventListener("click", function() {
            	 event.stopPropagation();
                 // 삭제하기 버튼을 클릭했을 때 수행할 동작을 여기에 추가
                 if(!confirm("정말로 삭제하시겠어요?")){
                  return;
                 }
                 clickedElement.remove();
                 console.log("삭제시 실행되는 <input> 값 사라짐 로그");
                 containerDiv.remove();
                 console.log("삭제시 실행되는 수정/삭제 버튼 사라짐 로그");
                 alert("삭제 완료!");
                 return true;
                 
             });
     }
 });

// 기존 관리자 페이지에서 제공하는 버튼 디자인 배열 : 후에 해시태그 입력시 밑 배열 디자인 중 하나가 랜덤으로 배정
var classNames = ["btn-success", "btn-warning","btn-info", "btn-dark"];
document.getElementById("addHashTag").addEventListener("click", function() {
	// 해시태그 입력란을 찾기
    var hashTagContainer = document.getElementById("hashTagContainer");
    
    // 해시태그 입력란 안의 모든 <input> 요소를 찾기
    var inputElements = hashTagContainer.querySelectorAll("input[type='button']");
    
    // 현재의 해시태그 개수를 확인
    var currentHashTagCount = inputElements.length;
    
    // 만약 3개를 초과한다면 경고 메시지를 표시 및 빠꾸시키기
    if (currentHashTagCount >= 3) {
        alert("한 상품당 해시태그는 최대 3개까지입니다.");
        return;
    }
	
    var newHashTag = prompt("추가할 해시태그를 입력하세요:");
    
    // 새로운 해시태그 중복 검사
    if (hashZungBok(newHashTag, inputElements)) {
        alert("입력하신 해시태그가 이미 존재합니다.");
        return;
    }
    
    if (newHashTag) {
    	// form에 담겨서 C에게 제출해야 하므로 <input>태그를 만드는 과정
        var hashTagElement = document.createElement("input");
    	// <>를 input으로 설정해준다.
        hashTagElement.type = "button";
    	// 타입은 버튼으로 설정
        hashTagElement.style.display = "block";
    	// 디자인은 블록으로
        // 랜덤으로 버튼 클래스 (버튼 디자인) 선택
        var randomIndex = Math.floor(Math.random() * classNames.length);
        hashTagElement.className = "btn " + classNames[randomIndex];
        // 상단에 설정해둔 var classNames 배열의 인덱스 값중 하나가 랜덤으로 선택됨
        hashTagElement.setAttribute('name','teaHashtagName')
        // 실제로 Form 영역에 담아서 제출해야 하므로, name의 인자를 M이 설정해둔 인자명과 동일하게 설정해서 보내주기 위한 메서드 (setAttribute)
        hashTagElement.value = newHashTag;
        // 해시태그에 특수 문자나 숫자 막기      
        if (/[\d!@#$%^&*()_+{}\[\]:;<>,.?~\\|'"`=\/\-]/.test(newHashTag)) {
            alert("특수 문자나 숫자는 허용되지 않습니다.");
            return;
        }
        else if(newHashTag.length > 15){
        	alert("해시태그는 총 15자까지만 가능합니다.");
        	return;	
        }
        else if(newHashTag === null || newHashTag.trim() === ''){
        	alert("공백은 허용하지 않습니다.");
        	return;
        }
        document.getElementById("hashTagContainer").appendChild(hashTagElement);
//        var hashTagField = document.getElementById("hashTagField");
//        var hiddenInput = document.createElement("input");
//        hiddenInput.type = "hidden";
//        hiddenInput.name = "hashtags[]"; 
//        hiddenInput.value = newHashTag;
 //       hashTagField.appendChild(hiddenInput);
    }
});

function hashZungBok(newHashTag, inputElements) {
    // Set을 사용하여 중복된 해시태그를 확인
    var hashTags = new Set();
    
    // 현재 입력된 해시태그를 Set에 추가
    inputElements.forEach(function(inputElement) {
        var value = inputElement.value;
        hashTags.add(value);
    });

    // 새로운 해시태그가 이미 존재하는지 확인
    return hashTags.has(newHashTag);
}

// 해시태그 수정시 똑같은 유효성 검사가 들어가기 때문에 별도로 모듈화 시킴
const Validation = {
    isSpecialCharacterOrNumber: function(inputString) {
    // 특수문자와 기호 막기
        return /[\d!@#$%^&*()_+{}\[\]:;<>,.?~\\|'"`=\/\-]/.test(inputString);
    },
    isMaxLengthExceeded: function(inputString, maxLength) {
    // 최대 글자수 제한	
        return inputString.length > maxLength;
    },
    isNullOrWhitespace: function(inputString) {
    // 공백 제한	
        return inputString === null || inputString.trim() === '';
    }
};

</script>
</body>
</html>