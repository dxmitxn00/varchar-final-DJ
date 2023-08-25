<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav">
          <li class="nav-item">
            <a class="nav-link" href="admin.jsp">
              <i class="mdi mdi-home menu-icon"></i>
              <span class="menu-title">메인으로 돌아가기</span>
            </a>
          </li>
          <li class="nav-item nav-category">Hashtag</li>
          <li class="nav-item">
            <a class="nav-link" data-bs-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
              <i class="menu-icon mdi mdi-tag-text-outline"></i>
              <span class="menu-title">해시태그 관리</span>
              <i class="menu-arrow"></i> 
            </a>
            <div class="collapse" id="ui-basic">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="adhashTag.jsp">해시태그 추가</a></li>
                <li class="nav-item"> <a class="nav-link" href="adhashTag.jsp">해시태그 삭제</a></li>
                <li class="nav-item"> <a class="nav-link" href="adhashTag.jsp">해시태그 수정</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item nav-category">Tea Product Management</li>
          <li class="nav-item">
            <a class="nav-link" data-bs-toggle="collapse" href="#form-elements" aria-expanded="false" aria-controls="form-elements">
              <i class="menu-icon mdi mdi-stove"></i>
              <span class="menu-title">티 상품관리</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="form-elements">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"><a class="nav-link" href="adteaManage.jsp" id="addtea">상품 추가</a></li>
                <li class="nav-item"><a class="nav-link" href="adteaManage.jsp#scrolltodelete" id="deletetea">상품 삭제</a></li>
                <li class="nav-item"><a class="nav-link" href="adteaManage.jsp#scrolltofix" id="fixtea">상품 수정(재고/가격)</a></li>
              </ul>
            </div>
          </li>
        </ul>
      </nav>
     <script>
     var sidebar = document.getElementById("sidebar");

     window.addEventListener("scroll", function () {
         var scrolled = window.scrollY;
         sidebar.style.transform = "translateY(" + scrolled + "px)";
     });
     
     </script> 