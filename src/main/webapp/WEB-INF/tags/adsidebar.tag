<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav">
          <li class="nav-item">
            <a class="nav-link" href="admin.do">
              <i class="mdi mdi-home menu-icon"></i>
              <span class="menu-title">메인으로 돌아가기</span>
            </a>
          </li>
          <li class="nav-item nav-category">Hashtag</li>
          <li class="nav-item">
            <a class="nav-link" data-bs-toggle="collapse" href="adminHashtagTea.do" aria-expanded="false" aria-controls="ui-basic">
              <i class="menu-icon mdi mdi-tag-text-outline"></i>
              <span class="menu-title">상품 해시태그 관리</span>
              <i class="menu-arrow"></i> 
            </a>
            <div class="collapse" id="ui-basic">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="adminHashtagTea.do">상품 Htg 추가/삭제/수정</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-bs-toggle="collapse" href="adminHashtagReview.do" aria-expanded="false" aria-controls="charts">
              <i class="menu-icon mdi mdi-tag-faces"></i>
              <span class="menu-title">후기 해시태그 관리</span>
              <i class="menu-arrow"></i> 
            </a>
            <div class="collapse" id="charts">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="adminHashtagReview.do">후기 Htg 추가/삭제/수정</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item nav-category">Tea Product Management</li>
          <li class="nav-item">
            <a class="nav-link" data-bs-toggle="collapse" href="adminTea.do" aria-expanded="false" aria-controls="form-elements">
              <i class="menu-icon mdi mdi-stove"></i>
              <span class="menu-title">티 상품관리</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="form-elements">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"><a class="nav-link" href="adminTea.do" id="addtea">상품 추가</a></li>
                <li class="nav-item"><a class="nav-link" href="adminTea.do#scrolltodelete" id="deletetea">상품 삭제</a></li>
                <li class="nav-item"><a class="nav-link" href="adminTea.do#scrolltofix" id="fixtea">상품 수정(재고/가격)</a></li>
              </ul>
            </div>
          </li>
        </ul>
      </nav>
     <script>
     // 스크롤되면 옆에 사이드바도 같이 따라서 내려오는 스크립트
     var sidebar = document.getElementById("sidebar");

     window.addEventListener("scroll", function () {
         var scrolled = window.scrollY;
         sidebar.style.transform = "translateY(" + scrolled + "px)";
     });
     
     </script> 