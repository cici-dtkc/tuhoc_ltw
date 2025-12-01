<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <meta charset="UTF-8">
    <title>Chi Tiết Đơn Hàng - Cửa hàng điện thoại</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/order_detail.css">
</head>
<body>
<%
    // Dữ liệu mẫu cho chi tiết đơn hàng
    java.util.Map<String, Object> order = new java.util.HashMap<>();
    order.put("id", "OD123456");
    order.put("date", "24/10/2025");
    order.put("customerName", "Nguyễn Văn A");
    order.put("phone", "+84 912 345 678");
    order.put("address", "123 Đường ABC, Phường 1, Quận 1, TP. HCM");
    order.put("paid", false);
    order.put("status", "ordered"); // ordered, confirmed, shipped, delivered
    order.put("statusText", "Đã đặt");
    order.put("paymentMethod", "Thanh toán khi nhận hàng (COD)");
    request.setAttribute("order", order);
    
    // Dữ liệu mẫu cho sản phẩm trong đơn hàng
    java.util.List<java.util.Map<String, Object>> orderItems = new java.util.ArrayList<>();
    
    java.util.Map<String, Object> item1 = new java.util.HashMap<>();
    item1.put("id", "TWX100-BLK");
    item1.put("name", "Tai nghe True Wireless X100");
    item1.put("variant", "Màu: Đen • Bảo hành: 12 tháng");
    item1.put("price", 1299000);
    item1.put("quantity", 1);
    item1.put("image", "product/iphone15.jpg");
    orderItems.add(item1);
    
    java.util.Map<String, Object> item2 = new java.util.HashMap<>();
    item2.put("id", "CASE16-GRN");
    item2.put("name", "Ốp lưng Silicone iPhone");
    item2.put("variant", "Dòng máy: iPhone 16 • Màu: Xanh");
    item2.put("price", 199000);
    item2.put("quantity", 2);
    item2.put("image", "product/iphone15.jpg");
    orderItems.add(item2);
    
    request.setAttribute("orderItems", orderItems);
    
    // Tính tổng
    long subtotal = 1299000 + 199000 * 2;
    long shipFee = 35000;
    long discount = 0;
    long total = subtotal + shipFee - discount;
    request.setAttribute("subtotal", subtotal);
    request.setAttribute("shipFee", shipFee);
    request.setAttribute("discount", discount);
    request.setAttribute("total", total);
%>

<main class="container" role="main">
    <section class="card" aria-labelledby="order-heading">
        <header class="order-header">
            <div>
                <div id="order-heading" class="order-id">Đơn hàng #<c:out value="${order.id}" /></div>
                <div class="meta">Ngày đặt: <strong id="order-date"><c:out value="${order.date}" /></strong> • Người nhận: <span id="order-name"><c:out value="${order.customerName}" /></span></div>
            </div>
            <div style="text-align:right">
                <div id="paid-badge" class="status-pill ${order.paid ? 'paid' : ''}" aria-live="polite">
                    <span id="paid-text">${order.paid ? 'Đã thanh toán' : 'Chưa thanh toán'}</span>
                </div>
                <div class="muted" style="font-size:12px;margin-top:6px" id="order-status-small">Trạng thái: <strong id="order-status"><c:out value="${order.statusText}" /></strong></div>
            </div>
        </header>

        <div class="timeline" aria-hidden="false" id="status-timeline" role="list">
            <div class="step ${order.status == 'ordered' || order.status == 'confirmed' || order.status == 'shipped' || order.status == 'delivered' ? 'active' : ''}" data-step="ordered" role="listitem">
                <div class="dot" aria-hidden="true"></div>
                <div class="small">Đã đặt</div>
            </div>
            <div class="step ${order.status == 'confirmed' || order.status == 'shipped' || order.status == 'delivered' ? 'active' : ''}" data-step="confirmed" role="listitem">
                <div class="dot"></div>
                <div class="small">Đã xác nhận</div>
            </div>
            <div class="step ${order.status == 'shipped' || order.status == 'delivered' ? 'active' : ''}" data-step="shipped" role="listitem">
                <div class="dot"></div>
                <div class="small">Đang giao</div>
            </div>
            <div class="step ${order.status == 'delivered' ? 'active' : ''}" data-step="delivered" role="listitem">
                <div class="dot"></div>
                <div class="small">Đã giao</div>
            </div>
        </div>

        <div class="items" id="order-items" aria-live="polite">
            <c:forEach var="item" items="${orderItems}">
                <article class="item">
                    <div class="thumb" aria-hidden="true">
                        <img src="${pageContext.request.contextPath}/assert/img/${item.image}" alt="${item.name}" style="width:82px;height:82px;border-radius:8px;object-fit:cover"/>
                    </div>
                    <div class="item-info">
                        <div class="name"><c:out value="${item.name}" /></div>
                        <div class="variant"><c:out value="${item.variant}" /></div>
                        <div class="small" style="margin-top:8px">Mã SP: <span class="muted"><c:out value="${item.id}" /></span></div>
                    </div>
                    <div class="price-qty">
                        <div class="price">₫<fmt:formatNumber value="${item.price}" type="number" groupingUsed="true" /></div>
                        <div class="qty">x<c:out value="${item.quantity}" /></div>
                    </div>
                </article>
            </c:forEach>
        </div>

        <div class="totals" role="region" aria-label="Tổng tiền">
            <div class="row"><div class="small">Tạm tính</div><div id="subtotal"><fmt:formatNumber value="${subtotal}" type="number" groupingUsed="true" />₫</div></div>
            <div class="row"><div class="small">Phí vận chuyển</div><div id="ship-fee"><fmt:formatNumber value="${shipFee}" type="number" groupingUsed="true" />₫</div></div>
            <div class="row"><div class="small">Giảm giá</div><div id="discount"><fmt:formatNumber value="${discount}" type="number" groupingUsed="true" />₫</div></div>
            <div class="row total-amount"><div>Tổng cộng</div><div id="total"><fmt:formatNumber value="${total}" type="number" groupingUsed="true" />₫</div></div>

            <div class="actions" role="group" aria-label="Hành động đơn hàng">
                <button id="btn-request-cancel" class="btn btn-ghost">Yêu cầu hủy</button>
                <a href="${pageContext.request.contextPath}/cart.jsp" class="btn btn-ghost">Mua lại</a>
            </div>

            <footer class="note">Ghi chú: Bạn có thể yêu cầu hủy nếu đơn hàng chưa giao.</footer>
        </div>
    </section>

    <aside class="right">
        <div class="card section" aria-labelledby="summary-heading">
            <h3 id="summary-heading" style="margin:0 0 8px 0">Tóm tắt</h3>
            <div class="small">Phương thức thanh toán</div>
            <div style="display:flex;justify-content:space-between;align-items:center;margin-top:8px">
                <div>
                    <div id="payment-method"><c:out value="${order.paymentMethod}" /></div>
                </div>
            </div>
        </div>

        <div class="card section" aria-labelledby="address-heading">
            <h4 id="address-heading" style="margin:0 0 8px 0">Giao tới</h4>
            <div class="address">
                <div id="rec-name"><strong><c:out value="${order.customerName}" /></strong> • <span class="muted" id="rec-phone"><c:out value="${order.phone}" /></span></div>
                <div id="ship-address" class="muted"><c:out value="${order.address}" /></div>
                <div id="ship-phone" class="muted"><c:out value="${order.phone}" /></div>
            </div>
        </div>
    </aside>
</main>
<script src="${pageContext.request.contextPath}/assert/js/orderDetail.js"></script>
</body>
</html>
