<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Tổng quan - Quản trị</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboardAdmin.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/sidebarAdmin.css" />
</head>
<body>
<%
    // Dữ liệu mẫu cho dashboard
    request.setAttribute("todayRevenue", 12345000);
    request.setAttribute("newOrders", 12);
    request.setAttribute("visitors", 1243);
    request.setAttribute("outOfStock", 3);
    
    // Dữ liệu mẫu cho đơn hàng gần nhất
    java.util.List<java.util.Map<String, Object>> recentOrders = new java.util.ArrayList<>();
    
    java.util.Map<String, Object> ro1 = new java.util.HashMap<>();
    ro1.put("id", "DH1005");
    ro1.put("customer", "Nguyễn Văn C");
    ro1.put("status", "Đang giao");
    ro1.put("total", 2100000);
    recentOrders.add(ro1);
    
    java.util.Map<String, Object> ro2 = new java.util.HashMap<>();
    ro2.put("id", "DH1004");
    ro2.put("customer", "Phạm D");
    ro2.put("status", "Hoàn thành");
    ro2.put("total", 850000);
    recentOrders.add(ro2);
    
    request.setAttribute("recentOrders", recentOrders);
    
    // Dữ liệu mẫu cho người dùng mới
    java.util.List<java.util.Map<String, Object>> newUsers = new java.util.ArrayList<>();
    
    java.util.Map<String, Object> u1 = new java.util.HashMap<>();
    u1.put("initials", "NT");
    u1.put("name", "Nguyễn Minh Trí");
    u1.put("email", "minhtri@example.com");
    u1.put("daysAgo", 2);
    u1.put("variant", "1");
    newUsers.add(u1);
    
    java.util.Map<String, Object> u2 = new java.util.HashMap<>();
    u2.put("initials", "LH");
    u2.put("name", "Lê Hương");
    u2.put("email", "lehuong@example.com");
    u2.put("daysAgo", 3);
    u2.put("variant", "2");
    newUsers.add(u2);
    
    java.util.Map<String, Object> u3 = new java.util.HashMap<>();
    u3.put("initials", "TV");
    u3.put("name", "Trần Văn A");
    u3.put("email", "tranva@example.com");
    u3.put("daysAgo", 4);
    u3.put("variant", "3");
    newUsers.add(u3);
    
    java.util.Map<String, Object> u4 = new java.util.HashMap<>();
    u4.put("initials", "PB");
    u4.put("name", "Phạm Thị B");
    u4.put("email", "phamtb@example.com");
    u4.put("daysAgo", 5);
    u4.put("variant", "4");
    newUsers.add(u4);
    
    java.util.Map<String, Object> u5 = new java.util.HashMap<>();
    u5.put("initials", "HA");
    u5.put("name", "Hoàng An");
    u5.put("email", "hoangan@example.com");
    u5.put("daysAgo", 7);
    u5.put("variant", "5");
    newUsers.add(u5);
    
    request.setAttribute("newUsers", newUsers);
%>

