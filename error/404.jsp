<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>404 - Không tìm thấy trang</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/base.css">
    <style>
        .error-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            text-align: center;
            padding: 20px;
        }
        .error-code {
            font-size: 120px;
            font-weight: bold;
            color: #333;
            margin: 0;
        }
        .error-message {
            font-size: 24px;
            color: #666;
            margin: 20px 0;
        }
        .error-description {
            font-size: 16px;
            color: #999;
            margin-bottom: 30px;
        }
        .btn-home {
            background-color: #007bff;
            color: white;
            padding: 15px 30px;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
            transition: background-color 0.3s;
        }
        .btn-home:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <h1 class="error-code">404</h1>
        <h2 class="error-message">Không tìm thấy trang</h2>
        <p class="error-description">Xin lỗi, trang bạn đang tìm kiếm không tồn tại hoặc đã bị di chuyển.</p>
        <a href="${pageContext.request.contextPath}/index.jsp" class="btn-home">Về trang chủ</a>
    </div>
</body>
</html>
