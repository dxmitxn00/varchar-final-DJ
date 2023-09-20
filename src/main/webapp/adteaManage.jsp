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
<link rel="shortcut icon" href="Ad/images/favicon.png" />
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
									<form action="insertTea.do" class="forms-sample" enctype="multipart/form-data" id="teaForm" >
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
											<input type="file" class="file-upload-default" id="fileInput" />
											<div class="input-group col-xs-12">
												<input type="text" class="form-control file-upload-info" disabled placeholder="$-{teaData.imageUrl}" id="fileInputText" />
												<span class="input-group-append" id="uploadSpan" >
													<button class="file-upload-browse btn btn-success btn-icon-text"
														type="button" id="uploadButton"><i class="ti-upload btn-icon-prepend"></i>사진 업로드</button>
												</span>
											</div>
											 <div class="image-preview mt-2">
                                               <img src="#" alt="미리보기" id="imagePreview" style="display: none; max-width: 200px;">
                                             </div>
										  </div>	
										<div class="form-group">
											<label for="exampleInputPassword1">상품 설명</label>
											<input type="text" class="form-control form-control-lg" name="teaContent"  required>
										</div>
										<input type="submit" class="btn btn-primary me-2" id="submitButton">
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
										<h5><strong>상품 카테고리 선택 [1) 카테고리를 먼저 지정한다.]</strong></h5>
										<select class="form-control" id="categoryToDel">
										<option value="선택하세요" id="none" disabled selected hidden>카테고리 선택</option>
											<c:forEach var="categoryData" items="${categoryDatas}">
											<option value="${categoryData.categoryNum}">${categoryData.categoryName}</option>
											</c:forEach>
										</select>
									</div>
										<div class="form-group">
										<h5><strong>상품 선택 [2) 위에서 나눈 카테고리 별로 상품이 출력되게 한다.]</strong></h5>
										<select class="form-control" id="teaToDel">
										</select>
									</div>
										<hr>
										<div class="form-group">
											<label for="exampleInputName1">상품번호(PK)</label> <input
												type="text" class="form-control" id="teaNum" name="teaNum"
												placeholder="$-{teaData.teaNum}" readonly>
										</div>
										<div class="form-group">
											<label for="exampleInputEmail3">상품명</label> <input
												type="text" class="form-control" id="teaName" name="teaName"
												placeholder="$-{teaData.teaName}" readonly>
										</div>
										<div class="form-group">
											<label for="exampleInputPrice">상품 가격</label> <input
												type="text" class="form-control" name="teaPrice"
												id="teaPrice" placeholder="$-{teaData.teaPrice}" readonly>
										</div>
										<div class="form-group">
											<label for="exampleInputCnt">상품 총 재고</label> <input
												type="text" class="form-control" name="teaCnt"
												id="teaCnt" placeholder="$-{teaData.teaCnt}" readonly>
										</div>
										<div class="form-group">
											<label for="exampleInputCity1">상품 설명</label> <input
												type="text" name="teaContent" class="form-control" id="teaContent" placeholder="$-{teaData.teaContent}" readonly>
										</div>
										<button id="scrolltofix"  type="submit" class="btn btn-primary me-2">Submit</button>
										<button class="btn btn-light">Cancel</button>
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
														<select class="form-control" id="categoryToFix">
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
														<input type="text" name="teaNum" id="fixteaNum"class="form-control" placeholder="$-{teaData.teaNum}" readonly/>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">상품명</label>
													<div class="col-sm-9">
														<input type="text" name="teaName" id="fixteaName" class="form-control" placeholder="$-{teaData.teaName}"/>
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
									   </div>
									   <button type="submit" class="btn btn-primary me-2">Submit</button>
									   <button class="btn btn-light">Cancel</button>
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
		   var firstItem = result[0];
		    $('#teaNum').attr("value",firstItem.teaNum);
		    $('#teaName').attr("value",firstItem.teaName);
		    $('#teaCnt').attr("value",firstItem.teaCnt);
		    $('#teaPrice').attr("value",firstItem.teaPrice);
		    $('#teaContent').attr("value",firstItem.teaContent);
		   for (var i=0;i<teaInfo.length;i++){
		   var optteaNum=teaInfo[i].teaNum;
		   var optteaName = teaInfo[i].teaName;
		   var optteaCnt = teaInfo[i].teaCnt;
		   var optteaPrice = teaInfo[i].teaPrice;
		   var optteaContent = teaInfo[i].teaContent;
		   console.log(optteaName);
                var optionElement = $('<option>' + optteaName + '</option>')
                    .attr('data-tea-num', optteaNum)
                    .attr('data-tea-name', optteaName)
                    .attr('data-tea-cnt', optteaCnt)
                    .attr('data-tea-price', optteaPrice)
                    .attr('data-tea-content', optteaContent);
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
    console.log('여기오냐1');

    // 각각의 <input> 엘리먼트에 데이터를 설정합니다.
     $('#teaNum').attr("value",teaNum);
    $('#teaName').attr("value",teaName);
    $('#teaCnt').attr("value",teaCnt);
    $('#teaPrice').attr("value",teaPrice);
    $('#teaContent').attr("value",teaContent);
    console.log('여기오냐2');
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
		   // 기존의 <option>을 모두 제거합니다.
		  // console.log(result[1].teaNum);
         $('#teaToFix').empty();
		   var teaInfo = result;
		   //var selteaNum='';
		   //var selteaName='';
		   //var selteaCnt='';
		   //var selteaPrice='';
		   //var selteaContent='';
		   var firstItem = result[0];
		    $('#fixteaNum').attr("value",firstItem.teaNum);
		    $('#fixteaName').attr("value",firstItem.teaName);
		    $('#existteaCnt').text(firstItem.teaCnt);
		    $('#existteaPrice').text(firstItem.teaPrice);
		   for (var i=0;i<teaInfo.length;i++){
		   var optteaNum=teaInfo[i].teaNum;
		   var optteaName = teaInfo[i].teaName;
		   var optteaCnt = teaInfo[i].teaCnt;
		   var optteaPrice = teaInfo[i].teaPrice;
		   var optteaContent = teaInfo[i].teaContent;
		   console.log(optteaName);
		//     console.log(optteaNum);
		     // 각 <option>에 데이터를 속성으로 추가
                var optionElement = $('<option>' + optteaName + '</option>')
                    .attr('data-tea-num', optteaNum)
                    .attr('data-tea-name', optteaName)
                    .attr('data-tea-cnt', optteaCnt)
                    .attr('data-tea-price', optteaPrice)

                // <option>을 #teaToDel에 추가
                $('#teaToFix').append(optionElement);
		 //  console.log(selteaName);
		      }
		   
           // 새로운 <option>을 추가합니다.
      //     $('#teaToDel').append(selteaName);
		   // 각각의 <input> 엘리먼트에 데이터를 설정합니다.
		 //  if($('#teaToDel'))
        //    $('#teaNum').attr("value",optteaNum);
       //     $('#teaName').attr("value",optteaName);
       //     $('#teaCnt').attr("value",optteaCnt);
       //     $('#teaPrice').attr("value",optteaPrice);
       //     $('#teaContent').attr("value",optteaContent);
		   },
		   // teaName이 forEach 형식으로 뜨게 하고 싶다.
		   // 결국엔 배열 형식이기 때문에, 항상 JAVA에서 써오던 for문 방식으로 먼저 체크를 해보자.
		   // 그리고 TeaVO의 멤버변수 하나하나로 다 받아온 저 result를 teaName만 추출해서 나오게 하도록!
		   // 오늘 집가서 이거 제대로 끝낸다 스바...
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
    console.log('여기오냐1');

    // 각각의 <input> 엘리먼트에 데이터를 설정합니다.
    $('#fixteaNum').attr("value",teaNum);
    $('#fixteaName').attr("value",teaName);
    $('#existteaCnt').text(teaCnt);
    $('#existteaPrice').text(teaPrice);
    console.log('여기오냐2');
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
$('#uploadSpan').on("click", async function(){
	console.log('이미지 업로드 버튼 클릭됨');
	
	const { value: file } = await Swal.fire({
		  title: '상품 이미지 선택',
		  input: 'file',
		  inputAttributes: {
		    'accept': 'image/*',
		    'aria-label': '업로드할 이미지를 선택해주세요'
		  }
		})

		if (file) {
		  const reader = new FileReader()
		  reader.onload = async(e) => {
		    Swal.fire({
		      title: '선택된 상품 이미지',
		      imageUrl: e.target.result,
		      imageAlt: 'The uploaded picture'
		    })
		  }
		  console.log('이미지 로그1 '+file);
		  //$('input[type=file]').attr('value', file);
		  console.log('이미지 로그2 '+reader.readAsDataURL(file));
		  reader.readAsDataURL(file)
		}
});
</script>
</body>

</html>