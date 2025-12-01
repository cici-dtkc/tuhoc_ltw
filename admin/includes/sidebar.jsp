<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<aside class="sidebar" id="sidebar">
    <div class="brand">
        <button class="toggle-icon sidebar-toggle" id="sidebarToggle" style="cursor: pointer">
            <i class="fa-solid fa-bars" style="font-size: 16px"></i>
        </button>
        <div>
            <div class="muted">Quản lý bán hàng</div>
        </div>
    </div>

    <div class="section-title">Điều hướng</div>
    <nav class="nav-section" id="nav-section">
        <ul class="nav-list primary-nav" id="nav">
            <li class="nav-item">
                <a class="nav-link" data-target="dashboard" href="${pageContext.request.contextPath}/admin/dashboardAdmin.jsp">
                    <span class="icon"><i class="fa-solid fa-chart-pie"></i></span>
                    <span class="nav-label">Tổng Quan</span>
                </a>
                <span class="nav-tooltip">Tổng Quan</span>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-target="products" href="${pageContext.request.contextPath}/admin/productAdmin.jsp">
                    <span class="icon"><i class="fa-solid fa-box-open"></i></span>
                    <span class="nav-label">Sản phẩm</span>
                </a>
                <span class="nav-tooltip">Sản phẩm</span>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-target="orders" href="#">
                    <span class="icon"><i class="fa-solid fa-receipt"></i></span>
                    <span class="nav-label">Đơn hàng</span>
                </a>
                <span class="nav-tooltip">Đơn hàng</span>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-target="customers" href="${pageContext.request.contextPath}/admin/userManagement.jsp">
                    <span class="icon"><i class="fa-solid fa-users"></i></span>
                    <span class="nav-label">Khách hàng</span>
                </a>
                <span class="nav-tooltip">Khách hàng</span>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-target="promotions" href="${pageContext.request.contextPath}/admin/vouchersAdmin.jsp">
                    <span class="icon"><i class="fa-solid fa-tags"></i></span>
                    <span class="nav-label">Khuyến mãi</span>
                </a>
                <span class="nav-tooltip">Khuyến mãi</span>
            </li>
        </ul>
        <ul class="nav-list second-nav">
            <li class="nav-item">
                <a class="nav-link" data-target="info" href="#">
                    <span class="icon"><i class="fa-solid fa-user-tie"></i></span>
                    <span class="nav-label">Thông tin</span>
                </a>
                <span class="nav-tooltip">Thông tin</span>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-target="logout" href="${pageContext.request.contextPath}/LogoutServlet">
                    <span class="icon"><i class="fa-solid fa-right-from-bracket"></i></span>
                    <span class="nav-label">Đăng xuất</span>
                </a>
                <span class="nav-tooltip">Đăng xuất</span>
            </li>
        </ul>
    </nav>
</aside>
