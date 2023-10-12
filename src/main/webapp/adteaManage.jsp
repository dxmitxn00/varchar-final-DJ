<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="try"%>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Star Admin2</title>
<!-- plugins:css -->
<link rel="stylesheet" href="Ad/vendors/feather/feather.css">
<link rel="stylesheet"
	href="Ad/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="Ad/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet" href="Ad/vendors/typicons/typicons.css">
<link rel="stylesheet"
	href="Ad/vendors/simple-line-icons/css/simple-line-icons.css">
<link rel="stylesheet" href="Ad/vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- Plugin css for this page -->
<link rel="stylesheet" href="Ad/vendors/select2/select2.min.css">
<link rel="stylesheet"
	href="Ad/vendors/select2-bootstrap-theme/select2-bootstrap.min.css">
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet" href="Ad/css/vertical-layout-light/style.css">
<!-- endinject -->
<!-- 파비콘 태그 -->
<try:favicon/>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<!-- 스윗알랏 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	
<style type="text/css">

  a {
  	text-decoration: none;
  }

  a:hover {
    text-decoration: underline;
    color: black;
  }
  
  label.col-sm-3.col-form-label {
  	padding-block-start: 5px;
  }
  .fixgroup{
  	display: flex;
  }

select {
	color: black !important;
}
</style>  
</head>

