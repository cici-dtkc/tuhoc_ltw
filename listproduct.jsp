<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Danh Sách Sản Phẩm - Cửa hàng điện thoại</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/listproduct.css">
</head>
<body>
<%
    // Dữ liệu mẫu cho danh sách sản phẩm
    java.util.List<java.util.Map<String, Object>> products = new java.util.ArrayList<>();
    
    // iPhone 17 Pro Max
    java.util.Map<String, Object> p1 = new java.util.HashMap<>();
    p1.put("id", 1);
    p1.put("name", "iPhone 17 Pro Max 2TB");
    p1.put("image", "iphone_17_pro_max.png");
    p1.put("price", 63990000);
    p1.put("discount", 12);
    p1.put("soldCount", "1.2k");
    p1.put("rating", 4);
    p1.put("colors", new String[]{"#eab308", "#f1f1f1", "#1f2937"});
    p1.put("capacities", new String[]{"256 GB", "512 GB", "1 TB", "2 TB"});
    products.add(p1);
    
    // Samsung Galaxy S24 Ultra
    java.util.Map<String, Object> p2 = new java.util.HashMap<>();
    p2.put("id", 2);
    p2.put("name", "Samsung Galaxy S24 Ultra");
    p2.put("image", "samsung-s23.png");
    p2.put("price", 29990000);
    p2.put("discount", 15);
    p2.put("soldCount", "2.5k");
    p2.put("rating", 5);
    p2.put("colors", new String[]{"#000000", "#8B4513", "#C0C0C0"});
    p2.put("capacities", new String[]{"256 GB", "512 GB", "1 TB"});
    products.add(p2);
    
    // Xiaomi 14 Pro
    java.util.Map<String, Object> p3 = new java.util.HashMap<>();
    p3.put("id", 3);
    p3.put("name", "Xiaomi 14 Pro 5G");
    p3.put("image", "xiaomi-13.png");
    p3.put("price", 18490000);
    p3.put("discount", 10);
    p3.put("soldCount", "980");
    p3.put("rating", 4);
    p3.put("colors", new String[]{"#000000", "#FFFFFF", "#FF69B4"});
    p3.put("capacities", new String[]{"256 GB", "512 GB"});
    products.add(p3);
    
    // OPPO Find X7 Pro
    java.util.Map<String, Object> p4 = new java.util.HashMap<>();
    p4.put("id", 4);
    p4.put("name", "OPPO Find X7 Pro");
    p4.put("image", "oppo-findx6.png");
    p4.put("price", 21990000);
    p4.put("discount", 8);
    p4.put("soldCount", "750");
    p4.put("rating", 4);
    p4.put("colors", new String[]{"#2F4F4F", "#F5F5DC"});
    p4.put("capacities", new String[]{"256 GB", "512 GB"});
    products.add(p4);
    
    // iPhone 15 Pro Max
    java.util.Map<String, Object> p5 = new java.util.HashMap<>();
    p5.put("id", 5);
    p5.put("name", "iPhone 15 Pro Max");
    p5.put("image", "product/iphone15.jpg");
    p5.put("price", 34990000);
    p5.put("discount", 5);
    p5.put("soldCount", "5.8k");
    p5.put("rating", 5);
    p5.put("colors", new String[]{"#1C1C1E", "#F5F5F7", "#A2845E"});
    p5.put("capacities", new String[]{"256 GB", "512 GB", "1 TB"});
    products.add(p5);
    
    // Samsung Galaxy Z Fold 5
    java.util.Map<String, Object> p6 = new java.util.HashMap<>();
    p6.put("id", 6);
    p6.put("name", "Samsung Galaxy Z Fold 5");
    p6.put("image", "samsung-s23.png");
    p6.put("price", 41990000);
    p6.put("discount", 20);
    p6.put("soldCount", "1.1k");
    p6.put("rating", 5);
    p6.put("colors", new String[]{"#40E0D0", "#000000", "#FFD700"});
    p6.put("capacities", new String[]{"256 GB", "512 GB", "1 TB"});
    products.add(p6);
    
    request.setAttribute("products", products);
%>

