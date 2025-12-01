<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết sản phẩm - Cửa hàng điện thoại</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/productDetail.css">
</head>
<body>
<%
    // Dữ liệu mẫu cho chi tiết sản phẩm
    java.util.Map<String, Object> product = new java.util.HashMap<>();
    product.put("id", 1);
    product.put("name", "iPhone 15 Pro Max 256GB");
    product.put("brand", "iPhone");
    product.put("currentPrice", 8490000);
    product.put("oldPrice", 9990000);
    product.put("discount", 15);
    product.put("soldCount", "22.4k");
    product.put("rating", 4.9);
    product.put("mainImage", "product/iphone15.jpg");
    product.put("os", "iOS 17");
    product.put("cpu", "Apple A17 Pro 6 nhân");
    product.put("cpuSpeed", "3.78 GHz");
    product.put("gpu", "Apple GPU 6 nhân");
    product.put("ram", "8 GB");
    product.put("storage", "256 GB");
    product.put("availableStorage", "241 GB");
    
    request.setAttribute("product", product);
    
    // Dữ liệu mẫu cho hình ảnh gallery
    String[] galleryImages = {"product/iphone15.jpg", "product/iphone15_behind.jpg", "product/iphone15_after.jpg", "product/iphone15_camera.jpg"};
    request.setAttribute("galleryImages", galleryImages);
    
    // Dữ liệu mẫu cho sản phẩm thường mua kèm
    java.util.List<java.util.Map<String, Object>> relatedProducts = new java.util.ArrayList<>();
    
    java.util.Map<String, Object> rp1 = new java.util.HashMap<>();
    rp1.put("id", 101);
    rp1.put("name", "Sạc Anker 2C1A");
    rp1.put("image", "product/Anker2C1A.jpg");
    rp1.put("price", 990000);
    rp1.put("discount", 12);
    rp1.put("soldCount", "1.2k");
    relatedProducts.add(rp1);
    
    java.util.Map<String, Object> rp2 = new java.util.HashMap<>();
    rp2.put("id", 102);
    rp2.put("name", "Sạc dự phòng");
    rp2.put("image", "product/Anker2C1B.jpg");
    rp2.put("price", 630000);
    rp2.put("discount", 12);
    rp2.put("soldCount", "1.2k");
    relatedProducts.add(rp2);
    
    java.util.Map<String, Object> rp3 = new java.util.HashMap<>();
    rp3.put("id", 103);
    rp3.put("name", "Sạc AKA1256");
    rp3.put("image", "product/AnkerA1256.jpg");
    rp3.put("price", 690000);
    rp3.put("discount", 12);
    rp3.put("soldCount", "1.2k");
    relatedProducts.add(rp3);
    
    request.setAttribute("relatedProducts", relatedProducts);
    
    // Dữ liệu mẫu cho đánh giá
    java.util.List<java.util.Map<String, Object>> reviews = new java.util.ArrayList<>();
    
    java.util.Map<String, Object> review1 = new java.util.HashMap<>();
    review1.put("name", "Thịnh");
    review1.put("rating", 5);
    review1.put("text", "Mình mua được 4 tháng giờ muốn bán lại cho cửa hàng máy vẫn còn nguyên phụ kiện không chưa vết xước thì được bao nhiêu %?");
    review1.put("helpful", 25);
    review1.put("usedTime", "4 tháng");
    reviews.add(review1);
    
    java.util.Map<String, Object> review2 = new java.util.HashMap<>();
    review2.put("name", "Huỳnh Hiện");
    review2.put("rating", 5);
    review2.put("text", "Reno 13F 5G xài rất ok, PIN tốt, 2 ngày mới phải sạc. Tính năng ổn định, không chơi game nên không biết hiệu năng game ra sao.");
    review2.put("helpful", 35);
    review2.put("usedTime", "6 tháng");
    reviews.add(review2);
    
    request.setAttribute("reviews", reviews);
%>