<body>
	<div class="container-scroller">
		<!-- partial:Ad/partials/_navbar.html -->
		<try:adnav />
		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:Ad/partials/_settings-panel.html -->
			<try:adpartial />
			<!-- partial -->
			<!-- partial:Ad/partials/_sidebar.html -->
			<try:adsidebar />
			<!-- partial -->
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="row">
						<div class="col-md-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">상품 추가</h4>
									<p class="card-description">양식에 맞게 기재하세요.</p>
									<!-- 상품 추가 form 시작 -->
									<form action="insertTea.do" class="forms-sample" enctype="multipart/form-data" id="insertTeaForm" method="post">
									<div class="form-group">
											<label>상품 카테고리</label>
											<select id="categorySelect" class="form-control" name="categoryNum">
												<option value="선택하세요" id="none" disabled selected hidden>카테고리 선택</option>
												<c:forEach var="categoryData" items="${categoryDatas}">
													<option value="${categoryData.categoryNum}">${categoryData.categoryName}</option>
												</c:forEach>
											</select>
										</div>
										<div class="form-group">
											<label for="exampleInputUsername1">상품명</label>
											<input type="text" class="form-control" name="teaName"  required>
										</div>
										<div class="form-group">
											<label for="exampleInputEmail1">상품 가격</label>
											<input type="number" class="form-control" name="teaPrice"  oninput="checkInput(teaPrice)" required>
										</div>
										<div class="form-group">
											<label for="exampleInputPassword1">상품 총 재고</label>
											<input type="number" class="form-control"  name="teaCnt"  oninput="checkInput(teaCnt)" required>
										</div>
										<div class="form-group">
											<label>상품 사진</label>
											<input type="file" class="file-upload-default" name="fileUpload" id="fileInput" multiple="multiple"/>
											<div class="input-group col-xs-12">
												<input type="text" class="form-control file-upload-info" disabled id="fileInputText" />
												<button class="btn btn-danger btn-icon-text" type="button" id="uploadButton">
						
													<i class="ti-upload btn-icon-prepend"></i>사진 업로드
												</button>
											</div>
											 <div class="image-preview mt-2">
                                               <img src="#" alt="미리보기" id="imagePreview" style="display: none; max-width: 200px;">
                                             </div>
										  </div>	
										<div class="form-group">
											<label for="exampleInputPassword1">상품 설명</label>
											<input type="text" class="form-control form-control-lg" name="teaContent"  required>
										</div>
										<input type="submit" value="추가" class="btn btn-primary me-2" id="insertSubmitButton">
									</form>
									<!-- 상품 추가 form 끝 -->
								</div>
							</div>
						</div>
						<div class="col-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">상품 삭제</h4>
									<p class="card-description">상품의 정보를 확인하신 후 삭제하세요.</p>
									<!-- 상품 삭제 form 시작 -->
									<form action="deleteTea.do" method="post" class="forms-sample">
									  <div class="form-group">
										<h5><strong>상품 카테고리 선택</strong></h5>
										<select class="form-control" id="categoryToDel">
										<option value="선택하세요" id="none" disabled selected hidden>카테고리 선택</option>
											<c:forEach var="categoryData" items="${categoryDatas}">
											<option value="${categoryData.categoryNum}">${categoryData.categoryName}</option>
											</c:forEach>
										</select>
									</div>
										<div class="form-group">
										<h5><strong>상품 선택</strong></h5>
										<select class="form-control" id="teaToDel">
										</select>
									</div>
										<hr>
										<div class="form-group">
											<label for="exampleInputName1">상품번호(PK)</label> <input
												type="text" class="form-control" id="teaNum" name="teaNum"
												 readonly>
										</div>
										<div class="form-group">
											<label for="exampleInputEmail3">상품명</label> <input
												type="text" class="form-control" id="teaName" name="teaName"
											 readonly>
										</div>
										<div class="form-group">
											<label for="exampleInputPrice">상품 가격</label> <input
												type="text" class="form-control" name="teaPrice"
												id="teaPrice" readonly>
										</div>
										<div class="form-group">
											<label for="exampleInputCnt">상품 총 재고</label> <input
												type="text" class="form-control" name="teaCnt"
												id="teaCnt" readonly>
										</div>
										<div class="form-group">
											<label for="exampleInputCity1">상품 설명</label> <input
												type="text" name="teaContent" class="form-control" id="teaContent" readonly>
										</div>
										<div class="form-group">
											<label for="exampleInputPrice">상품 판매 상태</label> <input
												type="text" class="form-control" name="teaStatus"
												id="teaStatus" readonly>
										</div>
										<button id="delTeabt"  type="submit" class="btn btn-primary me-2">삭제</button>
									</form>
									<!-- 상품 삭제 form 끝 -->
								</div>
							</div>
						</div>
					  	  <div class="col-12 grid-margin">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">상품 수정 (재고/가격)</h4>
									<!-- 상품 수정 form 시작 -->
									<form action="updateTea.do" method="post" class="form-sample" enctype="multipart/form-data">
										<p class="card-description">해당 상품의 재고/가격 변경 가능</p>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">카테고리 선택</label>
													<div class="col-sm-9">
														<select class="form-control" id="categoryToFix" name="categoryNum">
														<option value="선택하세요" id="none" disabled selected hidden>카테고리 선택</option>
															<c:forEach var="categoryData" items="${categoryDatas}">
											<option value="${categoryData.categoryNum}">${categoryData.categoryName}</option>
											</c:forEach>
														</select>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">상품 선택</label>
													<div class="col-sm-9">
														<select class="form-control" id="teaToFix">
														</select>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">상품번호(PK)</label>
													<div class="col-sm-9">
														<input type="text" name="teaNum" id="fixteaNum"class="form-control" readonly/>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">상품명 (변경하실 경우 새로 입력)</label>
													<div class="col-sm-9">
														<input type="text" name="teaName" id="fixteaName" class="form-control" />
													</div>
												</div>
											</div>
										</div>
											<div class="col-md-6">
													<label class="col-sm-3 col-form-label">변경할 목록</label>
													<div class="fixgroup">
													<div class="col-sm-4">
														<div class="form-check">
															<label class="form-check-label"> <input
																type="radio" class="form-check-input" name="hidden"
															    id="both" 
																checked> 모두(재고+가격)
															</label>
														</div>
													</div>
													<div class="col-sm-4">
														<div class="form-check">
															<label class="form-check-label"> <input
																type="radio" class="form-check-input" name="hidden"
																 id="radiocnt" 
																checked> 재고
															</label>
														</div>
													</div>
													<div class="col-sm-4">
														<div class="form-check">
															<label class="form-check-label"> <input
																type="radio" class="form-check-input" name="hidden"
																 id="radioprice" 
																> 가격
															</label>
														</div>
													</div>
												</div>	
											</div>
										<div class="row">
											<div class="col-md-6">
												<div  class="form-group row">
													<label class="col-sm-3 col-form-label">재고 수량 입력</label>
													<div class="col-sm-9">
														<input id="fixradicnt" type="number" name="teaCnt" class="form-control" oninput="checkInput(this)" />
													</div>
												</div>
											</div>
										<div class="col-md-6">
											<div  class="form-group row">
												<label class="col-sm-3 col-form-label">가격 입력</label>
													<div class="col-sm-9">
														<input id="fixradiprice" type="number" name="teaPrice" class="form-control" oninput="checkInput(this)"/>
													</div>
												</div>
											</div>
										 <div id="msg">
										 <p>해당 상품의 기존 <strong>재고</strong>는 <strong id="existteaCnt">$-{teaData.teaCnt}</strong>개, 기존 <strong>가격</strong>은 <strong id="existteaPrice">$-{teaData.teaPrice}</strong>원 입니다.</p>
										 </div>
										 <div class="form-group">
											<label for="exampleInputPassword1">상품 설명 변경</label>
											<input type="text" id="fixteaContent" class="form-control form-control-lg" name="teaContent">
										</div>
										<div class="form-group">
                                          <label for="exampleFormControlSelect3">상품 판매 상태 변경</label>
                                            <input type="text" class="form-control" id="fixteaStatus" name="teaStatus" readonly>
                                            <button type="button" class="btn btn-outline-info" onclick="fixStatus()">상태 바꾸기</button>
                                        </div>
									   </div>
									   <button id="fixTeabt" type="submit" class="btn btn-primary me-2">수정</button>
									</form>
									<!-- 상품 수정 form 끝 -->
								</div>
							</div>
						</div>	
					</div>
				</div>
				<!-- content-wrapper ends -->
				<!-- partial:Ad/partials/_footer.html -->
				<footer class="footer">
					<div
						class="d-sm-flex justify-content-center justify-content-sm-between">
						<span
							class="text-muted text-center text-sm-left d-block d-sm-inline-block">Premium
							<a href="https://www.bootstrapdash.com/" target="_blank">Bootstrap
								admin template</a> from BootstrapDash.
						</span> <span
							class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Copyright
							© 2021. All rights reserved.</span>
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
	<script src="Ad/vendors/typeahead.js/typeahead.bundle.min.js"></script>
	<script src="Ad/vendors/select2/select2.min.js"></script>
	<script
		src="Ad/vendors/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
	<!-- End plugin js for this page -->
	<!-- inject:js -->
	<script src="Ad/js/off-canvas.js"></script>
	<script src="Ad/js/hoverable-collapse.js"></script>
	<script src="Ad/js/template.js"></script>
	<script src="Ad/js/settings.js"></script>
	<script src="Ad/js/todolist.js"></script>
	<!-- endinject -->
	<!-- Custom js for this page-->
	<script src="Ad/js/file-upload.js"></script>
	<script src="Ad/js/typeahead.js"></script>
	<script src="Ad/js/select2.js"></script>
	<!-- End custom js for this page-->
	
