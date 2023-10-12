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
  <!-- 파비콘 태그 -->
  <try:favicon/>
<style type="text/css">

  a {
  	text-decoration: none;
  }

  a:hover {
    text-decoration: underline;
    color: black;
  }
  
  a:link { color: red; text-decoration: none;}
  a:visited { color: black; text-decoration: none;}
  a:hover { color: blue; text-decoration: underline;}
 
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
                                    <button class="btn btn-primary btn-lg text-white mb-0 me-0" type="button" onclick="addCate();"><i class="mdi mdi-account-plus"></i>새 카테고리 추가</button>
                                  </div>
                                </div>
                                <div class="table-responsive  mt-1">
                                  <table class="table select-table">
                                    <thead>
                                      <tr>
                                        <th><h6>카테고리</h6></th>
                                        <th><h6>판매현황</h6></th>
                                        <th><h6>상태</h6></th>
                                      </tr>
                                    </thead>
                                    <tbody>
                                    <!-- 반복 시작 -->
                                    <c:forEach var="categoryData" items="${categoryDatas}">
                                      <tr>
                                        <td>
                                          <div class="d-flex ">
                                            <img src="Ad/images/default.png" alt="카테고리 이미지">
                                            <div>
                                              <h6 id="cateName"><a href="adminCategory.do?categoryNum=${categoryData.categoryNum}&categoryName=${categoryData.categoryName}">${categoryData.categoryName}</a></h6>
                                            </div>
                                          </div>
                                        </td>
                                        <td>
                                          <div>
                                           <p>총 ${categoryData.buyCnt}개</p>
                                          </div>
                                        </td>
                                        
                                        <td>
                                        <c:if test="${ categoryData.categoryNum ne 0 }">
                                        	<button type="button" class="btn btn-danger" onclick="fixCate('${categoryData.categoryNum}', '${categoryData.categoryName}')">수정</button>
                                        	<button type="button" class="btn btn-info" onclick="delCate('${categoryData.categoryNum}', '${categoryData.categoryName}')">삭제</button>
                                      	</c:if>
                                        </td>
                                      </tr>
                                      </c:forEach>
                                       <!-- 반복 끝 -->
                                    </tbody>
                                  </table>
                                </div>
                              </div>
                              <!-- 차트 시작 -->
<div class="card-body">
	<div class="chartjs-size-monitor">
		<div class="chartjs-size-monitor-expand">
			<div class=""></div>
		</div>
		<div class="chartjs-size-monitor-shrink">
			<div class=""></div>
		</div>
	</div>
<h4 class="card-title">카테고리 별 판매량</h4>
<canvas id="barChart" style="display: block; height: 342px; width: 685px;" width="1370" height="684" class="chartjs-render-monitor"></canvas>
</div>
<!-- 차트 끝 -->

<!-- 차트 시작 -->
<div class="card-body">
	<div class="chartjs-size-monitor">
		<div class="chartjs-size-monitor-expand">
			<div class=""></div>
		</div>
		<div class="chartjs-size-monitor-shrink">
			<div class=""></div>
		</div>
	</div>
<h4 class="card-title">플랫폼별 사용자 수</h4>
<canvas id="pieChart" style="display: block; height: 342px; width: 685px;" width="1370" height="684" class="chartjs-render-monitor"></canvas>
</div>
<!-- 차트 끝 -->


<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script type="text/javascript">
var labelss = [];
var datas = [];
<c:forEach var="categoryData" items="${categoryDatas}">
labelss.push('${categoryData.categoryName}');
datas.push(${categoryData.buyCnt});
</c:forEach>
var labels2 = [];
var datas2 = [];
<c:forEach var="memberData" items="${memberDatas}">
labels2.push('${memberData.memberPlatform}');
datas2.push(${memberData.memberGrade});
</c:forEach>
			// bar 차트 시작 카테고리별 판매량
            var context = document
                .getElementById('barChart')
                .getContext('2d');
            var barChart = new Chart(context, {
                type: 'bar', // 차트의 형태
                data: { // 차트에 들어갈 데이터
                    labels: 
                        //x 축
                        labelss //녹차 홍차 ...(카테고리 명)
                    ,
                    datasets: [
                        { //데이터
                            label: '판매량', //차트 제목
                            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                            data: 
                            	datas //x축 label에 대응되는 데이터 값 // 판매량
                            ,
                            backgroundColor: [
                                //색상
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(153, 102, 255, 0.2)',
                                'rgba(255, 159, 64, 0.2)'
                            ],
                            borderColor: [
                                //경계선 색상
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)'
                            ],
                            borderWidth: 1 //경계선 굵기
                        }/* ,
                        {
                            label: 'test2',
                            fill: false,
                            data: [
                                8, 34, 12, 24
                            ],
                            backgroundColor: 'rgb(157, 109, 12)',
                            borderColor: 'rgb(157, 109, 12)'
                        } */
                    ]
                },
                options: {
                    scales: {
                        yAxes: [
                            {
                                ticks: {
                                    beginAtZero: true
                                }
                            }
                        ]
                    }
                }
            });
            
			// pie 차트 시작 카테고리별 판매량
            var context = document
                .getElementById('pieChart')
                .getContext('2d');
            var pieChart = new Chart(context, {
                type: 'pie', // 차트의 형태
                data: { // 차트에 들어갈 데이터
                    labels: 
                        //x 축
                        labels2 //(플랫폼 명)
                    ,
                    datasets: [
                        { //데이터
                            label: '사용자 수', //차트 제목
                            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                            data: 
                            	datas2 //x축 label에 대응되는 데이터 값 // 판매량
                            ,
                            backgroundColor: [
                                //색상
                                'rgba(255, 99, 132, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(153, 102, 255, 0.2)',
                                'rgba(255, 159, 64, 0.2)'
                            ],
                            borderColor: [
                                //경계선 색상
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)'
                            ],
                            borderWidth: 1 //경계선 굵기
                        }/* ,
                        {
                            label: 'test2',
                            fill: false,
                            data: [
                                8, 34, 12, 24
                            ],
                            backgroundColor: 'rgb(157, 109, 12)',
                            borderColor: 'rgb(157, 109, 12)'
                        } */
                    ]
                }
            });
        </script>
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
    	
		if(categoryNum > 0){
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
			 
		 }
		 else{
			 alert('해당 카테고리는 수정할 수 없습니다!');
			 return false;
		 }
    	

    }
}

function delCate(categoryNum, categoryName) {
	 if (confirm("정말 삭제하시겠습니까??") == true){    //확인
	    	
		 if(categoryNum > 0){
			 
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
	    	
		 }
		 else{
			 alert('해당 카테고리는 삭제할 수 없습니다!');
			 return false;
		 }
	 }
	 else{   //취소
	     return false;

	 }
}

</script>
<script type="text/javascript">
function addCate(categoryName) {
    var resAdd = prompt('추가하실 카테고리명을 입력하세요');
    if (resAdd !== null) {
        console.log(resAdd);
        
        $.ajax({
            url: 'insertCategory.do?categoryName='+resAdd,
            type: 'POST',
            success: function(fresult){
                //console.log('favorResult [' + favorResult + ']');
              	
            },
            error: function(error){
               alert('error [' + error + ']');
            }
         });
    }
}

</script>
</body>

</html>
