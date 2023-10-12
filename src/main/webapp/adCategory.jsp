<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
                        <!-- 카드 바디 시작 -->
                            <div class="card card-rounded">
                             <div class="card-body">
                                <div class="d-sm-flex justify-content-between align-items-start">
                                  <div>
                                    <h4 class="card-title card-title-dash">상품 카테고리 관리</h4>
                                   <p class="card-subtitle card-subtitle-dash">원하시는 상품을 클릭하여 관리하세요</p>
                                  </div>
                                  <div>
                                  <!--  -->
											<select id="categorySelect" class="form-control" name="categoryNum">
												<option value="선택하세요" id="none" disabled selected hidden>카테고리 선택</option>
												<c:forEach var="categoryData" items="${categoryDatas}">
													<option value="${categoryData.categoryNum}">${categoryData.categoryName}</option>
												</c:forEach>
											</select>
                                  </div>
                                    <button id="updateCategory" class="btn btn-primary btn-lg text-white mb-0 me-0" type="button"><i class="mdi mdi-account-plus"></i>카테고리 변경</button>
                                </div>
                                <div class="table-responsive  mt-1">
                                  <table class="table select-table">
                                    <thead>
                                      <tr>
                                        <th>
                                          <div class="form-check form-check-flat mt-0">
                                            <label class="form-check-label">
                                              <input type="checkbox" class="form-check-input" aria-checked="false"><i class="input-helper"></i><i class="input-helper"></i></label>
                                          </div>
                                        </th>
                                        <th>상품</th>
                                        <th>가격</th>
                                        <th>보유량</th>
                                        <th>판매현황</th>
                                      </tr>
                                    </thead>
                                    <tbody>
                                    
                                    <c:set var="sum" value="0" />
                                    <!--  반복 시작 -->
                                    <c:forEach var="teaData" items="${teaDatas}">
                                    	<c:set var= "sum" value="${sum + teaData.teaCnt}"/>
                                      <tr>
                                        <td>
                                          <div class="form-check form-check-flat mt-0">
                                            <label class="form-check-label">
                                            <input type="checkbox" class="form-check-input" aria-checked="false" name="teaNums" value="${teaData.teaNum}" ><i class="input-helper"></i><i class="input-helper"></i></label>
                                          </div>
                                        </td>
                                        <td>
                                          <div class="d-flex ">
                                            <img src="${teaData.imageUrl}" alt="상품이미지">
                                            <div>
                                              <h6>${teaData.teaName}</h6>
                                              <p>${teaData.teaNum}</p>
                                            </div>
                                          </div>
                                        </td>
                                        <td>
                                          <h6>${teaData.teaPrice} 원</h6>
                                          <p>${teaData.categoryName}</p>
                                        </td>
                                        <td>
                                          <div>
                                            <div class="d-flex justify-content-between align-items-center mb-1 max-width-progress-wrap">
                                              <p id="${teaData.teaNum}" class="text-success">79%</p>
                                              <p class="teaCnt">${teaData.teaCnt} / </p>
                                            </div>
                                            <div class="progress progress-md">
                                              <!-- value now로 그래프 조절 -->
                                              <div class="progress-bar bg-success" role="progressbar" style="width: 85%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                          </div>
                                        </td>
                                        <!-- 판매 현황 시작 -->
                                        <c:if test="${teaData.teaStatus eq 0}">
                                        	<td><div class="badge badge-opacity-success">판매중</div></td>
						    			</c:if>
                                        <c:if test="${ teaData.teaStatus eq 1}">
                                        	<td><div class="badge badge-opacity-warning">판매중단</div></td>
						    			</c:if>
						    			<!-- 판매 현황 끝 -->
                                      </tr>
                                      
                                      </c:forEach>
                                      <!--  반복 끝 -->
                                      
                                    <!--  샘플 데이터 1 시작 -->
                                    <c:if test="${ empty teaDatas }">
                                      <tr>
                                        <td>
                                          <div class="form-check form-check-flat mt-0">
                                            <label class="form-check-label">
                                            <input type="checkbox" class="form-check-input" aria-checked="false"><i class="input-helper"></i><i class="input-helper"></i></label>
                                          </div>
                                        </td>
                                        <td>
                                          <div class="d-flex ">
                                            <img src="Ad/images/soldout.jpg" alt="품절 이미지">
                                            <div>
                                              <h6>상품X</h6>
                                              <p>해당되는 상품이 존재하지 않습니다</p>
                                            </div>
                                          </div>
                                        </td>
                                        <td>
                                          <h6>- 원</h6>
                                          <p>${teaData.categoryName}</p><!-- 재고..? -->
                                        </td>
                                        <td>
                                          <div>
                                            <div class="d-flex justify-content-between align-items-center mb-1 max-width-progress-wrap">
                                              <p id="${teaData.teaNum}" class="text-success">79%</p>
                                              <p>85/162</p>
                                            </div>
                                            <div class="progress progress-md">
                                              <!-- value now로 그래프 조절 -->
                                              <div class="progress-bar bg-success" role="progressbar" style="width: 85%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                            </div>
                                          </div>
                                        </td>
                                        <td><div class="badge badge-opacity-danger">해당없음</div></td>
                                      </tr>
                                      </c:if>
                                      <!--  샘플 데이터 1 끝 -->

                                    </tbody>
                                  </table>
                                </div>
                              </div>
                                      
                                      
                                   <!-- 카드 바디 끝 -->
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
<script src="http://code.jquery.com/jquery-latest.js"></script> 
<script type="text/javascript">
$(document).ready(function(){
	
	var total = ${ sum };

	console.log('total: '+total);
	$('.teaCnt').append(total);
	
	$('#updateCategory').click(function (){
		
		var teaNums = [];
		var categoryNum = $("#categorySelect").val();
		
		console.log('categoryNum: '+categoryNum);
		
		$("input[name='teaNums']:checked").each(function(){
			teaNums.push($(this).val());
		});
		
		console.log('teaNums: '+teaNums);
		
		if(teaNums != null || categoryNum != null){
			$.ajax({
				url: 'changeCategory.do',
				type : 'post',
				data : {
					teaNums : teaNums,
					categoryNum : categoryNum
				},
 				success: function(result){
 					console.log('teaNums: '+teaNums);
 				},
 				error: function(error){
 					alert("올바르게 선택해주세요!");
 				}
			});
		}
		else{	
			alert("올바르게 선택해주세요!");
		}
		
		location.reload();
		
	
	});
	
	

});

</script>
</body>




























</html>
