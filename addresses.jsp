<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Địa chỉ của tôi - Cửa hàng điện thoại</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/accountSidebar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/addresses.css">
</head>
<body>
<%
    // Dữ liệu mẫu cho địa chỉ
    java.util.List<java.util.Map<String, Object>> addresses = new java.util.ArrayList<>();
    
    java.util.Map<String, Object> addr1 = new java.util.HashMap<>();
    addr1.put("id", 1);
    addr1.put("fullName", "Nguyễn Văn A");
    addr1.put("phone", "(+84) 902 275 080");
    addr1.put("location", "Phường Đông Hòa, Thành Phố Dĩ An, Bình Dương");
    addr1.put("specificAddress", "123 Đường ABC");
    addr1.put("type", "home");
    addr1.put("isDefault", true);
    addresses.add(addr1);
    
    java.util.Map<String, Object> addr2 = new java.util.HashMap<>();
    addr2.put("id", 2);
    addr2.put("fullName", "Nguyễn Văn A");
    addr2.put("phone", "(+84) 912 345 678");
    addr2.put("location", "Phường Bình Thuận, Quận 7, TP. Hồ Chí Minh");
    addr2.put("specificAddress", "456 Đường XYZ, Tòa nhà ABC, Tầng 5");
    addr2.put("type", "office");
    addr2.put("isDefault", false);
    addresses.add(addr2);
    
    request.setAttribute("addresses", addresses);
    
    java.util.Map<String, Object> user = new java.util.HashMap<>();
    user.put("username", "user1");
    request.setAttribute("user", user);
%>

<div id="pageWrapper">
    <!-- SIDEBAR -->
    <div id="accountSidebar">
        <div id="userBox">
            <img src="https://cdn-icons-png.flaticon.com/512/847/847969.png" id="userAvatar" alt="User avatar">
            <div id="userInfo">
                <span id="usernameDisplay"><c:out value="${user.username}" /></span>
                <a href="${pageContext.request.contextPath}/info-user.jsp" id="editProfileBtn">
                    <i class="fa-solid fa-pen"></i> Sửa Hồ Sơ
                </a>
            </div>
        </div>

        <div class="sidebar-divider"></div>

        <ul id="menuList">
            <li class="menu-category">
                <a href="#" id="menuAccountMain">
                    <i class="fa-solid fa-user"></i> Tài Khoản Của Tôi
                </a>
                <ul id="accountSubmenu" class="submenu">
                    <li class="menu-item">
                        <a href="${pageContext.request.contextPath}/info-user.jsp" id="menuProfile">Hồ Sơ</a>
                    </li>
                    <li class="menu-item">
                        <a href="${pageContext.request.contextPath}/paymentForm.jsp" id="menuBank">Ngân Hàng</a>
                    </li>
                    <li class="menu-item active">
                        <a href="${pageContext.request.contextPath}/addresses.jsp" id="menuAddress">Địa Chỉ</a>
                    </li>
                    <li class="menu-item">
                        <a href="${pageContext.request.contextPath}/formChangePass.jsp" id="menuPassword">Đổi Mật Khẩu</a>
                    </li>
                </ul>
            </li>

            <li class="menu-category">
                <a href="${pageContext.request.contextPath}/order.jsp" id="menuOrders">
                    <i class="fa-solid fa-bag-shopping"></i> Đơn Mua
                </a>
            </li>

            <li class="menu-category">
                <a href="${pageContext.request.contextPath}/voucherDetail.jsp" id="menuVoucher">
                    <i class="fa-solid fa-ticket"></i> Kho Voucher
                </a>
            </li>
        </ul>
    </div>

    <!-- ADDRESS CONTENT -->
    <div class="address-content">
        <div class="address-header">
            <h1 class="address-title">Địa chỉ của tôi</h1>
            <button class="btn-add-address" id="btnAddAddress">
                <i class="fa-solid fa-plus"></i> Thêm địa chỉ mới
            </button>
        </div>

        <div class="address-section">
            <h2 class="section-title">Địa chỉ</h2>
            <div class="address-list" id="addressList">
                <c:forEach var="addr" items="${addresses}">
                    <div class="address-item" data-id="${addr.id}">
                        <div class="address-info">
                            <div class="address-name">
                                <strong><c:out value="${addr.fullName}" /></strong>
                                <span class="address-phone"><c:out value="${addr.phone}" /></span>
                                <c:if test="${addr.isDefault}">
                                    <span class="badge-default">Mặc định</span>
                                </c:if>
                            </div>
                            <div class="address-detail">
                                <c:out value="${addr.specificAddress}" />, <c:out value="${addr.location}" />
                            </div>
                            <div class="address-type">
                                <span class="type-badge">${addr.type == 'home' ? 'Nhà Riêng' : 'Văn Phòng'}</span>
                            </div>
                        </div>
                        <div class="address-actions">
                            <a href="#" class="btn-edit-address">Cập nhật</a>
                            <c:if test="${!addr.isDefault}">
                                <a href="#" class="btn-delete-address">Xóa</a>
                            </c:if>
                            <c:if test="${!addr.isDefault}">
                                <button class="btn-set-default">Thiết lập mặc định</button>
                            </c:if>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

