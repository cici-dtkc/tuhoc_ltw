<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thanh toán - Cửa hàng điện thoại</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/checkout.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/cart.css">
</head>
<body>
<%
    // Dữ liệu mẫu cho checkout
    java.util.Map<String, Object> address = new java.util.HashMap<>();
    address.put("name", "Huỳnh Đức");
    address.put("phone", "(+84) 902 275 080");
    address.put("address", "Sau Ủy Ban Khánh Bình, Xã Khánh Bình, Huyện An Phú, An Giang");
    request.setAttribute("deliveryAddress", address);
    
    // Dữ liệu mẫu cho sản phẩm checkout
    java.util.List<java.util.Map<String, Object>> checkoutItems = new java.util.ArrayList<>();
    
    java.util.Map<String, Object> item1 = new java.util.HashMap<>();
    item1.put("id", 1);
    item1.put("name", "iPhone 17 Pro Max 256GB");
    item1.put("image", "iphone_17_pro_max.png");
    item1.put("type", "Màu Titan đen, 256GB");
    item1.put("price", 34990000);
    item1.put("quantity", 1);
    checkoutItems.add(item1);
    
    java.util.Map<String, Object> item2 = new java.util.HashMap<>();
    item2.put("id", 2);
    item2.put("name", "Samsung Galaxy S23 Ultra");
    item2.put("image", "samsung-s23.png");
    item2.put("type", "Màu Xanh phantom, 512GB");
    item2.put("price", 29990000);
    item2.put("quantity", 1);
    checkoutItems.add(item2);
    
    request.setAttribute("checkoutItems", checkoutItems);
    
    // Tính tổng tiền
    long subTotal = 0;
    for (java.util.Map<String, Object> item : checkoutItems) {
        subTotal += ((Number) item.get("price")).longValue() * ((Number) item.get("quantity")).intValue();
    }
    long shipping = 25000;
    long discount = 0;
    long total = subTotal + shipping - discount;
    
    request.setAttribute("subTotal", subTotal);
    request.setAttribute("shipping", shipping);
    request.setAttribute("discount", discount);
    request.setAttribute("total", total);
%>

<main>
    <!-- ĐỊA CHỈ NHẬN HÀNG -->
    <section class="address">
        <i class="fa-solid fa-location-dot"></i><span class="title">Địa Chỉ Nhận Hàng</span>
        <p><strong><c:out value="${deliveryAddress.name}" /></strong> <span><c:out value="${deliveryAddress.phone}" /></span></p>
        <p>
            <c:out value="${deliveryAddress.address}" />
            <span class="default">Mặc định</span>
            <a href="${pageContext.request.contextPath}/addresses.jsp">Thay đổi</a>
        </p>
    </section>

    <!-- DANH SÁCH SẢN PHẨM -->
    <section class="products">
        <h3 class="title">Sản phẩm</h3>
        <!-- Bảng sản phẩm -->
        <table class="product-table">
            <thead>
            <tr>
                <th></th>
                <th>Đơn giá</th>
                <th>Số lượng</th>
                <th>Thành tiền</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="item" items="${checkoutItems}">
                <tr class="product-item">
                    <td class="product-info">
                        <img src="${pageContext.request.contextPath}/assert/img/${item.image}" alt="${item.name}"/>
                        <div class="details">
                            <p class="name"><c:out value="${item.name}" /></p>
                            <p class="type">Phân loại: <c:out value="${item.type}" /></p>
                        </div>
                    </td>
                    <td class="price"><fmt:formatNumber value="${item.price}" type="number" groupingUsed="true" />₫</td>
                    <td class="quantity"><c:out value="${item.quantity}" /></td>
                    <td class="total"><fmt:formatNumber value="${item.price * item.quantity}" type="number" groupingUsed="true" />₫</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </section>

    <!-- MÃ GIẢM GIÁ -->
    <section class="voucher">
        <h3 class="title">Mã Khuyến Mãi</h3>
        <div class="coupon-box" style="box-shadow:none; width: 500px; margin: 0">
            <form action="${pageContext.request.contextPath}/ApplyCouponServlet" method="post">
                <div class="coupon-input">
                    <input type="text" name="coupon" placeholder="Mã Khuyến Mãi">
                    <button type="submit" class="round-black-btn">Áp Dụng</button>
                </div>
            </form>
        </div>
    </section>

    <!-- PHƯƠNG THỨC THANH TOÁN -->
    <section class="payment">
        <h3 class="title">Phương thức thanh toán</h3>

        <form id="payment-form">
            <label>
                <input type="radio" name="payment" value="cod" checked>
                Thanh toán khi nhận hàng (COD)
            </label><br>

            <label>
                <input type="radio" name="payment" value="momo">
                Thanh toán qua MoMo
            </label><br>

            <label>
                <input type="radio" name="payment" value="bank">
                Chuyển khoản ngân hàng
            </label><br>

            <label>
                <input type="radio" name="payment" value="credit">
                Thẻ tín dụng / Ghi nợ
            </label>
        </form>
    </section>

    <!-- TỔNG TIỀN -->
    <section class="summary">
        <h3 class="title">🧾 Tóm tắt đơn hàng</h3>
        <p>Tạm tính: <strong><fmt:formatNumber value="${subTotal}" type="number" groupingUsed="true" />₫</strong></p>
        <p>Phí vận chuyển: <strong><fmt:formatNumber value="${shipping}" type="number" groupingUsed="true" />₫</strong></p>
        <p>Giảm giá: <strong><fmt:formatNumber value="${discount}" type="number" groupingUsed="true" />₫</strong></p>
        <p class="total">Tổng cộng: <strong><fmt:formatNumber value="${total}" type="number" groupingUsed="true" />₫</strong></p>
        <div class="action">
            <form action="${pageContext.request.contextPath}/PlaceOrderServlet" method="post">
                <button type="submit" class="round-black-btn" style="width: 150px">Đặt hàng</button>
            </form>
        </div>
    </section>
</main>
</body>
</html>
