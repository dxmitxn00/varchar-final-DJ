<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style type="text/css">
	#edit_loginIcon {
		height: 19px;
		width: 19px;
	}
</style>
<!-- 상단 핵심 소개바 + 메뉴 + 반응형 구조로 창 최소화시 검은색으로 변하는 부분 (goto-here는 스크롤시 딸려나오지 않음) -->
	<div class="py-1 bg-primary">
    	<div class="container">
    		<div class="row no-gutters d-flex align-items-start align-items-center px-md-0">
	    		<div class="col-lg-12 d-block">
		    		<div class="row d-flex">
		    			<div class="col-md pr-4 d-flex topper align-items-center">
					    	<div class="icon mr-2 d-flex justify-content-center align-items-center"><span class="icon-phone2"></span></div>
						    <span class="text">+82 2 1588 5890</span>
					    </div>
					    <div class="col-md pr-4 d-flex topper align-items-center">
					    	<div class="icon mr-2 d-flex justify-content-center align-items-center"><span class="icon-paper-plane"></span></div>
						    <span class="text">tryCatchers@gmail.com</span>
					    </div>
					    <div class="col-md-5 pr-4 d-flex topper align-items-center text-lg-right">
					    	<c:if test="${ empty sessionMemberId }">
						    	<span class="text">Healing and Fresh all day with varchar</span> <!-- primary.emptyid -->
						    </c:if>
					    	<c:if test="${ not empty sessionMemberId }">
						    	<span class="text"><img id="edit_loginIcon" alt="" src="images/icon_${ sessionMemberPlatform }.png"> ${ sessionMemberName }님 환영합니다!</span> <!-- primary.id -->
						    </c:if>
					    </div>
				    </div>
			    </div>
		    </div>
		</div>
    </div>
	<!-- primary 끝 -->
	
	<!-- navbar: 상단 바 -->
    <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="main.do">Var &nbsp; 茶</a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span>
	      </button>

	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item active"><a href="main.do" class="nav-link">홈</a></li> <!-- nav.home -->
	          <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="teaListPage.do" id="dropdown04" aria-haspopup="true" aria-expanded="false">티 제품
              </a><!-- nav.category -->
              <div class="dropdown-menu" aria-labelledby="dropdown04">
              	<c:forEach var="category" items="${ categorys }">
              		<c:if test="${ category.categoryName != '해당없음'  }">
	              		<a class="dropdown-item" href="teaListPage.do?categoryName=${ category.categoryName }">${ category.categoryName }</a>
              		</c:if>
              	</c:forEach>
              	<!-- <a class="dropdown-item" href="teaListPage.do?categoryName=녹차">녹차</a> nav.category01
                <a class="dropdown-item" href="teaListPage.do?categoryName=홍차">홍차</a>
                <a class="dropdown-item" href="teaListPage.do?categoryName=루이보스">루이보스</a>
                <a class="dropdown-item" href="teaListPage.do?categoryName=우롱차">우롱차</a>
				<a class="dropdown-item" href="teaListPage.do?categoryName=허브차">허브차</a> -->
              </div>
            </li>
			  <li class="nav-item"><a href="reviewListPage.do?searchName=ALL" class="nav-link">티 후기</a></li> <!-- nav.review -->
	          <li class="nav-item"><a href="mapPage.do" class="nav-link">지점 위치</a></li> <!-- nav.place -->
			<!-- 비로그인 시 : 마이페이로 이동 -->
			<c:if test="${ empty sessionMemberId }">
			<li class="nav-item dropdown">
			  <a class="nav-link dropdown-toggle" href="login.do" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">마이페이지</a> <!-- nav.mypage -->
			  <div class="dropdown-menu" aria-labelledby="dropdown04">
				<a class="dropdown-item" href="login.do">로그인이 필요합니다</a> <!-- nav.loginIfo -->
			  </div>
			</li>
			</c:if>
			<!-- 로그인 시 : 각 메뉴 페이지로 이동 -->
			<c:if test="${ not empty sessionMemberId }">
			<li class="nav-item dropdown">
			  <a class="nav-link dropdown-toggle" href="updateInfo.do" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">마이페이지</a> <!-- nav.mypage -->
			  <div class="dropdown-menu" aria-labelledby="dropdown04">
				<a class="dropdown-item" href="cartPage.do">장바구니</a> <!-- nav.cart -->
				<a class="dropdown-item" href="favorPage.do">찜</a> <!-- nav.favor -->
			  	<a class="dropdown-item" href="buyListPage.do">주문내역</a> <!--  -->
			  	<a class="dropdown-item" href="myReviewsListPage.do?searchName=MEMBER">내 후기</a> <!-- nav.myReview -->
			  	<a class="dropdown-item" href="updateInfo.do">회원정보변경</a> <!-- nav.member -->
			  </div>
			 <c:if test="${ sessionMemberGrade eq 1 }">
			 	 <li class="nav-item"><a href="admin.do" class="nav-link">관리자페이지</a></li>
			 </c:if>
			</li>
			</c:if>
			</ul>
			<ul class="navbar-nav ml-auto">
	          <li class="nav-item cta cta-colored"><a href="cartPage.do" class="nav-link"><span class="icon-shopping_cart"></span>[${fn:length(sessionScope.cart)}]</a></li>
	          <li class="nav-item nav-line"></li>
	          <c:if test="${ empty sessionMemberId }">
	          	<li class="nav-item"><a href="login.do" class="nav-link">로그인</a></li> <!-- nav.login -->
	          	<li class="nav-item"><a href="signup.do" class="nav-link">회원가입</a></li> <!-- nav.signup -->
	          </c:if>
	          <c:if test="${ not empty sessionMemberId }">
	          	<li class="nav-item"><a href="logoutPage.do" class="nav-link">로그아웃</a></li> <!-- nav.logout -->
	          </c:if>
	        </ul>
	      </div>
	    </div>
	  </nav>
	 <!-- NAV 끝 --> 