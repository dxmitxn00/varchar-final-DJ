<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="try"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
	<try:favicon/>
</head>
<body>
<script>
	window.onload = function() {
	    Swal.fire({
	      title: '${ sweetAlert.title }', // 제목 text
	      text: '${ sweetAlert.text }', // 내용 text
	      icon: '${ sweetAlert.icon }', // warning, success, info, error, question
	      confirmButtonColor: '#d33', // confrim 버튼 색깔 지정
	      confirmButtonText: '확인' // confirm 버튼 text
	    }).then((result) => {
	        if (result.isConfirmed) {
	        	history.go(-1);
	        }
	    });
	}
</script>
</body>
</html>