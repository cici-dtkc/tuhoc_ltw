<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Quên mật khẩu - Cửa hàng điện thoại</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assert/css/forgotpass.css">
</head>
<body>
<div id="forgot-password">
    <c:if test="${not empty successMessage}">
        <div class="success-message" style="color: green; margin-bottom: 15px; text-align: center;">
            <c:out value="${successMessage}" />
        </div>
    </c:if>
    
    <c:if test="${not empty errorMessage}">
        <div class="error-message" style="color: red; margin-bottom: 15px; text-align: center;">
            <c:out value="${errorMessage}" />
        </div>
    </c:if>
    
    <form class="form-box" action="${pageContext.request.contextPath}/ForgotPasswordServlet" method="post">
        <h2>Đặt lại mật khẩu</h2>
        <p>Vui lòng nhập địa chỉ email mà bạn đã đăng ký trên trang web của chúng tôi.</p>
        <input type="email" name="email" placeholder="Email của bạn...." required>
        <button id="btn-send" type="submit">Gửi</button>
        <div class="links">
            <a href="${pageContext.request.contextPath}/login.jsp">Đăng nhập</a> | <a href="${pageContext.request.contextPath}/register.jsp">Đăng ký</a>
        </div>
    </form>
</div>
<script src="${pageContext.request.contextPath}/assert/js/forgotpassword.js"></script>
</body>
</html>
