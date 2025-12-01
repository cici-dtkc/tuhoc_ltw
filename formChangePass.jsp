<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/formChangepass.css">
    <title>Đổi mật khẩu - Cửa hàng điện thoại</title>
</head>
<body>
<div class="container" id="reset-step">
    <h2>Đặt mật khẩu mới</h2>
    <p>Tạo mật khẩu mới. Đảm bảo mật khẩu khác với mật khẩu trước đó để bảo mật.</p>
    
    <c:if test="${not empty errorMessage}">
        <div class="error-message" style="color: red; margin-bottom: 15px;">
            <c:out value="${errorMessage}" />
        </div>
    </c:if>
    
    <c:if test="${not empty successMessage}">
        <div class="success-message" style="color: green; margin-bottom: 15px;">
            <c:out value="${successMessage}" />
        </div>
    </c:if>
    
    <form id="reset-form" action="${pageContext.request.contextPath}/ChangePasswordServlet" method="post">
        <div class="input-group">
            <label>Mật khẩu hiện tại</label>
            <div class="password-wrapper">
                <input type="password" id="current-pass" name="currentPassword" placeholder="Nhập mật khẩu hiện tại" required>
                <span class="toggle">
                    <i class="fa-regular fa-eye"></i>
                    <i class="fa-regular fa-eye-slash"></i>
                </span>
            </div>
        </div>
        
        <div class="input-group">
            <label>Mật khẩu mới</label>
            <div class="password-wrapper">
                <input type="password" id="new-pass" name="newPassword" placeholder="Nhập mật khẩu mới của bạn" required>
                <span class="toggle">
                    <i class="fa-regular fa-eye"></i>
                    <i class="fa-regular fa-eye-slash"></i>
                </span>
            </div>
        </div>

        <div class="input-group">
            <label>Xác nhận mật khẩu</label>
            <div class="password-wrapper">
                <input type="password" id="confirm-pass" name="confirmPassword" placeholder="Nhập lại mật khẩu" required>
                <span class="toggle">
                    <i class="fa-regular fa-eye"></i>
                    <i class="fa-regular fa-eye-slash"></i>
                </span>
            </div>
        </div>
        <button type="submit" class="btn" id="update-btn">Cập nhật mật khẩu</button>
    </form>
</div>
<script src="${pageContext.request.contextPath}/assert/js/formChangepass.js"></script>
</body>
</html>
