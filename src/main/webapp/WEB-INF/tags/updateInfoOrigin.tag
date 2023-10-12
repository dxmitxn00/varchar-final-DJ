<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<input type="hidden" name="memberPlatform" value="${ memberData.memberPlatform }">
<div class="col-md-12">
	<label for="id"><spring:message code='updateInfo.form.id' /><span id="spanId" class="edit-red"></span></label>
	<div class="form-group edit-d-f">
		<input type="text" id="inputId" name="memberId" class="form-control" placeholder="아이디를 입력하세요." value="${ memberData.memberId }" readonly>
	</div>
</div>