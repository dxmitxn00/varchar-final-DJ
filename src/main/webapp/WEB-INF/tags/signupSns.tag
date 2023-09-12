<%@ tag language="java" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style type="text/css">
	#edit_hidden {
		display: none;
	}
	#edit_icon_image {
		width: 80px;
		height: 80px;
	}
	#edit_signSns {
		width: 100%;
	}
</style>


<div class="container">
	<div class="row no-gutters ftco-services">
		<div class="col-md-3 text-center d-flex align-self-stretch ftco-animate">
			<div class="media block-6 services mb-md-0 mb-4">
				<div class="icon d-flex justify-content-center align-items-center mb-2">
					<img id="edit_icon_image" src="images/icon_${ memberData.memberPlatform }.png">
				</div>
			</div>      
		</div>
		<div class="col-md-9 text-center d-flex align-self-stretch ftco-animate">
			<div class="media block-6 services mb-md-0 mb-4">
				<div id="edit_signSns" class="icon d-flex justify-content-center align-items-center mb-2">
					<c:if test="${ memberData.memberPlatform eq 'kakao' }">
						<h3>카카오톡 계정 회원가입</h3>
					</c:if>
					<c:if test="${ memberData.memberPlatform eq 'naver' }">
						<h3>네이버 계정 회원가입</h3>
					</c:if>
					<c:if test="${ memberData.memberPlatform eq 'google' }">
						<h3>구글 계정 회원가입</h3>
					</c:if>
				</div>
				<div class="media-body">
				</div>
			</div>      
		</div>
	</div>
</div>
<input type="hidden" name="memberPlatform" value="${ memberData.memberPlatform }">
<div id="edit_hidden">
<div class="col-md-12">
	<label for="id">아이디<span id="spanId" class="edit-red"> *</span></label>
	<div class="form-group edit-d-f">
		<input type="hidden" id="inputId" name="memberId" value="${ memberData.memberId }" class="form-control" placeholder="아이디를 입력하세요." required>
	</div>
</div>
<div class="w-100"></div>
<div class="col-md-12">
	<label for="password">비밀번호<span id="spanPassword1" class="edit-red"> *</span></label>
	<div class="form-group edit-d-f">
		<input type="hidden" id="inputPassword1" name="memberPw" value="${ memberData.memberPw }" class="form-control" placeholder="비밀번호를 입력하세요." required>
		<button type="button" id="inputBtnPassword1" class="edit-btn"><i class="fa-solid fa-eye-slash"></i></button>
	</div>
</div>
<div class="w-100"></div>
<div class="col-md-12">
	<label for="passwordre">비밀번호 확인<span id="spanPassword2" class="edit-red"> *</span></label>
	<div class="form-group edit-d-f">
		<input type="hidden" id="inputPassword2" value="${ memberData.memberPw }" class="form-control" placeholder="비밀번호를 한번 더 입력하세요." required>
		<button type="button" id="inputBtnPassword2" class="edit-btn"><i class="fa-solid fa-eye-slash"></i></button>
	</div>
</div>
</div>