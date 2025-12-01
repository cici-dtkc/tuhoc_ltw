<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kho Voucher - Cửa hàng điện thoại</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/voucherDetail.css">
</head>
<body>
<%
    // Dữ liệu mẫu cho voucher
    java.util.List<java.util.Map<String, Object>> vouchers = new java.util.ArrayList<>();
    
    java.util.Map<String, Object> v1 = new java.util.HashMap<>();
    v1.put("id", 1);
    v1.put("discount", "20%");
    v1.put("maxDiscount", "100k");
    v1.put("minOrder", "70k");
    v1.put("quantity", 5);
    v1.put("expired", false);
    vouchers.add(v1);
    
    java.util.Map<String, Object> v2 = new java.util.HashMap<>();
    v2.put("id", 2);
    v2.put("discount", "20%");
    v2.put("maxDiscount", "100k");
    v2.put("minOrder", "100k");
    v2.put("quantity", 5);
    v2.put("expired", false);
    vouchers.add(v2);
    
    java.util.Map<String, Object> v3 = new java.util.HashMap<>();
    v3.put("id", 3);
    v3.put("discount", "20%");
    v3.put("maxDiscount", "100k");
    v3.put("minOrder", "150k");
    v3.put("quantity", 5);
    v3.put("expired", false);
    vouchers.add(v3);
    
    java.util.Map<String, Object> v4 = new java.util.HashMap<>();
    v4.put("id", 4);
    v4.put("discount", "20%");
    v4.put("maxDiscount", "350k");
    v4.put("minOrder", "1tr");
    v4.put("quantity", 5);
    v4.put("expired", false);
    vouchers.add(v4);
    
    java.util.Map<String, Object> v5 = new java.util.HashMap<>();
    v5.put("id", 5);
    v5.put("discount", "22%");
    v5.put("maxDiscount", "100k");
    v5.put("minOrder", "350k");
    v5.put("quantity", 0);
    v5.put("expired", true);
    v5.put("validFrom", "04 Th11");
    vouchers.add(v5);
    
    java.util.Map<String, Object> v6 = new java.util.HashMap<>();
    v6.put("id", 6);
    v6.put("discount", "15%");
    v6.put("maxDiscount", "200k");
    v6.put("minOrder", "500k");
    v6.put("quantity", 3);
    v6.put("expired", false);
    vouchers.add(v6);
    
    request.setAttribute("vouchers", vouchers);
%>

<div class="voucher-container">
    <c:forEach var="voucher" items="${vouchers}">
        <c:choose>
            <c:when test="${voucher.expired}">
                <div class="voucher expired">
                    <div class="voucher-left">
                        <div class="icon"><img src="${pageContext.request.contextPath}/assert/img/logo.png" alt="logo"></div>
                    </div>
                    <div class="voucher-right">
                        <h3>Giảm <c:out value="${voucher.discount}" /> Giảm tối đa <c:out value="${voucher.maxDiscount}" />đ</h3>
                        <p>Đơn tối thiểu <c:out value="${voucher.minOrder}" />đ</p>
                        <small>Có hiệu lực từ <c:out value="${voucher.validFrom}" /><a href="#">Điều Kiện</a></small>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <div class="voucher">
                    <div class="voucher-left">
                        <div class="icon"><img src="${pageContext.request.contextPath}/assert/img/logo.png" alt="logo"></div>
                    </div>
                    <div class="voucher-right">
                        <div>
                            <h3>Giảm <c:out value="${voucher.discount}" /></h3>
                            <p>Giảm tối đa <c:out value="${voucher.maxDiscount}" />đ</p>
                            <p>Đơn tối thiểu <c:out value="${voucher.minOrder}" />đ</p>
                        </div>
                        <div>
                            <button>Lưu</button>
                            <a href="#">Điều kiện</a>
                        </div>
                    </div>
                    <div class="badge">x<c:out value="${voucher.quantity}" /></div>
                </div>
            </c:otherwise>
        </c:choose>
    </c:forEach>
</div>
</body>
</html>
