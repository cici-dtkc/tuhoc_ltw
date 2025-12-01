<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Cửa hàng điện thoại và phụ kiện di động - Sản phẩm chính hãng, giá tốt nhất">
    <meta name="keywords" content="điện thoại, phụ kiện, mobile, smartphone, iPhone, Samsung, Xiaomi, OPPO">
    <title>Cửa hàng điện thoại - Trang chủ</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/home.css">
</head>
<body>

<%-- Include Header --%>
<jsp:include page="/includes/header.jsp" />

<div id="main-content">
    <!-- Slider Banner -->
    <section id="banner-slider" class="slider-banner">
        <div id="slider-container" class="slider">
            <%-- Dữ liệu mẫu cho slider --%>
            <c:set var="banners" value="${['banner-1.png', 'banner-2.png', 'banner-3.png', 'banner-4.png']}" />
            
            <div class="slide active" id="slide-1">
                <a href="#"><img src="${pageContext.request.contextPath}/assert/img/banner-1.png" alt="Banner 1"></a>
            </div>
            <div class="slide" id="slide-2">
                <a href="#"><img src="${pageContext.request.contextPath}/assert/img/banner-3.png" alt="Banner 2"></a>
            </div>
            <div class="slide" id="slide-3">
                <a href="#"><img src="${pageContext.request.contextPath}/assert/img/banner-2.png" alt="Banner 3"></a>
            </div>
            <div class="slide" id="slide-4">
                <a href="#"><img src="${pageContext.request.contextPath}/assert/img/banner-4.png" alt="Banner 4"></a>
            </div>

            <!-- Navigation buttons -->
            <button id="btn-prev" class="prev">&#10094;</button>
            <button id="btn-next" class="next">&#10095;</button>
        </div>
    </section>

    <!-- Section sản phẩm nổi bật -->
    <section id="featured-products" class="featured-products">
        <h2 class="section-title">🔥 Sản phẩm nổi bật</h2>

        <div class="product-list">
            <%-- Dữ liệu mẫu sản phẩm nổi bật --%>
            <%
                // Dữ liệu mẫu cho sản phẩm nổi bật
                java.util.List<java.util.Map<String, Object>> featuredProducts = new java.util.ArrayList<>();
                
                java.util.Map<String, Object> product1 = new java.util.HashMap<>();
                product1.put("id", 1);
                product1.put("name", "iPhone 17 Pro Max");
                product1.put("image", "iphone_17_pro_max.png");
                product1.put("price", 34990000);
                featuredProducts.add(product1);
                
                java.util.Map<String, Object> product2 = new java.util.HashMap<>();
                product2.put("id", 2);
                product2.put("name", "Samsung Galaxy S23 Ultra");
                product2.put("image", "samsung-s23.png");
                product2.put("price", 29990000);
                featuredProducts.add(product2);
                
                java.util.Map<String, Object> product3 = new java.util.HashMap<>();
                product3.put("id", 3);
                product3.put("name", "Xiaomi 13 Pro");
                product3.put("image", "xiaomi-13.png");
                product3.put("price", 18490000);
                featuredProducts.add(product3);
                
                java.util.Map<String, Object> product4 = new java.util.HashMap<>();
                product4.put("id", 4);
                product4.put("name", "OPPO Find X6 Pro");
                product4.put("image", "oppo-findx6.png");
                product4.put("price", 21990000);
                featuredProducts.add(product4);
                
                request.setAttribute("featuredProducts", featuredProducts);
            %>
            
            <c:forEach var="product" items="${featuredProducts}">
                <a href="${pageContext.request.contextPath}/productDetail.jsp?id=${product.id}">
                    <div class="product-card">
                        <img src="${pageContext.request.contextPath}/assert/img/${product.image}" alt="${product.name}">
                        <h3><c:out value="${product.name}" /></h3>
                        <p class="price"><fmt:formatNumber value="${product.price}" type="number" groupingUsed="true" /> ₫</p>
                        <div class="product-actions">
                            <button class="btn-buy">Mua ngay</button>
                            <button class="btn-cart"><i class="fa-solid fa-cart-shopping"></i></button>
                        </div>
                    </div>
                </a>
            </c:forEach>
        </div>
    </section>

    <%-- Include Footer --%>
    <jsp:include page="/includes/footer.jsp" />

</div>

<script src="${pageContext.request.contextPath}/js/home.js"></script>
<script src="${pageContext.request.contextPath}/js/header.js"></script>
</body>
</html>
