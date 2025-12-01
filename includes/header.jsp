<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Header -->
<header id="header">
    <div class="container">
        <div class="inner-wrap">
            <div class="logo" id="logo">
                <a href="${pageContext.request.contextPath}/index.jsp">
                    <img src="${pageContext.request.contextPath}/assert/img/logo.png" alt="Logo Website" id="logo-img">
                </a>
            </div>
            <nav class="menu" id="menu">
                <ul>
                    <li><a href="${pageContext.request.contextPath}/index.jsp" id="nav-home">Trang chủ</a></li>
                    <li><a href="${pageContext.request.contextPath}/listproduct.jsp" id="nav-phone">Điện thoại</a></li>
                    <li class="has-mega" id="nav-accessory-item">
                        <a href="#" id="nav-accessory">Phụ kiện <i class="fa-solid fa-chevron-down" style="font-size:12px; margin-left:6px;"></i></a>
                        <div class="mega-menu" id="mega-accessory">
                            <div class="mega-inner">
                                <div class="mega-col">
                                    <h4>Phụ kiện di động</h4>
                                    <a href="#">Sạc dự phòng</a>
                                    <a href="#">Sạc, cáp</a>
                                    <a href="#">Ốp lưng điện thoại</a>
                                </div>
                                <div class="mega-col">
                                    <h4>&nbsp;</h4>
                                    <a href="#">Miếng dán màn hình</a>
                                    <a href="#">Kính cường lực</a>
                                    <a href="#">Giá đỡ điện thoại</a>
                                </div>
                                <div class="mega-col">
                                    <h4>&nbsp;</h4>
                                    <a href="#">Thẻ nhớ</a>
                                    <a href="#">Tai nghe Bluetooth</a>
                                    <a href="#">Tai nghe có dây</a>
                                </div>
                                <div class="mega-col">
                                    <h4>&nbsp;</h4>
                                    <a href="#">Dây đeo đồng hồ</a>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li><a href="#footer" id="nav-contact">Liên hệ</a></li>
                </ul>
            </nav>
            <div class="box" id="icon-box">
                <ul>
                    <li class="search-item">
                        <a href="#" id="btn-search"><i class="fa-solid fa-magnifying-glass"></i></a>
                        <input id="header-search" class="search-input" type="text" placeholder="Tìm kiếm sản phẩm..." />
                    </li>
                    <li class="cart-item">
                        <a href="${pageContext.request.contextPath}/cart.jsp" id="btn-cart">
                            <i class="fa-solid fa-cart-shopping"></i>
                            <span class="cart-badge" id="cart-badge">
                                <c:if test="${not empty sessionScope.cartCount}">
                                    ${sessionScope.cartCount}
                                </c:if>
                            </span>
                        </a>
                    </li>
                    <li id="user-area" class="user-area">
                        <c:choose>
                            <c:when test="${not empty sessionScope.user}">
                                <a href="${pageContext.request.contextPath}/info-user.jsp" id="btn-user">
                                    <i class="fa-solid fa-user"></i>
                                    <span>${sessionScope.user.name}</span>
                                </a>
                            </c:when>
                            <c:otherwise>
                                <a href="${pageContext.request.contextPath}/login.jsp" id="btn-user">
                                    <i class="fa-solid fa-user"></i>
                                </a>
                            </c:otherwise>
                        </c:choose>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</header>
<!-- End Header -->