<main class="product-page">
    <!-- Thanh lọc & sắp xếp -->
    <div class="product-filter-bar">
        <!-- Hàng 1: Bộ lọc + thương hiệu -->
        <div class="filter-top">
            <div class="filter-btn">
                <i class="fa-solid fa-filter"></i>
                <span>Bộ lọc</span>
            </div>

            <div class="brand-list">
                <div class="brand"><img src="${pageContext.request.contextPath}/assert/img/logoSamsung.png" alt="Samsung"></div>
                <div class="brand"><img src="${pageContext.request.contextPath}/assert/img/logoIphone.png" alt="iPhone"></div>
                <div class="brand"><img src="${pageContext.request.contextPath}/assert/img/logoOppo.png" alt="Oppo"></div>
                <div class="brand"><img src="${pageContext.request.contextPath}/assert/img/logoVivo.png" alt="Vivo"></div>
            </div>
        </div>

        <!-- Hàng 2: Các nút lọc -->
        <div class="filter-options">
            <div class="filter-item" data-filter="gia">Giá</div>
            <div class="filter-item" data-filter="bonho">Bộ nhớ</div>
            <div class="filter-item" data-filter="mausac">Màu sắc</div>
            <div class="filter-item" data-filter="namramat">Năm ra mắt</div>
        </div>

        <!-- Menu phụ cho từng bộ lọc -->
        <div class="dropdown" id="gia">
            <h4 style="margin-top: 0">Hãy chọn mức giá phù hợp với bạn</h4>
            <div class="price-input">
                <input type="number" placeholder="Từ">
                <span>-</span>
                <input type="number" placeholder="Đến">
            </div>
            <div class="dropdown-actions">
                <button class="btn-close">Đóng</button>
                <button class="btn-apply">Xem kết quả</button>
            </div>
        </div>

        <div class="dropdown" id="bonho">
            <div class="option-group">
                <button>64GB</button>
                <button>128GB</button>
                <button>256GB</button>
                <button>512GB</button>
            </div>
            <div class="dropdown-actions">
                <button class="btn-close">Đóng</button>
                <button class="btn-apply">Xem kết quả</button>
            </div>
        </div>

        <div class="dropdown" id="mausac">
            <div class="option-group">
                <button>Đen</button>
                <button>Trắng</button>
                <button>Xanh</button>
                <button>Hồng</button>
                <button>Bạc</button>
            </div>
            <div class="dropdown-actions">
                <button class="btn-close">Đóng</button>
                <button class="btn-apply">Xem kết quả</button>
            </div>
        </div>

        <div class="dropdown" id="namramat">
            <div class="option-group">
                <button>2021</button>
                <button>2022</button>
                <button>2023</button>
                <button>2024</button>
                <button>2025</button>
            </div>
            <div class="dropdown-actions">
                <button class="btn-close">Đóng</button>
                <button class="btn-apply">Xem kết quả</button>
            </div>
        </div>
    </div>

    <!-- Phần sắp xếp -->
    <div class="sort-section">
        <span>Sắp xếp theo:</span>
        <ul id="sortList">
            <li class="active">Nổi bật</li>
            <li>Bán chạy</li>
            <li>Giảm giá</li>
            <li>Mới</li>
            <li>Giá <i class="arrow"></i></li>
        </ul>
    </div>

    <!-- Danh sách sản phẩm -->
    <div id="product-list" class="product-list">
        <c:forEach var="product" items="${products}">
            <div class="product-card" id="product-card-${product.id}">
                <a href="${pageContext.request.contextPath}/productDetail.jsp?id=${product.id}">
                    <div class="product-img">
                        <img src="${pageContext.request.contextPath}/assert/img/${product.image}" alt="${product.name}">
                        <span class="discount-badge">-${product.discount}%</span>
                    </div>

                    <div class="product-info">
                        <h3><c:out value="${product.name}" /></h3>

                        <div class="price"><fmt:formatNumber value="${product.price}" type="number" groupingUsed="true" />₫</div>

                        <div class="colors">
                            <c:forEach var="color" items="${product.colors}" varStatus="status">
                                <div class="color ${status.first ? 'active' : ''}" style="background:${color}"></div>
                            </c:forEach>
                        </div>

                        <div class="capacity">
                            <c:forEach var="capacity" items="${product.capacities}" varStatus="status">
                                <button class="${status.first ? 'active' : ''}">${capacity}</button>
                            </c:forEach>
                        </div>

                        <div class="rating-cart">
                            <div class="rating">
                                <c:forEach begin="1" end="${product.rating}">
                                    <i class="fa-solid fa-star"></i>
                                </c:forEach>
                                <c:forEach begin="${product.rating + 1}" end="5">
                                    <i class="fa-regular fa-star"></i>
                                </c:forEach>
                            </div>
                        </div>

                        <div class="bottom-info">
                            <span class="sold-count">Đã bán <c:out value="${product.soldCount}" /></span>
                            <button class="cart-btn">
                                <i class="fa-solid fa-cart-plus"></i>
                            </button>
                        </div>
                    </div>
                </a>
            </div>
        </c:forEach>
    </div>

    <!-- nút xem thêm -->
    <div class="load-more-wrap">
        <button id="loadMoreBtn" class="btn">Xem thêm</button>
        <span id="loadMoreSpinner" class="spinner" style="display:none">Đang tải...</span>
    </div>
</main>
<script src="${pageContext.request.contextPath}/assert/js/listProduct.js"></script>
</body>
</html>
