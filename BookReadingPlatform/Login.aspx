<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BookReadingPlatform.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login - Book Reading</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f7f6; /* Light gray background */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .login-container {
            background: #ffffff;
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
            width: 100%;
            max-width: 320px;
            text-align: center;
        }
        .logo-icon {
            background: #5a67d8; /* Matching the purple-blue theme */
            color: white;
            width: 45px;
            height: 45px;
            border-radius: 10px;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0 auto 15px auto;
            font-size: 24px;
        }
        h2 { margin: 0 0 5px 0; color: #1a202c; font-size: 22px; font-weight: 700; }
        p { color: #718096; font-size: 13px; margin-bottom: 25px; }
        
        .toggle-box {
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            padding: 10px;
            margin-bottom: 20px;
            font-size: 13px;
            color: #4a5568;
            font-weight: 500;
        }

        .input-group { text-align: left; margin-bottom: 18px; }
        .input-group label { 
            display: flex; 
            justify-content: space-between;
            font-size: 12px; 
            color: #4a5568; 
            margin-bottom: 6px; 
            font-weight: 600;
        }
        .input-field {
            width: 100%;
            padding: 12px;
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            box-sizing: border-box;
            font-size: 14px;
            outline: none;
        }
        .input-field:focus { border-color: #5a67d8; }
        .forgot-link {
            font-size: 11px;
            color: #5a67d8;
            text-decoration: none;
            font-weight: normal;
        }
        
        .btn-login {
            width: 100%;
            padding: 12px;
            background-color: #5a67d8;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 14px;
            font-weight: bold;
            cursor: pointer;
            margin-top: 5px;
        }
        .btn-login:hover { background-color: #4c51bf; }
        
        .footer-text { margin-top: 25px; font-size: 12px; color: #718096; }
        .footer-text a { color: #5a67d8; text-decoration: none; font-weight: 600; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <!-- Logo Section -->
            <div class="logo-icon">📖</div>
            <h2>Book Reading</h2>
            <p>Immerse yourself in stories.</p>

            <!-- User Toggle Box -->
            <div class="toggle-box">User Login</div>

            <!-- Email Input -->
            <div class="input-group">
                <label>Email Address</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="input-field" placeholder="name@example.com" TextMode="Email"></asp:TextBox>
            </div>

            <!-- Password Input -->
            <div class="input-group">
                <label>Password <a href="#" class="forgot-link">Forgot password?</a></label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="input-field" placeholder="••••••••" TextMode="Password"></asp:TextBox>
            </div>

            <!-- Submit Button -->
            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn-login" OnClick="btnLogin_Click" />

            <!-- Register Link -->
            <div class="footer-text">
                Don't have an account? <a href="Register.aspx">Register</a>
            </div>
        </div>
    </form>
</body>
</html>