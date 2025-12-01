<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý sản phẩm - Admin</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/vouchersAdmin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/sidebarAdmin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/productAdmin.css">
</head>
<body>
<%
    // Dữ liệu mẫu cho danh sách sản phẩm admin
    java.util.List<java.util.Map<String, Object>> adminProducts = new java.util.ArrayList<>();
    
    java.util.Map<String, Object> ap1 = new java.util.HashMap<>();
    ap1.put("id", 1);
    ap1.put("name", "iPhone 16 Pro Max");
    ap1.put("image", "iphone_17_pro_max.png");
    ap1.put("price", 34990000);
    ap1.put("category", "Điện thoại");
    ap1.put("version", "256GB");
    ap1.put("stock", 25);
    ap1.put("visible", true);
    adminProducts.add(ap1);
    
    java.util.Map<String, Object> ap2 = new java.util.HashMap<>();
    ap2.put("id", 2);
    ap2.put("name", "Pin sạc dự phòng Xiaomi 20000mAh");
    ap2.put("image", "iphone_17_pro_max.png");
    ap2.put("price", 690000);
    ap2.put("category", "Phụ kiện");
    ap2.put("version", "20W");
    ap2.put("stock", 120);
    ap2.put("visible", true);
    adminProducts.add(ap2);
    
    java.util.Map<String, Object> ap3 = new java.util.HashMap<>();
    ap3.put("id", 3);
    ap3.put("name", "AirPods Pro 2");
    ap3.put("image", "iphone_17_pro_max.png");
    ap3.put("price", 5990000);
    ap3.put("category", "Phụ kiện");
    ap3.put("version", "Type-C");
    ap3.put("stock", 48);
    ap3.put("visible", true);
    adminProducts.add(ap3);
    
    request.setAttribute("adminProducts", adminProducts);
%>

<div class="app">
    <%-- Sidebar --%>
    <jsp:include page="/admin/includes/sidebar.jsp" />

    <div class="container">
        <div class="topbar">
            <div class="topbar-left">
                <div>
                    <h2 class="page-title" id="pageTitle">Sản Phẩm</h2>
                    <div class="muted" id="pageDesc">Quản lý sản phẩm</div>
                </div>
            </div>
            <div class="topbar-right">
                <div class="muted">Xin chào, Admin</div>
                <div class="card notification-card">
                    <i class="fa-solid fa-bell"></i><span class="muted">3</span>
                </div>
            </div>
        </div>

        <div class="table-container">
            <div class="toolbar">
                <div class="left">
                    <input type="text" id="searchInput" placeholder="Tìm kiếm sản phẩm...">
                    <label for="filterStatus">Trạng thái:</label>
                    <select id="filterStatus">
                        <option value="all">Tất cả</option>
                        <option value="active">Đang hiển thị</option>
                        <option value="inactive">Đang ẩn</option>
                    </select>
                    <label for="filterCategory">Danh mục:</label>
                    <select id="filterCategory">
                        <option value="all">Tất cả</option>
                        <option value="phone">Điện thoại</option>
                        <option value="accessory">Phụ kiện</option>
                    </select>
                    <button class="btn-filter" id="btnFilter">Tìm kiếm</button>
                </div>
                <a href="${pageContext.request.contextPath}/admin/addProductAdmin.jsp">
                    <button class="btn-add" id="btnOpenModal">+ Thêm sản phẩm</button>
                </a>
            </div>

            <table class="table-view" id="promoTable">
                <thead>
                <tr>
                    <th>Hình ảnh</th>
                    <th>Tên sản phẩm</th>
                    <th>Giá</th>
                    <th>Danh mục</th>
                    <th>Phiên bản</th>
                    <th>Tồn kho</th>
                    <th>Hành động</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="product" items="${adminProducts}">
                    <tr data-id="${product.id}">
                        <td><img src="${pageContext.request.contextPath}/assert/img/${product.image}" alt="${product.name}"></td>
                        <td><c:out value="${product.name}" /></td>
                        <td><fmt:formatNumber value="${product.price}" type="number" groupingUsed="true" />₫</td>
                        <td><c:out value="${product.category}" /></td>
                        <td><c:out value="${product.version}" /></td>
                        <td><c:out value="${product.stock}" /></td>
                        <td class="actionsProduct">
                            <div class="tooltip" data-tooltip="Chỉnh sửa sản phẩm">
                                <button class="btn-edit"><i class="fa-solid fa-pencil"></i></button>
                            </div>
                            <div class="tooltip toggleVisibilityBtn" data-tooltip="${product.visible ? 'Ẩn sản phẩm' : 'Hiện sản phẩm'}">
                                <button class="btn-delete" onclick="toggleVisibility(this)">
                                    <i class="fa-solid ${product.visible ? 'fa-eye' : 'fa-eye-slash'}"></i>
                                </button>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <div class="footer" id="footer-pagination">
                <p id="record-info">Hiển thị ${adminProducts.size()} sản phẩm</p>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/assert/js/sidebarAdmin.js"></script>
<script src="${pageContext.request.contextPath}/assert/js/productAdmin.js"></script>
</body>
</html>