<div class="app-wrapper">
    <!-- Header chi tiết sản phẩm -->
    <div class="container-header">
        <div class="breadcrumb">
            <a href="${pageContext.request.contextPath}/listproduct.jsp">Điện thoại</a>
            <span>›</span>
            <a href="#">Điện thoại <c:out value="${product.brand}" /></a>
        </div>
        <h1 class="product-title">
            <c:out value="${product.name}" />
            <span class="sold-info">Đã bán <c:out value="${product.soldCount}" /></span>
            <span class="rating"><i class="fa-solid fa-star" style="color: #f5a623;"></i> <c:out value="${product.rating}" /></span>
            <a href="#" class="spec-link">Thông số</a>
        </h1>
    </div>

    <!-- Main nội dung -->
    <div class="box-main">
        <!-- Cột trái -->
        <div class="product-info-left">
            <div class="product-detail">
                <div class="product-gallery">
                    <div class="main">
                        <img src="${pageContext.request.contextPath}/assert/img/${product.mainImage}" alt="Ảnh chính" class="img-feature"/>
                        <div class="control prev"><i class="fas fa-angle-left"></i></div>
                        <div class="control next"><i class="fas fa-angle-right"></i></div>
                    </div>

                    <div class="list-image">
                        <c:forEach var="img" items="${galleryImages}">
                            <div><img src="${pageContext.request.contextPath}/assert/img/${img}" alt=""/></div>
                        </c:forEach>
                    </div>
                </div>
            </div>

            <!-- Thông số kỹ thuật -->
            <div class="tech-specs">
                <h3 class="specs-title">Cấu hình &amp; Bộ nhớ</h3>
                <table class="specs-table">
                    <tr>
                        <td>Hệ điều hành:</td>
                        <td><c:out value="${product.os}" /></td>
                    </tr>
                    <tr>
                        <td>Chip xử lý (CPU):</td>
                        <td><a href="#"><c:out value="${product.cpu}" /></a></td>
                    </tr>
                    <tr>
                        <td>Tốc độ CPU:</td>
                        <td><c:out value="${product.cpuSpeed}" /></td>
                    </tr>
                    <tr>
                        <td>Chip đồ họa (GPU):</td>
                        <td><c:out value="${product.gpu}" /></td>
                    </tr>
                    <tr>
                        <td>RAM:</td>
                        <td><c:out value="${product.ram}" /></td>
                    </tr>
                    <tr>
                        <td>Dung lượng lưu trữ:</td>
                        <td><c:out value="${product.storage}" /></td>
                    </tr>
                    <tr>
                        <td>Dung lượng còn lại (khả dụng) khoảng:</td>
                        <td><c:out value="${product.availableStorage}" /></td>
                    </tr>
                </table>
            </div>

            <!-- Sản phẩm thường mua kèm -->
            <div class="related-products">
                <h3>Sản phẩm thường mua cùng</h3>
                <c:forEach var="rp" items="${relatedProducts}">
                    <div class="product-card">
                        <div class="product-img">
                            <img src="${pageContext.request.contextPath}/assert/img/${rp.image}" alt="${rp.name}">
                            <span class="discount-badge">-${rp.discount}%</span>
                        </div>
                        <div class="product-info">
                            <h3><c:out value="${rp.name}" /></h3>
                            <div class="price"><fmt:formatNumber value="${rp.price}" type="number" groupingUsed="true" />₫</div>
                            <div class="rating-cart">
                                <div class="rating">
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-solid fa-star"></i>
                                    <i class="fa-regular fa-star"></i>
                                </div>
                            </div>
                            <div class="bottom-info">
                                <span class="sold-count">Đã bán <c:out value="${rp.soldCount}" /></span>
                                <button class="cart-btn">
                                    <i class="fa-solid fa-cart-plus"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <!-- Cột phải -->
        <div class="product-info-right">
            <div class="product-info">
                <div class="info">
                    <!-- Giá & khuyến mãi -->
                    <h2 class="price-label">Giá sản phẩm</h2>
                    <div class="price-box">
                        <div class="price-content">
                            <span class="current-price"><fmt:formatNumber value="${product.currentPrice}" type="number" groupingUsed="true" />₫</span>
                            <span class="old-price"><fmt:formatNumber value="${product.oldPrice}" type="number" groupingUsed="true" />₫</span>
                            <span class="discount">-${product.discount}%</span>
                        </div>
                    </div>

                    <h2>Chọn phiên bản</h2>
                    <div class="version-select">
                        <button class="version active">12GB / 256GB</button>
                        <button class="version">8GB / 256GB</button>
                    </div>

                    <h2>Chọn màu sắc</h2>
                    <div class="color-options">
                        <div class="color-item">
                            <span class="color-list" style="background: #2d85f3"></span>
                            <span>Xanh biển</span>
                        </div>
                        <div class="color-item active">
                            <span class="color-list" style="background: #a19999"></span>
                            <span>Bạc ánh sao</span>
                        </div>
                        <div class="color-item">
                            <span class="color-list" style="background: mediumpurple"></span>
                            <span>Vàng mộng mơ</span>
                        </div>
                    </div>
                </div>

                <div class="promotion-box">
                    <h3>Khuyến mãi</h3>
                    <ul>
                        <li>Tặng phiếu mua hàng trị giá 200.000₫</li>
                        <li>Giảm thêm 5% khi thanh toán qua ví Momo</li>
                        <li>Trả góp 0% qua thẻ tín dụng</li>
                    </ul>
                </div>

                <div class="note-promotion">
                    <ul>
                        <li>Không áp dụng chung với khuyến mãi khác.</li>
                        <li>Khuyến mãi chưa bao gồm phí giao/chuyển hàng.</li>
                    </ul>
                </div>

                <div class="form-promo">
                    <form class="coupon-input" action="${pageContext.request.contextPath}/ApplyCouponServlet" method="post">
                        <input type="text" name="coupon" placeholder="Mã Khuyến Mãi">
                        <button type="submit" class="round-black-btn">Áp Dụng</button>
                    </form>
                </div>

                <!-- Vận chuyển & Phí ship -->
                <div class="shipping-box">
                    <h3>Vận chuyển & Phí ship</h3>
                    <p><i class="fa fa-truck"></i> Giao hàng tận nơi toàn quốc</p>
                    <p><i class="fa fa-box"></i> Miễn phí vận chuyển nội thành Hà Nội & TP.HCM</p>
                    <p><i class="fa fa-clock"></i> Thời gian giao hàng: 1 - 3 ngày</p>

                    <!-- Giao đến -->
                    <div class="shipping-destination">
                        <span><i class="fa fa-map-marker-alt"></i> Giao đến:
                        <strong>Hà Nội - Quận Cầu Giấy</strong></span>
                        <button class="btn-change">Thay đổi</button>
                    </div>
                </div>

                <!-- Nút hành động -->
                <div class="action-buttons">
                    <button class="btn-buy">Mua ngay</button>
                    <button class="btn-cart"><i class="fa-solid fa-cart-plus" style="margin-right: 5px;"></i>Thêm vào giỏ hàng</button>
                </div>
            </div>

            <!-- Mô tả nổi bật -->
            <div class="product-highlights">
                <h3>Đặc điểm nổi bật</h3>
                <ul>
                    <li>Màn hình Super Retina XDR 6.1 inch hiển thị sắc nét, rực rỡ.</li>
                    <li>Chip A16 Bionic mạnh mẽ, tiết kiệm năng lượng.</li>
                    <li>Camera kép 48MP chụp ảnh siêu chi tiết, hỗ trợ quay 4K.</li>
                    <li>Thiết kế sang trọng với khung viền nhôm, mặt kính bền bỉ.</li>
                    <li>Hỗ trợ sạc nhanh và kết nối USB Type-C tiện lợi.</li>
                </ul>
            </div>
        </div>
    </div>

    <!-- Đánh giá sản phẩm -->
    <section class="review-section">
        <h2>Đánh giá <c:out value="${product.name}" /></h2>

        <div class="review-summary">
            <div class="review-score">
                <span class="score"><c:out value="${product.rating}" /></span><span class="outof">/5</span>
                <p>109,2k khách hàng hài lòng</p>
                <p class="review-count">${reviews.size()} đánh giá</p>
            </div>

            <div class="review-bars">
                <div>
                    <span>5</span>
                    <div class="bar"><div class="fill" style="width: 99.9%"></div></div>
                    <span>99.9%</span>
                </div>
                <div>
                    <span>4</span>
                    <div class="bar"><div class="fill" style="width: 0%"></div></div>
                    <span>0%</span>
                </div>
                <div>
                    <span>3</span>
                    <div class="bar"><div class="fill" style="width: 0%"></div></div>
                    <span>0%</span>
                </div>
                <div>
                    <span>2</span>
                    <div class="bar"><div class="fill" style="width: 0%"></div></div>
                    <span>0%</span>
                </div>
                <div>
                    <span>1</span>
                    <div class="bar"><div class="fill" style="width: 0%"></div></div>
                    <span>0%</span>
                </div>
            </div>
        </div>

        <div class="review-list">
            <c:forEach var="review" items="${reviews}">
                <div class="review-item">
                    <div class="review-header">
                        <span class="name"><c:out value="${review.name}" /></span>
                        <span class="bought">Đã mua tại cửa hàng</span>
                    </div>
                    <div class="stars">
                        <c:forEach begin="1" end="${review.rating}">★</c:forEach>
                    </div>
                    <p class="review-text"><c:out value="${review.text}" /></p>
                    <div class="review-footer">
                        <span class="helpful"><i class="fa fa-thumbs-up"></i> Hữu ích (<c:out value="${review.helpful}" />)</span>
                        <span class="time">Đã dùng khoảng <c:out value="${review.usedTime}" /></span>
                    </div>
                </div>
            </c:forEach>
        </div>

        <div class="review-buttons">
            <button class="btn-view">Xem ${reviews.size()} đánh giá</button>
            <button class="btn-write">Viết đánh giá</button>
        </div>
    </section>
</div>
<script src="${pageContext.request.contextPath}/assert/js/header.js"></script>
<script src="${pageContext.request.contextPath}/assert/js/productDetail.js"></script>
</body>
</html>
