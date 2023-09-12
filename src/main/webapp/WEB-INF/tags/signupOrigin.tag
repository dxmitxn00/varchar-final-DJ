<%@ tag language="java" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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