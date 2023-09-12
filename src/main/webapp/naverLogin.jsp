<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="try"%>
<!DOCTYPE html>
<html>
<head>
    <title>Var茶 | 홈</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- 파비콘 태그 -->
    <try:favicon/>
    <!-- 링크 부분 태그 -->
    <try:link/>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<script type="text/javascript">
    var naver_id_login = new naver_id_login("gSqN5AjK3F7dFSVLcJF0", "http://localhost:8088/app/loginNaver.do");
    // 접근 토큰 값 출력
    $('#N_info').append('<p>접속토큰:'+naver_id_login.oauthParams.access_token+'</p>');
    // 네이버 사용자 프로필 조회
    naver_id_login.get_naver_userprofile("naverSignInCallback()");
    // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
    function naverSignInCallback() {
        const id = naver_id_login.getProfileData('id');
        const name = naver_id_login.getProfileData('name');
        const email = naver_id_login.getProfileData('email');
        const mobile = naver_id_login.getProfileData('mobile');
    
	$('#N_info').append('<p>로그인 성공!<p>');
	$('#N_info').append('<p>아이디:'+id+'</p>');
	$('#N_info').append('<p>이름:'+name+'</p>');
	$('#N_info').append('<p>이메일:'+email+'</p>');
	$('#N_info').append('<p>생일:'+mobile+'</p>');
  }
  
</script>
<div id="N_info">
	
</div>


</body>
</html>