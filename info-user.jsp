<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Hồ Sơ Của Tôi - Cửa hàng điện thoại</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/info-user.css">
</head>
<body>
<%
    // Dữ liệu mẫu cho thông tin người dùng
    java.util.Map<String, Object> user = new java.util.HashMap<>();
    user.put("username", "zyyy2809");
    user.put("fullName", "Nguyễn Văn A");
    user.put("email", "nguyenvana@example.com");
    user.put("phone", "0912345678");
    user.put("avatar", "admin.jpg");
    request.setAttribute("user", user);
%>

<div class="info-user" id="info-user">
    <div class="container">
        <div class="title" id="title">
            <span>Hồ Sơ Của Tôi</span>
        </div>

        <c:if test="${not empty successMessage}">
            <div class="success-message" style="color: green; margin-bottom: 15px;">
                <c:out value="${successMessage}" />
            </div>
        </c:if>

        <div class="profile">
            <div class="left">
                <form action="${pageContext.request.contextPath}/UpdateProfileServlet" method="post">
                    <div class="row">
                        <label class="label">Tên đăng nhập</label>
                        <div class="readonly" id="username-view"><c:out value="${user.username}" /></div>
                    </div>

                    <div class="row">
                        <label for="fullName" class="label">Tên</label>
                        <input type="text" id="fullName" name="fullName" class="input" 
                               value="<c:out value='${user.fullName}' />" placeholder="Nhập tên" disabled>
                    </div>

                    <div class="row">
                        <label class="label" for="emailInput">Email</label>
                        <input type="email" id="emailInput" name="email" class="input" 
                               value="<c:out value='${user.email}' />" placeholder="Nhập email" disabled>
                        <span class="error" id="emailError"></span>
                    </div>

                    <div class="row">
                        <label class="label" for="phoneInput">Số điện thoại</label>
                        <input type="text" id="phoneInput" name="phone" class="input" 
                               value="<c:out value='${user.phone}' />" placeholder="Nhập số điện thoại" disabled>
                        <span class="error" id="phoneError"></span>
                    </div>

                    <div id="password-fields" class="hidden">
                        <div class="row">
                            <label for="currentPassword" class="label">Mật khẩu hiện tại</label>
                            <input type="password" id="currentPassword" name="currentPassword" class="input" placeholder="Nhập mật khẩu hiện tại">
                            <span class="error" id="currentPwError"></span>
                        </div>
                        <div class="row">
                            <label for="newPassword" class="label">Mật khẩu mới</label>
                            <input type="password" id="newPassword" name="newPassword" class="input" placeholder="Ít nhất 6 ký tự">
                            <span class="error" id="newPwError"></span>
                        </div>
                        <div class="row">
                            <label for="confirmPassword" class="label">Xác nhận mật khẩu</label>
                            <input type="password" id="confirmPassword" name="confirmPassword" class="input" placeholder="Nhập lại mật khẩu mới">
                            <span class="error" id="confirmPwError"></span>
                        </div>
                    </div>

                    <div class="buttons">
                        <button type="button" class="btn primary" id="btn-edit">Chỉnh sửa thông tin</button>
                        <a href="${pageContext.request.contextPath}/LogoutServlet" class="btn outline" id="btn-logout">Đăng xuất</a>
                    </div>
                </form>
            </div>

            <div class="right">
                <div class="avatar">
                    <img id="user-avatar" src="${pageContext.request.contextPath}/assert/img/${user.avatar}" alt="avatar">
                </div>
                <label for="avatarInput" class="btn small">Chọn Ảnh</label>
                <input id="avatarInput" type="file" accept="image/png, image/jpeg" class="hidden-input">
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/js/info-user.js"></script>
</body>
</html>