<div class="app">
    <%-- Sidebar --%>
    <jsp:include page="/admin/includes/sidebar.jsp" />
    
    <div class="container">
        <main class="content">
            <div class="topbar">
                <div class="topbar-left">
                    <div>
                        <h2 class="page-title" id="pageTitle">Tổng Quan</h2>
                        <div class="muted hidden" id="pageDesc">
                            Tổng quan nhanh về cửa hàng và hiệu suất bán hàng
                        </div>
                    </div>
                </div>
                <div class="topbar-right">
                    <div class="muted hidden">Xin chào, Admin</div>
                    <div class="card notification-card">
                        <i class="fa-solid fa-bell"></i><span class="muted">3</span>
                    </div>
                </div>
            </div>
            
            <section id="pages">
                <div class="page card" id="page-dashboard">
                    <h3>Thống kê</h3>

                    <div class="actions-row">
                        <a href="${pageContext.request.contextPath}/admin/addProductAdmin.jsp" class="btn btn-outline-accent">
                            <i class="fa-solid fa-plus"></i> Thêm sản phẩm
                        </a>
                        <a href="${pageContext.request.contextPath}/admin/vouchersAdmin.jsp" class="btn btn-outline-accent">
                            <i class="fa-solid fa-tags"></i> Thêm khuyến mãi
                        </a>
                    </div>

                    <!-- KPI cards -->
                    <div class="grid kpi-grid">
                        <div class="card">
                            <strong>Doanh thu hôm nay</strong>
                            <div class="muted">₫<fmt:formatNumber value="${todayRevenue}" type="number" groupingUsed="true" /></div>
                        </div>
                        <div class="card">
                            <strong>Đơn hàng mới</strong>
                            <div class="muted"><c:out value="${newOrders}" /></div>
                        </div>
                        <div class="card">
                            <strong>Số khách truy cập</strong>
                            <div class="muted"><fmt:formatNumber value="${visitors}" type="number" groupingUsed="true" /></div>
                        </div>
                        <div class="card">
                            <strong>Sản phẩm hết hàng</strong>
                            <div class="muted"><c:out value="${outOfStock}" /></div>
                        </div>
                    </div>

                    <div class="charts-grid">
                        <div id="chart-cart" class="chart-card card">
                            <div class="filter-container">
                                <div class="filter-time">
                                    <button class="filter-btn" data-days="7">7 ngày</button>
                                    <button class="filter-btn active" data-days="30">30 ngày</button>
                                    <button class="filter-btn" data-days="90">90 ngày</button>
                                </div>
                            </div>
                            <strong>Doanh thu theo ngày (30 ngày)</strong>
                            <canvas id="salesLine"></canvas>
                        </div>

                        <div class="right-column">
                            <div class="chart-card card">
                                <strong>Doanh thu theo danh mục</strong>
                                <canvas id="categoryPie"></canvas>
                            </div>

                            <div class="chart-card card">
                                <strong>Sản phẩm bán chạy</strong>
                                <canvas id="topProductsBar" class="short-canvas"></canvas>
                            </div>

                            <div class="chart-card card">
                                <strong>5 người dùng mới</strong>
                                <div class="users-list">
                                    <c:forEach var="user" items="${newUsers}" varStatus="status">
                                        <div class="user-item ${status.last ? 'last' : ''}">
                                            <div class="avatar variant-${user.variant}"><c:out value="${user.initials}" /></div>
                                            <div>
                                                <div class="user-name"><c:out value="${user.name}" /></div>
                                                <div class="muted user-meta">
                                                    <c:out value="${user.email}" /> · Đăng ký <c:out value="${user.daysAgo}" /> ngày trước
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>

                                <div class="view-all-wrap">
                                    <a href="${pageContext.request.contextPath}/admin/userManagement.jsp" class="btn btn-outline-accent">
                                        Xem tất cả
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Recent orders under the big chart -->
                    <div class="recent-orders">
                        <h4>Đơn hàng gần nhất</h4>
                        <table class="table-reset">
                            <thead class="table-head">
                            <tr>
                                <th>Mã DH</th>
                                <th>Khách</th>
                                <th>Trạng thái</th>
                                <th>Tổng</th>
                                <th>Thao tác</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="order" items="${recentOrders}">
                                <tr>
                                    <td><c:out value="${order.id}" /></td>
                                    <td><c:out value="${order.customer}" /></td>
                                    <td><c:out value="${order.status}" /></td>
                                    <td>₫<fmt:formatNumber value="${order.total}" type="number" groupingUsed="true" /></td>
                                    <td><button style="width: 100%">Xem chi tiết</button></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </section>
        </main>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="${pageContext.request.contextPath}/js/sidebarAdmin.js"></script>
<script src="${pageContext.request.contextPath}/js/dashboardAdmin.js"></script>
</body>
</html>
