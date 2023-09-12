<%@ tag language="java" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<input type="hidden" name="memberPlatform">
<div class="col-md-12">
	<label for="id">아이디<span id="spanId" class="edit-red"> *</span></label>
	<div class="form-group edit-d-f">
		<input type="text" id="inputId" name="memberId" class="form-control" placeholder="아이디를 입력하세요." required>
	</div>
</div>
<div class="w-100"></div>
<div class="col-md-12">
	<label for="password">비밀번호<span id="spanPassword1" class="edit-red"> *</span></label>
	<div class="form-group edit-d-f">
		<input type="password" id="inputPassword1" name="memberPw" class="form-control" placeholder="비밀번호를 입력하세요." required>
		<button type="button" id="inputBtnPassword1" class="edit-btn"><i class="fa-solid fa-eye-slash"></i></button>
	</div>
</div>
<div class="w-100"></div>
<div class="col-md-12">
	<label for="passwordre">비밀번호 확인<span id="spanPassword2" class="edit-red"> *</span></label>
	<div class="form-group edit-d-f">
		<input type="password" id="inputPassword2" class="form-control" placeholder="비밀번호를 한번 더 입력하세요." required>
		<button type="button" id="inputBtnPassword2" class="edit-btn"><i class="fa-solid fa-eye-slash"></i></button>
	</div>
</div>
<script type="text/javascript">
		var inputId = null;
		var inputPassword1 = null;
		var inputPassword2 = null;
	
		var flagId = false;
		var flagPassword1 = false;
		var flagPassword2 = false;
		
		// 아이디 입력
		$("#inputId").on("input", function(){
			checkInputId();
		})
		
		// 아이디 함수
		function checkInputId() {
			var regexId = /^[0-9a-zA-Z]{7,20}$/;
			inputId = $("#inputId").val();
			
			if (!regexId.test(inputId)) {
				if (inputId == '') {
					$("#spanId").html(' <i class="fa-solid fa-x"></i> 필수 정보입니다.');
				} else {
					$("#spanId").html(' <i class="fa-solid fa-x"></i> 7 ~ 20자의 영문, 숫자만 사용 가능합니다.');
				}
				$("#spanId").css("color", "red");
				flagId = false;
			} else {
				console.log("checkInputId AJAX 진입");
				$.ajax({
					url: "checkId.do",
					data: {
						memberId: inputId
					},
					type: "post",
				    dataType: "json",
					success: function(result){
					    if (result == 1) {
			    			$("#spanId").html(' <i class="fa-solid fa-x"></i> 중복된 아이디가 있습니다.');
			    			$("#spanId").css("color", "red");
			        		flagId = false;
			    		} else {
			    			$("#spanId").html(' <i class="fa-solid fa-check"></i>');
			    			$("#spanId").css("color", "green");
			        		flagId = true;
			    		}
					},
					error: function(error){
					    console.log(error);
				    }
		    	});
			}
			console.log(flagId);
		}
		
		// 비밀번호 입력
		$("#inputPassword1").on("input", function(){
			checkInputPassword1();
		})
		
		// 비밀번호 함수
		function checkInputPassword1(){
			var regexPassword = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,20}$/;
			inputPassword1 = $("#inputPassword1").val();
			inputPassword2 = $("#inputPassword2").val();
			
			if (!regexPassword.test(inputPassword1)) {
				if (inputPassword1 == '') {
					$("#spanPassword1").html(' <i class="fa-solid fa-x"></i> 필수 정보입니다.');
				} else {
					$("#spanPassword1").html(' <i class="fa-solid fa-x"></i> 8 ~ 20자의 영문 대 소문자, 숫자, 특수문자를 사용하세요.');
				}
				$("#spanPassword1").css("color", "red");
				flagPassword1 = false;
			} else {
				$("#spanPassword1").html(' <i class="fa-solid fa-check"></i>');
				$("#spanPassword1").css("color", "green");
				flagPassword1 = true;
			}
			
			if (inputPassword1 != inputPassword2) {
				$("#spanPassword2").html(' <i class="fa-solid fa-x"></i> 비밀번호가 일치하지 않습니다.');
				$("#spanPassword2").css("color", "red");
				flagPassword2 = false;
			} else {
				$("#spanPassword2").html(' <i class="fa-solid fa-check"></i>');
				$("#spanPassword2").css("color", "green");
				flagPassword2 = true;
			}
			console.log(flagPassword1);
			console.log(flagPassword2);
		}
		
		// 비밀번호 확인 입력
		$("#inputPassword2").on("input", function(){
			checkInputPassword2();
		})
		
		// 비밀번호 확인 함수
		function checkInputPassword2(){
			inputPassword1 = $("#inputPassword1").val();
			inputPassword2 = $("#inputPassword2").val();
			
			if (inputPassword1 != inputPassword2) {
				$("#spanPassword2").html(' <i class="fa-solid fa-x"></i> 비밀번호가 일치하지 않습니다.');
				$("#spanPassword2").css("color", "red");
				flagPassword2 = false;
			} else {
				$("#spanPassword2").html(' <i class="fa-solid fa-check"></i>');
				$("#spanPassword2").css("color", "green");
				flagPassword2 = true;
			}
			console.log(flagPassword2);
		}
</script>