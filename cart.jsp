<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Giỏ Hàng - Cửa hàng điện thoại</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/cart.css">
</head>
<body>
<%
    // Dữ liệu mẫu cho giỏ hàng
    java.util.List<java.util.Map<String, Object>> cartItems = new java.util.ArrayList<>();
    
    java.util.Map<String, Object> item1 = new java.util.HashMap<>();
    item1.put("id", 1);
    item1.put("name", "iPhone 17 Pro Max 256GB");
    item1.put("image", "iphone_17_pro_max.png");
    item1.put("price", 34990000);
    item1.put("quantity", 1);
    item1.put("color", "Titan đen");
    cartItems.add(item1);
    
    java.util.Map<String, Object> item2 = new java.util.HashMap<>();
    item2.put("id", 2);
    item2.put("name", "Samsung Galaxy S23 Ultra");
    item2.put("image", "samsung-s23.png");
    item2.put("price", 29990000);
    item2.put("quantity", 2);
    item2.put("color", "Xanh phantom");
    cartItems.add(item2);
    
    request.setAttribute("cartItems", cartItems);
    
    // Tính tổng tiền
    long subTotal = 0;
    for (java.util.Map<String, Object> item : cartItems) {
        subTotal += ((Number) item.get("price")).longValue() * ((Number) item.get("quantity")).intValue();
    }
    request.setAttribute("subTotal", subTotal);
    request.setAttribute("discount", 0);
    request.setAttribute("total", subTotal);
%>

<div class="cart-wrap">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <a href="${pageContext.request.contextPath}/listproduct.jsp" class="round-black-btn">Thêm sản phẩm</a>
                <div class="table-cart">
                    <table>
                        <thead id="cart-header">
                        <tr>
                            <th><input type="checkbox" id="selectAll"></th>
                            <th>Sản Phẩm</th>
                            <th>Số Lượng</th>
                            <th>Thành Tiền</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody id="cart-body">
                        <c:choose>
                            <c:when test="${empty cartItems}">
                                <tr id="empty-row">
                                    <td colspan="5" class="empty-cart">
                                        <h3>Không có sản phẩm nào được thêm vào giỏ hàng</h3>
                                    </td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="item" items="${cartItems}">
                                    <tr data-id="${item.id}">
                                        <td><input type="checkbox" class="item-checkbox" checked></td>
                                        <td class="product-info">
                                            <img src="${pageContext.request.contextPath}/assert/img/${item.image}" alt="${item.name}" style="width: 80px;">
                                            <div>
                                                <h4><c:out value="${item.name}" /></h4>
                                                <p>Màu: <c:out value="${item.color}" /></p>
                                                <p class="price"><fmt:formatNumber value="${item.price}" type="number" groupingUsed="true" /> ₫</p>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="quantity-control">
                                                <button class="qty-btn minus">-</button>
                                                <input type="number" value="${item.quantity}" min="1" class="qty-input">
                                                <button class="qty-btn plus">+</button>
                                            </div>
                                        </td>
                                        <td class="item-total">
                                            <fmt:formatNumber value="${item.price * item.quantity}" type="number" groupingUsed="true" /> ₫
                                        </td>
                                        <td>
                                            <button class="remove-btn">
                                                <i class="fa fa-trash"></i>
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- PHAN TONG TIEN -->
            <div class="col-lg-4">
                <div class="beta">
                    <div class="coupon-box">
                        <form action="${pageContext.request.contextPath}/ApplyCouponServlet" method="post">
                            <div class="coupon-input">
                                <input type="text" name="coupon" placeholder="Mã Khuyến Mãi">
                                <button type="submit" class="round-black-btn">Áp Dụng</button>
                            </div>
                        </form>
                    </div>
                    <div class="cart-totals">
                        <table>
                            <tbody>
                            <tr>
                                <td>Tạm Tính:</td>
                                <td class="subtotal" id="sub-total"><fmt:formatNumber value="${subTotal}" type="number" groupingUsed="true" /> ₫</td>
                            </tr>
                            <tr>
                                <td>Giảm Giá:</td>
                                <td class="discount" id="discount"><fmt:formatNumber value="${discount}" type="number" groupingUsed="true" /> ₫</td>
                            </tr>
                            <tr class="total-row">
                                <td>Tổng Tiền:</td>
                                <td class="price-total" id="price-total"><fmt:formatNumber value="${total}" type="number" groupingUsed="true" /> ₫</td>
                            </tr>
                            </tbody>
                        </table>
                        <div class="btn-cart-totals">
                            <a href="${pageContext.request.contextPath}/checkout.jsp" class="update round-black-btn">Thanh Toán</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/js/cart.js"></script>
</body>
</html>
