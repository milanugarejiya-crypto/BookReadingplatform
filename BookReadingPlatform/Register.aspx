<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="BookReadingPlatform.Register" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register - Book Reading</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f7f6;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .register-container {
            background: #ffffff;
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
            width: 100%;
            max-width: 350px;
            text-align: center;
        }
        .logo-icon {
            background: #5a67d8;
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
            border: 1px solid #5a67d8; /* Highlighted to show active state */
            color: #5a67d8;
            border-radius: 8px;
            padding: 10px;
            margin-bottom: 20px;
            font-size: 13px;
            font-weight: 600;
        }

        .input-group { text-align: left; margin-bottom: 15px; }
        .input-group label { 
            display: block; 
            font-size: 12px; 
            color: #4a5568; 
            margin-bottom: 6px; 
            font-weight: 600;
        }
        .input-field {
            width: 100%;
            padding: 12px 12px 12px 35px; /* Padding for inline icons */
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            box-sizing: border-box;
            font-size: 14px;
            outline: none;
            background-repeat: no-repeat;
            background-position: 10px center;
            background-size: 16px;
        }
        .input-field:focus { border-color: #5a67d8; }
        
        /* Simulating the icons from your design */
        .icon-user { background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" fill="%23a0aec0" viewBox="0 0 24 24"><path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"/></svg>'); }
        .icon-email { background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" fill="%23a0aec0" viewBox="0 0 24 24"><path d="M20 4H4c-1.1 0-1.99.9-1.99 2L2 18c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2zm0 4l-8 5-8-5V6l8 5 8-5v2z"/></svg>'); }
        .icon-lock { background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" fill="%23a0aec0" viewBox="0 0 24 24"><path d="M18 8h-1V6c0-2.76-2.24-5-5-5S7 3.24 7 6v2H6c-1.1 0-2 .9-2 2v10c0 1.1.9 2 2 2h12c1.1 0 2-.9 2-2V10c0-1.1-.9-2-2-2zm-6 9c-1.1 0-2-.9-2-2s.9-2 2-2 2 .9 2 2-.9 2-2 2zm3.1-9H8.9V6c0-1.71 1.39-3.1 3.1-3.1 1.71 0 3.1 1.39 3.1 3.1v2z"/></svg>'); }

        .checkbox-group {
            display: flex;
            align-items: center;
            font-size: 11px;
            color: #718096;
            margin-bottom: 20px;
            text-align: left;
        }
        .checkbox-group input { margin-right: 8px; }
        .checkbox-group a { color: #5a67d8; text-decoration: none; }

        .btn-register {
            width: 100%;
            padding: 12px;
            background-color: #5a67d8;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 14px;
            font-weight: bold;
            cursor: pointer;
        }
        .btn-register:hover { background-color: #4c51bf; }
        
        .footer-text { margin-top: 20px; font-size: 12px; color: #718096; }
        .footer-text a { color: #5a67d8; text-decoration: none; font-weight: 600; }
        
        .error-message { color: #e53e3e; font-size: 12px; margin-bottom: 10px; display: none; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="register-container">
            <!-- Logo Section -->
            <div class="logo-icon">📖</div>
            <h2>Book Reading</h2>
            <p>Join our community of readers</p>

            <!-- Toggle Box -->
            <div class="toggle-box">Reader Account</div>

            <asp:Label ID="lblError" runat="server" CssClass="error-message"></asp:Label>

            <!-- Full Name Input -->
            <div class="input-group">
                <label>Full Name</label>
                <asp:TextBox ID="txtFullName" runat="server" CssClass="input-field icon-user" placeholder="Leslie Alexander"></asp:TextBox>
            </div>

            <!-- Email Input -->
            <div class="input-group">
                <label>Email Address</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="input-field icon-email" placeholder="name@example.com" TextMode="Email"></asp:TextBox>
            </div>

            <!-- Password Input -->
            <div class="input-group">
                <label>Password</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="input-field icon-lock" placeholder="••••••••••••" TextMode="Password"></asp:TextBox>
            </div>

            <!-- Confirm Password Input -->
            <div class="input-group">
                <label>Confirm Password</label>
                <asp:TextBox ID="txtConfirm" runat="server" CssClass="input-field icon-lock" placeholder="••••••••••••" TextMode="Password"></asp:TextBox>
            </div>

            <!-- Terms Checkbox -->
            <div class="checkbox-group">
                <asp:CheckBox ID="chkTerms" runat="server" />
                <span>I agree to the <a href="#">Terms of Service</a> and <a href="#">Privacy Policy</a>.</span>
            </div>

            <!-- Submit Button -->
            <asp:Button ID="btnRegister" runat="server" Text="Register &rarr;" CssClass="btn-register" OnClick="btnRegister_Click" />

            <!-- Login Link -->
            <div class="footer-text">
                Already have an account? <a href="Login.aspx">Log In</a>
            </div>
        </div>
    </form>
</body>
</html>