<script type="text/javascript">
$("#categoryToDel").change(function() {
	var categoryNum = $("#categoryToDel").val();
	console.log('첫번째');
	
	$.ajax({
		url: "selectTea.do",
		data: {
			category: categoryNum
		},
		type: "post",
	    dataType: "json",
		success: function(result){
		   console.log(result);
         $('#teaToDel').empty();
		   var teaInfo = result;
		   if(teaInfo.length == 0){
			   alert('해당 카테고리에 상품이 존재하지 않습니다.');
			   $('#teaToDel').empty();
			   $('#teaNum').val(' ');
				$('#teaName').val(' ');
				$('#teaCnt').val(' ');
				$('#teaPrice').val(' ');
				$('#teaContent').val(' ');
				$('#teaStatus').val(' ');
			   $('#delTeabt').css("display", "none");
		   }
		   var firstItem = result[0];
		   $('#teaNum').val(firstItem.teaNum);
		   $('#teaName').val(firstItem.teaName);
		   $('#teaCnt').val(firstItem.teaCnt);
		   $('#teaPrice').val(firstItem.teaPrice);
		   $('#teaContent').val(firstItem.teaContent);
		   $('#teaStatus').val(firstItem.teaStatus);
		   $('#delTeabt').css("display", "block");
		   for (var i=0;i<teaInfo.length;i++){
		   var optteaNum=teaInfo[i].teaNum;
		   var optteaName = teaInfo[i].teaName;
		   var optteaCnt = teaInfo[i].teaCnt;
		   var optteaPrice = teaInfo[i].teaPrice;
		   var optteaContent = teaInfo[i].teaContent;
		   var optteaStatus = teaInfo[i].teaStatus;
		   console.log(optteaName);
           var optionElement = 
           $('<option>' + optteaName + '</option>')
           .attr('data-tea-num', optteaNum)
           .attr('data-tea-name', optteaName)
           .attr('data-tea-cnt', optteaCnt)
           .attr('data-tea-price', optteaPrice)
           .attr('data-tea-content', optteaContent)
           .attr('data-tea-status', optteaStatus);
           $('#teaToDel').append(optionElement);
		      }
		   },
		error: function(error){
		    console.log(error);
	    }
	});
  });
  
