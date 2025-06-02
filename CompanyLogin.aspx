<%@ Page Title="" Language="vb" AutoEventWireup="false" CodeBehind="CompanyLogin.aspx.vb" Inherits="ModernDashboard.CompanyLogin" %>
<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <title>Login | INDUS ERP</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Styles/login-modern.css" rel="stylesheet" />
</head>
<body>
    <div class="login-bg">
        <div class="login-left">
            <div class="login-logo">
                <!-- Replace with your SVG/logo as needed -->
                <svg width="120" height="120" viewBox="0 0 120 120" fill="none">
                    <polygon points="60,10 110,110 10,110" fill="#159c9c"/>
                    <polygon points="41,80 60,45 78,80" fill="#fff"/>
                    <rect x="70" y="92" width="14" height="8" rx="2" fill="#ffe600"/>
                    <rect x="86" y="92" width="14" height="8" rx="2" fill="#00b9ff"/>
                    <rect x="102" y="92" width="14" height="8" rx="2" fill="#ff3a7b"/>
                </svg>
                <div class="login-title">INDUS <span>ANALYTICS</span></div>
                <div class="login-subtitle">Print Process Automation Partner</div>
            </div>
        </div>
        <div class="login-right">
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
    <script>
        // On login, simply redirect to Dashboard.aspx
        document.getElementById('loginForm').addEventListener('submit', function (e) {
            e.preventDefault();
            document.getElementById('loginBtn').disabled = true;
            setTimeout(function () {
                window.location.href = "Dashboard.aspx";
            }, 300); // Animation delay
        });
    </script>
</body>
</html>