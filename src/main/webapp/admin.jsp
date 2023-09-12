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
  <title>관리자 페이지 </title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="Ad/vendors/feather/feather.css">
  <link rel="stylesheet" href="Ad/vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="Ad/vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="Ad/vendors/typicons/typicons.css">
  <link rel="stylesheet" href="Ad/vendors/simple-line-icons/css/simple-line-icons.css">
  <link rel="stylesheet" href="Ad/vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <link rel="stylesheet" href="Ad/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
  <link rel="stylesheet" href="Ad/js/select.dataTables.min.css">
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
</style>  
</head>
<body>
  <div class="container-scroller"> 
    <!-- partial -->
    <try:adnav/>
    <div class="container-fluid page-body-wrapper">
      <!-- partial:partials/_settings-panel.html -->
     <try:adpartial/>
      <!-- partial -->
      <!-- partial:partials/_sidebar.html -->
      <try:adsidebar/>
      <!-- partial -->
      <div class="main-panel">
        <div class="content-wrapper">
          <div class="row">
            <div class="col-sm-12">
              <div class="home-tab">
                <div class="d-sm-flex align-items-center justify-content-between border-bottom">
                  <ul class="nav nav-tabs" role="tablist">
                    <li class="nav-item">
                      <a class="nav-link active ps-0" id="home-tab" data-bs-toggle="tab" href="adminTea.do" role="tab" aria-controls="overview" aria-selected="true">상품 관리</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" id="profile-tab" data-bs-toggle="tab" href="adminHashtagTea.do" role="tab" aria-selected="true">상품 해시태그 관리</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" id="contact-tab" data-bs-toggle="tab" href="adminHashtagReview.do" role="tab" aria-selected="true">후기 해시태그 관리</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link border-0" id="more-tab" href="main.do" role="tab" aria-selected="true">Var茶 홈페이지 이동</a>
                    </li>
                  </ul>
                </div>
                <div class="tab-content tab-content-basic">
                  <div class="tab-pane fade show active" id="overview" role="tabpanel" aria-labelledby="overview"> 
                    <div class="row">
                      <div class="col-lg-8 d-flex flex-column">
                        <div class="row flex-grow">
                        <div class="col-12 grid-margin stretch-card">
                            <div class="card card-rounded">
                              <div class="card-body">
                                <div class="d-sm-flex justify-content-between align-items-start">
                                  <div>
                                    <h4 class="card-title card-title-dash">상품 관리 목록</h4>
                                   <p class="card-subtitle card-subtitle-dash">원하시는 상품을 클릭하여 관리하세요</p>
                                  </div>
                                  <div>
                                    <button class="btn btn-primary btn-lg text-white mb-0 me-0" type="button"><i class="mdi mdi-account-plus"></i>새 카테고리 추가</button>
                                  </div>
                                </div>
                                <div class="table-responsive  mt-1">
                                  <table class="table select-table">
                                    <thead>
                                      <tr>
                                        <th><h6>차 종류</h6></th>
                                        <th><h6>재고현황</h6></th>
                                        <th><h6>상태</h6></th>
                                      </tr>
                                    </thead>
                                    <tbody>
                                      <tr>
                                        <td>
                                          <div class="d-flex ">
                                            <img src="Ad/images/faces/face1.jpg" alt="">
                                            <div>
                                            <a href="adteaListPage.do?teaCategory=녹차">
                                              <h6>녹차</h6>
                                              <p>Green Tea</p>
                                             </a>
                                            </div>
                                          </div>
                                        </td>
                                        <td>
                                          <div>
                                            <div class="d-flex justify-content-between align-items-center mb-1 max-width-progress-wrap">
                                              <p class="text-success">79%</p>
                                              <p>85/162</p>
                                            </div>
                                            <div class="progress progress-md">
                                              <div class="progress-bar bg-success" role="progressbar" style="width: 85%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                          </div>
                                        </td>
                                        <td><div class="badge badge-opacity-warning">In progress</div></td>
                                      </tr>
                                      <tr>
                                        <td>
                                          <div class="d-flex">
                                            <img src="Ad/images/faces/face2.jpg" alt="">
                                            <div>
                                            <a href="adteaListPage.do?teaCategory=홍차">
                                              <h6>홍차</h6>
                                              <p>Black Tea</p>
                                              </a>
                                            </div>
                                          </div>
                                        </td>
                                        <td>
                                          <div>
                                            <div class="d-flex justify-content-between align-items-center mb-1 max-width-progress-wrap">
                                              <p class="text-success">65%</p>
                                              <p>85/162</p>
                                            </div>
                                            <div class="progress progress-md">
                                              <div class="progress-bar bg-success" role="progressbar" style="width: 30%" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                          </div>
                                        </td>
                                        <td><div class="badge badge-opacity-warning">In progress</div></td>
                                      </tr>
                                      <tr>
                                        <td>
                                          <div class="d-flex">
                                            <img src="Ad/images/faces/face3.jpg" alt="">
                                            <div>
                                            <a href="adteaListPage.do?teaCategory=우롱차">
                                              <h6>우롱차</h6>
                                              <p>Oolong Tea</p>
                                             </a>
                                            </div>
                                          </div>
                                        </td>
                                        <td>
                                          <div>
                                            <div class="d-flex justify-content-between align-items-center mb-1 max-width-progress-wrap">
                                              <p class="text-success">65%</p>
                                              <p>85/162</p>
                                            </div>
                                            <div class="progress progress-md">
                                              <div class="progress-bar bg-warning" role="progressbar" style="width: 38%" aria-valuenow="38" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                          </div>
                                        </td>
                                        <td><div class="badge badge-opacity-warning">In progress</div></td>
                                      </tr>
                                      <tr>
                                        <td>
                                          <div class="d-flex">
                                            <img src="Ad/images/faces/face4.jpg" alt="">
                                            <div>
                                            <a href="adteaListPage.do?teaCategory=허브차">
                                              <h6>허브차</h6>
                                              <p>Herbal Tea</p>
                                             </a>
                                            </div>
                                          </div>
                                        </td>
                                        <td>
                                          <div>
                                            <div class="d-flex justify-content-between align-items-center mb-1 max-width-progress-wrap">
                                              <p class="text-success">65%</p>
                                              <p>85/162</p>
                                            </div>
                                            <div class="progress progress-md">
                                              <div class="progress-bar bg-danger" role="progressbar" style="width: 15%" aria-valuenow="15" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                          </div>
                                        </td>
                                        <td><div class="badge badge-opacity-danger">Pending</div></td>
                                      </tr>
                                      <tr>
                                        <td>
                                          <div class="d-flex">
                                            <img src="Ad/images/faces/face5.jpg" alt="">
                                            <div>
                                            <a href="adteaListPage.do?teaCategory=루이보스차">
                                              <h6>루이보스차</h6>
                                              <p>Rooibos Tea</p>
                                             </a>
                                            </div>
                                          </div>
                                        </td>
                                        <td>
                                          <div>
                                            <div class="d-flex justify-content-between align-items-center mb-1 max-width-progress-wrap">
                                              <p class="text-success">65%</p>
                                              <p>85/162</p>
                                            </div>
                                            <div class="progress progress-md">
                                              <div class="progress-bar bg-success" role="progressbar" style="width: 65%" aria-valuenow="65" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                          </div>
                                        </td>
                                        <td><div class="badge badge-opacity-success">Completed</div></td>
                                      </tr>
                                    </tbody>
                                  </table>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- content-wrapper ends -->
        <!-- partial:partials/_footer.html -->
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
  <script src="Ad/vendors/chart.js/Chart.min.js"></script>
  <script src="Ad/vendors/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
  <script src="Ad/vendors/progressbar.js/progressbar.min.js"></script>

  <!-- End plugin js for this page -->
  <!-- inject:js -->
  <script src="Ad/js/off-canvas.js"></script>
  <script src="Ad/js/hoverable-collapse.js"></script>
  <script src="Ad/js/template.js"></script>
  <script src="Ad/js/settings.js"></script>
  <script src="Ad/js/todolist.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <script src="Ad/js/dashboard.js"></script>
  <script src="Ad/js/Chart.roundedBarCharts.js"></script>
  <!-- End custom js for this page-->
</body>

</html>