//<select>에서 옵션을 선택했을 때 실행될 코드
$("#teaToDel").change(function () {
    var selectedOption = $("#teaToDel option:selected");
    var teaNum = selectedOption.attr('data-tea-num');
    var teaName = selectedOption.attr('data-tea-name');
    var teaCnt = selectedOption.attr('data-tea-cnt');
    var teaPrice = selectedOption.attr('data-tea-price');
    var teaContent = selectedOption.attr('data-tea-content');
    var teaStatus = selectedOption.attr('data-tea-status');
    console.log('로그1');

    // 각각의 <input> 엘리먼트에 데이터를 설정
    $('#teaNum').val(teaNum);
	$('#teaName').val(teaName);
	$('#teaCnt').val(teaCnt);
	$('#teaPrice').val(teaPrice);
	$('#teaContent').val(teaContent);
	$('#teaStatus').val(teaStatus);
	$('#delTeabt').css("display", "block");
    console.log('로그2');
});

</script>	
<script type="text/javascript">
$("#categoryToFix").change(function() {
	var categoryNum = $("#categoryToFix").val();
	console.log('첫번째');
	
	$.ajax({
		url: "selectTea.do",
		data: {
			category: categoryNum
		},
		type: "post",
	    dataType: "json",
		success: function(result){
		   console.log(result);
		   // 여기서 id가 selectTea라는 <select> 하위의 <option>에 gson으로 받아온
		   // 기존의 <option>을 모두 제거
         $('#teaToFix').empty();
		   var teaInfo = result;
		   if(teaInfo.length == 0){
			   alert('해당 카테고리에 상품이 존재하지 않습니다.');
			   $('#teaToFix').empty();
			   $('#fixteaNum').val(' ');
				$('#fixteaName').val(' ').prop('readonly', true);
				$('#fixradicnt').val(' ').prop('readonly', true);
				$('#fixradiprice').val(' ').prop('readonly', true);
				$('#existteaCnt').text(' ');
				$('#existteaPrice').text(' ');
				$('#fixteaContent').val(' ').prop('readonly', true);
				$('#fixteaStatus').val(' ');
			    $('#fixTeabt').css("display", "none");
		   }
		   var firstItem = result[0];
		   $('#fixteaNum').val(firstItem.teaNum);
		   $('#fixteaName').val(firstItem.teaName).prop('readonly', false);
		   $('#fixradiprice').val(firstItem.teaPrice).prop('readonly', false);
		   $('#fixradicnt').val(firstItem.teaCnt).prop('readonly', false);
		   $('#existteaCnt').text(firstItem.teaCnt);
		   $('#existteaPrice').text(firstItem.teaPrice);
		   $('#fixteaContent').val(firstItem.teaContent).prop('readonly', false);
		   $('#fixteaStatus').val(firstItem.teaStatus);
		   $('#fixteaStatus').attr("placeholder", firstItem.teaStatus);
		   $('#fixTeabt').css("display", "block");
		   for (var i=0;i<teaInfo.length;i++){
		   var optteaNum=teaInfo[i].teaNum;
		   var optteaName = teaInfo[i].teaName;
		   var optteaCnt = teaInfo[i].teaCnt;
		   var optteaPrice = teaInfo[i].teaPrice;
		   var optteaContent = teaInfo[i].teaContent;
		   var optteaStatus = teaInfo[i].teaStatus;
		   console.log(optteaName);
		     // 각 <option>에 데이터를 속성으로 추가
           var optionElement = 
           $('<option>' + optteaName + '</option>')
           .attr('data-tea-num', optteaNum)
           .attr('data-tea-name', optteaName)
           .attr('data-tea-cnt', optteaCnt)
           .attr('data-tea-price', optteaPrice)
           .attr('data-tea-content', optteaContent)
           .attr('data-tea-status', optteaStatus);
           $('#teaToFix').append(optionElement);
		      }
		   },
		error: function(error){
		    console.log(error);
	    }
	});
  });
