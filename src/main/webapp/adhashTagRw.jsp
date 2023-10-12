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
  
  .hashTagItem {
    display: flex; /* 입력 필드와 버튼을 가로로 정렬 */
 
}

.hashTagItem button {
    margin-top: 10px; /* 원하는 간격으로 조정 */
    margin-right: 5px;
}

#selectCategory {
	color: black;
}

#selectTea{
	color: black;
}

#selectReview{
	color: black;
}

#selectRwbutton {
  display: none;
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
                
                  <div class="col-md-6">
                    <div class="card-body">
                      <h4 class="card-title">후기 해시태그 삭제</h4>
                      <div class="template-demo">
									  <div class="form-group">
										<h5><strong>상품 카테고리 선택</strong></h5>
										<select class="form-control" id="selectCategory">
										<option value="선택하세요" id="none" disabled selected hidden>카테고리 선택</option>
										<c:forEach var="categoryData" items="${categoryDatas}">
										<option value="${categoryData.categoryNum}">${categoryData.categoryName}</option>
										</c:forEach>
										</select>
									</div>
										<div class="form-group">
										<h5><strong>상품 선택</strong></h5>
										<select class="form-control" id="selectTea"></select> <br>
										<button type="button" id="selectbutton" class="btn btn-outline-primary">상품 리뷰 조회</button>		
									</div>
									<div class="form-group">
										<h5><strong>리뷰 선택</strong></h5>
										<select class="form-control" id="selectReview"></select> <br>
										<button type="button" id="selectRwbutton" class="btn btn-outline-warning">리뷰 해시태그 조회</button>	
									</div>
                    	<form id="hashTagForm" method="post" action="admin.jsp" onsubmit="return false;">
                    	<div id="hashTagContainer" class="template-demo">
                         </div> 
                         <div id="buttonContainer" class="template-demo"></div><br>
                         <div id="saveContainer" class="template-demo">
                        <button type="button" class="btn btn-primary" id="btnSave" >저장(Save)</button>
                        </div>
                        </form>
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
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
  <!-- endinject -->
<script type="text/javascript">
$("#selectCategory").change(function() {
	var categoryNum = $("#selectCategory").val();
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
	         $('#selectTea').empty();
			   var teaInfo = result;
			   var hashtagContainer = $("#hashTagContainer");
			   var buttonContainer = $("#buttonContainer");
			   var saveContainer = $("#saveContainer");
			   if(teaInfo.length == 0){
				   alert("해당 카테고리에 상품이 존재하지 않습니다.");
				   $('#selectTea').empty();
				   hashtagContainer.empty(); // hashtagContainer 비우기
				   buttonContainer.empty(); // buttonContainer 비우기
				   saveContainer.css("display", "none");
				   return;
			   }
			   var firstItem = result[0];
			    $('#teaNum').attr("value",firstItem.teaNum);
			    $('#teaName').attr("value",firstItem.teaName);
			   for (var i=0;i<teaInfo.length;i++){
			   var optteaNum=teaInfo[i].teaNum;
			   var optteaName = teaInfo[i].teaName;
			   console.log(optteaName);
	                var optionElement = $('<option>' + optteaName + '</option>')
	                .attr('value', optteaNum)
	                .attr('data-tea-name', optteaName)                
	                $('#selectTea').append(optionElement);
			
			      }
		   },			
		error: function(error){
		    console.log(error);
	    }
	});
  });

$("#selectbutton").click(function () {
	  var tea = $("#selectTea").val();
	  var hashtagContainer = $("#hashTagContainer");
	  var buttonContainer = $("#buttonContainer");
	  $.ajax({
	    url: "selectReview.do",
	    data: {
	      tea: tea
	    },
	    type: "post",
	    dataType: "json",
	    success: function (result) {
	    	  console.log(result);
	    	  $('#selectReview').empty();
	    	  hashtagContainer.empty();
			  buttonContainer.empty();
			  $('#saveContainer').css("display","none");
	    	  if (result && result.length > 0) {
	    	    var firstRw = result[0];
	    	    $('#reviewNum').attr("value", firstRw.reviewNum);
	    	    $('#reviewContent').attr("value", firstRw.reviewContent);
	    	    $('#memberId').attr("value", firstRw.memberId);

	    	    for (var i = 0; i < result.length; i++) {
	    	      var optreviewNum = result[i].reviewNum;
	    	      var optreviewContent = result[i].reviewContent;
	    	      var optmemberId = result[i].memberId;

	    	      var optRwElement = $('<option>' + optreviewContent + '</option>')
	    	        .attr('value', optreviewNum)
	    	        .attr('data-review-content', optreviewContent)
	    	        .attr('data-member-id', optmemberId);

	    	      $('#selectReview').append(optRwElement);
	    	      $('#selectRwbutton').css('display', 'block');
	    	    }
	    	  } else {
	    	    alert("해당 상품은 리뷰가 없네용..ㅎㅎ");
	    	    $('#selectRwbutton').css('display', 'none');
	    	    $('#addHashTag').css('display', 'none');
	    	    $('#hashTagContainer').empty();
	    	    $('#saveContainer').css("display","none");
	    	  }
	    	},
	    error: function (error) {
	      console.log(error);
	    }
	  });
	});
