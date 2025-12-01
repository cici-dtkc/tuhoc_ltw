<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý Khuyến mãi - Admin</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/vouchersAdmin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/sidebarAdmin.css">
</head>
<body>
<%
    // Dữ liệu mẫu cho khuyến mãi
    java.util.List<java.util.Map<String, Object>> promotions = new java.util.ArrayList<>();
    
    java.util.Map<String, Object> p1 = new java.util.HashMap<>();
    p1.put("code", "KM01");
    p1.put("name", "Giảm 20% toàn bộ sản phẩm");
    p1.put("discount", 20);
    p1.put("startDate", "2025-10-01");
    p1.put("endDate", "2025-10-31");
    p1.put("active", true);
    promotions.add(p1);
    
    java.util.Map<String, Object> p2 = new java.util.HashMap<>();
    p2.put("code", "KM02");
    p2.put("name", "Mua 1 tặng 1");
    p2.put("discount", 0);
    p2.put("startDate", "2025-09-15");
    p2.put("endDate", "2025-09-30");
    p2.put("active", false);
    promotions.add(p2);
    
    java.util.Map<String, Object> p3 = new java.util.HashMap<>();
    p3.put("code", "KM03");
    p3.put("name", "Giảm 15% cho đơn từ 5 triệu");
    p3.put("discount", 15);
    p3.put("startDate", "2025-11-01");
    p3.put("endDate", "2025-12-31");
    p3.put("active", true);
    promotions.add(p3);
    
    request.setAttribute("promotions", promotions);
%>

<div class="app">
    <%-- Sidebar --%>
    <jsp:include page="/admin/includes/sidebar.jsp" />
    
    <div class="container">
        <div class="topbar">
            <div class="topbar-left">
                <div>
                    <h2 class="page-title" id="pageTitle">Khuyến mãi</h2>
                    <div class="muted hidden" id="pageDesc">Quản lý mã khuyến mãi</div>
                </div>
            </div>
            <div class="topbar-right">
                <div class="muted hidden">Xin chào, Admin</div>
                <div class="card notification-card">
                    <i class="fa-solid fa-bell"></i><span class="muted">3</span>
                </div>
            </div>
        </div>

        <div class="table-container">
            <div class="toolbar">
                <div class="left">
                    <input type="text" id="searchInput" placeholder="Tìm kiếm khuyến mãi...">
                    <select id="filterStatus">
                        <option value="all">Tất cả</option>
                        <option value="active">Đang áp dụng</option>
                        <option value="inactive">Hết hạn</option>
                    </select>
                </div>
                <button class="btn-add" id="btnOpenModal">+ Thêm Khuyến mãi</button>
            </div>

            <table id="promoTable">
                <thead>
                <tr>
                    <th>Mã KM</th>
                    <th>Tên khuyến mãi</th>
                    <th>Giảm (%)</th>
                    <th>Ngày bắt đầu</th>
                    <th>Ngày kết thúc</th>
                    <th>Trạng thái</th>
                    <th>Thao tác</th>
                </tr>
                </thead>
                <tbody id="promoBody">
                <c:forEach var="promo" items="${promotions}">
                    <tr data-code="${promo.code}">
                        <td><c:out value="${promo.code}" /></td>
                        <td><c:out value="${promo.name}" /></td>
                        <td><c:out value="${promo.discount}" /></td>
                        <td><c:out value="${promo.startDate}" /></td>
                        <td><c:out value="${promo.endDate}" /></td>
                        <td>
                            <c:choose>
                                <c:when test="${promo.active}">
                                    <span class="status active">Đang áp dụng</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="status inactive">Hết hạn</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <button class="btn-toggle">${promo.active ? 'Tắt' : 'Bật'}</button>
                            <button class="btn-edit">Sửa</button>
                            <button class="btn-delete">Xóa</button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <!-- Modal Form -->
            <div class="modal" id="promoModal">
                <div class="modal-content">
                    <h3>Thêm Khuyến mãi mới</h3>
                    <form id="promoForm" action="${pageContext.request.contextPath}/admin/AddPromotionServlet" method="post">
                        <label>Mã KM</label>
                        <input type="text" id="promoCode" name="promoCode" required>
                        <label>Tên khuyến mãi</label>
                        <input type="text" id="promoName" name="promoName" required>
                        <label>Giảm (%)</label>
                        <input type="number" id="promoDiscount" name="promoDiscount" required>
                        <label>Ngày bắt đầu</label>
                        <input type="date" id="promoStart" name="promoStart" required>
                        <label>Ngày kết thúc</label>
                        <input type="date" id="promoEnd" name="promoEnd" required>
                        <div class="modal-buttons">
                            <button type="submit" class="btn-save">Lưu</button>
                            <button type="button" class="btn-cancel" id="btnCloseModal">Hủy</button>
                        </div>
                    </form>
                </div>
            </div>

            <div class="footer" id="footer-pagination">
                <p id="record-info">Hiển thị ${promotions.size()} mã khuyến mãi</p>
                <div class="pagination" id="pagination-number">1</div>
            </div>
        </div>
    </div>
</div>

<!-- Toast Message -->
<div id="toast"></div>

<script src="${pageContext.request.contextPath}/assert/js/sidebarAdmin.js"></script>
<script src="${pageContext.request.contextPath}/assert/js/voucherAdmin.js"></script>
<script src="${pageContext.request.contextPath}/assert/js/dashboardAdmin.js"></script>
</body>
</html>
