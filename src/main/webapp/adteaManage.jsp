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
									<form class="forms-sample">
										<div class="form-group">
											<label for="exampleInputUsername1">상품명</label> <input
												type="text" class="form-control" id="exampleInputUsername1"
												placeholder="$-{teaData.teaName}">
										</div>
										<div class="form-group">
											<label for="exampleInputEmail1">상품 가격</label> <input
												type="text" class="form-control" id="exampleInputEmail1"
												placeholder="$-{teaData.teaPrice} 숫자만 입력하세요!!">
										</div>
										<div class="form-group">
											<label for="exampleInputPassword1">상품 총 재고</label> <input
												type="text" class="form-control"
												id="exampleInputPassword1" placeholder="$-{teaData.teaCnt}">
										</div>
										<div class="form-group">
											<label>상품 카테고리</label> <select
											class="js-example-basic-single w-100">
											<option value="녹차">녹차</option>
											<option value="홍차">홍차</option>
											<option value="우롱차">우롱차</option>
											<option value="루이보스">루이보스</option>
											<option value="허브차">허브차</option>
										</select>
										</div>
										<div class="form-group">
											<label>상품 사진</label> <input type="file" name="img[]"
												class="file-upload-default">
											<div class="input-group col-xs-12">
												<input type="text" class="form-control file-upload-info"
													disabled placeholder="$-{teaData.imageUrl}"> <span
													class="input-group-append">
													<button class="file-upload-browse btn btn-success btn-icon-text"
														type="button"><i class="ti-upload btn-icon-prepend"></i>사진 업로드</button>
												</span>
											</div>
										  </div>	
										<div class="form-group">
											<label for="exampleInputPassword1">상품 설명</label> <input
												type="text" class="form-control form-control-lg"
												id="exampleInputPassword1" placeholder="$-{teaData.teaContent}">
										</div>
										<button id="scrolltodelete" type="submit" class="btn btn-primary me-2">Submit</button>
										<button class="btn btn-light">Cancel</button>
									</form>
								</div>
							</div>
						</div>
						<div class="col-md-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">여기는 뭘로 쓰냐</h4>
									<p class="card-description">ㄹㅇ ㅋㅋ</p>
									<form class="forms-sample">
										<div class="form-group row">
											<label for="exampleInputUsername2"
												class="col-sm-3 col-form-label">Email</label>
											<div class="col-sm-9">
												<input type="text" class="form-control"
													id="exampleInputUsername2" placeholder="Username">
											</div>
										</div>
										<div class="form-group row">
											<label for="exampleInputEmail2"
												class="col-sm-3 col-form-label">Email</label>
											<div class="col-sm-9">
												<input type="email" class="form-control"
													id="exampleInputEmail2" placeholder="Email">
											</div>
										</div>
										<div class="form-group row">
											<label for="exampleInputMobile"
												class="col-sm-3 col-form-label">Mobile</label>
											<div class="col-sm-9">
												<input type="text" class="form-control"
													id="exampleInputMobile" placeholder="Mobile number">
											</div>
										</div>
										<div class="form-group row">
											<label for="exampleInputPassword2"
												class="col-sm-3 col-form-label">Password</label>
											<div class="col-sm-9">
												<input type="password" class="form-control"
													id="exampleInputPassword2" placeholder="Password">
											</div>
										</div>
										<div class="form-group row">
											<label for="exampleInputConfirmPassword2"
												class="col-sm-3 col-form-label">Re Password</label>
											<div class="col-sm-9">
												<input type="password" class="form-control"
													id="exampleInputConfirmPassword2" placeholder="Password">
											</div>
										</div>
										<div class="form-check form-check-flat form-check-primary">
											<label class="form-check-label"> <input
												type="checkbox" class="form-check-input"> Remember
												me
											</label>
										</div>
										<button type="submit" class="btn btn-primary me-2">Submit</button>
										<button class="btn btn-light">Cancel</button>
									</form>
								</div>
							</div>
						</div>
						<div class="col-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">상품 삭제</h4>
									<p class="card-description">상품의 정보를 확인하신 후 삭제하세요.</p>
									<form class="forms-sample">
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
										<hr>
										<div class="form-group">
											<label for="exampleInputName1">상품번호(PK)</label> <input
												type="text" class="form-control" id="exampleInputName1"
												placeholder="$-{teaData.teaNum}" disabled readonly>
										</div>
										<div class="form-group">
											<label for="exampleInputEmail3">상품명</label> <input
												type="text" class="form-control" id="exampleInputEmail3"
												placeholder="$-{teaData.teaName}" disabled readonly>
										</div>
										<div class="form-group">
											<label for="exampleInputPassword4">상품 가격</label> <input
												type="text" class="form-control"
												id="exampleInputPassword4" placeholder="$-{teaData.teaPrice}" disabled readonly>
										</div>
										<div class="form-group">
											<label for="exampleInputPassword4">상품 총 재고</label> <input
												type="text" class="form-control"
												id="exampleInputPassword4" placeholder="$-{teaData.teaCnt}" disabled readonly>
										</div>
										<div class="form-group">
											<label>상품 사진</label>
											<div class="input-group col-xs-12">
												<img alt="$-{teaData.imageUrl}" src="$-{teaData.imageUrl}">
											</div>
										</div>
										<div class="form-group">
											<label for="exampleInputCity1">상품 설명</label> <input
												type="text" class="form-control form-control-lg" id="exampleInputCity1"
												placeholder="$-{teaData.teaContent}" disabled readonly>
										</div>
										<button id="scrolltofix"  type="submit" class="btn btn-primary me-2">Submit</button>
										<button class="btn btn-light">Cancel</button>
									</form>
								</div>
							</div>
						</div>
					  	  <div class="col-12 grid-margin">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">상품 수정 (재고/가격)</h4>
									<form class="form-sample">
										<p class="card-description">해당 상품의 재고/가격 변경 가능</p>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">카테고리 선택</label>
													<div class="col-sm-9">
														<select class="form-control">
															<option value="1${teaData.teaCategory}">$-{teaData.teaCategory}</option>
															<option value="2">$-{teaData.teaCategory}</option>
															<option>$-{teaData.teaCategory}</option>
															<option>$-{teaData.teaCategory}</option>
														</select>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">상품 선택</label>
													<div class="col-sm-9">
														<select class="form-control">
															<option>$-{teaData.teaNum}</option>
															<option>$-{teaData.teaNum}</option>
															<option>$-{teaData.teaNum}</option>
															<option>$-{teaData.teaNum}</option>
														</select>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">상품번호(PK)</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" placeholder="$-{teaData.teaNum}" disabled readonly/>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group row">
													<label class="col-sm-3 col-form-label">상품명</label>
													<div class="col-sm-9">
														<input type="text" class="form-control" placeholder="$-{teaData.teaName}" disabled readonly/>
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
																type="radio" class="form-check-input"
																name="membershipRadios" id="both" value="모두(재고+가격)"
																checked> 모두(재고+가격)
															</label>
														</div>
													</div>
													<div class="col-sm-4">
														<div class="form-check">
															<label class="form-check-label"> <input
																type="radio" class="form-check-input"
																name="membershipRadios" id="selectcnt" value="재고"
																checked> 재고
															</label>
														</div>
													</div>
													<div class="col-sm-4">
														<div class="form-check">
															<label class="form-check-label"> <input
																type="radio" class="form-check-input"
																name="membershipRadios" id="selectprice"
																value="가격"> 가격
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
														<input id="fixcnt" type="text" class="form-control" />
													</div>
												</div>
											</div>
										<div class="col-md-6">
											<div  class="form-group row">
												<label class="col-sm-3 col-form-label">가격 입력</label>
													<div class="col-sm-9">
														<input id="fixprice" type="text" class="form-control" />
													</div>
												</div>
											</div>
										 <div id="msg">
										 <p>※ $-{teaData.teaName} 상품의 기존 <strong>재고</strong>는 <strong>$-{teaData.teaCnt}</strong>개, 기존 <strong>가격</strong>은 <strong>$-{teaData.teaPrice}</strong>원 입니다.</p>
										 </div>
									   </div>
									   <button type="submit" class="btn btn-primary me-2">Submit</button>
									   <button class="btn btn-light">Cancel</button>
									</form>
								</div>
							</div>
						</div>	
						<div class="col-md-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">상품 수정</h4>
									<p class="card-description">
										Add classes like
										<code>.form-control-lg</code>
										and
										<code>.form-control-sm</code>
										
									</p>
									<div class="form-group">
										<label>Large input</label> <input type="text"
											class="form-control form-control-lg" placeholder="Username"
											aria-label="Username">
									</div>
									<div class="form-group">
										<label>Default input</label> <input type="text"
											class="form-control" placeholder="Username"
											aria-label="Username">
									</div>
									<div class="form-group">
										<label>Small input</label> <input type="text"
											class="form-control form-control-sm" placeholder="Username"
											aria-label="Username">
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Select size</h4>
									<p class="card-description">
										Add classes like
										<code>.form-control-lg</code>
										and
										<code>.form-control-sm</code>
										.
									</p>
									<div class="form-group">
										<label for="exampleFormControlSelect1">Large select</label> <select
											class="form-control form-control-lg"
											id="exampleFormControlSelect1">
											<option>1</option>
											<option>2</option>
											<option>3</option>
											<option>4</option>
											<option>5</option>
										</select>
									</div>
									<div class="form-group">
										<label for="exampleFormControlSelect2">Default select</label>
										<select class="form-control" id="exampleFormControlSelect2">
											<option>1</option>
											<option>2</option>
											<option>3</option>
											<option>4</option>
											<option>5</option>
										</select>
									</div>
									<div class="form-group">
										<label for="exampleFormControlSelect3">Small select</label> <select
											class="form-control form-control-sm"
											id="exampleFormControlSelect3">
											<option>1</option>
											<option>2</option>
											<option>3</option>
											<option>4</option>
											<option>5</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Basic input groups</h4>
									<p class="card-description">Basic bootstrap input groups</p>
									<div class="form-group">
										<div class="input-group">
											<div class="input-group-prepend">
												<span class="input-group-text">@</span>
											</div>
											<input type="text" class="form-control"
												placeholder="Username" aria-label="Username">
										</div>
									</div>
									<div class="form-group">
										<div class="input-group">
											<div class="input-group-prepend">
												<span class="input-group-text bg-primary text-white">$</span>
											</div>
											<input type="text" class="form-control"
												aria-label="Amount (to the nearest dollar)">
											<div class="input-group-append">
												<span class="input-group-text">.00</span>
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="input-group">
											<div class="input-group-prepend">
												<span class="input-group-text">$</span>
											</div>
											<div class="input-group-prepend">
												<span class="input-group-text">0.00</span>
											</div>
											<input type="text" class="form-control"
												aria-label="Amount (to the nearest dollar)">
										</div>
									</div>
									<div class="form-group">
										<div class="input-group">
											<input type="text" class="form-control"
												placeholder="Recipient's username"
												aria-label="Recipient's username">
											<div class="input-group-append">
												<button class="btn btn-sm btn-primary" type="button">Search</button>
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="input-group">
											<div class="input-group-prepend">
												<button
													class="btn btn-sm btn-outline-primary dropdown-toggle"
													type="button" data-bs-toggle="dropdown"
													aria-haspopup="true" aria-expanded="false">Dropdown</button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="#">Action</a> <a
														class="dropdown-item" href="#">Another action</a> <a
														class="dropdown-item" href="#">Something else here</a>
													<div role="separator" class="dropdown-divider"></div>
													<a class="dropdown-item" href="#">Separated link</a>
												</div>
											</div>
											<input type="text" class="form-control"
												aria-label="Text input with dropdown button">
										</div>
									</div>
									<div class="form-group">
										<div class="input-group">
											<input type="text" class="form-control"
												placeholder="Find in facebook"
												aria-label="Recipient's username">
											<div class="input-group-append">
												<button class="btn btn-sm btn-facebook" type="button">
													<i class="ti-facebook"></i>
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
									<h4 class="card-title">Checkbox Controls</h4>
									<p class="card-description">Checkbox and radio controls
										(default appearance is in primary color)</p>
									<form>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<div class="form-check">
														<label class="form-check-label"> <input
															type="checkbox" class="form-check-input"> Default
														</label>
													</div>
													<div class="form-check">
														<label class="form-check-label"> <input
															type="checkbox" class="form-check-input" checked>
															Checked
														</label>
													</div>
													<div class="form-check">
														<label class="form-check-label"> <input
															type="checkbox" class="form-check-input" disabled>
															Disabled
														</label>
													</div>
													<div class="form-check">
														<label class="form-check-label"> <input
															type="checkbox" class="form-check-input" disabled checked>
															Disabled checked
														</label>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<div class="form-check">
														<label class="form-check-label"> <input
															type="radio" class="form-check-input"
															name="optionsRadios" id="optionsRadios1" value="">
															Default
														</label>
													</div>
													<div class="form-check">
														<label class="form-check-label"> <input
															type="radio" class="form-check-input"
															name="optionsRadios" id="optionsRadios2" value="option2"
															checked> Selected
														</label>
													</div>
													<div class="form-check">
														<label class="form-check-label"> <input
															type="radio" class="form-check-input"
															name="optionsRadios2" id="optionsRadios3" value="option3"
															disabled> Disabled
														</label>
													</div>
													<div class="form-check">
														<label class="form-check-label"> <input
															type="radio" class="form-check-input"
															name="optionsRadio2" id="optionsRadios4" value="option4"
															disabled checked> Selected and disabled
														</label>
													</div>
												</div>
											</div>
										</div>
									</form>
								</div>
								<div class="card-body">
									<p class="card-description">
										Add class
										<code>.form-check-{color}</code>
										for checkbox and radio controls in theme colors
									</p>
									<form>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<div class="form-check form-check-primary">
														<label class="form-check-label"> <input
															type="checkbox" class="form-check-input" checked>
															Primary
														</label>
													</div>
													<div class="form-check form-check-success">
														<label class="form-check-label"> <input
															type="checkbox" class="form-check-input" checked>
															Success
														</label>
													</div>
													<div class="form-check form-check-info">
														<label class="form-check-label"> <input
															type="checkbox" class="form-check-input" checked>
															Info
														</label>
													</div>
													<div class="form-check form-check-danger">
														<label class="form-check-label"> <input
															type="checkbox" class="form-check-input" checked>
															Danger
														</label>
													</div>
													<div class="form-check form-check-warning">
														<label class="form-check-label"> <input
															type="checkbox" class="form-check-input" checked>
															Warning
														</label>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<div class="form-check form-check-primary">
														<label class="form-check-label"> <input
															type="radio" class="form-check-input"
															name="ExampleRadio1" id="ExampleRadio1" checked>
															Primary
														</label>
													</div>
													<div class="form-check form-check-success">
														<label class="form-check-label"> <input
															type="radio" class="form-check-input"
															name="ExampleRadio2" id="ExampleRadio2" checked>
															Success
														</label>
													</div>
													<div class="form-check form-check-info">
														<label class="form-check-label"> <input
															type="radio" class="form-check-input"
															name="ExampleRadio3" id="ExampleRadio3" checked>
															Info
														</label>
													</div>
													<div class="form-check form-check-danger">
														<label class="form-check-label"> <input
															type="radio" class="form-check-input"
															name="ExampleRadio4" id="ExampleRadio4" checked>
															Danger
														</label>
													</div>
													<div class="form-check form-check-warning">
														<label class="form-check-label"> <input
															type="radio" class="form-check-input"
															name="ExampleRadio5" id="ExampleRadio5" checked>
															Warning
														</label>
													</div>
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
						<div class="col-12 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Inline forms</h4>
									<p class="card-description">
										Use the
										<code>.form-inline</code>
										class to display a series of labels, form controls, and
										buttons on a single horizontal row
									</p>
									<form class="form-inline">
										<label class="sr-only" for="inlineFormInputName2">Name</label>
										<input type="text" class="form-control mb-2 mr-sm-2"
											id="inlineFormInputName2" placeholder="Jane Doe"> <label
											class="sr-only" for="inlineFormInputGroupUsername2">Username</label>
										<div class="input-group mb-2 mr-sm-2">
											<div class="input-group-prepend">
												<div class="input-group-text">@</div>
											</div>
											<input type="text" class="form-control"
												id="inlineFormInputGroupUsername2" placeholder="Username">
										</div>
										<div class="form-check mx-sm-2">
											<label class="form-check-label"> <input
												type="checkbox" class="form-check-input" checked>
												Remember me
											</label>
										</div>
										<button type="submit" class="btn btn-primary mb-2">Submit</button>
									</form>
								</div>
							</div>
						</div>
						<div class="col-md-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Select 2</h4>
									<div class="form-group">
										<label>Single select box using select 2</label> <select
											class="js-example-basic-single w-100">
											<option value="AL">Alabama</option>
											<option value="WY">Wyoming</option>
											<option value="AM">America</option>
											<option value="CA">Canada</option>
											<option value="RU">Russia</option>
										</select>
									</div>
									<div class="form-group">
										<label>Multiple select using select 2</label> <select
											class="js-example-basic-multiple w-100" multiple="multiple">
											<option value="AL">Alabama</option>
											<option value="WY">Wyoming</option>
											<option value="AM">America</option>
											<option value="CA">Canada</option>
											<option value="RU">Russia</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6 grid-margin stretch-card">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title">Typeahead</h4>
									<p class="card-description">A simple suggestion engine</p>
									<div class="form-group row">
										<div class="col">
											<label>Basic</label>
											<div id="the-basics">
												<input class="typeahead" type="text"
													placeholder="States of USA">
											</div>
										</div>
										<div class="col">
											<label>Bloodhound</label>
											<div id="bloodhound">
												<input class="typeahead" type="text"
													placeholder="States of USA">
											</div>
										</div>
									</div>
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
window.addEventListener("load", function() {
	  // 페이지 로드 시, 모두(재고+가격)에 디폴트로 선택될 수 있도록
	  const both = document.getElementById("both");
	  both.checked = true;
});
</script>	
<script type="text/javascript">
// radio (select처럼 생긴거) 변수 선언
const both=document.getElementById("both");
const selectcnt = document.getElementById("selectcnt");
const selectprice = document.getElementById("selectprice");

// div (입력란 부분) 변수 선언
const fixcnt=document.getElementById("fixcnt");
const fixprice=document.getElementById("fixprice");

//라디오 버튼 상태 변화를 감지하는 이벤트 리스너를 추가합니다.
// 1) 모두에 체크되었을때
both.addEventListener("change", function(){
	if(both.checked){
		fixcnt.disabled = false;
		fixprice.disabled = false;
	}
});

// 2) 재고에 체크되었을때
selectcnt.addEventListener("change", function() {
  if (selectcnt.checked) {
    fixcnt.disabled = false;
    fixprice.disabled = true;
  }
});

// 3) 가격에 체크되었을때
selectprice.addEventListener("change", function(){
	if(selectprice.checked){
		fixprice.disabled = false;
		fixcnt.disabled = true;
	}
});
</script>	
</body>

</html>