$("#selectRwbutton").click(function () {
	  var hashtag = $("#selectReview").val();

	  $.ajax({
	    url: "selectReviewTag.do",
	    data: {
	      hashtag: hashtag
	    },
	    type: "post",
	    dataType: "json",
	    success: function (result) {
	      console.log(result);
	      var hashtagContainer = $("#hashTagContainer");
	      var buttonContainer = $("#buttonContainer");
	      var saveContainer = $("#saveContainer");
	      hashtagContainer.empty();
	      buttonContainer.empty();
	      saveContainer.css("display", "block");
	      var hashtags = result;

	      if (hashtags.length > 0) {
	        var firstTag = hashtags[0].reviewHashtagContent;
	        var hashTagElement = $("<input>", {
	          type: "button",
	          name: "reviewHashtagContent",
	          value: firstTag
	        });

	        var randomStyle = getRandomStyle(); // 랜덤한 스타일을 얻는 도우미 함수
	        hashTagElement.addClass("btn " + randomStyle);
	        hashtagContainer.append(hashTagElement);

	        for (var i = 1; i < hashtags.length; i++) {
	          var hashtag = hashtags[i].reviewHashtagContent;
	          randomStyle = getRandomStyle();
	          var tagElement = $("<input type='button' name='reviewHashtagContent' class='btn " + randomStyle + "'>")
	            .val(hashtag)
	            .css("display", "block");
	          hashtagContainer.append(tagElement);
	        }
	      } else {
	    	  var tagElement = $("<strong>해당 리뷰의 해시태그가 없네용..ㅎㅎ</strong>")
	            .css("display", "block");
	          hashtagContainer.append(tagElement);
	          saveContainer.css("display", "none");
	        console.log("선택된 상품에 대한 해시태그가 없습니다.");
	      }
	    },
	    error: function (error) {
	      	
	      console.log(error);
	    }
	  });
	});
	
	
$("#selectCategory").on("change", function() {
	   $("#selectReview").empty();
	   $("#selectRwbutton").hide();
	   $("#hashTagContainer").empty();
	   $("#buttonContainer").empty();
	   $("#saveContainer").hide();
	});

$("#selectTea").on("change", function() {
	       $("#selectReview").empty();
	       $("#selectRwbutton").hide();
		   $("#hashTagContainer").empty();
		   $("#buttonContainer").empty();
		   $("#saveContainer").hide();
	});
	
$("#selectReview").on("change", function() {
	   $("#hashTagContainer").empty();
	   $("#buttonContainer").empty();
	   $("#saveContainer").hide();
});
	
	// 랜덤한 버튼 스타일을 얻는 도우미 함수
	function getRandomStyle() {
	  var buttonStyles = ["btn-success", "btn-warning", "btn-info", "btn-dark"];
	  return buttonStyles[Math.floor(Math.random() * buttonStyles.length)];
	}

</script>
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
             // 버튼이 아직 추가되지 않았으면 삭제하기 버튼을 추가 (관리자는 오직 리뷰 해시태그를 삭제만 가능토록)

             var deleteButton = document.createElement("button"); // <button> 생성
             deleteButton.textContent = "삭제"; // 브라우저에서 "삭제"라는 글자의 버튼이 나오도록
             deleteButton.classList.add("btn", "btn-outline-danger", "btn-sm"); // 버튼 디자인 및 색깔 지정

             // 위의 삭제 버튼을 담아낼 hashTagItem이라는 <div> 생성 
             containerDiv = document.createElement("div");
             containerDiv.classList.add("hashTagItem");

             // <div class="hashTagItem">의 하위요소 (자식) 으로 들어가게 설정 --> <div class="hashTagItem"> *삭제 버튼이 들어갈 공간* </div>
             containerDiv.appendChild(deleteButton);

             // div 요소를 <input> 요소 앞에 추가
             clickedElement.parentElement.insertBefore(containerDiv, clickedElement.nextElementSibling);
             isButtonVisible = true; // 요거 밑의 else랑 같이 토글형식 구현
         } else {
             // 클릭한 버튼을 다시 클릭하면 버튼을 숨기도록 설정
             containerDiv.remove();
             isButtonVisible = false;
         }
    	          
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



$('#btnSave').on("click", function(){
	console.log('버튼 클릭됨');
	
	var inputElements = hashTagContainer.querySelectorAll("input[type='button']"); // 유효성 검사를 위해 해시태그 입력란 내 모든 input 요소 찾기
	console.log(inputElements);
	
	//var teaNum = $('#teaNum').val();
	var reviewNum = $("#selectReview option:selected").val();
	
	var hashTags = new Array();
	    
	// 현재 입력된 해시태그를 Set에 추가
	var i = 0;
	inputElements.forEach(function(inputElement) {
	var value = inputElement.value;
	
	
	//hashTags.add(value);
	hashTags[i] = value;
	
	console.log("value: "+value);
	i++;
	});
	
	console.log("arr: "+hashTags);
	console.log("reviewNum: "+reviewNum);
	
	var hashTags = {itemNum: reviewNum, tag1: hashTags[0], tag2: hashTags[1], tag3: hashTags[2] };

	
	$.ajax({
        url: 'adminHashtagReview.do',
        type: 'POST',
        data: hashTags,
        success: function(fresult){
        	alert('해시태그 저장 완료!');
          	
        },
        error: function(error){
           alert('error [' + error + ']');
        }
     });
	
	
});

</script>
<script type="text/javascript">

document.addEventListener("DOMContentLoaded", function () {
	  const saveContainer = document.getElementById("saveContainer");

	  // 페이지 로드 시 "저장(Save)" <div> 영역 숨기기
	  saveContainer.style.display = "none";
	});

</script>
</body>
</html>