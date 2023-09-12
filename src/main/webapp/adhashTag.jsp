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

#selectCategory {
	color: black;
}

#selectTea{
	color: black;
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
										<h5><strong>상품 카테고리 선택 [1) 카테고리를 먼저 지정한다.]</strong></h5>
										<select class="form-control" id="selectCategory">
										<option value="선택하세요" id="none" disabled selected hidden>카테고리 선택</option>
										<c:forEach var="categoryData" items="${categoryDatas}">
										<option value="${categoryData.categoryNum}">${categoryData.categoryName}</option>
										</c:forEach>
										</select>
									</div>
										<div class="form-group">
										<h5><strong>상품 선택 [2) 위에서 나눈 카테고리 별로 상품이 출력되게 한다.]</strong></h5>
										<select class="form-control" id="selectTea"></select> <br>
										<button type="button" id="selectbutton" class="btn btn-outline-info">조회</button>
									</div>
                    	<form id="hashTagForm" method="post" action="adminHashtagTea.do" onsubmit="return false;">
                    	<div id="hashTagContainer" class="template-demo">
                         </div> <br>
                        <button type="button" class="btn btn-primary" id="btnSave" >저장(Save)</button>
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
                        <button type="button" id="addHashTag" class="btn btn-dark btn-rounded btn-fw">직접 입력</button>
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
			   // 여기서 id가 selectTea라는 <select> 하위의 <option>에 gson으로 받아온
			   // 기존의 <option>을 모두 제거합니다.
			  // console.log(result[1].teaNum);
	         $('#selectTea').empty();
			   var teaInfo = result;
			   //var selteaNum='';
			   //var selteaName='';
			   //var selteaCnt='';
			   //var selteaPrice='';
			   //var selteaContent='';
			   var firstItem = result[0];
			    $('#teaNum').attr("value",firstItem.teaNum);
			    $('#teaName').attr("value",firstItem.teaName);
			   for (var i=0;i<teaInfo.length;i++){
			   var optteaNum=teaInfo[i].teaNum;
			   var optteaName = teaInfo[i].teaName;
			   console.log(optteaName);
			//     console.log(optteaNum);
			     // 각 <option>에 데이터를 속성으로 추가
	                var optionElement = $('<option>' + optteaName + '</option>')
	                    .attr('value', optteaNum)
	                    .attr('data-tea-name', optteaName)

	                // <option>을 #teaToDel에 추가
	                $('#selectTea').append(optionElement);
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

$("#selectbutton").click(function() {
	  var hashtag = $("#selectTea").val();
	 // var hashTags = exampleData.find(function(product) {
	 //   return product.name === selectedProduct;
	 // });
	  $.ajax({
			url: "selectTeaTag.do",
			data: {
				hashtag: hashtag
			},
			type: "post",
		    dataType: "json",
			success: function(result){
			   console.log(result);
			   // 여기서 id가 selectTea라는 <select> 하위의 <option>에 gson으로 받아온
			 //  var teaInfo = result;
			//   var selteaName='';
			//   for (var i=0;i<teaInfo.length;i++){
			//   var optteaName = teaInfo[i].teaName;
			//   console.log(optteaName);
			//   selteaName += '<option>' + optteaName + '</option>';
			//      }
			   // 기존의 <option>을 모두 제거합니다.
	        //   $('#selectTea').empty();

	           // 새로운 <option>을 추가합니다.
	       //    $('#selectTea').append(selteaName);
			   },
			   // teaName이 forEach 형식으로 뜨게 하고 싶다.
			   // 결국엔 배열 형식이기 때문에, 항상 JAVA에서 써오던 for문 방식으로 먼저 체크를 해보자.
			   // 그리고 TeaVO의 멤버변수 하나하나로 다 받아온 저 result를 teaName만 추출해서 나오게 하도록!
			   // 오늘 집가서 이거 제대로 끝낸다 스바...
			
			error: function(error){
			    console.log(error);
		    }
		});
	  
	  // 해시태그 버튼을 생성하고 추가
//	  var hashTagContainer = $("#hashTagContainer");
//	  hashTagContainer.empty(); // 이전 버튼 제거
	  
//	  if (hashTags && hashTags.hashtags) {
//	    hashTags.hashtags.forEach(function(tag) {
//	      var classNames = ["btn-success", "btn-warning", "btn-info", "btn-dark"];
//	      var randomClass = classNames[Math.floor(Math.random() * classNames.length)];
//	      var hashTagButton = $('<input type="button" value="' + tag + '" name="hashTagContent" class="btn '+ randomClass +'" style="display: block;">');
//	      console.log('해시태그: '+tag);
//	      hashTagContainer.append(hashTagButton);
//	    });
//	  }
	});
</script>
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function () {
	  const hashTagMaker = document.getElementById("hashTagMaker");

	  // 페이지 로드 시 "hashTagMaker" <div> 영역 숨기기
	  hashTagMaker.style.display = "none";
	  
	  const selectCategory = document.getElementById("selectCategory");
	  
	  // "카테고리 선택" 옵션이 변경될 때 이벤트 리스너를 추가
	  selectCategory.addEventListener("change", function () {
	    if (selectCategory.value === "선택하세요") {
	      // "카테고리 선택"이 선택되었을 때 "hashTagMaker" <div> 영역 숨기기
	      hashTagMaker.style.display = "none";
	    } else {
	      // 다른 카테고리가 선택되었을 때 "hashTagMaker" 표시
	      hashTagMaker.style.display = "block";
	    }
	  });
	});
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
	// 조회되는 상품이 없다면 입력 막기

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
        hashTagElement.setAttribute('name','teaHashtagContent')
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
    }
});

function hashZungBok(newHashTag, inputElements) {
    // Set을 사용하여 중복된 해시태그를 확인
    // 참고로 Set은 클래스이기 때문에 밑처럼 new 해주기
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

$('#btnSave').on("click", function(){
	console.log('버튼 클릭됨');
	
	var inputElements = hashTagContainer.querySelectorAll("input[type='button']"); // 유효성 검사를 위해 해시태그 입력란 내 모든 input 요소 찾기
	console.log(inputElements);
	
	//var teaNum = $('#teaNum').val();
	var teaNum = $("#selectTea option:selected").val();
	
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
	console.log("teaNum: "+teaNum);
	
	var hashTags = {itemNum: teaNum, tag1: hashTags[0], tag2: hashTags[1], tag3: hashTags[2] };

	
	$.ajax({
        url: 'adminHashtagTea.do',
        type: 'POST',
        data: hashTags,
        success: function(fresult){
            //console.log('favorResult [' + favorResult + ']');
          	
        },
        error: function(error){
           alert('error [' + error + ']');
        }
     });
	
	
});







</script>
</body>
</html>