<!-- Modal Add Address -->
<div class="modal-overlay" id="modalOverlay">
    <div class="modal-content">
        <h2 class="modal-title">Địa chỉ mới</h2>
        <form class="address-form" id="addressForm" action="${pageContext.request.contextPath}/AddAddressServlet" method="post">
            <div class="form-row">
                <label for="fullName" class="form-label">Họ và tên</label>
                <input type="text" id="fullName" name="fullName" class="form-input" placeholder="Nhập họ và tên" required>
            </div>

            <div class="form-row">
                <label for="phoneNumber" class="form-label">Số điện thoại</label>
                <input type="text" id="phoneNumber" name="phoneNumber" class="form-input" placeholder="Nhập số điện thoại" required>
            </div>

            <div class="form-row">
                <label for="location" class="form-label">Tỉnh/ Thành phố, Quận/Huyện, Phường/Xã</label>
                <select id="location" name="location" class="form-select" required>
                    <option value="">Chọn địa điểm</option>
                    <option value="Phường Đông Hòa, Thành Phố Dĩ An, Bình Dương">Phường Đông Hòa, Thành Phố Dĩ An, Bình Dương</option>
                    <option value="Phường Bình Thuận, Quận 7, TP. Hồ Chí Minh">Phường Bình Thuận, Quận 7, TP. Hồ Chí Minh</option>
                    <option value="Phường 5, Quận Tân Bình, TP. Hồ Chí Minh">Phường 5, Quận Tân Bình, TP. Hồ Chí Minh</option>
                </select>
            </div>

            <div class="form-row">
                <label for="specificAddress" class="form-label">Địa chỉ cụ thể</label>
                <textarea id="specificAddress" name="specificAddress" class="form-textarea" placeholder="Nhập địa chỉ cụ thể" rows="3" required></textarea>
            </div>

            <div class="form-row">
                <label class="form-label">Loại địa chỉ:</label>
                <div class="address-type-group">
                    <button type="button" class="address-type-btn active" data-type="home">Nhà Riêng</button>
                    <button type="button" class="address-type-btn" data-type="office">Văn Phòng</button>
                </div>
                <input type="hidden" name="addressType" id="addressType" value="home">
            </div>

            <div class="form-row">
                <label class="checkbox-label">
                    <input type="checkbox" id="setDefault" name="setDefault" class="checkbox-input">
                    <span>Đặt làm địa chỉ mặc định</span>
                </label>
            </div>

            <div class="modal-actions">
                <button type="button" class="btn-back" id="btnBack">Trở Lại</button>
                <button type="submit" class="btn-complete">Hoàn thành</button>
            </div>
        </form>
    </div>
</div>
<script src="${pageContext.request.contextPath}/assert/js/addresses.js"></script>
</body>
</html>
