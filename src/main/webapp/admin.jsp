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
                                    <a href=""><button class="btn btn-primary btn-lg text-white mb-0 me-0" type="button"><i class="mdi mdi-account-plus"></i>새 카테고리 추가</button></a>
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
                                    <c:forEach var="categoryData" items="${categoryDatas}">
                                      <tr>
                                        <td>
                                          <div class="d-flex ">
                                            <img src="Ad/images/faces/face1.jpg" alt="">
                                            <div>
                                              <h6 id="cateName">${categoryData.categoryName}</h6>
                                            </div>
                                          </div>
                                        </td>
                                        <td>
                                          <div>
                                           <p>여기 카테고리당 재고 쓸거냐</p>
                                          </div>
                                        </td>
                                        <td><button type="button" class="btn btn-danger" onclick="fixCate('${categoryData.categoryNum}', '${categoryData.categoryName}')">수정</button>
                                        <button type="button" class="btn btn-info" onclick="delCate('${categoryData.categoryNum}', '${categoryData.categoryName}')">삭제</button></td>
                                      </tr>
                                      </c:forEach>
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
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script type="text/javascript">
function fixCate(categoryNum, categoryName) {
    var resFix = prompt('수정하실 카테고리명을 입력하세요', categoryName);
    if (resFix !== null) {
        console.log(resFix);
        
        
    	var category = {categoryNum: categoryNum, categoryName: resFix };
    	
    	$.ajax({
            url: 'updateCategory.do',
            type: 'POST',
            data: category,
            success: function(fresult){
                //console.log('favorResult [' + favorResult + ']');
              	
            },
            error: function(error){
               alert('error [' + error + ']');
            }
         });

/*         // 요청 본문 데이터를 JSON 형식으로 설정
        var requestData = {
            categoryNum: categoryNum,
            categoryName: resFix
        };
		console.log(requestData);
        // fetch를 사용하여 서버에 POST 요청 보내기
        fetch('/updateCategory.do', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json;charset=UTF-8',
            },
            body: JSON.stringify(requestData),
        })
        .then(function(response) {
            if (!response.ok) {
                throw new Error('네트워크 응답 실패');
            }
            return response.json();
        })
        .then(function(data) {
            console.log(data); // 서버에서 온 응답 데이터 처리
            window.location.reload();
        })
        .catch(function(error) {
            console.error('오류 발생:', error);
        }); */
    }
}

function delCate(categoryNum, categoryName) {
	 if (confirm("정말 삭제하시겠습니까??") == true){    //확인

	    	//var category = {categoryNum: categoryNum, categoryName: resFix };
	    	
	    	$.ajax({
	            url: 'deleteCategory.do?categoryNum='+categoryNum,
	            type: 'POST',
	            success: function(fresult){
	                //console.log('favorResult [' + favorResult + ']');
	              	
	            },
	            error: function(error){
	               alert('error [' + error + ']');
	            }
	         });
	     

	 }else{   //취소

	     return false;

	 }
}

</script>
</body>

</html>
