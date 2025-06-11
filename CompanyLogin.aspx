<%@ Page Title="" Language="vb" AutoEventWireup="false" CodeBehind="CompanyLogin.aspx.vb" Inherits="ModernDashboard.CompanyLogin" %>
<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <title>Login | INDUS ERP</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Styles/login-modern.css" rel="stylesheet" />
    <!-- AOS Animation CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.css" />
</head>
<body>
    <div class="login-bg">
        <!-- LEFT: Large Logo -->
        <div class="login-left" data-aos="fade-up" data-aos-delay="200">
            <img src="Image/your-logo.png" alt="Indas Analytics Logo" class="big-logo-img" />
        </div>
        <!-- RIGHT: Login Form -->
        <div class="login-right" data-aos="fade-left" data-aos-delay="400">
            <form id="loginForm" autocomplete="off" onsubmit="return false;">
                <div class="login-box">
                    <h2 class="login-welcome">Welcome</h2>
                    <div class="mb-3">
                        <input type="text" id="companyName" class="login-input" placeholder="Company Name" autocomplete="off" />
                    </div>
                    <div class="mb-3">
                        <input type="password" id="password" class="login-input" placeholder="Password" autocomplete="off" />
                    </div>
                    <button type="submit" id="loginBtn" class="login-btn">Login</button>
                </div>
            </form>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.js"></script>
    <script>
        AOS.init({ duration: 700, once: true });
        // On login, simply redirect to Dashboard.aspx
        document.getElementById('loginForm').addEventListener('submit', function (e) {
            e.preventDefault();
            document.getElementById('loginBtn').disabled = true;
            setTimeout(function () {
                window.location.href = "Dashboard.aspx";
            }, 300);
        });
    </script>
</body>
</html>