//<select>에서 옵션을 선택했을 때 실행될 코드
$("#teaToFix").change(function () {
    var selectedOption = $("#teaToFix option:selected");
    var teaNum = selectedOption.attr('data-tea-num');
    var teaName = selectedOption.attr('data-tea-name');
    var teaCnt = selectedOption.attr('data-tea-cnt');
    var teaPrice = selectedOption.attr('data-tea-price');
    var teaContent = selectedOption.attr('data-tea-content');
    var teaStatus = selectedOption.attr('data-tea-status');
    console.log('로그1');
  
    // 각각의 <input> 태그에 데이터를 설정
    $('#fixteaNum').val(teaNum);
	$('#fixteaName').val(teaName).prop('readonly', false);
    $('#fixradiprice').val(teaPrice).prop('readonly', false);
	$('#fixradicnt').val(teaCnt).prop('readonly', false);
	$('#existteaCnt').text(teaCnt);
	$('#existteaPrice').text(teaPrice);
	$('#fixteaContent').val(teaContent).prop('readonly', false);
	$('#fixteaStatus').val(teaStatus);
	$('#fixTeabt').css("display", "block");
    console.log('로그2');
    
});

</script>
<script type="text/javascript">
window.addEventListener("load", function() {
	  // 페이지 로드 시, 모두(재고+가격)에 디폴트로 선택될 수 있도록
	  const both = document.getElementById("both");
	  both.checked = true;  
});
</script>	
<script type="text/javascript">
// radio (select처럼 생긴거) 변수 선언
const both=document.getElementById("both");
const radiocnt = document.getElementById("radiocnt");
const radioprice = document.getElementById("radioprice");

// div (입력란 부분) 변수 선언
const fixradicnt=document.getElementById("fixradicnt");
const fixradiprice=document.getElementById("fixradiprice");

//라디오 버튼 상태 변화를 감지하는 이벤트 리스너 추가
// 1) 모두에 체크되었을때
both.addEventListener("change", function(){
	if(both.checked){
		fixradicnt.readOnly = false;
		fixradiprice.readOnly = false;
	}
});

// 2) 재고에 체크되었을때
radiocnt.addEventListener("change", function() {
  if (radiocnt.checked) {
	  fixradiprice.readOnly = true;
      fixradicnt.readOnly = false;
  }
});

// 3) 가격에 체크되었을때
radioprice.addEventListener("change", function(){
	if(radioprice.checked){
		fixradiprice.readOnly = false;
		fixradicnt.readOnly = true;
	}
});
</script>
<script type="text/javascript">
// 상품 추가/수정 시 재고/가격에 숫자만 입력 + 음수, 소수 입력 안되게
function checkInput(input) {
	  if (input.value < 0) {
	    input.value = 0;
	  }
}
</script>	

<script type="text/javascript">

$('#uploadButton').on("click", function(){
	console.log('이미지 업로드 버튼 클릭됨');
		
	$('#fileInput').trigger('click');
});
</script>
<script type="text/javascript">
function fixStatus(){
	var teaStatus = document.getElementById('fixteaStatus').value;
	teaStatus = parseInt(teaStatus);	
		if(teaStatus === 1) {
			teaStatus = 0;
		}
		else if(teaStatus === 0){
			teaStatus = 1;
		}
		else{
			alert('상품 선택후 조회 버튼을 눌러주세요!');
			location.reload();
		}
     document.getElementById('fixteaStatus').value = teaStatus;	
     console.log(teaStatus);
    
}


</script>
</body>

</html>