<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="vi">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>Đơn Mua - Cửa hàng điện thoại</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/accountSidebar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/order.css">
</head>
<body>
<%
    // Dữ liệu mẫu cho đơn hàng
    java.util.List<java.util.Map<String, Object>> orders = new java.util.ArrayList<>();
    
    // Đơn hàng 1
    java.util.Map<String, Object> order1 = new java.util.HashMap<>();
    order1.put("id", "DH001");
    order1.put("shopName", "Phone Store Official");
    order1.put("status", "Giao hàng thành công");
    order1.put("total", 34990000);
    
    java.util.List<java.util.Map<String, Object>> items1 = new java.util.ArrayList<>();
    java.util.Map<String, Object> item1 = new java.util.HashMap<>();
    item1.put("name", "iPhone 17 Pro Max 256GB");
    item1.put("image", "iphone_17_pro_max.png");
    item1.put("variant", "Titan đen, 256GB");
    item1.put("quantity", 1);
    item1.put("oldPrice", 38990000);
    item1.put("price", 34990000);
    items1.add(item1);
    order1.put("items", items1);
    orders.add(order1);
    
    // Đơn hàng 2
    java.util.Map<String, Object> order2 = new java.util.HashMap<>();
    order2.put("id", "DH002");
    order2.put("shopName", "Samsung Official Store");
    order2.put("status", "Đang giao hàng");
    order2.put("total", 59980000);
    
    java.util.List<java.util.Map<String, Object>> items2 = new java.util.ArrayList<>();
    java.util.Map<String, Object> item2a = new java.util.HashMap<>();
    item2a.put("name", "Samsung Galaxy S24 Ultra");
    item2a.put("image", "samsung-s23.png");
    item2a.put("variant", "Xanh phantom, 512GB");
    item2a.put("quantity", 2);
    item2a.put("oldPrice", 32990000);
    item2a.put("price", 29990000);
    items2.add(item2a);
    order2.put("items", items2);
    orders.add(order2);
    
    request.setAttribute("orders", orders);
    
    // Dữ liệu người dùng
    java.util.Map<String, Object> user = new java.util.HashMap<>();
    user.put("username", "user1");
    request.setAttribute("user", user);
%>

<div id="pageWrapper">
    <!-- SIDEBAR -->
    <div id="accountSidebar">
        <!-- USER INFO -->
        <div id="userBox">
            <img src="https://cdn-icons-png.flaticon.com/512/847/847969.png" id="userAvatar">
            <div id="userInfo">
                <span id="usernameDisplay"><c:out value="${user.username}" /></span>
                <a href="${pageContext.request.contextPath}/info-user.jsp" id="editProfileBtn">
                    <i class="fa-solid fa-pen"></i> Sửa Hồ Sơ
                </a>
            </div>
        </div>

        <div class="sidebar-divider"></div>

        <ul id="menuList">
            <!-- TÀI KHOẢN CỦA TÔI -->
            <li class="menu-category">
                <a href="#" id="menuAccountMain">
                    <i class="fa-solid fa-user"></i> Tài Khoản Của Tôi
                </a>
                <ul id="accountSubmenu" class="submenu">
                    <li class="menu-item">
                        <a href="${pageContext.request.contextPath}/info-user.jsp" id="menuProfile">Hồ Sơ</a>
                    </li>
                    <li class="menu-item">
                        <a href="#" id="menuBank">Ngân Hàng</a>
                    </li>
                    <li class="menu-item">
                        <a href="${pageContext.request.contextPath}/addresses.jsp" id="menuAddress">Địa Chỉ</a>
                    </li>
                    <li class="menu-item">
                        <a href="${pageContext.request.contextPath}/formChangePass.jsp" id="menuPassword">Đổi Mật Khẩu</a>
                    </li>
                </ul>
            </li>

            <!-- ĐƠN MUA -->
            <li class="menu-category active">
                <a href="${pageContext.request.contextPath}/order.jsp" id="menuOrders">
                    <i class="fa-solid fa-bag-shopping"></i> Đơn Mua
                </a>
            </li>

            <!-- VOUCHER -->
            <li class="menu-category">
                <a href="${pageContext.request.contextPath}/voucherDetail.jsp" id="menuVoucher">
                    <i class="fa-solid fa-ticket"></i> Kho Voucher
                </a>
            </li>
        </ul>
    </div>

    <div class="container">
        <c:forEach var="order" items="${orders}">
            <div class="order-card">
                <div class="order-top">
                    <div class="shop-left">
                        <span class="badge favorite">Yêu thích</span>
                        <span class="shop-name"><c:out value="${order.shopName}" /></span>
                        <button class="btn-outline small">Chat</button>
                        <button class="btn-outline small">Xem Shop</button>
                    </div>
                    <div class="shop-right">
                        <span class="delivery-success"><c:out value="${order.status}" /></span>
                        <a class="rate-link">ĐÁNH GIÁ</a>
                    </div>
                </div>

                <div class="order-body">
                    <c:forEach var="item" items="${order.items}">
                        <div class="item">
                            <img src="${pageContext.request.contextPath}/assert/img/${item.image}" alt="sản phẩm" />
                            <div class="item-info">
                                <h3 class="item-title"><c:out value="${item.name}" /></h3>
                                <div class="item-variant">Phân loại hàng: <c:out value="${item.variant}" /></div>
                                <div class="item-qty">x<c:out value="${item.quantity}" /></div>
                            </div>
                            <div class="item-price">
                                <div class="old-price"><fmt:formatNumber value="${item.oldPrice}" type="number" groupingUsed="true" />₫</div>
                                <div class="new-price"><fmt:formatNumber value="${item.price}" type="number" groupingUsed="true" />₫</div>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <div class="order-footer">
                    <div class="total">Thành tiền: <span class="total-value"><fmt:formatNumber value="${order.total}" type="number" groupingUsed="true" />₫</span></div>
                    <div class="actions">
                        <button class="btn primary">Mua Lại</button>
                        <button class="btn">Liên Hệ Người Bán</button>
                        <a href="${pageContext.request.contextPath}/order_detail.jsp?id=${order.id}" class="btn">Xem Chi Tiết</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<script src="${pageContext.request.contextPath}/js/order.js"></script>
</body>
</html>
